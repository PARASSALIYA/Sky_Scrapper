import 'package:sky_scrapper/views/bookmark/views/bookmark_page.dart';

import 'header.dart';

void main() {
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()..getHistory()),
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.splash: (context) => const SplashPage(),
          Routes.home: (context) => const HomePage(),
          Routes.search: (context) => const SearchPage(),
          Routes.bookmark: (context) => const BookmarkPage(),
        },
      ),
    );
  }
}
