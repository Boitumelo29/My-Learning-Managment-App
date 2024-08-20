import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 0)
class ImageModel extends HiveObject {
  @HiveField(0)
  final Uint8List imageBytes;

  ImageModel(this.imageBytes);
}
