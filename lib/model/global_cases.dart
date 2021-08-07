class GlobalData {
  final String name;
  final String value;

  GlobalData({required this.name, required this.value});

  factory GlobalData.fromJson(Map<String, dynamic> json) {
    return GlobalData(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
