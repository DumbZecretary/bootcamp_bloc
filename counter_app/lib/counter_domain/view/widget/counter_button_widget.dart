import 'package:flutter/material.dart';

class CounterButtonWidget extends StatelessWidget {
  const CounterButtonWidget({
    required this.iconData,
    required this.function,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        // style: ButtonStyle(
        //     backgroundColor:
        //         MaterialStateProperty.all<Color>(Colors.pinkAccent),
        //     shape:
        //         MaterialStateProperty.all<RoundedRectangleBorder>(
        //             RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(24.0),
        //                 side: BorderSide(color: Colors.red)))),
        onPressed: function,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          primary: Colors.pinkAccent,
        ),
        child: SizedBox(
          height: 48,
          width: 48,
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
              size: 16,
            ),
          ),
        ));
  }
}
