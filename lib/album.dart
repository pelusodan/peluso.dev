enum Album {
  commonVice(
      "https://open.spotify.com/album/702ahHlBL3mCvggDuL2Ozb?si=xKgWuaP0SIudKhjvOlsgrw"
  ),
  austin(
      "https://open.spotify.com/album/2aZlaovcmoI2gsljpj9Z9n?si=2IPQZQ8RQt22n51kBoz_-g"
  ),
  mature(
      "https://open.spotify.com/album/4ZL1Zt7sfVYxU3BLXKBRim?si=2-uA5POLRaG0fY7DIjSKoQ"
  );

  const Album(this.url);
  final String url;

}
