class Notificacao {
  int id;
  int appid;
  String message;
  String title;
  int priority;
  String date;

  Notificacao({this.id, this.appid, this.message, this.title, this.priority, this.date});

  Notificacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appid = json['appid'];
    message = json['message'];
    title = json['title'];
    priority = json['priority'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appid'] = this.appid;
    data['message'] = this.message;
    data['title'] = this.title;
    data['priority'] = this.priority;
    data['date'] = this.date;
    return data;
  }
}
