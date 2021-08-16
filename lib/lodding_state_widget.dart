import 'package:flutter/material.dart';
import 'package:provider_test/base_view_model.dart';

class LoadingStateWidget extends StatelessWidget {
  final ViewState viewState;
  final VoidCallback? retry;
  final Widget? child;

  LoadingStateWidget(
      {Key? key,
      this.viewState = ViewState.loadding,
      this.retry,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (this.viewState) {
      case ViewState.loadding:
        return _loadingView;
      case ViewState.error:
        return _errorView;
      default:
        return child!;
    }
  }

  Widget get _loadingView => Center(
        child: CircularProgressIndicator(),
      );

  Widget get _errorView => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: OutlinedButton(
                onPressed: retry,
                child: Text(
                  '重试',
                  style: TextStyle(color: Colors.black87),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.black12)),
              ),
            )
          ],
        ),
      );
}
