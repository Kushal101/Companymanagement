final String tableNotes = 'notes';

class CompanyModelField {
  static final List<String> values = [

    id, isImportant, title,
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String title = 'title';

}

class CompanyModel {
  final int? id;
  final bool isImportant;
  final String title;


  const CompanyModel({
    this.id,
    required this.isImportant,
    required this.title,

  });

  CompanyModel copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      CompanyModel(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        title: title ?? this.title,

      );

  static CompanyModel fromJson(Map<String, Object?> json) =>CompanyModel(
    id: json[CompanyModelField.id] as int?,
    isImportant: json[CompanyModelField.isImportant] == 1,
    title: json[CompanyModelField.title] as String,

  );

  Map<String, Object?> toJson() => {
    CompanyModelField.id: id,
    CompanyModelField.title: title,
      CompanyModelField.isImportant: isImportant ? 1 : 0,


  };
}
