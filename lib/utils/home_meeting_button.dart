import 'package:flutter/material.dart';
import 'package:people/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton(
      {Key? key, required this.onPressed, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 4),
                  )
                ]),
            width: 55.0,
            height: 55.0,
            child: Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(text, style: const TextStyle(fontSize: 12.0, color: Colors.grey),),
        ],
      ),
    );
  }
}
