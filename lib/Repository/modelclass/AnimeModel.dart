class AnimeModel {
  AnimeModel({
      this.data, 
      this.meta,});

  AnimeModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Data>? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}

class Meta {
  Meta({
      this.page, 
      this.size, 
      this.totalData, 
      this.totalPage,});

  Meta.fromJson(dynamic json) {
    page = json['page'];
    size = json['size'];
    totalData = json['totalData'];
    totalPage = json['totalPage'];
  }
  int? page;
  int? size;
  int? totalData;
  int? totalPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['size'] = size;
    map['totalData'] = totalData;
    map['totalPage'] = totalPage;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.title, 
      this.alternativeTitles, 
      this.ranking, 
      this.genres, 
      this.episodes, 
      this.hasEpisode, 
      this.hasRanking, 
      this.image, 
      this.link, 
      this.status, 
      this.synopsis, 
      this.thumb, 
      this.type,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    alternativeTitles = json['alternativeTitles'] != null ? json['alternativeTitles'].cast<String>() : [];
    ranking = json['ranking'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    episodes = json['episodes'];
    hasEpisode = json['hasEpisode'];
    hasRanking = json['hasRanking'];
    image = json['image'];
    link = json['link'];
    status = json['status'];
    synopsis = json['synopsis'];
    thumb = json['thumb'];
    type = json['type'];
  }
  String? id;
  String? title;
  List<String>? alternativeTitles;
  int? ranking;
  List<String>? genres;
  int? episodes;
  bool? hasEpisode;
  bool? hasRanking;
  String? image;
  String? link;
  String? status;
  String? synopsis;
  String? thumb;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['alternativeTitles'] = alternativeTitles;
    map['ranking'] = ranking;
    map['genres'] = genres;
    map['episodes'] = episodes;
    map['hasEpisode'] = hasEpisode;
    map['hasRanking'] = hasRanking;
    map['image'] = image;
    map['link'] = link;
    map['status'] = status;
    map['synopsis'] = synopsis;
    map['thumb'] = thumb;
    map['type'] = type;
    return map;
  }

}