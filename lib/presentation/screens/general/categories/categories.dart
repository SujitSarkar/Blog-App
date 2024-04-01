part of 'categories_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              'Categories'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.plus,
                  size: 24,
                ))
          ],
        ),
        body: ListView.separated(
          padding: EdgeInsets.only(left: 16.w, right: 4.w, top: 12.h),
          separatorBuilder: (context, index) => 16.h.heightBox,
          itemCount: 20,
          itemBuilder: (context, index) => ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            onTap: () {},
            title: '${index + 1} Enter'.text.size(14.sp).make(),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.edit2,
                        size: 20,
                        color: Colors.green,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.trash,
                        size: 20,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
