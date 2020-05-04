class Product {
  String _brand;
  String _name;
  String _imageLink;
  String _description;
  String _productType;
  String api_featured_image;
  List<dynamic> tag_list;
  List<ProductColors> _productColors;

  Product(
      {String brand,
      String name,
      String imageLink,
      String description,
      String productType,
      List<String> tag_list,
      String api_featured_image,
      List<ProductColors> productColors}) {
    this._brand = brand;
    this._name = name;
    this._imageLink = imageLink;
    this._description = description;
    this._productType = productType;
    this._productColors = productColors;
    this.tag_list = tag_list;
  }

  String get brand => _brand;
  set brand(String brand) => _brand = brand;
  String get name => _name;
  set name(String name) => _name = name;
  String get imageLink => _imageLink;
  set imageLink(String imageLink) => _imageLink = imageLink;
  String get description => _description;
  set description(String description) => _description = description;
  String get productType => _productType;
  set productType(String productType) => _productType = productType;
  List<ProductColors> get productColors => _productColors;
  set productColors(List<ProductColors> productColors) =>
      _productColors = productColors;

  Product.fromJson(Map<String, dynamic> json) {
    _brand = json['brand'];
    _name = json['name'];
    _imageLink = json['image_link'];
    _description = json['description'];
    _productType = json['product_type'];
    api_featured_image = json['api_featured_image'];
    tag_list = json['tag_list'];
    if (json['product_colors'] != null) {
      _productColors = new List<ProductColors>();
      json['product_colors'].forEach((v) {
        _productColors.add(new ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this._brand;
    data['name'] = this._name;
    data['image_link'] = this._imageLink;
    data['description'] = this._description;
    data['product_type'] = this._productType;
    data['api_featured_image'] = this.api_featured_image;
    data['tag_list'] = this.tag_list;

    if (this._productColors != null) {
      data['product_colors'] =
          this._productColors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColors {
  String hexValue;
  String colourName;

  ProductColors({String hexValue, String colourName}) {
    this.hexValue = hexValue;
    this.colourName = colourName;
  }

  ProductColors.fromJson(Map<String, dynamic> json) {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hex_value'] = this.hexValue;
    data['colour_name'] = this.colourName;
    return data;
  }
}
