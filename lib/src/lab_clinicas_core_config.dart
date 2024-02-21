import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    super.key,
    this.bindings,
    this.pages,
    this.pagesBuilders,
    this.modules,
    required this.title,
    this.didStart,
  });

  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;
  final VoidCallback? didStart;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        debugMode: kDebugMode,
        bindings: bindings,
        pages: [...pages ?? [], ...pagesBuilders ?? []],
        modules: modules,
        builder: (context, routes, flutterGetItNavObserver) {
          return AsyncStateBuilder(
              loader: AppLoader(),
              builder: (navigatorObservers) {
                if (didStart != null) {
                  didStart!();
                }
                return MaterialApp(
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  navigatorObservers: [
                    navigatorObservers,
                    flutterGetItNavObserver
                  ],
                  routes: routes,
                  title: title,
                );
              });
        });
  }
}
