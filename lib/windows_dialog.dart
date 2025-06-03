import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

const _goldenRatio = 1.618;

Future<T?> showSuccessDialog95<T>({
  required BuildContext context,
  required String title,
  required String message,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      var maxWidth = MediaQuery.of(context).size.width < 400
          ? MediaQuery.of(context).size.width / _goldenRatio
          : MediaQuery.of(context).size.width / 3;
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Scaffold95(
            title: title,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Column(
                children: <Widget>[
                  Text(
                    message,
                    style: Flutter95.textStyle,
                  ),
                  const SizedBox(height: 8),
                  Button95(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
