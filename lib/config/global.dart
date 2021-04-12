library my_prj.globals;

import 'package:housebarber/config/banco.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isLoading = false;
BancoMg bacon = new BancoMg();
User user;
SharedPreferences prefs;
List<Agendamento> listAgenda = <Agendamento>[];
String login = 'lucascardo12';
String senha = 'fuckyuo12';
String host = 'cluster0.p6s2p.mongodb.net';
String cluster = 'Cluster0';
String format = 'mongodb+srv';
