enum Project {
  walletGuru(
      "assets/img/walletGuru.png",
      "Wallet Guru",
      "Wallet Guru is a reddit wrapper that promotes posts relevant to account activity",
      "https://github.com/pelusodan/WalletGuru"),
  fridgePal(
      "assets/img/fridgePal.png",
      "FridgePal",
      "FridgePal is a multi-platform Flutter app meant to help promote using foods before expiration dates.",
      "https://github.com/pelusodan/FridgePal"),
  kanestheticLearning(
      "assets/img/kanestheticLearning.png",
      "Kanesthetic Learning",
      "A full product suite of RFID and BLE enabled tags meant to communicate data to the blind. Developed smartphone companion app.",
      "https://www.pelusodan.com/programming/kanesthetic-learning.html"),
  missMyTrain(
      "assets/img/missMyTrain.png",
      "Miss My Train",
      "An Android app which combines Mapquest and MBTA Transit APIs to help users determine if a train is worth catching.",
      "https://github.com/pelusodan/MissMyTrain"),
  pokemonDatabase(
      "assets/img/pokemon.png",
      "Pokemon Database Interactor",
      "A CRUD interactor built on top of a flask backend to communicate with a MySQL instance",
      "https://github.com/pelusodan/PokemonDatabaseAndroidApp"),
  personalSite(
      "assets/img/header_dan.png",
      "Personal Website",
      "A Flutter web vintage desktop experience powered by Dart and community libraries.",
      "https://github.com/pelusodan/peluso.dev");

  const Project(this.imgPath, this.title, this.body, this.repoLink);

  final String imgPath;
  final String title;
  final String body;
  final String repoLink;
}
