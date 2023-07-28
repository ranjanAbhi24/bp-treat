class SetReminder {
  String? msg;
  String? status;
  Data? data;

  SetReminder({this.msg, this.status, this.data});

  SetReminder.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? period;
  String? time;
  String? type;

  Data({this.period, this.time, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    time = json['time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['period'] = period;
    data['time'] = time;
    data['type'] = type;
    return data;
  }
}