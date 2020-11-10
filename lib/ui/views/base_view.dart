import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weatherapp/locator.dart';
import 'package:weatherapp/core/view_models/base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Function(T) dispose;
  final Function(T) initState;
  final Widget Function(BuildContext context, T model, Widget child) builder;

  BaseView({this.initState, this.builder, this.dispose});

  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.initState != null) widget.initState(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose != null) widget.dispose(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
