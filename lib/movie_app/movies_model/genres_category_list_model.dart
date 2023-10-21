class GenresCategoryListModel {
  int? id;
  String? name;

  GenresCategoryListModel({this.id, this.name});

  GenresCategoryListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
