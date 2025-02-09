class ReviewRequestModel {
  final String userID;
  final String title;
  final List<String> mainCategory;
  final List<String> criteria;
  final int star;
  final String content;

  ReviewRequestModel({
    required this.userID,
    required this.title,
    required this.mainCategory,
    required this.criteria,
    required this.star,
    required this.content,
  });

  Map<String, dynamic> toJson() {

    return {
      'userID': userID,
      'title': title,
      'mainCategory': mainCategory.join(', '),
      'criteria': criteria.join(', '),
      'star': star,
      'content': content,
    };
  }

  factory ReviewRequestModel.fromJson(Map<String, dynamic> json) {
    return ReviewRequestModel(
      userID: json['userID'],
      title: json['title'],
      mainCategory: json['mainCategory'],
      criteria: json['criteria'],
      star: json['star'],
      content: json['content'],
    );
  }
}
class ReviewResponseModel {
  final int id;
  final String userID;
  final String title;
  final String mainCategory;
  final String criteria;
  final int star;
  final String content;
  final String createdAt;
  final String updatedAt;

  ReviewResponseModel({
    required this.id,
    required this.userID,
    required this.title,
    required this.mainCategory,
    required this.criteria,
    required this.star,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userID': userID,
      'title': title,
      'mainCategory': mainCategory,
      'criteria': criteria,
      'star': star,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) {
    return ReviewResponseModel(
      id: json['id'],
      userID: json['userID'],
      title: json['title'],
      mainCategory: json['mainCategory'],
      criteria: json['criteria'],
      star: json['star'],
      content: json['content'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}