import 'package:flutter/material.dart';

import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {}

class HomeViewController<ViewModel extends HomeProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/home';

  HomeViewController({super.key, required this.viewModel});

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
    return HomeView(viewModel: widget.viewModel);
  }
}
