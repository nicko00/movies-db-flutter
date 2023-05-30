import 'package:flutter/material.dart';

import 'menu_view.dart';

abstract class MenuProtocol extends MenuViewModelProtocol {}

class MenuViewController extends StatefulWidget {
  final MenuProtocol viewModel;

  const MenuViewController({super.key, required this.viewModel});

  @override
  State<MenuViewController> createState() => _MenuViewControllerState();
}

class _MenuViewControllerState extends State<MenuViewController> {
  @override
  Widget build(BuildContext context) {
    return MenuView(viewModel: widget.viewModel);
  }
}
