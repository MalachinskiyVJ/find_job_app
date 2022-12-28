class AddJobRequest {
  String? title;
  String? description;
  String? city;
  int? companyId;

  AddJobRequest({this.title, this.description, this.city, this.companyId});

  AddJobRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    city = json['city'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['city'] = this.city;
    data['companyId'] = this.companyId;
    return data;
  }
}
