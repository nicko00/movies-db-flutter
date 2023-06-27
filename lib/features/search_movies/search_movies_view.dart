import 'package:flutter/material.dart';

import '../../support/components/default_screen.dart';
import '../../support/components/default_text_form_field.dart';
import '../../support/components/placeholders/empty_placeholder.dart';
import '../../support/components/placeholders/loading_view.dart';
import 'item/search_movies_item_view.dart';

abstract class SearchMoviesViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  bool get isRefreshLoading;
  String? get errorMessage;
  ScrollController get scrollController;
  List<SearchMoviesItemViewModelProtocol> get itemViewModels;

  void onChangeText(String text);
}

class SearchMoviesView extends StatelessWidget {
  final SearchMoviesViewModelProtocol viewModel;

  const SearchMoviesView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultScreen(
        isBottomBarTransparent: true,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 4),
              DefaultTextFormField(
                hintText: 'Pesquisar',
                icon: Icons.search_rounded,
                onChanged: viewModel.onChangeText,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: AnimatedBuilder(
                  animation: viewModel,
                  builder: (_, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: _bodyWidget,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _bodyWidget {
    if (viewModel.isLoading) return const LoadingView();

    if (viewModel.itemViewModels.isEmpty) {
      return const EmptyPlaceholder(
        message: 'Insira o nome de algum filme',
        icon: Icons.search_rounded,
      );
    }

    return Column(
      children: [
        Flexible(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: viewModel.itemViewModels.length,
            controller: viewModel.scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.5,
              mainAxisSpacing: 4,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
            ),
            itemBuilder: (_, index) {
              final itemViewModel = viewModel.itemViewModels[index];

              return SearchMoviesItemView(itemViewModel: itemViewModel);
            },
          ),
        ),
        Visibility(
          visible: viewModel.isRefreshLoading,
          child: const Column(
            children: [
              Positioned(
                bottom: 0,
                child: LoadingView(),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
