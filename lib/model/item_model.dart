class TeamDataModel {
  final String title;
  final String imageUrl;


  TeamDataModel({
    required this.title,
    required this.imageUrl,
  });
}
List<String> itemList = ['beauty','offers','fashion','home','Shirt','Woman Bag','Dress','Mobiles'];

List<TeamDataModel> teamData = [
  TeamDataModel(
    imageUrl: 'assets/image/makeup.png',
    title: "beauty",
  ),
  TeamDataModel(
    imageUrl: 'assets/image/redicon.png',
    title: "offers",
  ),
  TeamDataModel(
    imageUrl: 'assets/image/girl.png',
    title: "fashion",
  ),
  TeamDataModel(
    imageUrl: 'assets/image/sofa.png',
    title: "home",
  ),
  TeamDataModel(
    imageUrl: 'assets/image/shirt.png',
    title: "Shirt",
  ),
  TeamDataModel(
    imageUrl: 'assets/image/bag.png',
    title: 'Woman Bag',
  ),
  TeamDataModel(
    imageUrl: 'assets/image/dress.png',
    title: 'Dress',
  ),

  TeamDataModel(
    imageUrl: 'assets/image/mobile.png',
    title: 'Mobiles',
  ),



];
