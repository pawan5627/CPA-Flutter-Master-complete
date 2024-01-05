class SimpleTag {
  String tag1;
  String tag2;
  String tag3;

  SimpleTag({
    required this.tag1,
    required this.tag2,
    required this.tag3,
  });

  factory SimpleTag.fromJson(Map<String, dynamic> json) {
    return SimpleTag(
      tag1: json['30 Days'],
      tag2: json['60 Days'],
      tag3: json['90 Days'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tag1': tag1,
      'tag2': tag2,
      'tag3': tag3,
    };
  }
}
