import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

class ProfileModel {
    final int? status;
    final int? postsCount;
    final UserDetails? userDetails;
    final List<MyPost>? posts;

    ProfileModel({
        this.status,
        this.postsCount,
        this.userDetails,
        this.posts,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        postsCount: json["posts_count"],
        userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
        posts: json["posts"] == null ? [] : List<MyPost>.from(json["posts"]!.map((x) => MyPost.fromJson(x))),
    );
}

class MyPost {
    final int? id;
    final int? userId;
    final String? title;
    final String? slug;
    final String? featuredimage;
    final String? body;
    final int? status;
    final dynamic like;
    final dynamic dislike;
    final int? views;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    MyPost({
        this.id,
        this.userId,
        this.title,
        this.slug,
        this.featuredimage,
        this.body,
        this.status,
        this.like,
        this.dislike,
        this.views,
        this.createdAt,
        this.updatedAt,
    });

    factory MyPost.fromJson(Map<String, dynamic> json) => MyPost(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        slug: json["slug"],
        featuredimage: json["featuredimage"],
        body: json["body"],
        status: json["status"],
        like: json["like"],
        dislike: json["dislike"],
        views: json["views"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );
}

class UserDetails {
    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final dynamic currentTeamId;
    final String? profilePhotoPath;
    final String? about;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? profilePhotoUrl;

    UserDetails({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.about,
        this.createdAt,
        this.updatedAt,
        this.profilePhotoUrl,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        about: json["about"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"],
    );
}
