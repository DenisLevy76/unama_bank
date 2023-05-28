
// To parse this JSON data, do
//
//     final currencyResponse = currencyResponseFromJson(jsonString);

import 'dart:convert';

CurrencyResponse currencyResponseFromJson(String str) =>
    CurrencyResponse.fromJson(json.decode(str));

String currencyResponseToJson(CurrencyResponse data) =>
    json.encode(data.toJson());

class CurrencyResponse {
  String? by;
  bool? validKey;
  Results? results;
  double? executionTime;
  bool? fromCache;

  CurrencyResponse({
    this.by,
    this.validKey,
    this.results,
    this.executionTime,
    this.fromCache,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      CurrencyResponse(
        by: json["by"],
        validKey: json["valid_key"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
        executionTime: json["execution_time"],
        fromCache: json["from_cache"],
      );

  Map<String, dynamic> toJson() => {
        "by": by,
        "valid_key": validKey,
        "results": results?.toJson(),
        "execution_time": executionTime,
        "from_cache": fromCache,
      };
}

class Results {
  Currencies? currencies;
  Stocks? stocks;
  List<String>? availableSources;
  Bitcoin? bitcoin;
  List<Tax>? taxes;

  Results({
    this.currencies,
    this.stocks,
    this.availableSources,
    this.bitcoin,
    this.taxes,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        stocks: json["stocks"] == null ? null : Stocks.fromJson(json["stocks"]),
        availableSources: json["available_sources"] == null
            ? []
            : List<String>.from(json["available_sources"]!.map((x) => x)),
        bitcoin:
            json["bitcoin"] == null ? null : Bitcoin.fromJson(json["bitcoin"]),
        taxes: json["taxes"] == null
            ? []
            : List<Tax>.from(json["taxes"]!.map((x) => Tax.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currencies": currencies?.toJson(),
        "stocks": stocks?.toJson(),
        "available_sources": availableSources == null
            ? []
            : List<dynamic>.from(availableSources!.map((x) => x)),
        "bitcoin": bitcoin?.toJson(),
        "taxes": taxes == null
            ? []
            : List<dynamic>.from(taxes!.map((x) => x.toJson())),
      };
}

class Bitcoin {
  Bitstamp? blockchainInfo;
  Coinbase? coinbase;
  Bitstamp? bitstamp;
  Coinbase? foxbit;
  Bitstamp? mercadobitcoin;

  Bitcoin({
    this.blockchainInfo,
    this.coinbase,
    this.bitstamp,
    this.foxbit,
    this.mercadobitcoin,
  });

  factory Bitcoin.fromJson(Map<String, dynamic> json) => Bitcoin(
        blockchainInfo: json["blockchain_info"] == null
            ? null
            : Bitstamp.fromJson(json["blockchain_info"]),
        coinbase: json["coinbase"] == null
            ? null
            : Coinbase.fromJson(json["coinbase"]),
        bitstamp: json["bitstamp"] == null
            ? null
            : Bitstamp.fromJson(json["bitstamp"]),
        foxbit:
            json["foxbit"] == null ? null : Coinbase.fromJson(json["foxbit"]),
        mercadobitcoin: json["mercadobitcoin"] == null
            ? null
            : Bitstamp.fromJson(json["mercadobitcoin"]),
      );

  Map<String, dynamic> toJson() => {
        "blockchain_info": blockchainInfo?.toJson(),
        "coinbase": coinbase?.toJson(),
        "bitstamp": bitstamp?.toJson(),
        "foxbit": foxbit?.toJson(),
        "mercadobitcoin": mercadobitcoin?.toJson(),
      };
}

class Bitstamp {
  String? name;
  List<String>? format;
  double? last;
  double? buy;
  double? sell;
  double? variation;

  Bitstamp({
    this.name,
    this.format,
    this.last,
    this.buy,
    this.sell,
    this.variation,
  });

  factory Bitstamp.fromJson(Map<String, dynamic> json) => Bitstamp(
        name: json["name"],
        format: json["format"] == null
            ? []
            : List<String>.from(json["format"]!.map((x) => x)),
        last: json["last"]?.toDouble(),
        buy: json["buy"]?.toDouble(),
        sell: json["sell"]?.toDouble(),
        variation: json["variation"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "format":
            format == null ? [] : List<dynamic>.from(format!.map((x) => x)),
        "last": last,
        "buy": buy,
        "sell": sell,
        "variation": variation,
      };
}

class Coinbase {
  String? name;
  List<String>? format;
  double? last;
  double? variation;

  Coinbase({
    this.name,
    this.format,
    this.last,
    this.variation,
  });

  factory Coinbase.fromJson(Map<String, dynamic> json) => Coinbase(
        name: json["name"],
        format: json["format"] == null
            ? []
            : List<String>.from(json["format"]!.map((x) => x)),
        last: json["last"]?.toDouble(),
        variation: json["variation"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "format":
            format == null ? [] : List<dynamic>.from(format!.map((x) => x)),
        "last": last,
        "variation": variation,
      };
}

class Currencies {
  String? source;
  Ars? usd;
  Ars? eur;
  Ars? gbp;
  Ars? ars;
  Ars? cad;
  Ars? aud;
  Ars? jpy;
  Ars? cny;
  Ars? btc;

  Currencies({
    this.source,
    this.usd,
    this.eur,
    this.gbp,
    this.ars,
    this.cad,
    this.aud,
    this.jpy,
    this.cny,
    this.btc,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        source: json["source"],
        usd: json["USD"] == null ? null : Ars.fromJson(json["USD"]),
        eur: json["EUR"] == null ? null : Ars.fromJson(json["EUR"]),
        gbp: json["GBP"] == null ? null : Ars.fromJson(json["GBP"]),
        ars: json["ARS"] == null ? null : Ars.fromJson(json["ARS"]),
        cad: json["CAD"] == null ? null : Ars.fromJson(json["CAD"]),
        aud: json["AUD"] == null ? null : Ars.fromJson(json["AUD"]),
        jpy: json["JPY"] == null ? null : Ars.fromJson(json["JPY"]),
        cny: json["CNY"] == null ? null : Ars.fromJson(json["CNY"]),
        btc: json["BTC"] == null ? null : Ars.fromJson(json["BTC"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "USD": usd?.toJson(),
        "EUR": eur?.toJson(),
        "GBP": gbp?.toJson(),
        "ARS": ars?.toJson(),
        "CAD": cad?.toJson(),
        "AUD": aud?.toJson(),
        "JPY": jpy?.toJson(),
        "CNY": cny?.toJson(),
        "BTC": btc?.toJson(),
      };
}

class Ars {
  String? name;
  double? buy;
  double? sell;
  double? variation;

  Ars({
    this.name,
    this.buy,
    this.sell,
    this.variation,
  });

  factory Ars.fromJson(Map<String, dynamic> json) => Ars(
        name: json["name"],
        buy: json["buy"]?.toDouble(),
        sell: json["sell"]?.toDouble(),
        variation: json["variation"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "buy": buy,
        "sell": sell,
        "variation": variation,
      };
}

class Stocks {
  Cac? ibovespa;
  Cac? ifix;
  Cac? nasdaq;
  Cac? dowjones;
  Cac? cac;
  Cac? nikkei;

  Stocks({
    this.ibovespa,
    this.ifix,
    this.nasdaq,
    this.dowjones,
    this.cac,
    this.nikkei,
  });

  factory Stocks.fromJson(Map<String, dynamic> json) => Stocks(
        ibovespa:
            json["IBOVESPA"] == null ? null : Cac.fromJson(json["IBOVESPA"]),
        ifix: json["IFIX"] == null ? null : Cac.fromJson(json["IFIX"]),
        nasdaq: json["NASDAQ"] == null ? null : Cac.fromJson(json["NASDAQ"]),
        dowjones:
            json["DOWJONES"] == null ? null : Cac.fromJson(json["DOWJONES"]),
        cac: json["CAC"] == null ? null : Cac.fromJson(json["CAC"]),
        nikkei: json["NIKKEI"] == null ? null : Cac.fromJson(json["NIKKEI"]),
      );

  Map<String, dynamic> toJson() => {
        "IBOVESPA": ibovespa?.toJson(),
        "IFIX": ifix?.toJson(),
        "NASDAQ": nasdaq?.toJson(),
        "DOWJONES": dowjones?.toJson(),
        "CAC": cac?.toJson(),
        "NIKKEI": nikkei?.toJson(),
      };
}

class Cac {
  String? name;
  String? location;
  double? points;
  double? variation;

  Cac({
    this.name,
    this.location,
    this.points,
    this.variation,
  });

  factory Cac.fromJson(Map<String, dynamic> json) => Cac(
        name: json["name"],
        location: json["location"],
        points: json["points"]?.toDouble(),
        variation: json["variation"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "points": points,
        "variation": variation,
      };
}

class Tax {
  DateTime? date;
  double? cdi;
  double? selic;
  double? dailyFactor;
  double? selicDaily;
  double? cdiDaily;

  Tax({
    this.date,
    this.cdi,
    this.selic,
    this.dailyFactor,
    this.selicDaily,
    this.cdiDaily,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        cdi: json["cdi"]?.toDouble(),
        selic: json["selic"]?.toDouble(),
        dailyFactor: json["daily_factor"]?.toDouble(),
        selicDaily: json["selic_daily"]?.toDouble(),
        cdiDaily: json["cdi_daily"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "cdi": cdi,
        "selic": selic,
        "daily_factor": dailyFactor,
        "selic_daily": selicDaily,
        "cdi_daily": cdiDaily,
      };
}
