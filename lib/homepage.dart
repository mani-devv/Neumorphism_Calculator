import 'package:flutter/material.dart';
import 'package:neumorphism_calculator/neu_button.dart';

import 'constant.dart';

class CalculatorNeuApp extends StatefulWidget {
  const CalculatorNeuApp({Key? key}) : super(key: key);

  @override
  _CalculatorNeuAppState createState() => _CalculatorNeuAppState();
}

class _CalculatorNeuAppState extends State<CalculatorNeuApp> {
  late int firstNum;
  late int secondNum;
  String textToDisplay = "";
  late String res;
  late String operationToPerform;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      textToDisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "/") {
      firstNum = int.parse(textToDisplay);
      res = "";
      operationToPerform = btntext;
    } else if (btntext == "=") {
      secondNum = int.parse(textToDisplay);
      if (operationToPerform == "+") {
        res = (firstNum + secondNum).toString();
      }
      if (operationToPerform == "-") {
        res = (firstNum - secondNum).toString();
      }
      if (operationToPerform == "x") {
        res = (firstNum * secondNum).toString();
      }
      if (operationToPerform == "/") {
        res = (firstNum ~/ secondNum).toString();
      }
    } else {
      res = int.parse(textToDisplay + btntext).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          darkMode ? darkMode = false : darkMode = true;
                        });
                      },
                      child: _switchMode()),
                  const SizedBox(
                    height: 180,
                  ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Text(
                  //     "$textToDisplay",
                  //     style: TextStyle(
                  //       fontSize: 55,
                  //       fontWeight: FontWeight.bold,
                  //       color: darkMode ? Colors.white : Colors.black,
                  //     ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "=",
                        style: TextStyle(
                          fontSize: 35,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        textToDisplay,
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      // Text(
                      //   "10+500*12",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     color: darkMode ? Colors.white : Colors.black,
                      //   ),
                      // )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     _buttonOval(title: "sin"),
                  //     _buttonOval(title: "cos"),
                  //     _buttonOval(title: "tan"),
                  //     _buttonOval(title: "%"),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     _buttonRounded(
                  //       btnval: "C",
                  //       textColor: darkMode ? Colors.green : Colors.redAccent,
                  //     ),
                  //     _buttonRounded(btnval: "("),
                  //     _buttonRounded(btnval: ")"),
                  //     _buttonRounded(
                  //       btnval: "/",
                  //       textColor: darkMode ? Colors.green : Colors.redAccent,
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(btnval: "7"),
                      _buttonRounded(btnval: "8"),
                      _buttonRounded(btnval: "9"),
                      _buttonRounded(
                        btnval: "x",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(btnval: "4"),
                      _buttonRounded(btnval: "5"),
                      _buttonRounded(btnval: "6"),
                      _buttonRounded(
                        btnval: "-",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(btnval: "1"),
                      _buttonRounded(btnval: "2"),
                      _buttonRounded(btnval: "3"),
                      _buttonRounded(
                        btnval: "+",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                        btnval: "C",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                      _buttonRounded(btnval: "0"),
                      _buttonRounded(
                        btnval: "=",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                      _buttonRounded(
                        btnval: "/",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _buttonRounded(
      {String? btnval,
      double padding = 17,
      IconData? icon,
      Color? iconColor,
      Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: () => btnclicked(btnval!),
        child: NeuButton(
          darkMode: darkMode,
          borderRadius: BorderRadius.circular(40),
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
                child: btnval != null
                    ? Text(
                        btnval,
                        style: TextStyle(
                            color: textColor ??
                                (darkMode ? Colors.white : Colors.black),
                            fontSize: 30),
                      )
                    : Icon(
                        icon,
                        color: iconColor,
                        size: 30,
                      )),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NeuButton(
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            )
          ],
        ),
      ),
      darkMode: darkMode,
      borderRadius: BorderRadius.circular(40),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    );
  }

  // Widget _buttonOval({
  //   String? title,
  //   double padding = 15,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: NeuButton(
  //       child: SizedBox(
  //         width: padding * 2,
  //         child: Center(
  //           child: Text(
  //             title!,
  //             style: TextStyle(
  //               color: darkMode ? Colors.green : Colors.black,
  //               fontSize: 15,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //       darkMode: darkMode,
  //       borderRadius: BorderRadius.circular(50),
  //       padding:
  //           EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
  //     ),
  //   );
  // }

}
