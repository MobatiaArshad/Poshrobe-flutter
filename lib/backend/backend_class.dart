




class Header {
  final String name;
  final String id;
  final String categoryParent;
  final String categoryDisplayOrder;

  Header({
    required this.id,
    required this.name,
    required this.categoryParent,
    required this.categoryDisplayOrder,
  });

  factory Header.fromJson(Map<String, dynamic> json){
    return Header(
        id: json['id'].toString(),
        name: json['name'].toString(),
        categoryParent: json['category_parent'].toString(),
        categoryDisplayOrder: json['category_display_order'].toString(),
    );
  }
}