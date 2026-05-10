class SavingTransactionModel {
  final int? id;
  final int savingId;
  final String type; // 'credit' | 'debit'
  final double amount;
  final String source; // e.g. Salary, Wallet, Friend, Others
  final String? note;
  final String createdAt;

  SavingTransactionModel({
    this.id,
    required this.savingId,
    required this.type,
    required this.amount,
    required this.source,
    this.note,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'saving_id': savingId,
      'type': type,
      'amount': amount,
      'source': source,
      'note': note,
      'created_at': createdAt,
    };
  }

  factory SavingTransactionModel.fromMap(Map<String, dynamic> map) {
    return SavingTransactionModel(
      id: map['id'] as int?,
      savingId: map['saving_id'] as int,
      type: map['type'] as String,
      amount: (map['amount'] as num).toDouble(),
      source: map['source'] as String,
      note: map['note'] as String?,
      createdAt: map['created_at'] as String,
    );
  }

  SavingTransactionModel copyWith({
    int? id,
    int? savingId,
    String? type,
    double? amount,
    String? source,
    String? note,
    String? createdAt,
  }) {
    return SavingTransactionModel(
      id: id ?? this.id,
      savingId: savingId ?? this.savingId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      source: source ?? this.source,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
