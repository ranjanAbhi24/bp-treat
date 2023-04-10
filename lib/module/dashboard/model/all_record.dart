class AllRecord {
  String? msg;
  String? status;
  Records? records;

  AllRecord({this.msg, this.status, this.records});

  AllRecord.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    records = json['data'] != null ? Records.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (records != null) {
      data['data'] = records!.toJson();
    }
    return data;
  }
}

class Records {
  List<Listrecord>? listrecord;
  int? total;

  Records({this.listrecord, this.total});

  Records.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listrecord = <Listrecord>[];
      json['data'].forEach((v) {
        listrecord!.add(Listrecord.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listrecord != null) {
      data['data'] = listrecord!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Listrecord {
  String? sId;
  int? systolic;
  int? diastolic;
  int? pulse;
  String? note;
  String? createdAt;
  String? category;

  Listrecord(
      {this.sId,
      this.systolic,
      this.diastolic,
      this.pulse,
      this.note,
      this.createdAt,
      this.category});

  Listrecord.fromJson(Map<String, dynamic> json) {
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
