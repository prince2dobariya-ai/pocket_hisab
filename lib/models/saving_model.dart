class SavingModel {
  final int? id;
  final String savingName;
  final double balance;
  final String createdAt;

  SavingModel({
    this.id,
    required this.savingName,
    required this.balance,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'saving_name': savingName,
      'balance': balance,
      'created_at': createdAt,
    };
  }

  factory SavingModel.fromMap(Map<String, dynamic> map) {
    return SavingModel(
      id: map['id'] as int?,
      savingName: map['saving_name'] as String,
      balance: (map['balance'] as num).toDouble(),
      createdAt: map['created_at'] as String,
    );
  }

  SavingModel copyWith({
    int? id,
    String? savingName,
    double? balance,
    String? createdAt,
  }) {
    return SavingModel(
      id: id ?? this.id,
      savingName: savingName ?? this.savingName,
      balance: balance ?? this.balance,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
