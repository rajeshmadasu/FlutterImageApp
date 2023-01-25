import 'package:flutter/material.dart';
import 'screens/image_viewer.dart';
import './screens/svg_network_demo.dart';

import './widget/simple_elevated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(
        title: 'Flutter Image Demo',
      ),
      routes: {ImageViewWidget.routeName: (context) => const ImageViewWidget()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum ImageTypes { png, jpeg, svg, lottie, network }

class _MyHomePageState extends State<MyHomePage> {
  void navToImageViewScreen(ImageTypes imageTypes) {
    Navigator.pushNamed(context, ImageViewWidget.routeName,
        arguments: imageTypes);
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: textStyle,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleElevatedButton(
                color: Colors.green,
                onPressed: () => navToImageViewScreen(ImageTypes.png),
                child: const Text(
                  'View Png',
                  style: textStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SimpleElevatedButton(
                color: Colors.amber,
                onPressed: () => navToImageViewScreen(ImageTypes.jpeg),
                child: const Text(
                  'View Jpeg/Jpeg',
                  style: textStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SimpleElevatedButton(
                color: Colors.orange,
                onPressed: () => navToImageViewScreen(ImageTypes.svg),
                child: const Text(
                  'View Svg from asset',
                  style: textStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SimpleElevatedButton(
                color: Colors.red,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SvgNetworkDemoPage(
                              title: 'Svg Demo',
                            )),
                  )
                },
                child: const Text(
                  'View Svg from netowrk',
                  style: textStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SimpleElevatedButton(
                color: Colors.blue,
                onPressed: () => navToImageViewScreen(ImageTypes.lottie),
                child: const Text(
                  'View Lottie',
                  style: textStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SimpleElevatedButton(
                color: Colors.purple,
                onPressed: () => navToImageViewScreen(ImageTypes.network),
                child: const Text(
                  'View images from Network ',
                  style: textStyle,
                ),
              ),
            ],
          ),
        ));
  }
}
