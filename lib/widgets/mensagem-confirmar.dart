import 'package:flutter/material.dart';

Future<void> showConfirme(
    {BuildContext context,
    String label,
    Function confirme,
    Function cancel}) async {
  AlertDialog simpleDialog = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    content: Container(
      child: Text(label),
    ),
    actions: <Widget>[
      Row(
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5),
              ),
              backgroundColor: Colors.red,
            ),
            child: Text(
              'Cancelar',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            onPressed: cancel,
          ),
          SizedBox(width: 5),
          TextButton(
            child: Text(
              'Confirmar',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5),
              ),
              backgroundColor: Colors.green,
            ),
            onPressed: confirme,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ],
  );
  showDialog(context: context, builder: (BuildContext context) => simpleDialog);
}
