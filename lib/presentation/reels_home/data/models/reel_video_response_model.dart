class ReelVideoResponse {
  int statusCode;
  String message;
  ReelsData reelsdata;

  ReelVideoResponse({
    required this.statusCode,
    required this.message,
    required this.reelsdata,
  });

  factory ReelVideoResponse.fromJson(Map<String, dynamic> json) => ReelVideoResponse(
        statusCode: json['statusCode'],
        message: json['message'],
        reelsdata: ReelsData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'message': message,
        'data': reelsdata.toJson(),
      };
}

class ReelsData {
  List<Reel> data;
  MetaData metaData;

  ReelsData({
    required this.data,
    required this.metaData,
  });

  factory ReelsData.fromJson(Map<String, dynamic> json) => ReelsData(
        data: List<Reel>.from(json['data'].map((x) => Reel.fromJson(x))),
        metaData: MetaData.fromJson(json['meta_data']),
      );

  int get length => data.length;

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'meta_data': metaData.toJson(),
      };
}

class Reel {
  int id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int priority;
  int categoryId;
  int totalViews;
  int totalLikes;
  int totalComments;
  int totalShare;
  int totalWishlist;
  int duration;
  DateTime byteAddedOn;
  DateTime byteUpdatedOn;
  String? bunnyStreamVideoId;
  String? bytePlusVideoId;
  String? language;
  String? orientation;
  int bunnyEncodingStatus;
  DateTime? deletedAt;
  int videoHeight;
  int videoWidth;
  String? location;
  int isPrivate;
  int isHideComment;
  String? description;
  DateTime? archivedAt;
  double? latitude;
  double? longitude;
  ReelUser user;
  ReelCategory category;
  List<String> resolutions;
  bool isLiked;
  bool isWished;
  bool isFollow;
  String? metaDescription;
  String? metaKeywords;
  String? videoAspectRatio;

  Reel({
    required this.id,
    this.title,
    this.url,
    this.cdnUrl,
    this.thumbCdnUrl,
    required this.userId,
    this.status,
    this.slug,
    this.encodeStatus,
    required this.priority,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    this.bunnyStreamVideoId,
    this.bytePlusVideoId,
    this.language,
    this.orientation,
    required this.bunnyEncodingStatus,
    this.deletedAt,
    required this.videoHeight,
    required this.videoWidth,
    this.location,
    required this.isPrivate,
    required this.isHideComment,
    this.description,
    this.archivedAt,
    this.latitude,
    this.longitude,
    required this.user,
    required this.category,
    required this.resolutions,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
    this.metaDescription,
    this.metaKeywords,
    this.videoAspectRatio,
  });

  factory Reel.fromJson(Map<String, dynamic> json) => Reel(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        cdnUrl: json['cdn_url'],
        thumbCdnUrl: json['thumb_cdn_url'],
        userId: json['user_id'],
        status: json['status'],
        slug: json['slug'],
        encodeStatus: json['encode_status'],
        priority: json['priority'],
        categoryId: json['category_id'],
        totalViews: json['total_views'],
        totalLikes: json['total_likes'],
        totalComments: json['total_comments'],
        totalShare: json['total_share'],
        totalWishlist: json['total_wishlist'],
        duration: json['duration'],
        byteAddedOn: DateTime.parse(json['byte_added_on']),
        byteUpdatedOn: DateTime.parse(json['byte_updated_on']),
        bunnyStreamVideoId: json['bunny_stream_video_id'],
        bytePlusVideoId: json['byte_plus_video_id'],
        language: json['language'],
        orientation: json['orientation'],
        bunnyEncodingStatus: json['bunny_encoding_status'],
        deletedAt: json['deleted_at'] != null ? DateTime.tryParse(json['deleted_at']) : null,
        videoHeight: json['video_height'],
        videoWidth: json['video_width'],
        location: json['location'],
        isPrivate: json['is_private'],
        isHideComment: json['is_hide_comment'],
        description: json['description'],
        archivedAt: json['archived_at'] != null ? DateTime.tryParse(json['archived_at']) : null,
        latitude: json['latitude'] != null ? double.tryParse(json['latitude'].toString()) : null,
        longitude: json['longitude'] != null ? double.tryParse(json['longitude'].toString()) : null,
        user: ReelUser.fromJson(json['user']),
        category: ReelCategory.fromJson(json['category']),
        resolutions: List<String>.from(json['resolutions'].map((x) => x.toString())),
        isLiked: json['is_liked'],
        isWished: json['is_wished'],
        isFollow: json['is_follow'],
        metaDescription: json['meta_description'],
        metaKeywords: json['meta_keywords'],
        videoAspectRatio: json['video_aspect_ratio'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'cdn_url': cdnUrl,
        'thumb_cdn_url': thumbCdnUrl,
        'user_id': userId,
        'status': status,
        'slug': slug,
        'encode_status': encodeStatus,
        'priority': priority,
        'category_id': categoryId,
        'total_views': totalViews,
        'total_likes': totalLikes,
        'total_comments': totalComments,
        'total_share': totalShare,
        'total_wishlist': totalWishlist,
        'duration': duration,
        'byte_added_on': byteAddedOn.toIso8601String(),
        'byte_updated_on': byteUpdatedOn.toIso8601String(),
        'bunny_stream_video_id': bunnyStreamVideoId,
        'byte_plus_video_id': bytePlusVideoId,
        'language': language,
        'orientation': orientation,
        'bunny_encoding_status': bunnyEncodingStatus,
        'deleted_at': deletedAt?.toIso8601String(),
        'video_height': videoHeight,
        'video_width': videoWidth,
        'location': location,
        'is_private': isPrivate,
        'is_hide_comment': isHideComment,
        'description': description,
        'archived_at': archivedAt?.toIso8601String(),
        'latitude': latitude,
        'longitude': longitude,
        'user': user.toJson(),
        'category': category.toJson(),
        'resolutions': resolutions,
        'is_liked': isLiked,
        'is_wished': isWished,
        'is_follow': isFollow,
        'meta_description': metaDescription,
        'meta_keywords': metaKeywords,
        'video_aspect_ratio': videoAspectRatio,
      };
}

class ReelUser {
  int userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;
  bool isSubscriptionActive;
  bool isFollow;

  ReelUser({
    required this.userId,
    required this.fullname,
    required this.username,
    this.profilePicture,
    this.profilePictureCdn,
    this.designation,
    required this.isSubscriptionActive,
    required this.isFollow,
  });

  factory ReelUser.fromJson(Map<String, dynamic> json) => ReelUser(
        userId: json['user_id'],
        fullname: json['fullname'],
        username: json['username'],
        profilePicture: json['profile_picture'],
        profilePictureCdn: json['profile_picture_cdn'],
        designation: json['designation'],
        isSubscriptionActive: json['is_subscription_active'],
        isFollow: json['is_follow'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'fullname': fullname,
        'username': username,
        'profile_picture': profilePicture,
        'profile_picture_cdn': profilePictureCdn,
        'designation': designation,
        'is_subscription_active': isSubscriptionActive,
        'is_follow': isFollow,
      };
}

class ReelCategory {
  String title;

  ReelCategory({required this.title});

  factory ReelCategory.fromJson(Map<String, dynamic> json) => ReelCategory(
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}

class MetaData {
  int total;
  int page;
  int limit;

  MetaData({
    required this.total,
    required this.page,
    required this.limit,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        total: json['total'],
        page: json['page'],
        limit: json['limit'],
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'page': page,
        'limit': limit,
      };
}
