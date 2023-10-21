class UserModelCreate{

  int? id;
  String? name;
  String? userName;
  double? isDone;
  List<AddressModelCustom>? address;

  UserModelCreate({this.id,this.name,this.userName,this.isDone,this.address});


  UserModelCreate.formJson(Map<String,dynamic> json) {

    id = json["id"];
    name = json["name"];
    userName = json["userName"];
    isDone = json["isDone"];

    if(json[address] != null){
      address=<AddressModelCustom>[];
      json['address'].forEach((element) {
        address?.add(AddressModelCustom.formJson(element));
      });
    }
  }

  Map<String,dynamic> toJson(){

    final Map<String,dynamic> data = <String,dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['userName'] = userName;
    data['isDone'] = isDone;
    if(address != null){
      data['address'] =  address!.map((e) => e.toJson()).toList();
    }
   return data;
  }

}


class AddressModelCustom{

  String? city;
  String? state;
  String? country;

  AddressModelCustom({this.city,this.state,this.country});

  AddressModelCustom.formJson(Map<String,dynamic> json){

    city = json['city'];
    state = json['state'];
    country = json['country'];

  }


  Map<String,dynamic> toJson(){

    final Map<String,dynamic> data = <String,dynamic>{};

    data['city'] = city;
    data['state'] = state;
    data['country'] = country;

    return data;
  }


}