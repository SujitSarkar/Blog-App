part of 'widgets_imports.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 28.sp,
        width: 28.sp,
        child: Platform.isIOS
            ? CupertinoActivityIndicator(color: Theme.of(context).primaryColor)
            : CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
      ),
    );
  }
}
