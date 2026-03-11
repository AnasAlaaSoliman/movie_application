class MovieDataModel {
  final String status;
  final String statusMessage;
  final MovieData movieData;

  MovieDataModel({
    required this.status,
    required this.statusMessage,
    required this.movieData,
  });

  factory MovieDataModel.fromJson(Map<String, dynamic> json) {
    return MovieDataModel(
      status: json['status'],
      statusMessage: json['status_message'],
      movieData: MovieData.fromJson(json['data']['movie'])
    );
  }
}

class MovieData {
  late final int? id;
  final String urlLink;
  final double rating;
  final int runTime;
  final int likeCount;
  final String mediumScreenshotImage1;
  final String mediumScreenshotImage2;
  final String mediumScreenshotImage3;
  final String largeScreenshotImage1;
  final String largeScreenshotImage2;
  final String largeScreenshotImage3;

  MovieData({
    this.id,
    required this.urlLink,
    required this.rating,
    required this.runTime,
    required this.likeCount,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
  });
  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
      id: json['id'],
      urlLink: json['url'],
      rating: json['rating'].toDouble(),
      runTime: json['runtime'],
      likeCount: json['like_count'],
      mediumScreenshotImage1: json['medium_screenshot_image1'],
      mediumScreenshotImage2: json['medium_screenshot_image2'],
      mediumScreenshotImage3: json['medium_screenshot_image3'],
      largeScreenshotImage1: json['large_screenshot_image1'],
      largeScreenshotImage2: json['large_screenshot_image2'],
      largeScreenshotImage3: json['large_screenshot_image3'],
    );
  }
}
