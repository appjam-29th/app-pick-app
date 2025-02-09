class MatchRequestModel {
  final List<String> category;
  final String gender;
  final int ageGroup; // int 타입으로 변경
  final List<String> values;

  MatchRequestModel({
    required this.category,
    required this.gender,
    required this.ageGroup,
    required this.values,
  });

  // 나이 -> 연령대 변환 함수
  String getAgeGroupString() {
    if (ageGroup < 10) return "10세 미만";
    if (ageGroup < 20) return "10대";
    if (ageGroup < 30) return "20대";
    if (ageGroup < 40) return "30대";
    if (ageGroup < 50) return "40대";
    if (ageGroup < 60) return "50대";
    return "60대 이상";
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'gender': gender,
      'age_group': getAgeGroupString(), // 변환된 값 사용
      'values': values,
      'favorite_app': '없음',
    };
  }

  factory MatchRequestModel.fromJson(Map<String, dynamic> json) {
    return MatchRequestModel(
      category: List<String>.from(json['category']),
      gender: json['gender'],
      ageGroup: int.parse(json['age_group']), // JSON에서 숫자로 변환
      values: List<String>.from(json['values']),
    );
  }
}

class MatchResponseModel {
  final String appName;
  final String appUrl;
  final String appIconUrl;
  final String strength;

  MatchResponseModel({
    required this.appName,
    required this.appUrl,
    required this.appIconUrl,
    required this.strength,
  });

  Map<String, dynamic> toJson() {
    return {
      'app_name': appName,
      'app_store_url': appUrl,
      'app_icon_url': appIconUrl,
      'strength': strength,
    };
  }

  factory MatchResponseModel.fromJson(Map<String, dynamic> json) {
    return MatchResponseModel(
      appName: json['app_name'],
      appUrl: json['app_store_url'],
      appIconUrl: json['app_icon_url'],
      strength: json['strength'],
    );
  }
}
