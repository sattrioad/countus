class Sites {
  final int id;
  final String judul;
  final String urlImage;
  final String link;
  bool favorited;

  Sites({
    required this.id,
    required this.judul,
    required this.urlImage,
    required this.link,
    required this.favorited,
  });
}

List<Sites> sitesList = [
  Sites(
    id: 1,
    judul: "Ruang Guru",
    urlImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT8WEapLEotR8jyn4qZGvGbZX6tffgekMqlYfO2BKvVWj0qBWG8wDdk34&s=10",
    link: "https://www.ruangguru.com",
    favorited: false,
  ),
  Sites(
    id: 2,
    judul: "Pahamify",
    urlImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGUFSba8gZibRmB-iQyrcLVOlyrfxZ5aax3Gis-vYDX-6J1TJDAEcpzmE&s=10",
    link: "https://pahamify.com",
    favorited: false,
  ),
  Sites(
    id: 3,
    judul: "Zenius",
    urlImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB6WYCeX5YoOxTd1J_wiwjLjrYJBpesqbAEdMX8mdaSnm2NYNpBIEtgf30&s=10",
    link: "https://www.zenius.net",
    favorited: false,
  ),
  Sites(
    id: 4,
    judul: "Celebrum",
    urlImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZa2WjQavIxZi2pjEK6QzdBATzncBri4tnlhryW-V8e-QAO2qkPqYtIYTM&s=10",
    link: "https://celebrum.id/",
    favorited: false,
  ),
];
