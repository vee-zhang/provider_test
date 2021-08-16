import 'package:flutter/material.dart';
import 'package:provider_test/lodding_state_widget.dart';
import 'package:provider_test/provider_widget.dart';
import 'package:provider_test/view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) =>
      ProviderWidget<ViewModel>(ViewModel(), onModelInit: (model) {
        model?.updateState();
      }, builder: (context, model, child) {
        return LoadingStateWidget(
          viewState: model.viewState,
          retry: model.incrementCounter,
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${model.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: model.incrementCounter,
              tooltip: 'Increment',
              child: Text('点我'),
            ),
          ),
        );
      });
}
