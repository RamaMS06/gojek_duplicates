class ItemCountryModel {
  String? name, dialCode, code, flag;

  ItemCountryModel({this.name, this.dialCode, this.code, this.flag});

  factory ItemCountryModel.fromJson(Map<String, dynamic> json) =>
      ItemCountryModel(
          name: json['name'], dialCode: json['dial_code'], code: json['code'], flag: json['flag']);

  Map<String, dynamic> fromJson() =>
      {'name': name, 'dial_code': dialCode, 'code': code, 'flag' : flag};
}
