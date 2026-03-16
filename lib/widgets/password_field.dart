import 'package:flutter/material.dart';

class MyPassfeild extends StatefulWidget {
  String lable;
  String hint;
  TextEditingController controller;
  IconData icon;
  String? Function(String?)? validator;
  bool obscureText;

  MyPassfeild({
    super.key,
    required this.lable,
    required this.hint,
    required this.icon,
    required this.validator,
    required this.controller,
    this.obscureText = true,
  });

  @override
  State<MyPassfeild> createState() => _MyTextfeildState();
}

class _MyTextfeildState extends State<MyPassfeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autocorrect: true,
      controller: widget.controller,
      obscureText: widget.obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        fillColor: Colors.grey,
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
          icon: Icon(
              widget.obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        labelText: widget.lable,
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
