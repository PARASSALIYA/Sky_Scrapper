import 'package:sky_scrapper/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProviderW;
  late HomeProvider homeProviderR;
  TextEditingController controller = TextEditingController();
  void showCity() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 100,
            width: 300,
            color: Colors.black,
            child: SearchBar(
              controller: controller,
              onSubmitted: (value) {
                controller.text = value;
                context.read<HomeProvider>().selectedCity = value;
                context.read<HomeProvider>().getWetherHelper();
                Navigator.pop(context);
                controller.clear();
                context
                    .read<HomeProvider>()
                    .setSearch(context.read<HomeProvider>().selectedCity);
              },
              hintText: "Search city",
              padding: const WidgetStatePropertyAll(
                EdgeInsets.only(left: 20, top: 5),
              ),
              hintStyle: const WidgetStatePropertyAll(
                TextStyle(color: Colors.white),
              ),
              textStyle: const WidgetStatePropertyAll(
                TextStyle(color: Colors.white),
              ),
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => showCity(),
    );

    context.read<HomeProvider>().getWetherHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  homeProviderR.getTempBg(
                      "${homeProviderR.wetherModel?.weather?[0].main}"),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.search);
                        },
                        icon: const Icon(Icons.add,
                            color: Colors.white, size: 30),
                      ),
                      Text(
                        "${homeProviderR.wetherModel?.name}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      GestureDetector(
                        onLongPress: () {
                          Navigator.pushNamed(context, Routes.bookmark);
                        },
                        child: IconButton(
                          onPressed: () {
                            homeProviderW.bookMark
                                .add(homeProviderW.wetherModel!);
                          },
                          icon: const Icon(
                            Icons.bookmark_add_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SearchBar(
                    controller: controller,
                    onSubmitted: (value) {
                      controller.text = value;
                      homeProviderR.selectedCity = value;
                      homeProviderR.getWetherHelper();
                      homeProviderR.setSearch(homeProviderR.selectedCity);
                      controller.clear();
                    },
                    hintText: "Search city",
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.only(left: 20, top: 5),
                    ),
                    hintStyle: const WidgetStatePropertyAll(
                      TextStyle(color: Colors.white),
                    ),
                    textStyle: const WidgetStatePropertyAll(
                      TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                  ),
                  const SizedBox(height: 50),
                  Image(
                    image: AssetImage(
                      homeProviderR.getTemp(
                          "${homeProviderR.wetherModel?.weather?[0].main}"),
                    ),
                    width: 95,
                    height: 95,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${homeProviderR.wetherModel?.main?.temp?.toInt()}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 70),
                      ),
                      const Align(
                        alignment: Alignment(0, -1.9),
                        child: Text(
                          "°C",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${homeProviderR.wetherModel?.weather?[0].main}",
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 200,
                            height: 110,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Speed",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${homeProviderW.wetherModel?.wind?.speed}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "deg",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${homeProviderW.wetherModel?.wind?.deg}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "dt",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "\t\t\t\t\t\t\t\t\t\t\t\t\t${homeProviderW.wetherModel?.dt}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 200,
                            height: 120,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${homeProviderW.wetherModel?.sys?.sunrise}\t\t\t Sunrise",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text(
                                  "${homeProviderW.wetherModel?.sys?.sunset}\t\t\t Sunset",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text(
                                  "${homeProviderW.wetherModel?.main?.pressure}\t\t\t\t\t pressure",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            width: 150,
                            height: 200,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                const Spacer(),
                                Text(
                                  "visibility ${homeProviderW.wetherModel?.visibility}Km",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text(
                                  "Hum\t\t\t\t\t\t\t\t\t ${homeProviderW.wetherModel?.main?.humidity}%",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text(
                                  "All \t\t\t\t\t\t\t\t\t\t\t\t${homeProviderW.wetherModel?.clouds?.all} %",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text(
                                  "hPa\t\t\t\t\t\t\t\t\t\t\t\t${homeProviderW.wetherModel?.main?.pressure}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    height: 70,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          "${homeProviderW.wetherModel?.coord?.lat} lat",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Text(
                          "${homeProviderW.wetherModel?.coord?.lon} lon",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
