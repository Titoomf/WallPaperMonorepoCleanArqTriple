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

// construtor factory ele me retorna a instancia da super classe ou subclasses
  factory PhotoEntityModel.fromMap(Map<String, dynamic> map) {
    return PhotoEntityModel(
      originalPath: map['src']['original'] ?? '',
    );
  }
}
