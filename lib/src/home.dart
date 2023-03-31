import 'package:buildspace/main.dart';
import 'package:buildspace/src/constant/constant.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const double WIDTH = 200;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();

    animation = Tween<double>(
      begin: (nfts.length * 100 * -1),
      end: (nfts.length * 5),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BaseWidget(animation: animation),
    );
  }
}

class BaseWidget extends AnimatedWidget {
  const BaseWidget({
    super.key,
    required this.animation,
  }) : super(listenable: animation);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: animation.value,
          child: SizedBox(
            height: size.height * .5 * .5,
            width: WIDTH * nfts.length,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      for (var n in nfts) ImageTile(n: n),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: size.height * .5 * .5,
          left: animation.value,
          child: SizedBox(
            height: size.height * .5 * .5,
            width: WIDTH * nfts.length,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      for (var n in nfts.reversed) ImageTile(n: n),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.n,
  });

  final Map<String, String> n;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WIDTH,
      height: size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                n['img'] as String,
              ),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: const Text(
              'Lorem Ipsume',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
