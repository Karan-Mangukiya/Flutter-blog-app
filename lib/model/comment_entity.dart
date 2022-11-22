// To parse this JSON data, do
//
//     final commentEntity = commentEntityFromMap(jsonString);

import 'dart:convert';

class CommentEntity {
  CommentEntity({
    this.id,
    this.post,
    this.parent,
    this.author,
    this.authorName,
    this.authorUrl,
    this.date,
    this.dateGmt,
    this.content,
    this.link,
    this.status,
    this.type,
    this.authorAvatarUrls,
    this.meta,
    this.links,
  });

  int? id;
  int? post;
  int? parent;
  int? author;
  String? authorName;
  String? authorUrl;
  DateTime? date;
  DateTime? dateGmt;
  Content? content;
  String? link;
  String? status;
  String? type;
  Map<String, String>? authorAvatarUrls;
  List<dynamic>? meta;
  Links? links;

  factory CommentEntity.fromJson(String str) =>
      CommentEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentEntity.fromMap(Map<String, dynamic> json) => CommentEntity(
        id: json["id"],
        post: json["post"],
        parent: json["parent"],
        author: json["author"],
        authorName: json["author_name"],
        authorUrl: json["author_url"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        content: Content.fromMap(json["content"]),
        link: json["link"],
        status: json["status"],
        type: json["type"],
        authorAvatarUrls: Map.from(json["author_avatar_urls"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "post": post,
        "parent": parent,
        "author": author,
        "author_name": authorName,
        "author_url": authorUrl,
        "date": date?.toIso8601String(),
        "date_gmt": dateGmt?.toIso8601String(),
        "content": content?.toMap(),
        "link": link,
        "status": status,
        "type": type,
        "author_avatar_urls": Map.from(authorAvatarUrls ?? {})
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": List<dynamic>.from(meta?.map((x) => x) ?? []),
        "_links": links?.toMap(),
      };
}

class Content {
  Content({
    this.rendered,
  });

  String? rendered;

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toMap() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.up,
  });

  List<Collection>? self;
  List<Collection>? collection;
  List<Up>? up;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromMap(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromMap(x))),
        up: List<Up>.from(json["up"].map((x) => Up.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "self": List<dynamic>.from(self?.map((x) => x.toMap()) ?? []),
        "collection":
            List<dynamic>.from(collection?.map((x) => x.toMap()) ?? []),
        "up": List<dynamic>.from(up?.map((x) => x.toMap()) ?? []),
      };
}

class Collection {
  Collection({
    this.href,
  });

  String? href;

  factory Collection.fromJson(String str) =>
      Collection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class Up {
  Up({
    this.embeddable,
    this.postType,
    this.href,
  });

  bool? embeddable;
  String? postType;
  String? href;

  factory Up.fromJson(String str) => Up.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Up.fromMap(Map<String, dynamic> json) => Up(
        embeddable: json["embeddable"],
        postType: json["post_type"],
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "embeddable": embeddable,
        "post_type": postType,
        "href": href,
      };
}
