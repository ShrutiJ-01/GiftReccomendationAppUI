// To parse this JSON data  final results = resultsFromJson(jsonString);

import 'dart:convert';

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
  Results({
    this.gifts,
    this.links,
    this.searchLinks,
    this.images,
  });

  List<String> gifts;
  List<List<String>> links;
  List<String> searchLinks;
  List<List<String>> images;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    gifts: List<String>.from(json["gifts"].map((x) => x)),
    links: List<List<String>>.from(json["links"].map((x) => List<String>.from(x.map((x) => x)))),
    searchLinks: List<String>.from(json["searchLinks"].map((x) => x)),
    images: List<List<String>>.from(json["images"].map((x) => List<String>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "gifts": List<dynamic>.from(gifts.map((x) => x)),
    "links": List<dynamic>.from(links.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "searchLinks": List<dynamic>.from(searchLinks.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
