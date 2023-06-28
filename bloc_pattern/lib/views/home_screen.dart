import 'package:bloc_pattern/blocs/app_blocks.dart';
import 'package:bloc_pattern/blocs/app_events.dart';
import 'package:bloc_pattern/blocs/app_states.dart';
import 'package:bloc_pattern/models/user_model.dart';
import 'package:bloc_pattern/repos/repositories.dart';
import 'package:bloc_pattern/views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BloC Pattern"),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // User is loaded
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(e: userList[index])));
                  },
                  child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            userList[index].firstname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            userList[index].lastname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(userList[index].avatar)),
                        ),
                      )),
                );
              },
            );
          }

          // If there is an error
          if (state is UserErrorState) {
            debugPrint(state.error);
            return const Center(child: Text("Error loading the data"));
          }
          return Container();
        }),
      ),
    );
  }
}
