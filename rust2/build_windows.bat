@echo off
rem 设置当前控制台为UTF-8编码
chcp 65001 >> nul

rem 使用默认平台编译 `rustup show active-toolchain`
rem stable-x86_64-pc-windows-msvc (default) (64位)
rem i686-pc-windows-msvc (32位)
rem 输出目录在 ./release

rustup show active-toolchain

cargo build --release

rem 复制到上级目录 必须用\而不是/
xcopy /y .\target\release\rust_api_test2.dll ..\windows\libs\

rem 编译头文件
./generate_headers.bat