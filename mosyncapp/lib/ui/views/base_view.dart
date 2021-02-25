import 'package:flutter/cupertino.dart';
import 'package:mosyncapp/viewmodel/base_model.dart';
import 'package:provider/provider.dart';
import 'package:mosyncapp/locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget{
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final Function(T) onModelDestroy;
  BaseView({this.builder, this.onModelReady, this.onModelDestroy});
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}
class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }
  @override
  void dispose() {
    if (widget.onModelDestroy != null) {
      widget.onModelDestroy(model);
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}