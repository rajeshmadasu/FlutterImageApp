import 'package:flutter/material.dart';
import 'package:flutter_images_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

/// This widget will display various image based on the input provided.
class ImageViewWidget extends StatelessWidget {
  static const String routeName = "/imageview";

  const ImageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final imageType = ModalRoute.of(context)!.settings.arguments as ImageTypes;

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Image:${imageType.name}"),
      ),
      body: Container(
          width: double.infinity,
          height: height - 10,
          alignment: Alignment.topCenter,
          child: Builder(
            builder: (context) {
              try {
                if (imageType == ImageTypes.png) {
                  return _loadImageFromAssets('asset/images/flutter2.png');
                } else if (imageType == ImageTypes.jpeg) {
                  return _loadImageFromAssets('asset/images/lake.jpg');
                } else if (imageType == ImageTypes.svg) {
                  return _getSvgFromAssets('asset/images/hero-image.svg');
                } else if (imageType == ImageTypes.network) {
                  return _fetchImagesFromNetwork();
                } else {
                  return _loadLottieAnimations();
                }
              } catch (e) {
                return const Text("Unable to load image");
              }
            },
          )),
    );
  }

  Image _loadImageFromAssets(String image) {
    return Image.asset(image);
  }

  SingleChildScrollView _loadLottieAnimations() {
    return SingleChildScrollView(
      child: Column(children: [
        Lottie.asset('asset/images/welcome.json'),
        Lottie.network(
            'https://assets3.lottiefiles.com/packages/lf20_y7xcP4oERZ.json'),
        // Load an animation and its images from a zip file, make sure it has .json file
        // Lottie.asset('asset/images/welcome-2023.zip'),
        Lottie.network(
            'https://assets10.lottiefiles.com/packages/lf20_GofK09iPAE.json',
            height: 200),
      ]),
    );
  }

  SingleChildScrollView _fetchImagesFromNetwork() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            shadowColor: Colors.blue,
            elevation: 8,
            child: Image.network(
                fit: BoxFit.cover,
                "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png"),
          ),
          Card(
              elevation: 8,
              shadowColor: Colors.green,
              child: Column(children: [
                const Text(
                  "FadeInImage asset Network Image with placeholder",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FadeInImage.assetNetwork(
                  placeholder: 'asset/images/loading.gif',
                  image:
                      'https://images.unsplash.com/photo-1674513921651-d0a593756de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80',
                )
              ])),
          Card(
              shadowColor: Colors.red,
              elevation: 8,
              child: Column(children: [
                const Text(
                  "Network Image ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.network(
                    'https://images.unsplash.com/photo-1674538862542-dcaba80e0bd0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80')
              ]))
        ],
      ),
    );
  }

  Widget _getSvgFromAssets(String imageAssetName) {
    try {
      return SvgPicture.asset(
        imageAssetName,
      );
    } catch (e) {
      return const Text("Unable to load svg image");
    }
  }
}
