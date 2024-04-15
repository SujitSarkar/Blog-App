// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) => List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic currentTeamId;
  final String? profilePhotoPath;
  final String? about;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userId;
  final String? title;
  final String? slug;
  final String? featuredimage;
  final String? body;
  final int? status;
  final dynamic like;
  final dynamic dislike;
  final int? views;
  final String? profilePhotoUrl;

  HomeModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.about,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.title,
    this.slug,
    this.featuredimage,
    this.body,
    this.status,
    this.like,
    this.dislike,
    this.views,
    this.profilePhotoUrl,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    currentTeamId: json["current_team_id"],
    profilePhotoPath: json["profile_photo_path"],
    about: json["about"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    title: json["title"],
    slug: json["slug"],
    featuredimage: json["featuredimage"],
    body: json["body"],
    status: json["status"],
    like: json["like"],
    dislike: json["dislike"],
    views: json["views"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "current_team_id": currentTeamId,
    "profile_photo_path": profilePhotoPath,
    "about": about,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_id": userId,
    "title": title,
    "slug": slug,
    "featuredimage": featuredimage,
    "body": body,
    "status": status,
    "like": like,
    "dislike": dislike,
    "views": views,
    "profile_photo_url": profilePhotoUrl,
  };
}
