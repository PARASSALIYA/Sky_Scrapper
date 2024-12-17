import 'package:sky_scrapper/header.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  late HomeProvider searchProviderW;
  late HomeProvider searchProviderR;
  @override
  Widget build(BuildContext context) {
    searchProviderR = context.read<HomeProvider>();
    searchProviderW = context.watch<HomeProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Manage Cities",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SearchBar(
              controller: controller,
              onSubmitted: (value) {
                controller.text = value;
                searchProviderR.selectedCity = value;
                searchProviderR.getWetherHelper();
                searchProviderR
                    .setSearch(context.read<HomeProvider>().selectedCity);
                controller.clear();
              },
              hintText: "Search for a city",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<HomeProvider>().searchHistory.length,
                itemBuilder: (context, index) {
                  final history = searchProviderW.searchHistory[index];
                  return GestureDetector(
                    onTap: () {
                      searchProviderR.selectedCity = history;
                      searchProviderR.getWetherHelper();
                      Navigator.pushNamed(context, Routes.home);
                    },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade900,
                      ),
                      child: ListTile(
                        title: Text(
                          history,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            searchProviderR.removeSearch(history);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
