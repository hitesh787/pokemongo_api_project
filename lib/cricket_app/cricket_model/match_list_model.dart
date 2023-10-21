
class CricketMatchSeriesModel {
  Info? info;
  List<MatchList>? matchList;

  CricketMatchSeriesModel({this.info, this.matchList});

  CricketMatchSeriesModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['matchList'] != null) {
      matchList = <MatchList>[];
      json['matchList'].forEach((v) {
        matchList!.add(MatchList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (matchList != null) {
      data['matchList'] = matchList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? id;
  String? name;
  String? startdate;
  String? enddate;
  int? odi;
  int? t20;
  int? test;
  int? squads;
  int? matches;

  Info(
      {this.id,
        this.name,
        this.startdate,
        this.enddate,
        this.odi,
        this.t20,
        this.test,
        this.squads,
        this.matches});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    odi = json['odi'];
    t20 = json['t20'];
    test = json['test'];
    squads = json['squads'];
    matches = json['matches'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['odi'] = odi;
    data['t20'] = t20;
    data['test'] = test;
    data['squads'] = squads;
    data['matches'] = matches;
    return data;
  }
}

class MatchList {
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  String? dateTimeGMT;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  bool? fantasyEnabled;
  bool? bbbEnabled;
  bool? hasSquad;
  bool? matchStarted;
  bool? matchEnded;

  MatchList(
      {this.id,
        this.name,
        this.matchType,
        this.status,
        this.venue,
        this.date,
        this.dateTimeGMT,
        this.teams,
        this.teamInfo,
        this.fantasyEnabled,
        this.bbbEnabled,
        this.hasSquad,
        this.matchStarted,
        this.matchEnded});

  MatchList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    matchType = json['matchType'];
    status = json['status'];
    venue = json['venue'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    teams = json['teams'].cast<String>();
    if (json['teamInfo'] != null) {
      teamInfo = <TeamInfo>[];
      json['teamInfo'].forEach((v) {
        teamInfo!.add(TeamInfo.fromJson(v));
      });
    }
    fantasyEnabled = json['fantasyEnabled'];
    bbbEnabled = json['bbbEnabled'];
    hasSquad = json['hasSquad'];
    matchStarted = json['matchStarted'];
    matchEnded = json['matchEnded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['matchType'] = matchType;
    data['status'] = status;
    data['venue'] = venue;
    data['date'] = date;
    data['dateTimeGMT'] = dateTimeGMT;
    data['teams'] = teams;
    if (teamInfo != null) {
      data['teamInfo'] = teamInfo!.map((v) => v.toJson()).toList();
    }
    data['fantasyEnabled'] = fantasyEnabled;
    data['bbbEnabled'] = bbbEnabled;
    data['hasSquad'] = hasSquad;
    data['matchStarted'] = matchStarted;
    data['matchEnded'] = matchEnded;
    return data;
  }
}

class TeamInfo {
  String? name;
  String? shortname;
  String? img;

  TeamInfo({this.name, this.shortname, this.img});

  TeamInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortname = json['shortname'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['shortname'] = shortname;
    data['img'] = img;
    return data;
  }
}

