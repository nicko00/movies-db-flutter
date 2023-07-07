import 'package:flutter/material.dart';

import '../profile/profile_factory.dart';
import 'menu_view.dart';

abstract class MenuProtocol extends MenuViewModelProtocol {
  VoidCallback? onTapProfile;
}

class MenuViewController extends StatefulWidget {
  final MenuProtocol viewModel;

  const MenuViewController({super.key, required this.viewModel});

  @override
  State<MenuViewController> createState() => _MenuViewControllerState();
}

class _MenuViewControllerState extends State<MenuViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return MenuView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapProfile = () {
      Navigator.pushNamed(context, ProfileFactory.route);
    };
  }
}
