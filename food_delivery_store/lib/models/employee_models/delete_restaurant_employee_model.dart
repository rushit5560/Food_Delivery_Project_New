import 'dart:convert';

DeleteEmployeeModel deleteEmployeeModelFromJson(String str) => DeleteEmployeeModel.fromJson(json.decode(str));

String deleteEmployeeModelToJson(DeleteEmployeeModel data) => json.encode(data.toJson());

class DeleteEmployeeModel {
  DeleteEmployeeModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteEmployeeModel.fromJson(Map<String, dynamic> json) => DeleteEmployeeModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
