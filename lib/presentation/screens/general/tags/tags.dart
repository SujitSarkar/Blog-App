part of 'tags_imports.dart';

@RoutePage<TagsModel>()
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
                onPressed: () {
                  tagsViewModel.goToAddTagsPage(context);
                },
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
                          onTap: () {
                            if(AutoRouter.of(context).canPop()){
                              AutoRouter.of(context).popForced<TagsModel>(tagsModel);
                            }
                          },
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
                                    onPressed: () {
                                      tagsViewModel.goToUpdateTagPage(context, tagModel: tagsModel);
                                    },
                                    icon: const Icon(
                                      FeatherIcons.edit2,
                                      size: 20,
                                      color: Colors.green,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      deleteTagAlert(
                                          tagId:
                                              state.data[index].id.toString());
                                    },
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

  void deleteTagAlert({required String tagId}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Delete this tag?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('NO',
                        style: TextStyle(color: Colors.green))),
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: tagsViewModel.isLoading,
                  builder: (context, state) {
                    return TextButton(
                        onPressed: () {
                          tagsViewModel.deleteTags(context, tagId: tagId);
                        },
                        child: state.data
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator())
                            : const Text(
                                'YES',
                                style: TextStyle(color: Colors.red),
                              ));
                  },
                )
              ],
            ));
  }
}
