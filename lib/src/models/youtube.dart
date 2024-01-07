// To parse this JSON data, do
//
//     final youtubeResponse = youtubeResponseFromJson(jsonString);

import 'dart:convert';

YoutubeResponse youtubeResponseFromJson(String str) => YoutubeResponse.fromJson(json.decode(str));

String youtubeResponseToJson(YoutubeResponse data) => json.encode(data.toJson());

class YoutubeResponse {
    List<Youtube> youtubes;
    bool error;
    String errorMsg;

    YoutubeResponse({
        required this.youtubes,
        required this.error,
        required this.errorMsg,
    });

    factory YoutubeResponse.fromJson(Map<String, dynamic> json) => YoutubeResponse(
        youtubes: List<Youtube>.from(json["youtubes"].map((x) => Youtube.fromJson(x))),
        error: json["error"],
        errorMsg: json["error_msg"],
    );

    Map<String, dynamic> toJson() => {
        "youtubes": List<dynamic>.from(youtubes.map((x) => x.toJson())),
        "error": error,
        "error_msg": errorMsg,
    };
}

class Youtube {
    String id;
    String title;
    String subtitle;
    String avatarImage;
    String youtubeImage;

    Youtube({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.avatarImage,
        required this.youtubeImage,
    });

    factory Youtube.fromJson(Map<String, dynamic> json) => Youtube(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        avatarImage: json["avatar_image"],
        youtubeImage: json["youtube_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "avatar_image": avatarImage,
        "youtube_image": youtubeImage,
    };
}
