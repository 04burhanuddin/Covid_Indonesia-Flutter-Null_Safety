class DataIndonesia {
  final String name;
  final String positif;
  final String sembuh;
  final String meninggal;
  final String dirawat;

  DataIndonesia(
      {required this.name,
      required this.positif,
      required this.sembuh,
      required this.meninggal,
      required this.dirawat});

  factory DataIndonesia.fromJson(Map<String, dynamic> json) {
    return DataIndonesia(
      name: json['name'],
      positif: json['positif'],
      sembuh: json['sembuh'],
      meninggal: json['meninggal'],
      dirawat: json['dirawat'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    data['dirawat'] = this.dirawat;
    return data;
  }
}
