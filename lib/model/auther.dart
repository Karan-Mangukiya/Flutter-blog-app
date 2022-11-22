// To parse this JSON data, do
//
//     final autherEntity = autherEntityFromMap(jsonString);

import 'dart:convert';

class AutherEntity {
  AutherEntity({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.meta,
    this.isSuperAdmin,
    this.woocommerceMeta,
    this.links,
  });

  int? id;
  String? name;
  String? url;
  String? description;
  String? link;
  String? slug;
  Map<String, String>? avatarUrls;
  List<dynamic>? meta;
  bool? isSuperAdmin;
  WoocommerceMeta? woocommerceMeta;
  Links? links;

  factory AutherEntity.fromJson(String str) =>
      AutherEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AutherEntity.fromMap(Map<String, dynamic> json) => AutherEntity(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: json["slug"],
        avatarUrls: Map.from(json["avatar_urls"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        isSuperAdmin: json["is_super_admin"],
        woocommerceMeta: WoocommerceMeta.fromMap(json["woocommerce_meta"]),
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "link": link,
        "slug": slug,
        "avatar_urls": Map.from(avatarUrls as Map<String, String>)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": List<dynamic>.from(meta?.map((x) => x) ?? []),
        "is_super_admin": isSuperAdmin,
        "woocommerce_meta": woocommerceMeta?.toMap(),
        "_links": links?.toMap(),
      };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection>? self;
  List<Collection>? collection;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromMap(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "self": List<dynamic>.from(self?.map((x) => x.toMap()) ?? []),
        "collection":
            List<dynamic>.from(collection?.map((x) => x.toMap()) ?? []),
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

class WoocommerceMeta {
  WoocommerceMeta({
    this.activityPanelInboxLastRead,
    this.activityPanelReviewsLastRead,
    this.categoriesReportColumns,
    this.couponsReportColumns,
    this.customersReportColumns,
    this.ordersReportColumns,
    this.productsReportColumns,
    this.revenueReportColumns,
    this.taxesReportColumns,
    this.variationsReportColumns,
    this.dashboardSections,
    this.dashboardChartType,
    this.dashboardChartInterval,
    this.dashboardLeaderboardRows,
    this.homepageLayout,
    this.homepageStats,
    this.taskListTrackedStartedTasks,
    this.helpPanelHighlightShown,
    this.androidAppBannerDismissed,
  });

  String? activityPanelInboxLastRead;
  String? activityPanelReviewsLastRead;
  String? categoriesReportColumns;
  String? couponsReportColumns;
  String? customersReportColumns;
  String? ordersReportColumns;
  String? productsReportColumns;
  String? revenueReportColumns;
  String? taxesReportColumns;
  String? variationsReportColumns;
  String? dashboardSections;
  String? dashboardChartType;
  String? dashboardChartInterval;
  String? dashboardLeaderboardRows;
  String? homepageLayout;
  String? homepageStats;
  String? taskListTrackedStartedTasks;
  String? helpPanelHighlightShown;
  String? androidAppBannerDismissed;

  factory WoocommerceMeta.fromJson(String str) =>
      WoocommerceMeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WoocommerceMeta.fromMap(Map<String, dynamic> json) => WoocommerceMeta(
        activityPanelInboxLastRead: json["activity_panel_inbox_last_read"],
        activityPanelReviewsLastRead: json["activity_panel_reviews_last_read"],
        categoriesReportColumns: json["categories_report_columns"],
        couponsReportColumns: json["coupons_report_columns"],
        customersReportColumns: json["customers_report_columns"],
        ordersReportColumns: json["orders_report_columns"],
        productsReportColumns: json["products_report_columns"],
        revenueReportColumns: json["revenue_report_columns"],
        taxesReportColumns: json["taxes_report_columns"],
        variationsReportColumns: json["variations_report_columns"],
        dashboardSections: json["dashboard_sections"],
        dashboardChartType: json["dashboard_chart_type"],
        dashboardChartInterval: json["dashboard_chart_interval"],
        dashboardLeaderboardRows: json["dashboard_leaderboard_rows"],
        homepageLayout: json["homepage_layout"],
        homepageStats: json["homepage_stats"],
        taskListTrackedStartedTasks: json["task_list_tracked_started_tasks"],
        helpPanelHighlightShown: json["help_panel_highlight_shown"],
        androidAppBannerDismissed: json["android_app_banner_dismissed"],
      );

  Map<String, dynamic> toMap() => {
        "activity_panel_inbox_last_read": activityPanelInboxLastRead,
        "activity_panel_reviews_last_read": activityPanelReviewsLastRead,
        "categories_report_columns": categoriesReportColumns,
        "coupons_report_columns": couponsReportColumns,
        "customers_report_columns": customersReportColumns,
        "orders_report_columns": ordersReportColumns,
        "products_report_columns": productsReportColumns,
        "revenue_report_columns": revenueReportColumns,
        "taxes_report_columns": taxesReportColumns,
        "variations_report_columns": variationsReportColumns,
        "dashboard_sections": dashboardSections,
        "dashboard_chart_type": dashboardChartType,
        "dashboard_chart_interval": dashboardChartInterval,
        "dashboard_leaderboard_rows": dashboardLeaderboardRows,
        "homepage_layout": homepageLayout,
        "homepage_stats": homepageStats,
        "task_list_tracked_started_tasks": taskListTrackedStartedTasks,
        "help_panel_highlight_shown": helpPanelHighlightShown,
        "android_app_banner_dismissed": androidAppBannerDismissed,
      };
}
