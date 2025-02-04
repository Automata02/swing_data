import 'package:flutter/cupertino.dart';
import '../styles/text_styles.dart';
import '../cubit/swing_cubit.dart';
import '../cubit/swing_state.dart';
import '../reusable_components/cupertino_destructive_icon_button.dart';
import '../reusable_components/line_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final String filePath;
  const DetailScreen({
    super.key,
    required this.filePath,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String currentFilePath;

  @override
  void initState() {
    super.initState();
    currentFilePath = widget.filePath;
    context.read<SwingsCubit>().loadSwingData(currentFilePath);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Inspection'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: SafeArea(
        child: BlocBuilder<SwingsCubit, SwingsState>(
          builder: (context, state) {
            if (state is! SwingsLoaded) {
              return const Center(child: CupertinoActivityIndicator());
            }

            final files = state.files;
            if (!files.contains(currentFilePath)) {
              final oldIndex =
                  int.parse(currentFilePath.split('/').last.split('.').first) -
                      1;
              if (oldIndex < files.length) {
                currentFilePath = files[oldIndex];
              } else if (files.isNotEmpty) {
                currentFilePath = files.last;
              } else {
                Navigator.pop(context);
                return const SizedBox.shrink();
              }
            }
            final currentIndex = files.indexOf(currentFilePath);
            final fileName = currentFilePath.split('/').last.split('.').first;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Swing $fileName',
                        style: TextStyles.listTileTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: DestructiveButton(
                        onPressed: () {
                          final currentIndex = files.indexOf(currentFilePath);

                          if (files.length <= 1) {
                            context.read<SwingsCubit>().deleteSwing(0);
                            Navigator.pop(context);
                            return;
                          }

                          String? newFilePath;
                          if (currentIndex == files.length - 1) {
                            newFilePath = currentIndex > 0
                                ? files[currentIndex - 1]
                                : null;
                          } else {
                            newFilePath = files[currentIndex + 1];
                          }

                          setState(() {
                            if (newFilePath != null) {
                              currentFilePath = newFilePath;
                            }
                          });
                          context.read<SwingsCubit>().deleteSwing(currentIndex);
                          if (newFilePath != null) {
                            context
                                .read<SwingsCubit>()
                                .loadSwingData(newFilePath);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (state.currentSwing != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SwingLineChart(
                      flexionExtension: state.currentSwing?.parameters.hfaCrWrFlexEx.values ?? [],
                      ulnarRadial: state.currentSwing?.parameters.hfaCrWrRadUln.values ?? [],
                    ),
                  ),
                Text('File: $currentFilePath'),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CupertinoButton(
                      onPressed: currentIndex > 0
                          ? () {
                              setState(() {
                                currentFilePath = files[currentIndex - 1];
                              });
                              context
                                  .read<SwingsCubit>()
                                  .loadSwingData(files[currentIndex - 1]);
                            }
                          : null,
                      child: const Text('Previous'),
                    ),
                    CupertinoButton(
                      onPressed: currentIndex < files.length - 1
                          ? () {
                              setState(() {
                                currentFilePath = files[currentIndex + 1];
                              });
                              context
                                  .read<SwingsCubit>()
                                  .loadSwingData(files[currentIndex + 1]);
                            }
                          : null,
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
