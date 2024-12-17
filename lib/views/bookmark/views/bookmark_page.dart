import 'package:sky_scrapper/header.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late HomeProvider bookmarkProviderW;
  late HomeProvider bookmarkProviderR;
  @override
  Widget build(BuildContext context) {
    bookmarkProviderR = context.read<HomeProvider>();
    bookmarkProviderW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: context.watch<HomeProvider>().bookMark.length,
          itemBuilder: (context, index) {
            final bookMark = bookmarkProviderW.bookMark[index];
            return GestureDetector(
              onTap: () {
                bookmarkProviderR.selectedCity = "${bookMark.name}";
                bookmarkProviderR.getWetherHelper();
                Navigator.pushNamed(context, Routes.home);
              },
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade900,
                ),
                child: ListTile(
                  title: Text(
                    "${bookMark.name}",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  subtitle: Text(
                    "${bookMark.weather?[0].main}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "${bookMark.main?.temp?.toInt()}°",
                    style: const TextStyle(color: Colors.white, fontSize: 34),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
