import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quietroom/app/app.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final isGuestUser = user.email == null || user.email?.isEmpty == true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quite Room'),
        actions: <Widget>[
          if (!isGuestUser)
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          ),
        ],
      ),
      body:
      Align(
        alignment: const Alignment(0, -1 / 3),
        child:
        Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 140),
            const Text(
              'Welcome to your Quiet Room',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isGuestUser)
              const Text('You can be a member any time'),
            if (!isGuestUser)
            Text('Your email: ${user.email ?? ''}'),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 330,
                  child: Image.asset('assets/wall-picture.png', width: 220, height: 130),
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 237),
                    height: 230,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                if (!isGuestUser)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/couch.png', width: 220, height: 220),
                          Image.asset('assets/chair-red.png', width: 130, height: 130),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 180),
                        child: Image.asset('assets/table.png', width: 200, height: 200),
                      ),
                    ],
                  ),
                if (isGuestUser)
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/chair-yellow.png', width: 180, height: 180),
                            Image.asset('assets/chair-blue.png', width: 180, height: 180),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 150),
                          child: Image.asset('assets/round-table.png', width: 200, height: 200),
                        ),]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}