import 'package:aga_calculator/components/calc_key.dart';
import 'package:aga_calculator/components/operation_key.dart';
import 'package:aga_calculator/components/sign_key.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  double _leftNumber = 0;
  double _rightNumber = 0;
  String _sign = "";
  String _operation = "";
  String _result = "";

  void onKeyTapped(int num) {
    String newOperation = "$_operation$num";
    double newLeft = _leftNumber;
    double newRight = _rightNumber;

    if (_sign.isNotEmpty) {
      List<String> arr = newOperation.split(_sign);
      newLeft = double.parse(arr[0]);
      newRight = double.parse(arr[1]);
    } else {
      newLeft = double.parse(newOperation);
      newRight = double.parse(newOperation);
    }

    setState(() {
      _operation = newOperation;
      _leftNumber = newLeft;
      _rightNumber = newRight;
    });
  }

  void onSignTapped(String sign) {
    // todo: +/-, ., (), %
    switch (sign) {
      case "C":
        resetValues();
        return;
      case "( )":
      case "+/-":
      case ".":
      case "%":
        alertComing();
        return;
      default:
    }

    setState(() {
      _sign = sign;
      _operation = "$_operation$sign";
    });
  }

  void onOperationTap(String sign) {
    if (_operation.isEmpty) {
      alertInvalidFormat();
      return;
    }
    if (sign == '=') {
      calcResult();
      return;
    }

    setState(() {
      _sign = sign;
      _operation = "$_operation$sign";
    });
  }

  void clearLastOperation() {
    int len = _operation.length;
    if (len == 0) {
      return;
    }
    String newOperation = _operation.substring(0, len - 1);
    if (newOperation.isEmpty) {
      resetValues();
      return;
    }
    setState(() {
      _operation = newOperation;
    });
  }

  void calcResult() {
    double result = 0;
    String resultStr = "";
    switch (_sign) {
      case "+":
        result = _leftNumber + _rightNumber;
        break;
      case "x":
        result = _leftNumber * _rightNumber;
        break;
      case "-":
        result = _leftNumber - _rightNumber;
        break;
      case "/":
        result = _leftNumber / _rightNumber;
        break;
      default:
    }
    if (result.toInt().compareTo(result) == 0) {
      resultStr = result.toInt().toString();
    } else {
      resultStr = result.toString();
    }

    setState(() {
      _result = resultStr;
    });
  }

  void resetValues() {
    setState(() {
      _leftNumber = 0;
      _rightNumber = 0;
      _sign = "";
      _operation = "";
      _result = "";
    });
  }

  void alertComing() {
    const snackBar = SnackBar(content: Text('Coming soon!'));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void alertInvalidFormat() {
    const snackBar = SnackBar(content: Text('Invalid format!'));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    const double gap = 16;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 460),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _operation,
                      style: const TextStyle(fontSize: 50.0),
                    ),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _result,
                      style: const TextStyle(fontSize: 32.0, color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.backspace),
                      onPressed: clearLastOperation,
                    ),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  children: [
                    SignKey(sign: "C", onSignTap: onSignTapped),
                    const SizedBox(width: gap),
                    SignKey(sign: "( )", onSignTap: onSignTapped),
                    const SizedBox(width: gap),
                    SignKey(sign: "%", onSignTap: onSignTapped),
                    const SizedBox(width: gap),
                    OperationKey(sign: "/", onTap: onOperationTap),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  children: [
                    CalcKey(num: 7, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    CalcKey(num: 8, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    CalcKey(num: 9, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    OperationKey(sign: "x", onTap: onOperationTap),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  children: [
                    CalcKey(num: 4, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    CalcKey(num: 5, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    CalcKey(num: 6, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    OperationKey(sign: "-", onTap: onOperationTap),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  children: [
                    CalcKey(num: 1, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    CalcKey(num: 2, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    CalcKey(num: 3, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    OperationKey(sign: "+", onTap: onOperationTap),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  children: [
                    SignKey(sign: "+/-", onSignTap: onSignTapped),
                    const SizedBox(width: gap),
                    CalcKey(num: 0, onKeyTap: onKeyTapped),
                    const SizedBox(width: gap),
                    SignKey(sign: ".", onSignTap: onSignTapped),
                    const SizedBox(width: gap),
                    OperationKey(sign: "=", onTap: onOperationTap),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
