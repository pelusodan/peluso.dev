enum Presentation {
  composeInteroperability(
      "Compose Interoperability in a Legacy Codebase",
      "Discussed the path to using Compose in coordination with XML at a large scale company.",
      "assets/img/droidcon.jpg",
      "https://www.droidcon.com/2023/10/06/coupling-compose-interoperability-in-a-legacy-codebase/",
      ["Droidcon NYC 2023"]),
  flutterWebsite(
      "Flutter Web: Building and Maintaining a Public Web App",
      "How to create a unique Flutter portfolio and use Github pages + actions to create CI for your project",
      "assets/img/flutterWeb.jpg",
      "https://gdg.community.dev/events/details/google-gdg-boston-android-presents-devfest-boston-2023-1/cohost-gdg-boston-android",
      ["DevFest 2023 UMass Boston", "DevFest 2023 Boston"]
);

  const Presentation(
      this.title, this.body, this.imgPath, this.link, this.conferences);

  final String title;
  final String body;
  final String imgPath;
  final String? link;
  final List<String> conferences;
}
