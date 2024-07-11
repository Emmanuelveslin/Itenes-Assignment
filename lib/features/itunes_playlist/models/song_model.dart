class SongModel {
  String wrapperType;
  String kind;
  int artistId;
  int collectionId;
  int trackId;
  String artistName;
  String collectionName;
  String trackName;
  String collectionCensoredName;
  String trackCensoredName;
  String artistViewUrl;
  String collectionViewUrl;
  String trackViewUrl;
  String previewUrl;
  String artworkUrl30;
  String artworkUrl60;
  String artworkUrl100;
  double collectionPrice;
  double trackPrice;
  String releaseDate;
  String collectionExplicitness;
  String trackExplicitness;
  int discCount;
  int discNumber;
  int trackCount;
  int trackNumber;
  int trackTimeMillis;
  String country;
  String currency;
  String primaryGenreName;

  SongModel({
    required this.wrapperType,
    required this.kind,
    required this.artistId,
    required this.collectionId,
    required this.trackId,
    required this.artistName,
    required this.collectionName,
    required this.trackName,
    required this.collectionCensoredName,
    required this.trackCensoredName,
    required this.artistViewUrl,
    required this.collectionViewUrl,
    required this.trackViewUrl,
    required this.previewUrl,
    required this.artworkUrl30,
    required this.artworkUrl60,
    required this.artworkUrl100,
    required this.collectionPrice,
    required this.trackPrice,
    required this.releaseDate,
    required this.collectionExplicitness,
    required this.trackExplicitness,
    required this.discCount,
    required this.discNumber,
    required this.trackCount,
    required this.trackNumber,
    required this.trackTimeMillis,
    required this.country,
    required this.currency,
    required this.primaryGenreName,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
        wrapperType: json['wrapperType'] ?? "",
        kind: json['kind'] ?? "",
        artistId: json['artistId'] ?? 0,
        collectionId: json['collectionId'] ?? 0,
        trackId: json['trackId'] ?? 0,
        artistName: json['artistName'] ?? "",
        collectionName: json['collectionName'] ?? "",
        trackName: json['trackName'] ?? "",
        collectionCensoredName: json['collectionCensoredName'] ?? "",
        trackCensoredName: json['trackCensoredName'] ?? "",
        artistViewUrl: json['artistViewUrl'] ?? "",
        collectionViewUrl: json['collectionViewUrl'] ?? "",
        trackViewUrl: json['trackViewUrl'] ?? "",
        previewUrl: json['previewUrl'] ?? "",
        artworkUrl30: json['artworkUrl30'] ?? "",
        artworkUrl60: json['artworkUrl60'] ?? "",
        artworkUrl100: json['artworkUrl100'] ?? "",
        collectionPrice: json['collectionPrice'] ?? "",
        trackPrice: json['trackPrice'] ?? "",
        releaseDate: json['releaseDate'] ?? "",
        collectionExplicitness: json['collectionExplicitness'] ?? "",
        trackExplicitness: json['trackExplicitness'] ?? "",
        discCount: json['discCount'] ?? 0,
        discNumber: json['discNumber'] ?? 0,
        trackCount: json['trackCount'] ?? 0,
        trackNumber: json['trackNumber'] ?? 0,
        trackTimeMillis: json['trackTimeMillis'] ?? 0,
        country: json['country'] ?? "",
        currency: json['currency'] ?? "",
        primaryGenreName: json['primaryGenreName'] ?? "",
      );
  }
}
