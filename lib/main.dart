import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reed/screens/home_page.dart';
import 'package:reed/utils/size_config.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        home: const SplashScreen(),
      ),
    );

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SizeConfig.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LottieBuilder.asset(
            'assets/lottie/car_with_singer.json',
            controller: _controller,
            animate: true,
            height: SizeConfig.heightPercent * 80,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().whenComplete(
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                );
            },
          ),
          const Text(
            'Reed',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Qualy', fontSize: 30),
          ),
        ],
      ),
    );
  }
}
