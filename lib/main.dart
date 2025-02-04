import 'package:flutter/cupertino.dart';
import './styles/text_styles.dart';
import './cubit/swing_cubit.dart';
import './cubit/swing_state.dart';
import './detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SwingsCubit(),
      child: CupertinoApp(
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
          brightness: Brightness.dark,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SwingsCubit>().loadSwings(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: BlocBuilder<SwingsCubit, SwingsState>(
          builder: (context, state) {
            if (state is SwingsLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state is SwingsLoaded) {
              return ListView.builder(
                itemCount: state.files.length,
                itemBuilder: (context, index) {
                  final filePath = state.files[index];
                  final fileName = filePath.split('/').last.split('.').first;
                  return CupertinoListTile(
                    title: Text(
                      'Swing $fileName',
                      style: TextStyles.listTileTitle,
                    ),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              DetailScreen(filePath: filePath),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Center(
              child: Text('☹️', style: TextStyle(fontSize: 30)),
            );
          },
        ),
      ),
    );
  }
}
