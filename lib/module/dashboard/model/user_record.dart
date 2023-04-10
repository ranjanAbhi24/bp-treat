class UserRecord {
  String? msg;
  String? status;
  List<Record>? record;

  UserRecord({this.msg, this.status, this.record});

  UserRecord.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    if (json['data'] != null) {
      record = <Record>[];
      json['data'].forEach((v) {
        record!.add(Record.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (record != null) {
      data['data'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  String? sId;
  int? systolic;
  int? diastolic;
  int? pulse;
  String? note;
  String? createdAt;
  String? category;

  Record(
      {this.sId,
      this.systolic,
      this.diastolic,
      this.pulse,
      this.note,
      this.createdAt,
      this.category});

  Record.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    systolic = json['systolic'];
    diastolic = json['diastolic'];
    pulse = json['pulse'];
    note = json['note'];
    createdAt = json['createdAt'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['systolic'] = systolic;
    data['diastolic'] = diastolic;
    data['pulse'] = pulse;
    data['note'] = note;
    data['createdAt'] = createdAt;
    data['category'] = category;
    return data;
  }
}
