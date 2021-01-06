library my_prj.globals;

import 'package:housebarber/config/banco.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable/timetable.dart';

bool isLoading = false;
BancoMg bacon = new BancoMg();
User user;
SharedPreferences prefs;
List<Agendamento> listAgenda = <Agendamento>[];
List<BasicEvent> listBasec = <BasicEvent>[];
