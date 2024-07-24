class QOTDataModel {
  final int id;
  final String author;
  final String body;

  QOTDataModel({required this.id, required this.author, required this.body});

  factory QOTDataModel.fromJson(Map<String, dynamic> json) {
    var quoteJson = json['quote'];
    return QOTDataModel(
        id: quoteJson['id'],
        author: quoteJson['author'],
        body: quoteJson['body']);
  }
}
