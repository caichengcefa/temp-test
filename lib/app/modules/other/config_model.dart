class Config {
  String? appName;
  num? versionCode;
  List<String>? features;

  Config({
    this.appName,
    this.versionCode,
    this.features,
  });

  Config.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    versionCode = json['version_code'] as num?;
    features = json['features']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['app_name'] = appName;
    data['version_code'] = versionCode;
    data['features'] = features;
    return data;
  }
}
