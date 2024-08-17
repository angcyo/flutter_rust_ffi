use safer_ffi::ffi_export;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024-08-17
///

/// 测试布尔类型的参数传输
/// @return 取反
#[ffi_export]
pub fn test_bool(value: bool) -> bool {
    !value
}

/// 测试整数类型的参数传输
#[ffi_export]
pub fn test_int(value: i32) -> i32 {
    value
}

/// 测试浮点类型的参数传输
#[ffi_export]
pub fn test_float(value: f32) -> f32 {
    value
}

/// 测试双精度浮点类型的参数传输
#[ffi_export]
pub fn test_double(value: f64) -> f64 {
    value
}

/// 测试字符串类型的参数传输
#[ffi_export]
pub fn test_string(value: &safer_ffi::String) -> safer_ffi::String {
    safer_ffi::String::from(value.to_string())
}

/// 测试字节类型的参数传输
#[ffi_export]
pub fn test_bytes(value: &safer_ffi::Vec<u8>) -> safer_ffi::Vec<u8> {
    safer_ffi::Vec::from(value.to_vec())
}

#[test]
#[cfg(feature = "headers")]
fn generate_headers() -> std::io::Result<()> {
    safer_ffi::headers::builder()
        .to_file("rust_api_test.h")?
        .generate()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_func() {
        println!("test_bool->{}", test_bool(true));
        println!("test_int->{}", test_int(1));
        println!("test_float->{}", test_float(1.1));
        println!("test_double->{}", test_double(1.1));
        println!("test_string->{}", test_string(&safer_ffi::String::from("test_string")));
        println!("test_bytes->{}", test_bytes(&safer_ffi::Vec::from(vec![1, 2, 3])).len());
    }
}
