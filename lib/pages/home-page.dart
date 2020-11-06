import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryLight,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {},
        ),
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                icon: Icon(Icons.filter_list, color: Colors.white, size: 28),
                onPressed: () {}),
          ],
        ),
        body: ListView(
          children: [],
        ));
  }
}
