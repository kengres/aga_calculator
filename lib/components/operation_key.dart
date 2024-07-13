import 'package:flutter/material.dart';

typedef TapCallBack = void Function(String sign);

class OperationKey extends StatelessWidget {
  final String sign;
  final TapCallBack onTap;
  const OperationKey({
    super.key,
    required this.sign,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          child: Container(
            color: const Color.fromARGB(235, 221, 221, 221),
            child: Center(
              child: Text(sign, style: const TextStyle(fontSize: 32.0)),
            ),
          ),
          onTap: () => {onTap(sign)},
        ),
      ),
    );
  }
}
