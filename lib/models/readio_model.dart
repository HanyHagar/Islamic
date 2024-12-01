class RadioModel{
  final String name;
  final String url;
  RadioModel({required this.name, required this.url});
  factory RadioModel.jsonData(
      Map<String,dynamic> jsonData
      ){
    return RadioModel(
    name: jsonData['name'],
    url: jsonData['url'],
  );
  }

}