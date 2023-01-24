import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<String> uriNames = <String>[
  'http://upload.wikimedia.org/wikipedia/commons/0/02/SVG_logo.svg',
  'https://upload.wikimedia.org/wikipedia/commons/b/b4/Chess_ndd45.svg',
];

class SvgNetworkDemoPage extends StatefulWidget {
  const SvgNetworkDemoPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  SvgNetworkDemoPageState createState() => SvgNetworkDemoPageState();
}

class SvgNetworkDemoPageState extends State<SvgNetworkDemoPage> {
  final List<Widget> _painters = <Widget>[];
  late double _dimension;

  @override
  void initState() {
    super.initState();
    _dimension = 203.0;

    for (String uriName in uriNames) {
      _painters.add(
        SvgPicture.network(
          uriName,
          placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_dimension > MediaQuery.of(context).size.width - 10.0) {
      _dimension = MediaQuery.of(context).size.width - 10.0;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Slider(
          min: 5.0,
          max: MediaQuery.of(context).size.width - 10.0,
          value: _dimension,
          onChanged: (double val) {
            setState(() => _dimension = val);
          },
        ),
        Expanded(
          child: GridView.extent(
            shrinkWrap: true,
            maxCrossAxisExtent: _dimension,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: _painters.toList(),
          ),
        ),
      ]),
    );
  }
}
