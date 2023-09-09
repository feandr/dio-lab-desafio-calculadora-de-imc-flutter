import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onReset;

  const CustomAppBar({required this.onReset, String? data});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Calcular IMC",style: TextStyle(fontSize: 18.0),),
      elevation: 8.0,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 55, 88, 85),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: onReset,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
