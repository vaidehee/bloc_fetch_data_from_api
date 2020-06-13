import 'package:bloc_fetch_data_from_api/models/photo_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';

class PhotoListProvider {
  Client client = Client();
  final String url = "https://jsonplaceholder.typicode.com/photos";

  Future<List<PhotoModel>> fetchPhotoList() async {
    final response = await client.get(url);
    print("res==>${response.body.toString()}");
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<PhotoModel>((json) => PhotoModel.fromJson(json))
          .toList();
    } else {
      print("status code not valid ${response.statusCode.toString()}");
      throw Exception('Failed to load post');
    }
  }
}
