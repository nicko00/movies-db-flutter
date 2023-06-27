import 'package:flutter/material.dart';

import 'profile_view.dart';

abstract class ProfileProtocol extends ProfileViewModelProtocol {
  void loadContent();
}

class ProfileViewController extends StatefulWidget {
  final ProfileProtocol viewModel;

  const ProfileViewController({super.key, required this.viewModel});

  @override
  State<ProfileViewController> createState() => _ProfileViewControllerState();
}

class _ProfileViewControllerState extends State<ProfileViewController> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileView(viewModel: widget.viewModel);
  }
}
