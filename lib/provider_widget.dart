import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget? child;
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T?)? onModelInit;

  ProviderWidget(this.model,
      {Key? key, @required this.builder, this.onModelInit, this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    this.model = widget.model;
    if (widget.onModelInit != null && model != null) {
      widget.onModelInit?.call(model);
    }
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<T>(
        create: (_) => this.model,
        child: Consumer<T>(
          builder: widget.builder!,
          child: widget.child,
        ),
      );
}
