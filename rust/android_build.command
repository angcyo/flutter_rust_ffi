# Build the Android .so
# 需要先安装rust Android编译工具链: rustup target add aarch64-linux-android armv7-linux-androideabi
# 再安装编译工具: cargo install cargo-ndk

# 输出目录在 ./jniLibs
cargo ndk -t armeabi-v7a -t arm64-v8a -o ./output/jniLibs build -vv --release

# 复制到上级目录
cp -r ./output/jniLibs ../lp_data_handle_ffi/android/src/main/

# 编译头文件
./generate_headers.command