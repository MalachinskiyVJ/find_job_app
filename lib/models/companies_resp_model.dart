class CompaniesRespsonse {
  List<Company>? company;

  CompaniesRespsonse({this.company});

  CompaniesRespsonse.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      company = <Company>[];
      json['result'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['result'] = this.company!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? description;
  String? industry;

  Company({this.id, this.name, this.description, this.industry});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    industry = json['industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['industry'] = this.industry;
    return data;
  }
}
