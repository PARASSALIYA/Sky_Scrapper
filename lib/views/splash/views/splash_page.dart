import 'package:sky_scrapper/header.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.watch<HomeProvider>().isDark ? Colors.black : Colors.white,
      body: const Center(
        child: Image(
          image: AssetImage("assets/images/images.png"),
        ),
      ),
    );
  }
}
