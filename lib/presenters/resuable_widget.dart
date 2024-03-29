import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextFormField resuableTexFile(
  String text,
  IconData icon,
  bool isPasswordType,
  bool isPhone, // Thêm tham số để xác định loại TextField
  TextEditingController controller,
  String? Function(String?)? validator,
) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.pink,
    style: TextStyle(color: Colors.pink.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon:  Icon(
        icon,
        color: Colors.white,
      ),
      labelText: text,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.pink.withOpacity(0.1),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.pink, // Border color when focused
          width: 1.0,
        ),
      ),
    ),
     keyboardType: isPhone
        ? TextInputType.phone // Nếu là số điện thoại, sử dụng TextInputType.phone
        : isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
    inputFormatters: isPhone
    ?[FilteringTextInputFormatter.digitsOnly]
    :[] ,// Chỉ cho phép nhập chữ số nếu là số điện thoại
    maxLength: isPhone ? 10  : null, // Giới hạn độ dài số điện thoại nếu là số điện thoại
    validator: validator,
  );
}

TextFormField resuablepassTexFile(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
  String? Function(String?)? validator,
  bool isObscure, // Thêm tham số để truyền giá trị _isObscure từ bên ngoài
  VoidCallback toggleObscure, // Thêm callback để cập nhật _isObscure
) {
  return TextFormField(
    controller: controller,
    obscureText: isObscure,
    cursorColor: Colors.pink,
    style: TextStyle(
        color: Colors.pink
            .withOpacity(0.9)), // Sử dụng giá trị được truyền từ bên ngoài
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      suffixIcon: isPasswordType
          ? IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
              onPressed:
                  toggleObscure, // Sử dụng callback để cập nhật _isObscure
            )
          : null,
      labelText: text,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.pink.withOpacity(0.1),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.pink, // Border color when focused
          width: 1.0,
        ),
      ),
    ),
    validator: validator,
  );
}