import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/show_cubit.dart';
import 'package:untitled6/show_slider.dart';
import 'netflix_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NetflixAppBar(),
      body: BlocBuilder<ShowCubit, ShowState>(
        builder: (context, state) {
          if (state is ShowLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          } else if (state is ShowLoaded) {
            return ListView(
              children: [
                ShowCarousel(category: "Popular Shows", shows: state.shows),
              ],
            );
          } else if (state is ShowError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
