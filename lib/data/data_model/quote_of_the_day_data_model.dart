class QOTDataModel {
  final int id;
  final String author;
  final String body;

  QOTDataModel({required this.id, required this.author, required this.body});

  factory QOTDataModel.fromJson(Map<String, dynamic>json){
    var qouteJson = json[""];
  }
}
