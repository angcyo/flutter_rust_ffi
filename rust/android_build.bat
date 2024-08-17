@echo off
rem Build the Android .so
rem 需要先安装rust Android编译工具链: rustup target add aarch64-linux-android armv7-linux-androideabi
rem 再安装编译工具: cargo install cargo-ndk

rem 输出目录在 ./jniLibs
cargo ndk -t armeabi-v7a -t arm64-v8a -o ./output/jniLibs build --release

rem 复制到上级目录 必须用\而不是/
xcopy /s /y  .\output\jniLibs\* ..\lp_data_handle_ffi\android\src\main\jniLibs\

rem 编译头文件
./generate_headers.bat