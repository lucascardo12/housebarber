import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/meets.dart';

List<Meeting> getDataSource() {
  List<Meeting> meetings = <Meeting>[];

  listAgenda.forEach((element) {
    meetings.add(Meeting('Conference', DateTime.parse(element.startTime),
        DateTime.parse(element.endTime), secondary, false));
  });

  return meetings;
}
