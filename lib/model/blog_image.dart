// To parse this JSON data, do
//
//     final featureMedia = featureMediaFromMap(jsonString);

import 'dart:convert';

class BlogImageEntity {
  BlogImageEntity({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.author,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.meta,
    this.description,
    this.caption,
    this.altText,
    this.mediaType,
    this.mimeType,
    this.mediaDetails,
    this.post,
    this.sourceUrl,
    this.links,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Caption? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Caption? title;
  int? author;
  String? commentStatus;
  String? pingStatus;
  String? template;
  Meta? meta;
  Caption? description;
  Caption? caption;
  String? altText;
  String? mediaType;
  MimeType? mimeType;
  MediaDetails? mediaDetails;
  int? post;
  String? sourceUrl;
  Links? links;

  factory BlogImageEntity.fromJson(String str) =>
      BlogImageEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogImageEntity.fromMap(Map<String, dynamic> json) => BlogImageEntity(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Caption.fromMap(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Caption.fromMap(json["title"]),
        author: json["author"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        template: json["template"],
        meta: Meta.fromMap(json["meta"]),
        description: Caption.fromMap(json["description"]),
        caption: Caption.fromMap(json["caption"]),
        altText: json["alt_text"],
        mediaType: json["media_type"],
        mimeType: mimeTypeValues.map?[json["mime_type"]],
        mediaDetails: MediaDetails.fromMap(json["media_details"]),
        post: json["post"],
        sourceUrl: json["source_url"],
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date?.toIso8601String(),
        "date_gmt": dateGmt?.toIso8601String(),
        "guid": guid?.toMap(),
        "modified": modified?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title?.toMap(),
        "author": author,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": meta?.toMap(),
        "description": description?.toMap(),
        "caption": caption?.toMap(),
        "alt_text": altText,
        "media_type": mediaType,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "media_details": mediaDetails?.toMap(),
        "post": post,
        "source_url": sourceUrl,
        "_links": links?.toMap(),
      };
}

class Caption {
  Caption({
    this.rendered,
  });

  String? rendered;

  factory Caption.fromJson(String str) => Caption.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Caption.fromMap(Map<String, dynamic> json) => Caption(
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
    this.about,
    this.author,
    this.replies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromMap(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromMap(x))),
        about: List<About>.from(json["about"].map((x) => About.fromMap(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromMap(x))),
        replies:
            List<Author>.from(json["replies"].map((x) => Author.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "self": List<dynamic>.from(self?.map((x) => x.toMap()) ?? []),
        "collection":
            List<dynamic>.from(collection?.map((x) => x.toMap()) ?? []),
        "about": List<dynamic>.from(about?.map((x) => x.toMap()) ?? []),
        "author": List<dynamic>.from(author?.map((x) => x.toMap()) ?? []),
        "replies": List<dynamic>.from(replies?.map((x) => x.toMap()) ?? []),
      };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(String str) => About.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory About.fromMap(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class MediaDetails {
  MediaDetails({
    this.width,
    this.height,
    this.file,
    this.filesize,
    this.sizes,
    this.imageMeta,
    this.originalImage,
  });

  int? width;
  int? height;
  String? file;
  int? filesize;
  Map<String, Size>? sizes;
  ImageMeta? imageMeta;
  String? originalImage;

  factory MediaDetails.fromJson(String str) =>
      MediaDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaDetails.fromMap(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        filesize: json["filesize"],
        sizes: Map.from(json["sizes"])
            .map((k, v) => MapEntry<String, Size>(k, Size.fromMap(v))),
        imageMeta: ImageMeta.fromMap(json["image_meta"]),
        originalImage: json["original_image"],
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "file": file,
        "filesize": filesize,
        "sizes": Map.from(sizes as Map<String, Size>)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "image_meta": imageMeta?.toMap(),
        "original_image": originalImage,
      };
}

class ImageMeta {
  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<String>? keywords;

  factory ImageMeta.fromJson(String str) => ImageMeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageMeta.fromMap(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": List<dynamic>.from(keywords?.map((x) => x) ?? []),
      };
}

class Size {
  Size({
    this.file,
    this.width,
    this.height,
    this.filesize,
    this.mimeType,
    this.sourceUrl,
    this.uncropped,
  });

  String? file;
  int? width;
  int? height;
  int? filesize;
  MimeType? mimeType;
  String? sourceUrl;
  bool? uncropped;

  factory Size.fromJson(String str) => Size.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Size.fromMap(Map<String, dynamic> json) => Size(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        filesize: json["filesize"],
        mimeType: mimeTypeValues.map?[json["mime_type"]],
        sourceUrl: json["source_url"],
        uncropped: json["uncropped"],
      );

  Map<String, dynamic> toMap() => {
        "file": file,
        "width": width,
        "height": height,
        "filesize": filesize,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "source_url": sourceUrl,
        "uncropped": uncropped,
      };
}

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({"image/jpeg": MimeType.IMAGE_JPEG});

class Meta {
  Meta({
    this.omDisableAllCampaigns,
    this.miSkipTracking,
  });

  bool? omDisableAllCampaigns;
  bool? miSkipTracking;

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        omDisableAllCampaigns: json["om_disable_all_campaigns"],
        miSkipTracking: json["_mi_skip_tracking"],
      );

  Map<String, dynamic> toMap() => {
        "om_disable_all_campaigns": omDisableAllCampaigns,
        "_mi_skip_tracking": miSkipTracking,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    // if (reverseMap == null) {
    //   reverseMap = map?.map((k, v) => MapEntry(v, k));
    // }
    return <T, String>{};
  }
}
