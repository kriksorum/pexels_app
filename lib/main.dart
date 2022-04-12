import 'package:flutter/material.dart';
import 'package:pexels_app/screens/photos_screen/photos_widget.dart';
import 'package:pexels_app/screens/photos_screen/photos_model.dart';
import 'package:pexels_app/screens/videos_screen/videos_model.dart';
import 'package:pexels_app/screens/videos_screen/videos_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      //(
      //  primarySwatch: Colors.blue,
     // ),
      home: const HomePageState(),
      //ChangeNotifierProvider(
       //   create: (_) => PhotosModel(photos: [], index: 0),
        //  child: const PhotosWidget()),
    );
  }
}

class HomePageState extends StatefulWidget {
  const HomePageState({Key? key}) : super(key: key);

  @override
  State<HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: "Photo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_label),
            label: "Video",
          ),
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return ChangeNotifierProvider(
          create: (_) => PhotosModel(photos: [], index: 0),
          child: const PhotosWidget());
    } else {
      return  ChangeNotifierProvider(
        create: (_) => VideosModel(videos: [], index: 0),
        child: const VideosWidget(),
        );  
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
