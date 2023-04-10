class GraphModel {
  String? msg;
  String? status;
  List<Graph>? graph;

  GraphModel({this.msg, this.status, this.graph});

  GraphModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    if (json['data'] != null) {
      graph = <Graph>[];
      json['data'].forEach((v) {
        graph!.add(Graph.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (graph != null) {
      data['data'] = graph!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Graph {
  String? interval;
  dynamic systolic;
  dynamic diastolic;

  Graph({this.interval, this.systolic, this.diastolic});

  Graph.fromJson(Map<String, dynamic> json) {
    interval = json['interval'];
    systolic = json['systolic'];
    diastolic = json['diastolic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interval'] = interval;
    data['systolic'] = systolic;
    data['diastolic'] = diastolic;
    return data;
  }
}
