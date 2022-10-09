import 'dart:convert';

import 'package:find_house/modals/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
//fetching api data
  getRecommendedSpaces() async {
    //menampilkan hasil request
    var result =
        await http.get('http://bwa-cozy.herokuapp.com/recommended-spaces');

    print(result.statusCode);
    //berhasil = 200
    //tidak berhasil = 404

    print(result.body);

    //return data

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();

      return spaces;
    } else {
      return <Space>[];
    }
  }
}
