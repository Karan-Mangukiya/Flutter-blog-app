// // To parse this JSON data, do
// //
// //     final blogDetailsEntity = blogDetailsEntityFromMap(jsonString);

// import 'dart:convert';

// class BlogDataEntity {
//   BlogDataEntity({
//     this.id,
//     this.date,
//     this.dateGmt,
//     this.guid,
//     this.modified,
//     this.modifiedGmt,
//     this.slug,
//     this.status,
//     this.type,
//     this.link,
//     this.title,
//     this.content,
//     this.excerpt,
//     this.author,
//     this.featuredMedia,
//     this.commentStatus,
//     this.pingStatus,
//     this.sticky,
//     this.template,
//     this.format,
//     this.meta,
//     this.categories,
//     this.tags,
//     this.links,
//   });

//   int? id;
//   DateTime? date;
//   DateTime? dateGmt;
//   Guid? guid;
//   DateTime? modified;
//   DateTime? modifiedGmt;
//   String? slug;
//   String? status;
//   String? type;
//   String? link;
//   Guid? title;
//   Content? content;
//   Content? excerpt;
//   int? author;
//   int? featuredMedia;
//   String? commentStatus;
//   String? pingStatus;
//   bool? sticky;
//   String? template;
//   String? format;
//   Meta? meta;
//   List<int>? categories;
//   List<dynamic>? tags;
//   Links? links;

//   factory BlogDataEntity.fromJson(String str) =>
//       BlogDataEntity.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory BlogDataEntity.fromMap(Map<String, dynamic> json) => BlogDataEntity(
//         id: json["id"],
//         date: DateTime.parse(json["date"]),
//         dateGmt: DateTime.parse(json["date_gmt"]),
//         guid: Guid.fromMap(json["guid"]),
//         modified: DateTime.parse(json["modified"]),
//         modifiedGmt: DateTime.parse(json["modified_gmt"]),
//         slug: json["slug"],
//         status: json["status"],
//         type: json["type"],
//         link: json["link"],
//         title: Guid.fromMap(json["title"]),
//         content: Content.fromMap(json["content"]),
//         excerpt: Content.fromMap(json["excerpt"]),
//         author: json["author"],
//         featuredMedia: json["featured_media"],
//         commentStatus: json["comment_status"],
//         pingStatus: json["ping_status"],
//         sticky: json["sticky"],
//         template: json["template"],
//         format: json["format"],
//         meta: Meta.fromMap(json["meta"]),
//         categories: List<int>.from(json["categories"].map((x) => x)),
//         tags: List<dynamic>.from(json["tags"].map((x) => x)),
//         links: Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "date": date?.toIso8601String(),
//         "date_gmt": dateGmt?.toIso8601String(),
//         "guid": guid?.toMap(),
//         "modified": modified?.toIso8601String(),
//         "modified_gmt": modifiedGmt?.toIso8601String(),
//         "slug": slug,
//         "status": status,
//         "type": type,
//         "link": link,
//         "title": title?.toMap(),
//         "content": content?.toMap(),
//         "excerpt": excerpt?.toMap(),
//         "author": author,
//         "featured_media": featuredMedia,
//         "comment_status": commentStatus,
//         "ping_status": pingStatus,
//         "sticky": sticky,
//         "template": template,
//         "format": format,
//         "meta": meta?.toMap(),
//         "categories": List<dynamic>.from(categories?.map((x) => x) ?? []),
//         "tags": List<dynamic>.from(tags?.map((x) => x) ?? []),
//         "_links": links?.toMap(),
//       };
// }

// class Content {
//   Content({
//     this.rendered,
//     this.protected,
//   });

//   String? rendered;
//   bool? protected;

//   factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Content.fromMap(Map<String, dynamic> json) => Content(
//         rendered: json["rendered"],
//         protected: json["protected"],
//       );

//   Map<String, dynamic> toMap() => {
//         "rendered": rendered,
//         "protected": protected,
//       };
// }

// class Guid {
//   Guid({
//     this.rendered,
//   });

//   String? rendered;

//   factory Guid.fromJson(String str) => Guid.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Guid.fromMap(Map<String, dynamic> json) => Guid(
//         rendered: json["rendered"],
//       );

//   Map<String, dynamic> toMap() => {
//         "rendered": rendered,
//       };
// }

// class Links {
//   Links({
//     this.self,
//     this.collection,
//     this.about,
//     this.author,
//     this.replies,
//     this.versionHistory,
//     this.wpAttachment,
//     this.wpTerm,
//     this.curies,
//   });

//   List<About>? self;
//   List<About>? collection;
//   List<About>? about;
//   List<Author>? author;
//   List<Author>? replies;
//   List<VersionHistory>? versionHistory;
//   List<About>? wpAttachment;
//   List<WpTerm>? wpTerm;
//   List<Cury>? curies;

