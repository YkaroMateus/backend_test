class NewsModel {
  final int? id;
  final String title;
  final String description;
  final String image;
  final String projectedDate;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.projectedDate,
  });

  factory NewsModel.fromJson(Map json) {
    return NewsModel(
      id: json["id"] ?? -1,
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      description: json["description"] ?? "",
      projectedDate: json["projectedDate"] ?? "",
    );
  }
  Map toJson() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "description": description,
      "projectedDate": projectedDate
    };
  }

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, description: $description, image: $image, projectedDate: $projectedDate)';
  }
}
