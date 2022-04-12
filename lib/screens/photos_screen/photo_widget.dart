import 'package:flutter/material.dart';
import 'package:pexels_app/screens/photos_screen/photos_model.dart';
import 'package:provider/provider.dart';

class PhotoWidget extends StatelessWidget {
  final int index;
  const PhotoWidget({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<PhotosModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
        controller: PageController(initialPage: index),
        // ignore: avoid_print
        onPageChanged: (int page) => {print("page changed to $page")},
        scrollDirection: Axis.vertical,
        itemCount: model.photos.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(model.photos[index].src.portrait,
                    fit: BoxFit.cover),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          primary: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )),
                      onPressed: () {
                        model
                            .saveNetworkImage(model.photos[index].src.original, model.photos[index].alt);
                        const snackBar = SnackBar(
                          content: Text('Image Saved In Gallery!'),
                        );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text('Download image'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(model.photos[index].alt,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 15),
                    child: Text(
                        'Photographer: ${model.photos[index].photographer}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
