class StockData {
  List<AllData>? data;
  int? count;
  String? status;

  StockData({this.data, this.count, this.status});

  StockData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AllData>[];
      json['data'].forEach((v) {
        data!.add(new AllData.fromJson(v));
      });
    }
    count = json['count'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['status'] = this.status;
    return data;
  }
}

class AllData {
  String? symbol;
  String? name;
  String? currency;
  String? exchange;
  String? micCode;
  String? country;
  String? type;
  String? figiCode;

  AllData(
      {this.symbol,
      this.name,
      this.currency,
      this.exchange,
      this.micCode,
      this.country,
      this.type,
      this.figiCode});

  AllData.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
    currency = json['currency'];
    exchange = json['exchange'];
    micCode = json['mic_code'];
    country = json['country'];
    type = json['type'];
    figiCode = json['figi_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['exchange'] = this.exchange;
    data['mic_code'] = this.micCode;
    data['country'] = this.country;
    data['type'] = this.type;
    data['figi_code'] = this.figiCode;
    return data;
  }
}
