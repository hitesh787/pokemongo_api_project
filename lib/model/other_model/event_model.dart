var data =
{
  "organisersDetails": [
    {
      "admin": false
    }
  ],

  "extendedSchedule": {

    "schedule": {
      "id": "03082023_NTF137927",
      "itineraries": [
        {
          "id": "3ecc0594-01a2-438a-a189-1df24e8e0250",
          "date": {
            "nanos": 0
          },
          "activities": [
            {
              "venueCode": "GSM505108",
              "artists": [
                {
                  "performanceType": "TANGO_PERFORMANCE"
                }
              ],
              "seatMap": {
                "id": "17a9f17b-84b5-4183-a900-cbfa9c0cd6e6",
                "sectors": {
                  "Table D": {
                    "id": "5d349456-112d-48da-af71-8b7d56456fa7"
                  }
                }
              }
            }
          ]
        }
      ]
    },
    "djs": [
      {
        "id": "88daeabd-6326-46ea-8b48-8b3a1e8e7ac3",
        "type": [
          "DJ"
        ]
      }
    ],
    "performers": [
      {
        "id": "8356ad7c-3cab-4de6-a23b-d24fd9ebc072",
        "type": [
          "TANGO_INSTRUCTION"
        ]
      }
    ],
    "venues": [
      {
        "code": "MC6763580",
        "location": {
          "latitude": 40.8390369,
          "longitude": 14.2498554
        }
      }
    ],
    "eventPacks": [
      {
        "id": "0af992e8-ced7-4f3a-a234-37df1f801e9e",
        "activityIds": [
          "1ceff1a2-bbbe-40a5-b45c-a1f324b3b51b"
        ]
      }
    ]

  },

  "booking": {
    "items": [
      {
        "id": "f3f04975-2e11-442e-8fb7-1142ac4afca9",
        "included": [
          "b1bde7d5-5099-4f61-8715-688977f50dc1"
        ]
      }
    ]
  }

};




class ProfileModelCustom {
  List<String>? topics;
  List<OrganisersDetails>? organisersDetails;
  ExtendedSchedule? extendedSchedule;
  Booking? booking;

  ProfileModelCustom({this.topics,this.organisersDetails,this.extendedSchedule,this.booking});


  ProfileModelCustom.fromJson(Map<String, dynamic> json) {
    topics = json['topics'].cast<String>();
    if (json['organisersDetails'] != null) {
      organisersDetails = <OrganisersDetails>[];
      json['organisersDetails'].forEach((v) {
        organisersDetails!.add(OrganisersDetails.fromJson(v));
      });
    }
    extendedSchedule = json['extendedSchedule'] != null
        ? ExtendedSchedule.fromJson(json['extendedSchedule'])
        : null;
    booking =
    json['booking'] != null ? Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topics'] = topics;
    if (organisersDetails != null) {
      data['organisersDetails'] =
          organisersDetails!.map((v) => v.toJson()).toList();
    }
    if (extendedSchedule != null) {
      data['extendedSchedule'] = extendedSchedule!.toJson();
    }
    if (booking != null) {
      data['booking'] = booking!.toJson();
    }
    return data;
  }
}

///  OrganisersDetails model
class OrganisersDetails {
  bool? admin;

  OrganisersDetails({this.admin});

  OrganisersDetails.fromJson(Map<String, dynamic> json) {
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['admin'] = admin;
    return data;
  }
}



/// extendedSchedule Model
class ExtendedSchedule {
  Schedule? schedule;
  List<Djs>? djs;
  List<Venues>? venues;
  List<String>? venueCodes;
  List<EventPacks>? eventPacks;

  ExtendedSchedule(
      {this.schedule, this.djs, this.venues, this.venueCodes, this.eventPacks});

  ExtendedSchedule.fromJson(Map<String, dynamic> json) {
    schedule = json['schedule'] != null ? Schedule.fromJson(json['schedule']): null;
    if (json['djs'] != null) {
      djs = <Djs>[];
      json['djs'].forEach((v) {
        djs!.add(Djs.fromJson(v));
      });
    }
    if (json['venues'] != null) {
      venues = <Venues>[];
      json['venues'].forEach((v) {
        venues!.add(Venues.fromJson(v));
      });
    }
    venueCodes = json['venueCodes'].cast<String>();
    if (json['eventPacks'] != null) {
      eventPacks = <EventPacks>[];
      json['eventPacks'].forEach((v) {
        eventPacks!.add(EventPacks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    if (djs != null) {
      data['djs'] = djs!.map((v) => v.toJson()).toList();
    }
    if (venues != null) {
      data['venues'] = venues!.map((v) => v.toJson()).toList();
    }
    data['venueCodes'] = venueCodes;
    if (eventPacks != null) {
      data['eventPacks'] = eventPacks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  String? id;
  List<Itineraries>? itineraries;

  Schedule({this.id, this.itineraries});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['itineraries'] != null) {
      itineraries = <Itineraries>[];
      json['itineraries'].forEach((v) {
        itineraries!.add(Itineraries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (itineraries != null) {
      data['itineraries'] = itineraries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Itineraries {
  String? id;
  Date? date;
  List<Activities>? activities;

  Itineraries({this.id, this.date, this.activities});

  Itineraries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (date != null) {
      data['date'] = date!.toJson();
    }
    if (activities != null) {
      data['activities'] = activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Date {
  int? nanos;

  Date({this.nanos});

  Date.fromJson(Map<String, dynamic> json) {
    nanos = json['nanos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nanos'] = nanos;
    return data;
  }
}

class Activities {
  String? venueCode;
  List<Artists>? artists;
  SeatMap? seatMap;

  Activities({this.venueCode, this.artists, this.seatMap});

  Activities.fromJson(Map<String, dynamic> json) {
    venueCode = json['venueCode'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(Artists.fromJson(v));
      });
    }
    seatMap =
    json['seatMap'] != null ? SeatMap.fromJson(json['seatMap']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['venueCode'] = venueCode;
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    if (seatMap != null) {
      data['seatMap'] = seatMap!.toJson();
    }
    return data;
  }
}

class Artists {
  String? performanceType;

  Artists({this.performanceType});

  Artists.fromJson(Map<String, dynamic> json) {
    performanceType = json['performanceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['performanceType'] = performanceType;
    return data;
  }
}

class SeatMap {
  String? id;
  Sectors? sectors;

  SeatMap({this.id, this.sectors});

  SeatMap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectors =
    json['sectors'] != null ? Sectors.fromJson(json['sectors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (sectors != null) {
      data['sectors'] = sectors!.toJson();
    }
    return data;
  }
}

class Sectors {
  TableD? tableD;

  Sectors({this.tableD});

  Sectors.fromJson(Map<String, dynamic> json) {
    tableD =
    json['Table D'] != null ? TableD.fromJson(json['Table D']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tableD != null) {
      data['Table D'] = tableD!.toJson();
    }
    return data;
  }
}

class TableD {
  String? id;

  TableD({this.id});

  TableD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Djs {
  String? id;
  List<String>? type;

  Djs({this.id, this.type});

  Djs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Venues {
  String? code;
  Location? location;

  Venues({this.code, this.location});

  Venues.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class EventPacks {
  String? id;
  List<String>? activityIds;

  EventPacks({this.id, this.activityIds});

  EventPacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityIds = json['activityIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['activityIds'] = activityIds;
    return data;
  }
}




/// Booking Model
class Booking {
  List<Items>? items;

  Booking({this.items});

  Booking.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  List<String>? included;

  Items({this.id, this.included});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    included = json['included'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['included'] = included;
    return data;
  }
}
