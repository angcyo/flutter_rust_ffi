import 'dart:ffi' as ffi;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2026/03/13
///
///
/// \brief
/// Same as [`Vec<T>`][`rust::Vec`], but with guaranteed `#[repr(C)]` layout
final class Vec_uint8 extends ffi.Struct {
  /// <No documentation available>
  external ffi.Pointer<ffi.Uint8> ptr;

  /// <No documentation available>
  @ffi.Size()
  external int len;

  /// <No documentation available>
  @ffi.Size()
  external int cap;
}

/// \brief
/// Same as [`Vec<T>`][`rust::Vec`], but with guaranteed `#[repr(C)]` layout
typedef Vec_uint8_t = Vec_uint8;
