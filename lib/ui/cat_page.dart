// lib/pages/cat_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cat_api/bloc/cat/cat_bloc.dart';

class CatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Cat Images')),
      body: BlocBuilder<CatBloc, CatState>(
        builder: (context, state) {
          if (state is CatInitial) {
            BlocProvider.of<CatBloc>(context).add(FetchCatImages());
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: state.catImages.length,
              itemBuilder: (context, index) {
                return Image.network(state.catImages[index].url,
                    fit: BoxFit.cover);
              },
            );
          } else if (state is CatError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            BlocProvider.of<CatBloc>(context).add(FetchCatImages()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
