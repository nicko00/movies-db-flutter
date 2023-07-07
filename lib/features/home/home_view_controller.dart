import 'package:flutter/material.dart';

import '../menu/menu_factory.dart';
import '../movies_list/movies_list_factory.dart';
import '../search_movies/search_movies_factory.dart';
import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {
  set animationController(AnimationController controller);

  VoidCallback? onTapSelectedIndex;
  VoidCallback? onTapMenu;
}

class HomeViewController extends StatefulWidget {
  final HomeProtocol viewModel;

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _bind();
    _setupAnimationController();
  }

  @override
  void dispose() {
    widget.viewModel.animationController.dispose();
    super.dispose();
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
      SearchMoviesFactory.search(),
      Container(color: Colors.green),
    ];
  }

  void _bind() {
    widget.viewModel.onTapSelectedIndex = () {
      widget.viewModel.animationController.forward(from: 0);
    };
    widget.viewModel.onTapMenu = () {
      Navigator.pushNamed(context, MenuFactory.route);
    };
  }

  void _setupAnimationController() {
    widget.viewModel.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    widget.viewModel.animationController.forward();
  }
}
