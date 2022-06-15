import '../../domain/entities/photo_entity.dart';

class PhotoEntityModel extends PhotoEntity {
  PhotoEntityModel({
    required String originalPath,
  }) : super(
          photoPath: originalPath,
        );

  Map<String, dynamic> toMap() {
    return {
      'originalPath': photoPath,
    };
  }

  factory PhotoEntityModel.fromMap(Map<String, dynamic> map) {
    return PhotoEntityModel(
      originalPath: map['src']['tiny'] ?? '',
    );
  }
}
