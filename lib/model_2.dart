// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class LiveStockDataModel {
  List<MarketState>? marketState;
  Marketcap? marketcap;
  Indicativenifty50? indicativenifty50;

  LiveStockDataModel(
      {this.marketState, this.marketcap, this.indicativenifty50});

  LiveStockDataModel.fromJson(Map<String, dynamic> json) {
    if (json['marketState'] != null) {
      marketState = <MarketState>[];
      json['marketState'].forEach((v) {
        marketState!.add(new MarketState.fromJson(v));
      });
    }
    marketcap = json['marketcap'] != null
        ? new Marketcap.fromJson(json['marketcap'])
        : null;
    indicativenifty50 = json['indicativenifty50'] != null
        ? new Indicativenifty50.fromJson(json['indicativenifty50'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketState != null) {
      data['marketState'] = this.marketState!.map((v) => v.toJson()).toList();
    }
    if (this.marketcap != null) {
      data['marketcap'] = this.marketcap!.toJson();
    }
    if (this.indicativenifty50 != null) {
      data['indicativenifty50'] = this.indicativenifty50!.toJson();
    }
    return data;
  }
}

class MarketState {
  String? market;
  String? marketStatus;
  String? tradeDate;
  String? index;
  dynamic? last;
  dynamic? variation;
  dynamic? percentChange;
  String? marketStatusMessage;
  String? expiryDate;
  String? underlying;
  String? updatedTime;
  String? tradeDateFormatted;
  String? slickclass;

  MarketState(
      {this.market,
      this.marketStatus,
      this.tradeDate,
      this.index,
      this.last,
      this.variation,
      this.percentChange,
      this.marketStatusMessage,
      this.expiryDate,
      this.underlying,
      this.updatedTime,
      this.tradeDateFormatted,
      this.slickclass});

  MarketState.fromJson(Map<String, dynamic> json) {
    market = json['market'];
    marketStatus = json['marketStatus'];
    tradeDate = json['tradeDate'];
    index = json['index'];
    last = json['last'];
    variation = json['variation'];
    percentChange = json['percentChange'];
    marketStatusMessage = json['marketStatusMessage'];
    expiryDate = json['expiryDate'];
    underlying = json['underlying'];
    updatedTime = json['updated_time'];
    tradeDateFormatted = json['tradeDateFormatted'];
    slickclass = json['slickclass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['market'] = this.market;
    data['marketStatus'] = this.marketStatus;
    data['tradeDate'] = this.tradeDate;
    data['index'] = this.index;
    data['last'] = this.last;
    data['variation'] = this.variation;
    data['percentChange'] = this.percentChange;
    data['marketStatusMessage'] = this.marketStatusMessage;
    data['expiryDate'] = this.expiryDate;
    data['underlying'] = this.underlying;
    data['updated_time'] = this.updatedTime;
    data['tradeDateFormatted'] = this.tradeDateFormatted;
    data['slickclass'] = this.slickclass;
    return data;
  }
}

class Marketcap {
  String? timeStamp;
  double? marketCapinTRDollars;
  double? marketCapinLACCRRupees;
  double? marketCapinCRRupees;
  String? marketCapinCRRupeesFormatted;
  String? marketCapinLACCRRupeesFormatted;
  String? underlying;

  Marketcap(
      {this.timeStamp,
      this.marketCapinTRDollars,
      this.marketCapinLACCRRupees,
      this.marketCapinCRRupees,
      this.marketCapinCRRupeesFormatted,
      this.marketCapinLACCRRupeesFormatted,
      this.underlying});

  Marketcap.fromJson(Map<String, dynamic> json) {
    timeStamp = json['timeStamp'];
    marketCapinTRDollars = json['marketCapinTRDollars'];
    marketCapinLACCRRupees = json['marketCapinLACCRRupees'];
    marketCapinCRRupees = json['marketCapinCRRupees'];
    marketCapinCRRupeesFormatted = json['marketCapinCRRupeesFormatted'];
    marketCapinLACCRRupeesFormatted = json['marketCapinLACCRRupeesFormatted'];
    underlying = json['underlying'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeStamp'] = this.timeStamp;
    data['marketCapinTRDollars'] = this.marketCapinTRDollars;
    data['marketCapinLACCRRupees'] = this.marketCapinLACCRRupees;
    data['marketCapinCRRupees'] = this.marketCapinCRRupees;
    data['marketCapinCRRupeesFormatted'] = this.marketCapinCRRupeesFormatted;
    data['marketCapinLACCRRupeesFormatted'] =
        this.marketCapinLACCRRupeesFormatted;
    data['underlying'] = this.underlying;
    return data;
  }
}

class Indicativenifty50 {
  String? dateTime;
  Null? indicativeTime;
  String? indexName;
  Null? indexLast;
  Null? indexPercChange;
  Null? indexTimeVal;
  double? closingValue;
  double? finalClosingValue;
  double? change;
  double? perChange;
  String? status;

  Indicativenifty50(
      {this.dateTime,
      this.indicativeTime,
      this.indexName,
      this.indexLast,
      this.indexPercChange,
      this.indexTimeVal,
      this.closingValue,
      this.finalClosingValue,
      this.change,
      this.perChange,
      this.status});

  Indicativenifty50.fromJson(Map<String, dynamic> json) {
    dateTime = json['dateTime'];
    indicativeTime = json['indicativeTime'];
    indexName = json['indexName'];
    indexLast = json['indexLast'];
    indexPercChange = json['indexPercChange'];
    indexTimeVal = json['indexTimeVal'];
    closingValue = json['closingValue'];
    finalClosingValue = json['finalClosingValue'];
    change = json['change'];
    perChange = json['perChange'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateTime'] = this.dateTime;
    data['indicativeTime'] = this.indicativeTime;
    data['indexName'] = this.indexName;
    data['indexLast'] = this.indexLast;
    data['indexPercChange'] = this.indexPercChange;
    data['indexTimeVal'] = this.indexTimeVal;
    data['closingValue'] = this.closingValue;
    data['finalClosingValue'] = this.finalClosingValue;
    data['change'] = this.change;
    data['perChange'] = this.perChange;
    data['status'] = this.status;
    return data;
  }
}
