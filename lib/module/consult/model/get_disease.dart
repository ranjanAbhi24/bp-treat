class GetDisease {
  String? msg;
  String? status;
  List<Disease>? disease;

  GetDisease({this.msg, this.status, this.disease});

  GetDisease.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    if (json['data'] != null) {
      disease = <Disease>[];
      json['data'].forEach((v) {
        disease!.add(Disease.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (disease != null) {
      data['data'] = disease!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Disease {
  String? sId;
  String? name;
  String? slug;
  String? description;
  String? symptoms;
  String? causes;
  String? treatment;
  String? category;
  String? recoveryRate;
  String? severity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Disease(
      {this.sId,
      this.name,
      this.slug,
      this.description,
      this.symptoms,
      this.causes,
      this.treatment,
      this.category,
      this.recoveryRate,
      this.severity,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Disease.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    symptoms = json['symptoms'];
    causes = json['causes'];
    treatment = json['treatment'];
    category = json['category'];
    recoveryRate = json['recoveryRate'];
    severity = json['severity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['symptoms'] = symptoms;
    data['causes'] = causes;
    data['treatment'] = treatment;
    data['category'] = category;
    data['recoveryRate'] = recoveryRate;
    data['severity'] = severity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
