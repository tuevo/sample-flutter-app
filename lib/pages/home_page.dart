import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/models/english_today.dart';
import 'package:sample_flutter_app/pages/control_page.dart';
import 'package:sample_flutter_app/utils/random.dart';
import 'package:sample_flutter_app/values/app_assets.dart';
import 'package:sample_flutter_app/values/app_colors.dart';
import 'package:sample_flutter_app/values/app_styles.dart';
import 'package:sample_flutter_app/values/shared_keys.dart';
import 'package:sample_flutter_app/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _currentIndex = 0;
  late PageController _pageController;

  List<EnglishToday> _words = [];

  getEnglishToday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int len = prefs.getInt(SharedKeys.counter) ?? 5;

    List<String> newList = [];
    List<int> rands = randomIntegerList(len: len, max: nouns.length);

    for (var index in rands) {
      newList.add(nouns[index]);
    }

    setState(() {
      _words = newList.map((e) => EnglishToday(noun: e)).toList();
    });
  }

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    getEnglishToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Text(
          'English today',
          style: AppStyles.h3.copyWith(
              color: AppColors.textColor,
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset(AppAssets.icFolderPlus),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: size.height * 1 / 10,
                padding: const EdgeInsets.all(24),
                alignment: Alignment.centerLeft,
                child: Text(
                    '"Is is amazing how complete is the declusion that beauty is goodness."',
                    style: AppStyles.h5
                        .copyWith(fontSize: 12, color: AppColors.textColor))),
            SizedBox(
              height: size.height * 2 / 3 - 60,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: _words.length,
                  itemBuilder: ((context, index) {
                    var noun = _words[index].noun;
                    String nounFirstLetter =
                        noun != null ? noun.substring(0, 1) : '';
                    String restOfNoun = noun != null ? noun.substring(1) : '';

                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(3, 6),
                                  blurRadius: 6)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.centerRight,
                                child: Image.asset(AppAssets.icFolderPlus)),
                            RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: nounFirstLetter.toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: FontFamily.quicksand,
                                        fontSize: 89,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(3, 6),
                                              blurRadius: 6),
                                        ]),
                                    children: [
                                      TextSpan(
                                          text: restOfNoun,
                                          style: const TextStyle(
                                              fontFamily: FontFamily.quicksand,
                                              fontSize: 68,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              shadows: [
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    offset: Offset(3, 6),
                                                    blurRadius: 6),
                                              ]))
                                    ])),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: AutoSizeText(
                                '"Think of all the beauty still left around you and be happy. Think of all the beauty still left around you and be happy. Think of all the beauty still left around you and be happy.Think of all the beauty still left around you and be happy. Think of all the beauty still left around you and be happy."',
                                maxFontSize: 20,
                                style: AppStyles.h4.copyWith(
                                    letterSpacing: 1,
                                    color: AppColors.textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            ),

            // indicator
            SizedBox(
              height: size.height * 1 / 14,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _words.length,
                    itemBuilder: ((context, index) {
                      return buildIndicator(index == _currentIndex, size);
                    })),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          getEnglishToday();
        },
        child: Image.asset(AppAssets.icFolderPlus),
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.lightBlue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: Text(
                  'Your mind',
                  style: AppStyles.h3.copyWith(color: AppColors.textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: AppButton(
                    label: 'Favorites',
                    onTap: () {
                      print('favorites');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: AppButton(
                    label: 'Your control',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ControlPage()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: isActive ? size.width * 1 / 4 : 36,
      decoration: BoxDecoration(
          color: isActive ? AppColors.lightBlue : AppColors.lightGray,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }
}
