class PersonModel {
  final int? id;
  final String personName;
  final String createdAt;

  PersonModel({
    this.id,
    required this.personName,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'person_name': personName,
      'created_at': createdAt,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] as int?,
      personName: map['person_name'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  PersonModel copyWith({
    int? id,
    String? personName,
    String? createdAt,
  }) {
    return PersonModel(
      id: id ?? this.id,
      personName: personName ?? this.personName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
