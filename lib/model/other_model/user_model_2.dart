var data = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Klas Light",
    "suite": "Apt. 556",
    "city": "Gwen borough",
    "zipcode": "92998-3874",
    "geo": {"lat": "-37.3159", "lng": "81.1496"}
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Demagoguery-Cron",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
};

/// User Model for Manual
class ProfileModelCustom {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  List<AddressModelCustom>? address;
  List<CompanyModel>? company;

  ProfileModelCustom(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  ProfileModelCustom.formJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    username = json['username'];
    email = json['email'];
    if (json['address'] != null) {
      address = <AddressModelCustom>[];
      json['address'].forEach((element) {
        address!.add(AddressModelCustom.formJson(element));
      });
    }
    phone = json['phone'];
    website = json['website'];
    // company = (json['company'] != null ? CompanyModel.formJson(json['company']) : null);
    if (json["company"] != null) {
      company = <CompanyModel>[];
      json["company"].forEach((element) {
        company!.add(CompanyModel.formJson(element));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.map((e) => e.toJson()).toList();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data["company"] = company!.map((e) => e.toJson()).toList();
    }
    // if (this.company != null) {
    //   data['company'] = this.company!.toJson();
    // }
    return data;
  }
}





class AddressModelCustom {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  List<GeoModelCustom>? geo;

  AddressModelCustom(
      {this.street, this.suite, this.city, this.zipcode, this.geo});

  AddressModelCustom.formJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    if (json["geo"] != null) {
      geo = <GeoModelCustom>[];
      json['geo'].forEach((element) {
        geo!.add(GeoModelCustom.formJson(element));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.map((e) => e.toJson());
    }
    return data;
  }
}

class GeoModelCustom {
  String? lat;
  String? lng;

  GeoModelCustom({this.lat, this.lng});

  GeoModelCustom.formJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class CompanyModel {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyModel({this.name, this.catchPhrase, this.bs});

  CompanyModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
