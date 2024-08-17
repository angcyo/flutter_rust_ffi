import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'flutter_rust_ffi_bindings_generated.dart';

/// 测试布尔类型的参数传输
/// @return 取反
bool testBool(bool value) => _bindings.test_bool(value);

int testInt(int value) => _bindings.test_int(value);

double testFloat(double value) => _bindings.test_float(value);

double testDouble(double value) => _bindings.test_double(value);

String testString(String value) {
  return ffiPtrList((ptrList) {
    return _bindings.test_string(ptrList[0]).toStr();
  }, [value])!;
}

List<int> testBytes(List<int> value) {
  return ffiPtrList((ptrList) {
    return _bindings.test_bytes(ptrList[0]).toBytes();
  }, [value])!;
}

extension FfiListIntEx on List<int> {
  /// 转成[Vec_uint8_t]
  Pointer<Vec_uint8_t> toVecUint8() {
    final bytes = this;
    //创建一个指针, 用来ffi传递
    final Pointer<Uint8> bytesPtr = calloc.allocate<Uint8>(bytes.length);
    final Uint8List nativeBytes = bytesPtr.asTypedList(bytes.length);
    nativeBytes.setAll(0, bytes);

    //ffi传递的结构体
    final ptr = calloc<Vec_uint8_t>();
    ptr.ref.ptr = bytesPtr;
    ptr.ref.len = bytes.length;
    ptr.ref.cap = bytes.length;
    return ptr;
  }
}

extension FfiVecUint8Ex on Vec_uint8_t {
  /// 转成字节
  Uint8List toBytes() {
    final result = ptr;
    final reversedBytes = result.asTypedList(len);
    //calloc.free(result);
    return reversedBytes;
  }

  /// 转成字符串
  String toStr() => utf8.decode(toBytes());
}

/// 批量创建[Vec_uint8_t]指针
R? ffiPtrList<R>(
  R? Function(List<Pointer<Vec_uint8_t>> ptrList) action,
  List<dynamic> args,
) {
  final ptrList = <Pointer<Vec_uint8_t>>[];
  for (var i = 0; i < args.length; i++) {
    final arg = args[i];
    if (arg is String) {
      ptrList.add(utf8.encode(arg).toVecUint8());
    } else if (arg is List<int>) {
      ptrList.add(arg.toVecUint8());
    } else if (arg is Pointer<Vec_uint8_t>) {
      ptrList.add(arg);
    }
  }
  try {
    return action(ptrList);
  } catch (e, s) {
    print('ffiPtrList error: $e, $s');
  } finally {
    for (final element in ptrList) {
      calloc.free(element.ref.ptr);
      calloc.free(element);
    }
  }
  return null;
}

const String _libName = 'rust_api_test';

/// The dynamic library in which the symbols for [FlutterRustFfiBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    //return DynamicLibrary.open('$_libName.framework/$_libName');
    return DynamicLibrary.executable();
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final FlutterRustFfiBindings _bindings = FlutterRustFfiBindings(_dylib);
