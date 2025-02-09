class FilterResponseModel {
  final int id;
  final String userID;
  final String title;
  final String mainCategory;
  final String criteria;
  final int star;
  final String content;
  final String createdAt;
  final String updatedAt;

  FilterResponseModel({
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

  factory FilterResponseModel.fromJson(Map<String, dynamic> json) {
    return FilterResponseModel(
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