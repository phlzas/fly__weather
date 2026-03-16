import 'package:flutter/material.dart';

class MyTextfeild extends StatefulWidget {
  String lable;
  String hint;
  TextEditingController controller;
  IconData icon;
  String? Function(String?)? validator;

  MyTextfeild({
    super.key,
    required this.lable,
    required this.hint,
    required this.icon,
    required this.validator,
    required this.controller,
  });

  @override
  State<MyTextfeild> createState() => _MyTextfeildState();
}

class _MyTextfeildState extends State<MyTextfeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autocorrect: true,
      controller: widget.controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        prefixIconColor: Colors.grey,
        prefixIcon: Icon(widget.icon),
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
