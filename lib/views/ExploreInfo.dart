class ExploreInfo {
  String reference="";
  String parent="-1";
  String description="";
  String images="";
  String name="";
  String id="-1";

  ExploreInfo({
    required this.reference,
    required this.parent,
    required this.description,
    required this.images,
    required this.name,
    required this.id,
  });

  factory ExploreInfo.fromJson(Map<String, dynamic> json) {
    return ExploreInfo(
      reference: json['reference'],
      parent: json['parent'],
      description: json['description'],
      images: json['images'],
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'parent': parent,
      'description': description,
      'images': images,
      'name': name,
      'id': id,
    };
  }
}
