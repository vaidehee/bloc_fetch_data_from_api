import 'package:bloc_fetch_data_from_api/blocs/photo_bloc.dart';
import 'package:bloc_fetch_data_from_api/models/photo_model.dart';
import 'package:flutter/material.dart';
import 'items/item_photolist.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
    @override
  void initState() {
    super.initState();
    bloc.fetchPhotosFromBloc();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: StreamBuilder(
              stream:bloc.allPhoto
              ,builder: (BuildContext context,AsyncSnapshot<List<PhotoModel>> snapshot)
          {
            if (snapshot.hasData) {
              return PhotosList(photoList: snapshot.data,);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}

