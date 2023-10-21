class CricketMatchModel {
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  String? dateTimeGMT;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  String? seriesId;
  bool? fantasyEnabled;
  bool? bbbEnabled;
  bool? hasSquad;
  bool? matchStarted;
  bool? matchEnded;
  List<Score>? score;

  CricketMatchModel(
      {this.id,
        this.name,
        this.matchType,
        this.status,
        this.venue,
        this.date,
        this.dateTimeGMT,
        this.teams,
        this.teamInfo,
        this.seriesId,
        this.fantasyEnabled,
        this.bbbEnabled,
        this.hasSquad,
        this.matchStarted,
        this.matchEnded,
        this.score});

  CricketMatchModel.fromJson(Map<String, dynamic> json) {
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
        teamInfo!.add(new TeamInfo.fromJson(v));
      });
    }
    seriesId = json['series_id'];
    fantasyEnabled = json['fantasyEnabled'];
    bbbEnabled = json['bbbEnabled'];
    hasSquad = json['hasSquad'];
    matchStarted = json['matchStarted'];
    matchEnded = json['matchEnded'];
    if (json['score'] != null) {
      score = <Score>[];
      json['score'].forEach((v) {
        score!.add(new Score.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['matchType'] = this.matchType;
    data['status'] = this.status;
    data['venue'] = this.venue;
    data['date'] = this.date;
    data['dateTimeGMT'] = this.dateTimeGMT;
    data['teams'] = this.teams;
    if (this.teamInfo != null) {
      data['teamInfo'] = this.teamInfo!.map((v) => v.toJson()).toList();
    }
    data['series_id'] = this.seriesId;
    data['fantasyEnabled'] = this.fantasyEnabled;
    data['bbbEnabled'] = this.bbbEnabled;
    data['hasSquad'] = this.hasSquad;
    data['matchStarted'] = this.matchStarted;
    data['matchEnded'] = this.matchEnded;
    if (this.score != null) {
      data['score'] = this.score!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shortname'] = this.shortname;
    data['img'] = this.img;
    return data;
  }
}

class Score {
  int? r;
  int? w;
  double? o;
  String? inning;

  Score({this.r, this.w, this.o, this.inning});

  Score.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    w = json['w'];
    o = json['o'].toDouble();
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['w'] = this.w;
    data['o'] = this.o;
    data['inning'] = this.inning;
    return data;
  }
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  int? offsetRows;
  int? totalRows;
  double? queryTime;
  int? s;
  int? cache;

  Info(
      {this.hitsToday,
        this.hitsUsed,
        this.hitsLimit,
        this.credits,
        this.server,
        this.offsetRows,
        this.totalRows,
        this.queryTime,
        this.s,
        this.cache});

  Info.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    offsetRows = json['offsetRows'];
    totalRows = json['totalRows'];
    queryTime = json['queryTime'].toDouble();
    s = json['s'];
    cache = json['cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hitsToday'] = this.hitsToday;
    data['hitsUsed'] = this.hitsUsed;
    data['hitsLimit'] = this.hitsLimit;
    data['credits'] = this.credits;
    data['server'] = this.server;
    data['offsetRows'] = this.offsetRows;
    data['totalRows'] = this.totalRows;
    data['queryTime'] = this.queryTime;
    data['s'] = this.s;
    data['cache'] = this.cache;
    return data;
  }
}
