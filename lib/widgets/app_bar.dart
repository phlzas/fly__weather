import 'package:flutter/material.dart';

  class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
@override
  final Size preferredSize;

  AppBarScreen({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'AppBarScreen',
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
    );
  }
}