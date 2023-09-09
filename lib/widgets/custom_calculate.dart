import 'package:flutter/material.dart';

class CustomCalculateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomCalculateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
      child: TextButton(
        onPressed: onPressed,
          child: Container(
            width: 300.0,
            height: 50, // Altura do botão
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 118, 246, 191),
                  Color.fromARGB(255, 73, 237, 48),
                  Color.fromARGB(255, 46, 159, 114),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10.0), 
            ),
            child: const Center(
              child: Text(
                'Confirmar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
      ),
    );
  }
}
