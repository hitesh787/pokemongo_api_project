class HelloModel {
  String? name;
  int? age;
  List<Address>? address;
  int? phone;
  String? hobby;


  HelloModel({this.name, this.age, this.address, this.phone, this.hobby});


  HelloModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    age = json['Age'];
    if (json['Address'] != null) {
      address = <Address>[];
      json['Address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
    phone = json['Phone'];
    hobby = json['Hobby'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Age'] = age;
    if (address != null) {
      data['Address'] = address!.map((v) => v.toJson()).toList();
    }
    data['Phone'] = phone;
    data['Hobby'] = hobby;
    return data;
  }


}


class Address {
  String? city;
  String? stata;
  String? country;

  Address({this.city, this.stata, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    stata = json['Stata'];
    country = json['Country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['Stata'] = stata;
    data['Country'] = country;
    return data;
  }
}
