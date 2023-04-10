class UserNotification {
  String? msg;
  String? status;
  List<Notify>? notify;

  UserNotification({this.msg, this.status, this.notify});

  UserNotification.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    if (json['data'] != null) {
      notify = <Notify>[];
      json['data'].forEach((v) {
        notify!.add(Notify.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (notify != null) {
      data['data'] = notify!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notify {
  String? sId;
  String? title;
  String? body;
  String? createdAt;

  Notify({this.sId, this.title, this.body, this.createdAt});

  Notify.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['body'] = body;
    data['createdAt'] = createdAt;
    return data;
  }
}
