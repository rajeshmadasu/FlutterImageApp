import 'package:flutter/material.dart';
import './widget/image_viewer.dart';
import 'package:flutter_images_app/screens/svg_network_demo.dart';

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
              SizedBox(
                width: 250,
                child: SimpleElevatedButton(
                    borderRadius: 16,
                    color: Colors.green,
                    onPressed: () => navToImageViewScreen(ImageTypes.png),
                    child: const Text(
                      'View Png',
                      style: textStyle,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: SimpleElevatedButton(
                    borderRadius: 16,
                    color: Colors.amber,
                    onPressed: () => navToImageViewScreen(ImageTypes.jpeg),
                    child: const Text(
                      'View Jpeg/Jpeg',
                      style: textStyle,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: SimpleElevatedButton(
                    borderRadius: 16,
                    color: Colors.orange,
                    onPressed: () => navToImageViewScreen(ImageTypes.svg),
                    child: const Text(
                      'View Svg from asset',
                      style: textStyle,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: SimpleElevatedButton(
                    borderRadius: 16,
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
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: SimpleElevatedButton(
                    borderRadius: 16,
                    color: Colors.blue,
                    onPressed: () => navToImageViewScreen(ImageTypes.lottie),
                    child: const Text(
                      'View Lottie',
                      style: textStyle,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: SimpleElevatedButton(
                    borderRadius: 16,
                    color: Colors.purple,
                    onPressed: () => navToImageViewScreen(ImageTypes.network),
                    child: const Text(
                      'View images from Network ',
                      style: textStyle,
                    )),
              ),
            ],
          ),
        ));
  }
}

class SimpleElevatedButton extends StatelessWidget {
  const SimpleElevatedButton(
      {this.child,
      this.color,
      this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      Key? key})
      : super(key: key);
  final Color? color;
  final Widget? child;
  final Function? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: child,
    );
  }
}
