import 'dart:convert';

DetailProduct detailProductFromJson(String str) => DetailProduct.fromJson(json.decode(str));

String detailProductToJson(DetailProduct data) => json.encode(data.toJson());

class DetailProduct {
    String? nama;
    String? harga;
    double? rating;
    int? reviewCount;
    String? desc;
    List<String>? colors;
    String? sku;
    String? category;
    List<String>? images;
    List<String>? sizes;
    String? tags;
    String? desc2;
    String? addInfo;
    List<String>? review;

    DetailProduct({
      this.nama,
      this.harga,
      this.rating,
      this.reviewCount,
      this.desc,
      required this.colors,
      this.sku,
      this.category,
      required this.images,
      this.tags,
      this.desc2,
      this.sizes,
      this.addInfo,
      required this.review,
    });

    factory DetailProduct.fromJson(Map<String, dynamic> json) => DetailProduct(
        nama: json["nama"]??"",
        harga: json["harga"]??"",
        rating: json["rating"]??0,
        reviewCount: json["review_count"]??"",
        desc: json["desc"]??"",
        colors: List<String>.from(json["colors"].map((x) => x)),
        sku: json["sku"]??"",
        category: json["category"]??"",
        images: List<String>.from(json["images"].map((x) => x)),
        tags: json["tags"]??"",
        desc2: json["desc2"]??"",
        addInfo: json["addInfo"]??"",
        review: List<String>.from(json["review"].map((x) => x)),
        sizes: List<String>.from(json["size"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "harga": harga,
        "rating": rating,
        "review_count": reviewCount,
        "desc": desc,
        "colors": List<dynamic>.from(colors!.map((x) => x)),
        "sku": sku,
        "category": category,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "tags": tags,
        "desc2": desc2,
        "addInfo": addInfo,
        "review": List<dynamic>.from(review!.map((x) => x)),
        "size": List<dynamic>.from(sizes!.map((x) => x)),
    };
}