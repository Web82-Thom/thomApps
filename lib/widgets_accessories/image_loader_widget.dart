import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thomapps/screens/home/controllers/picker_controller.dart';

class ImageLoaderWidget extends StatefulWidget {
  final String url;
  final double? height;
  final double? width;
  final bool isCircular;
  final Decoration? decoration;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  const ImageLoaderWidget({Key? key, required this.url, this.borderRadius, this.decoration, this.fit, this.height, this.width, required this.isCircular}) : super(key: key);

  @override
  _ImageLoaderWidgetState createState() => _ImageLoaderWidgetState();
}

class _ImageLoaderWidgetState extends State<ImageLoaderWidget> {
  PickerController pickerController = PickerController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: pickerController.downloadURL(widget.url),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return Container(
            width: widget.width,
            height: widget.height,
            child: (widget.isCircular)
            ? CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data!,
              ),
            )
                : Container(
              //height: screenSize.height * 0.05,
              //width: screenSize.width * 0.1,
              width: widget.width,
              height: widget.height,
              decoration: widget.decoration,
              child: ClipRRect(
                  borderRadius: (widget.borderRadius != null) ? widget.borderRadius : BorderRadius.circular(0),
                child: Image.network(
                  snapshot.data!,
                  fit: widget.fit,
                  width: double.infinity,
                ),
              ),
            ),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting || snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Container();
      },);
  }
}
