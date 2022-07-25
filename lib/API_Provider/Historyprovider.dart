import 'dart:convert';

import 'package:chaining/API_Provider/Assetsprovider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/Classes/CoinHistory.dart';
import 'package:dio/dio.dart';

class Historyprovider {
  var baseURL = "https://api.coincap.io/v2/";

  //Get history of a coin
  Future<List<CoinHistory>> getHistoryOfCoin(String id, String interval) async {
    final Response response;
    response = await Dio()
        .get(baseURL + "assets/" + id + "/history?interval=" + interval);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> datalist = jsonDecode(response.toString())["data"];
      List<CoinHistory> coins = [];
      for (var i = datalist.length - 1; datalist.length - 25 < i; i--) {
        CoinHistory c = CoinHistory();
        c.priceUsd = double.parse(datalist[i]["priceUsd"]);
        c.time = datalist[i]["time"].toString();
        c.date = datalist[i]["date"].toString();
        c.circulatingSupply = double.parse(datalist[i]["circulatingSupply"]);
        coins.add(c);
      }
      for (var i in coins) {
        print(i.priceUsd);
      }
      print(coins.length);
      return coins;
    } else {
      throw Exception("Failed to get coin");
    }
  }

  Future<List<AssetCoin>> getTopWinner() async {
    List<AssetCoin> coins = [];
    List<AssetCoin> top = [];
    coins = await Assetsprovider().getAllAssets();
    AssetCoin coinOne = coins[0];
    AssetCoin coinTwo = coins[1];

    for (var i in coins) {
      if (i.chnagePercent24Hr! > coinOne.chnagePercent24Hr!.toDouble()) {
        coinOne = i;
      } else if (i.chnagePercent24Hr! > coinTwo.chnagePercent24Hr!.toDouble()) {
        coinTwo = i;
      }
    }
    print(coinOne.name);
    print(coinTwo.name);

    top.add(coinOne);
    top.add(coinTwo);
    return top;
  }
}
