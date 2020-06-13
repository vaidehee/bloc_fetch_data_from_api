import 'package:bloc_fetch_data_from_api/models/photo_model.dart';
import 'package:bloc_fetch_data_from_api/resourses/photolist_provider.dart';

class Repository {
  final photoListProvider = new PhotoListProvider();

  Future<List<PhotoModel>> fetchPhotos() async {
    return photoListProvider.fetchPhotoList();
  }
}
