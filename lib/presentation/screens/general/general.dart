part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  List<TabItem> items = const [
    TabItem(icon: FeatherIcons.home),
    TabItem(icon: FeatherIcons.tag),
    TabItem(icon: FeatherIcons.plus),
    TabItem(icon: FeatherIcons.hash),
    TabItem(icon: FeatherIcons.user),
  ];
  int visit = 0;

  List<Widget> pages = const [
    Home(),Tags(),AddPosts(),Categories(),Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(visit),
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: Colors.white,
        color: Colors.grey,
        colorSelected: AppColors.primaryColor,
        indexSelected: visit,
        paddingVertical: 24,
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
