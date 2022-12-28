class AddCompanyRequest {
  String? name;
  String? description;
  String? industry;

  AddCompanyRequest({this.name, this.description, this.industry});

  AddCompanyRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    industry = json['industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['industry'] = this.industry;
    return data;
  }
}
