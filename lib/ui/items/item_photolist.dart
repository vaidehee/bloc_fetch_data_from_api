import 'package:bloc_fetch_data_from_api/models/photo_model.dart';
import 'package:flutter/cupertino.dart';

class PhotosList extends StatefulWidget {
  final List<PhotoModel> photoList;

  PhotosList({Key key, this.photoList}) : super(key: key);

  @override
  _PhotosListState createState() => _PhotosListState(photoList: photoList);
}

class _PhotosListState extends State<PhotosList> {
  List<PhotoModel> photoList = List();
  AsyncSnapshot snapshot;

  _PhotosListState({this.photoList});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photoList.length,
      itemBuilder: (context, index) {
        return Image.network(photoList[index].thumbnailUrl);
      },
    );
  }
}
