import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pexels_app/screens/videos_screen/video_widget.dart';
import 'package:pexels_app/screens/videos_screen/videos_model.dart';
import 'package:provider/provider.dart';

class VideosWidget extends StatefulWidget {
  const VideosWidget({Key? key}) : super(key: key);

  @override
  State<VideosWidget> createState() => _VideosWidgetState();
}

class _VideosWidgetState extends State<VideosWidget> {
  int itemCount = 20;
  @override
  void initState() {
    context.read<VideosModel>().getPopularVideos();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<VideosModel>();
    itemCount = model.videos.length;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  model.onChangeTextField(value);
                },
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
                itemCount: itemCount,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  model.showedVideoAtIndex(index, '');
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChangeNotifierProvider(
                            create: (_) =>
                                VideosModel(videos: model.videos, index: index),
                            child: const VideoWidget(),
                          );
                        }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        clipBehavior: Clip.hardEdge,
                        child: Stack(
                          //clipBehavior: Clip.hardEdge,
                          fit: StackFit.expand,
                          children: [                      
                            CachedNetworkImage(
                              imageUrl: model.videos[index].image,                          
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                            const Align(alignment: Alignment.center,
                              child: Icon(Icons.play_arrow, size: 50,)),
                          ],                      
                        ),
                      ),
                  );
                },              
              ),
            ),
          ],
        ),
      ),
    );
  }
}