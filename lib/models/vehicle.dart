class VehicleModel {
  String manufacturer;
  String model;
  String fuel;
  String image;
  String price;
  String color;

  VehicleModel(this.manufacturer, this.color, this.fuel, this.image, this.model,
      this.price);

  factory VehicleModel.fromJson(dynamic json) {
    //json eken ena tika convert karanawa.
    return VehicleModel(
        json['manufacturer'] as String,
        json['color'] as String,
        json['fuel'] as String,
        json['image'] as String,
        json['model'] as String,
        json['price'] as String);
  }
}