//   factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Links.fromMap(Map<String, dynamic> json) => Links(
//         self: List<About>.from(json["self"].map((x) => About.fromMap(x))),
//         collection:
//             List<About>.from(json["collection"].map((x) => About.fromMap(x))),
//         about: List<About>.from(json["about"].map((x) => About.fromMap(x))),
//         author: List<Author>.from(json["author"].map((x) => Author.fromMap(x))),
//         replies:
//             List<Author>.from(json["replies"].map((x) => Author.fromMap(x))),
//         versionHistory: List<VersionHistory>.from(
//             json["version-history"].map((x) => VersionHistory.fromMap(x))),
//         wpAttachment: List<About>.from(
//             json["wp:attachment"].map((x) => About.fromMap(x))),
//         wpTerm:
//             List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromMap(x))),
//         curies: List<Cury>.from(json["curies"].map((x) => Cury.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "self": List<dynamic>.from(self?.map((x) => x.toMap()) ?? []),
//         "collection":
//             List<dynamic>.from(collection?.map((x) => x.toMap()) ?? []),
//         "about": List<dynamic>.from(about?.map((x) => x.toMap()) ?? []),
//         "author": List<dynamic>.from(author?.map((x) => x.toMap()) ?? []),
//         "replies": List<dynamic>.from(replies?.map((x) => x.toMap()) ?? []),
//         "version-history":
//             List<dynamic>.from(versionHistory?.map((x) => x.toMap()) ?? []),
//         "wp:attachment":
//             List<dynamic>.from(wpAttachment?.map((x) => x.toMap()) ?? []),
//         "wp:term": List<dynamic>.from(wpTerm?.map((x) => x.toMap()) ?? []),
//         "curies": List<dynamic>.from(curies?.map((x) => x.toMap()) ?? []),
//       };
// }

// class About {
//   About({
//     this.href,
//   });

//   String? href;

//   factory About.fromJson(String str) => About.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory About.fromMap(Map<String, dynamic> json) => About(
//         href: json["href"],
//       );

//   Map<String, dynamic> toMap() => {
//         "href": href,
//       };
// }

// class Author {
//   Author({
//     this.embeddable,
//     this.href,
//   });

//   bool? embeddable;
//   String? href;

//   factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Author.fromMap(Map<String, dynamic> json) => Author(
//         embeddable: json["embeddable"],
//         href: json["href"],
//       );

//   Map<String, dynamic> toMap() => {
//         "embeddable": embeddable,
//         "href": href,
//       };
// }

// class Cury {
//   Cury({
//     this.name,
//     this.href,
//     this.templated,
//   });

//   String? name;
//   String? href;
//   bool? templated;

//   factory Cury.fromJson(String str) => Cury.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Cury.fromMap(Map<String, dynamic> json) => Cury(
//         name: json["name"],
//         href: json["href"],
//         templated: json["templated"],
//       );

//   Map<String, dynamic> toMap() => {
//         "name": name,
//         "href": href,
//         "templated": templated,
//       };
// }

// class VersionHistory {
//   VersionHistory({
//     this.count,
//     this.href,
//   });

//   int? count;
//   String? href;

//   factory VersionHistory.fromJson(String str) =>
//       VersionHistory.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory VersionHistory.fromMap(Map<String, dynamic> json) => VersionHistory(
//         count: json["count"],
//         href: json["href"],
//       );

//   Map<String, dynamic> toMap() => {
//         "count": count,
//         "href": href,
//       };
// }

// class WpTerm {
//   WpTerm({
//     this.taxonomy,
//     this.embeddable,
//     this.href,
//   });

//   String? taxonomy;
//   bool? embeddable;
//   String? href;

//   factory WpTerm.fromJson(String str) => WpTerm.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory WpTerm.fromMap(Map<String, dynamic> json) => WpTerm(
//         taxonomy: json["taxonomy"],
//         embeddable: json["embeddable"],
//         href: json["href"],
//       );

//   Map<String, dynamic> toMap() => {
//         "taxonomy": taxonomy,
//         "embeddable": embeddable,
//         "href": href,
//       };
// }

// class Meta {
//   Meta({
//     this.omDisableAllCampaigns,
//     this.miSkipTracking,
//   });

//   bool? omDisableAllCampaigns;
//   bool? miSkipTracking;

//   factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Meta.fromMap(Map<String, dynamic> json) => Meta(
//         omDisableAllCampaigns: json["om_disable_all_campaigns"],
//         miSkipTracking: json["_mi_skip_tracking"],
//       );

//   Map<String, dynamic> toMap() => {
//         "om_disable_all_campaigns": omDisableAllCampaigns,
//         "_mi_skip_tracking": miSkipTracking,
//       };
// }
