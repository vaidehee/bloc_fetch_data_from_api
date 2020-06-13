import 'dart:async';
import 'package:bloc_fetch_data_from_api/models/photo_model.dart';
import 'package:bloc_fetch_data_from_api/resourses/repository/repository.dart';

class PhotoBloc {
  final repository = new Repository();
  final photoListFetcher = StreamController<List<PhotoModel>>();

  Stream<List<PhotoModel>> get allPhoto => photoListFetcher.stream;

  fetchPhotosFromBloc() async {
    List<PhotoModel> photoModelList = List();
    photoModelList = await repository.fetchPhotos();
    photoListFetcher.sink.add(photoModelList);
  }

  dispose() {
    photoListFetcher.close();
  }
}

final bloc = PhotoBloc();
