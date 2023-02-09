import 'package:flutter/material.dart';

import '../../movies_list/movies_list/movies_list_view.dart';
import '../../movies_list/movies_list/movies_list_view_controller.dart';
import '../../movies_list/movies_list_factory.dart';
import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {}

class HomeViewController extends StatefulWidget {
  final HomeProtocol viewModel;

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(
      indexedChildren: _homeChildren(),
      viewModel: widget.viewModel,
    );
  }

  List<Widget> _homeChildren() {
    return [
      MoviesListFactory.moviesListPage(),
      Container(color: Colors.red),
      Container(color: Colors.green),
    ];
  }
}
