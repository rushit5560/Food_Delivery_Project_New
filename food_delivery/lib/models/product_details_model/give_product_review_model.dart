// To parse this JSON data, do
//
//     final giveProductReviewModel = giveProductReviewModelFromJson(jsonString);

import 'dart:convert';

GiveProductReviewModel giveProductReviewModelFromJson(String str) => GiveProductReviewModel.fromJson(json.decode(str));

String giveProductReviewModelToJson(GiveProductReviewModel data) => json.encode(data.toJson());

class GiveProductReviewModel {
  GiveProductReviewModel({
    required this.status,
    required this.message,
    required this.review,
  });

  bool status;
  String message;
  Review review;

  factory GiveProductReviewModel.fromJson(Map<String, dynamic> json) => GiveProductReviewModel(
    status: json["status"] == null ? false : json["status"],
    message: json["message"] == null ? "" : json["message"],
    review: Review.fromJson(json["review"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "review": review.toJson(),
  };
}

class Review {
  Review({
    required this.product,
    required this.customer,
    required this.review,
    required this.rating,
    required this.date,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String product;
  String customer;
  String review;
  String rating;
  DateTime date;
  bool isActive;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    product: json["Product"] == null ? "" : json["Product"],
    customer: json["Customer"] == null ? "" : json["Customer"],
    review: json["Review"] == null ? "" : json["Review"],
    rating: json["Rating"] == null ? "" : json["Rating"],
    date: DateTime.parse(json["Date"]),
    isActive: json["IsActive"] == null ? false : json["IsActive"],
    id: json["_id"] == null ? "" : json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? 0 : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "Product": product,
    "Customer": customer,
    "Review": review,
    "Rating": rating,
    "Date": date.toIso8601String(),
    "IsActive": isActive,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
