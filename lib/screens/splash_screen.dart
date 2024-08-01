import 'package:flutter/material.dart';
import 'package:test_project_mxpertz/screens/onboarding_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final AssetManifest assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  //final List<String> assets = assetManifest.listAssets();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
          () {
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingScreen(),));
        // Navigate to main screen
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/image/logo.png'))),
      ),
    );
  }
}
