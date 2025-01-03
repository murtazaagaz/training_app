import 'dart:convert';

class TrainingModel {
  final String title;
  final String trainer;
  final String location;
  final String summary;
  final String image;
  final String date;
  final String timings;
  final String trainerImage;
  final String tag;
  TrainingModel({
    required this.title,
    required this.trainer,
    required this.location,
    required this.summary,
    required this.image,
    required this.date,
    required this.timings,
    required this.trainerImage,
    required this.tag,
  });

 
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'trainer': trainer});
    result.addAll({'location': location});
    result.addAll({'summary': summary});
    result.addAll({'image': image});
    result.addAll({'date': date});
    result.addAll({'timings': timings});
    result.addAll({'trainerImage': trainerImage});
    result.addAll({'tag': tag});
  
    return result;
  }

  factory TrainingModel.fromMap(Map<String, dynamic> map) {
    return TrainingModel(
      title: map['title'] ?? '',
      trainer: map['trainer'] ?? '',
      location: map['location'] ?? '',
      summary: map['summary'] ?? '',
      image: map['image'] ?? '',
      date: map['date'] ?? '',
      timings: map['timings'] ?? '',
      trainerImage: map['trainerImage'] ?? '',
      tag: map['tag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingModel.fromJson(String source) =>
      TrainingModel.fromMap(json.decode(source));
}
