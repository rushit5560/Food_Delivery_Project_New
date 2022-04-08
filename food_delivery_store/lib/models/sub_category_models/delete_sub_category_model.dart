import 'dart:convert';

DeleteSubCategoryModel deleteSubCategoryModelFromJson(String str) => DeleteSubCategoryModel.fromJson(json.decode(str));

String deleteSubCategoryModelToJson(DeleteSubCategoryModel data) => json.encode(data.toJson());

class DeleteSubCategoryModel {
  DeleteSubCategoryModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteSubCategoryModel.fromJson(Map<String, dynamic> json) => DeleteSubCategoryModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
