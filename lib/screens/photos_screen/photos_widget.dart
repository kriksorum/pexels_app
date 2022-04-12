import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pexels_app/screens/photos_screen/photo_widget.dart';
import 'package:pexels_app/screens/photos_screen/photos_model.dart';
import 'package:provider/provider.dart';

class PhotosWidget extends StatefulWidget {
  const PhotosWidget({Key? key}) : super(key: key);

  @override
  State<PhotosWidget> createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends State<PhotosWidget> {
  final TextEditingController _controller = TextEditingController();
  String searchString = '';
  int itemCount = 20;
  @override
  void initState() {
    context.read<PhotosModel>().getCuratedPhotos();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PhotosModel>();

    itemCount = model.photos.length;

   // if (model.isLoading) {
      //return const Center(child: CircularProgressIndicator());
  //  } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 30, left: 10, right: 10, bottom: 10),
                child: TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () {
                    model.onChangeTextField(_controller.text);
                    searchString = _controller.text;
                  },
                  onChanged: (String value) {
                    if (value == '') {
                      model.onChangeTextField(value);
                    }
                  },
                  style: const TextStyle(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Количество столбцов в строке
                    mainAxisSpacing: 2.0, // Вертикальный интервал
                    crossAxisSpacing: 2.0, // Горизонтальный интервал
                    childAspectRatio:
                        0.71, // Коэффициент масштабирования, соотношение сторон изображения
                  ),
                  shrinkWrap: true,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    model.showedPhotoAtIndex(index, searchString);
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChangeNotifierProvider(
                            create: (_) =>
                                PhotosModel(photos: model.photos, index: index),
                            child: PhotoWidget(index: index),
                          );
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: model.photos[index].src.portrait,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),

                        // Image.network(model.photos[index].src.portrait,
                        //    fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      );
   // }
  }
  
}
