import 'package:flutter/material.dart';

typedef TapCallBack = void Function(String sign);

class SignKey extends StatelessWidget {
  final String sign;
  final TapCallBack onSignTap;
  const SignKey({
    super.key,
    required this.sign,
    required this.onSignTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          child: Container(
            color: const Color.fromARGB(235, 231, 231, 231),
            child: Center(
              child: Text(
                sign,
                style: const TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          onTap: () => {onSignTap(sign)},
        ),
      ),
    );
  }
}
