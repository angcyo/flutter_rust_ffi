use safer_ffi::ffi_export;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2026-03-13
///

/// 测试布尔类型的参数传输
/// @return 取反
#[ffi_export]
pub fn test_bool2(value: bool) -> bool {
    !value
}

/// 测试整数类型的参数传输
#[ffi_export]
pub fn test_int2(value: i32) -> i32 {
    value
}

/// 测试浮点类型的参数传输
#[ffi_export]
pub fn test_float2(value: f32) -> f32 {
    value
}

/// 测试双精度浮点类型的参数传输
#[ffi_export]
pub fn test_double2(value: f64) -> f64 {
    value
}

/// 测试字符串类型的参数传输
#[ffi_export]
pub fn test_string2(value: &safer_ffi::String) -> safer_ffi::String {
    safer_ffi::String::from(value.to_string())
}

/// 测试字节类型的参数传输
#[ffi_export]
pub fn test_bytes2(value: &safer_ffi::Vec<u8>) -> safer_ffi::Vec<u8> {
    safer_ffi::Vec::from(value.to_vec())
}

#[test]
#[cfg(feature = "headers")]
fn generate_headers() -> std::io::Result<()> {
    safer_ffi::headers::builder()
        .to_file("rust_api_test2.h")?
        .generate()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_func() {
        /*println!("test_bool2->{}", test_bool2(true));
        println!("test_int2->{}", test_int2(1));
        println!("test_float2->{}", test_float2(1.1));
        println!("test_double2->{}", test_double2(1.1));
        println!("test_string2->{}", test_string2(&safer_ffi::String::from("test_string2")));
        println!("test_bytes2->{}", test_bytes2(&safer_ffi::Vec::from(vec![1, 2, 3])).len());*/
    }
}
