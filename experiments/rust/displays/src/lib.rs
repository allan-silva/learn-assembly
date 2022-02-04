extern crate libc;

use libc::c_char;

use std::ffi::CStr;

#[no_mangle]
pub extern "C" fn print_int_as_binary(identifier: *const c_char, value: i64) {
    let identifier = unsafe {CStr::from_ptr(identifier)}.to_str().unwrap();
    println!("{:?} -> {}", identifier, int_64_bytes_repr(value));
}

#[no_mangle]
pub extern "C" fn say_hi() {

    println!("Hi!");
}

fn int_64_bytes_repr(value: i64) -> String {
    let bytes = if cfg!(target_endian = "little") {
        value.to_be_bytes()
    } else {
        value.to_ne_bytes()
    };

    bytes.map(|b|b.reverse_bits())
        .map(|b| {
            let mut bits: [u8; 8] = [0; 8];

            for bit in 0..bits.len() {
                bits[bit] = if b & (1 << bit) != 0 {
                    1
                } else {
                    0
                }
            }

            bits
        })
        .iter()
        .map(|bits| {
            bits.map(|bit| bit.to_string()).to_vec().join("")
        })
        .collect::<Vec<String>>()
        .join(" ")
}

#[cfg(test)]
mod tests {
    use super::int_64_bytes_repr;

    #[test]
    fn test_repr() {
        let repr = int_64_bytes_repr(1i64);
        assert_eq!(
            "00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000001",
            repr
        );

        let repr = int_64_bytes_repr(2i64);
        assert_eq!(
            "00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000010",
            repr
        );

        let repr = int_64_bytes_repr(-1i64);
        assert_eq!(
            "11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111",
            repr
        );

        let repr = int_64_bytes_repr(-2i64);
        assert_eq!(
            "11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111110",
            repr
        );
    }
}