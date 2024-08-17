# Build the iOS .a
# 需要先安装rust iOS编译工具链: rustup target add aarch64-apple-ios
# 再安装编译工具: cargo install cargo-lipo

# 默认输出目录在 target/aarch64-apple-ios/release
cargo lipo --targets aarch64-apple-ios --release
echo "output-> target/aarch64-apple-ios/release"

# 复制产物
mkdir -p output/ && cp target/aarch64-apple-ios/release/librust_api_test.a output/

# 编译头文件
./generate_headers.command