class JobsRespsonse {
  List<Job>? job;

  JobsRespsonse({this.job});

  JobsRespsonse.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      job = <Job>[];
      json['result'].forEach((v) {
        job!.add(new Job.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.job != null) {
      data['result'] = this.job!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Job {
  int? id;
  int? companyId;
  String? title;
  String? description;
  String? city;

  Job({this.id, this.companyId, this.title, this.description, this.city});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    title = json['title'];
    description = json['description'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['city'] = this.city;
    return data;
  }
}
