part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;
  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: 'Tags'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
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
        body: BlocBuilder<VelocityBloc<List<TagsModel>>,
                VelocityState<List<TagsModel>>>(
            bloc: tagsViewModel.tagsListBloc,
            builder: (context, state) {
              if (state is VelocityInitialState) {
                return const LoadingWidget();
              } else if (state is VelocityUpdateState) {
                return ListRefreshIndicator(
                  onRefresh: () async {
                    await tagsViewModel.fetchAllTags();
                  },
                  child: ListView.separated(
                      padding:
                          EdgeInsets.only(left: 16.w, right: 4.w, top: 12.h),
                      physics: const AlwaysScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => 16.h.heightBox,
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final TagsModel tagsModel = state.data[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          leading: '${index + 1}'.text.size(14.sp).make(),
                          title: '${tagsModel.title}'.text.size(14.sp).make(),
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
                        );
                      }),
                );
              } else {
                return const SizedBox.shrink();
              }
            }));
  }
}
