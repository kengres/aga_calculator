import 'package:flutter/material.dart';

typedef TapCallBack = void Function(int num);

class CalcKey extends StatelessWidget {
  final int num;
  final TapCallBack onKeyTap;
  const CalcKey({
    super.key,
    required this.num,
    required this.onKeyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x1F1F1F1F)),
              // color: Colors.amberAccent,
            ),
            child: Center(
              child: Text("$num", style: const TextStyle(fontSize: 36.0)),
            ),
          ),
          onTap: () {
            onKeyTap(num);
          },
        ),
      ),
    );
  }
}
