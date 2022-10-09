
class ProductModel {
/// map --> model
  final int id ;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final Rating rating;
ProductModel(
    {
      required this.id  ,
      required this.description ,
      required this.title,
      required this.image ,
      required this.price,
      required this.rating
}
);
factory ProductModel.fromjson( jsonData ){
  return ProductModel(
      id: jsonData['id'],
      description: jsonData['description'],
      title: jsonData['title'],
      image: jsonData['image'],
      price: jsonData['price'],
      rating: Rating.fromjson(jsonData['rating'])
  );
}
}
class Rating{
  final dynamic rate ;
  final dynamic count ;
  Rating({
    required this.rate ,
    required this.count
  });
  factory Rating.fromjson ( json ){
    return Rating(
        rate:    json['rate'],
        count:   json['count']
    ) ;
  }
}