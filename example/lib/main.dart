import 'package:flutter/material.dart';
import 'package:flutter_rust_ffi/flutter_rust_ffi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  '`Flutter` 通过`ffi`调用`Rust`编译生成的产物`.so文件(Android)`, `.a/.dylib文件(iOS/macOS)`和`.dll文件(windows)`接口方法.',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                Text(
                  'testBool->${testBool(false)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testBool2->${testBool2(false)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testInt->${testInt(10)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testInt2->${testInt2(10)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testFloat->${testFloat(10.00)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testFloat2->${testFloat2(10.00)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testDouble->${testDouble(10.00)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testDouble2->${testDouble2(10.00)}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testString->${testString(runtimeType.toString())}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testString2->${testString2(runtimeType.toString())}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testBytes->${testBytes([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'testBytes2->${testBytes2([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
