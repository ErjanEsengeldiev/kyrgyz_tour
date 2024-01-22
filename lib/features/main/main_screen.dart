import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyrgyz_tour/features/main/logic/cubit/main_cubit.dart';
import 'package:latlong2/latlong.dart';
import 'package:kyrgyz_tour/constans/app_theme.dart/app_colors.dart';
import 'package:kyrgyz_tour/constans/app_theme.dart/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainCubit _cubit = MainCubit();
  @override
  void initState() {
    _cubit.getGeoLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('kyrgyztan'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.abc),
            ),
          ],
        ),
        drawer: Center(),
        body: Padding(
          padding: const EdgeInsets.all(20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('data'),
              ),
              Text(
                'Hi John,',
                style: AppTextStyle.regular18,
              ),
              SizedBox(
                width: 276.w,
                child: Text(
                  'Where do you wanna go?',
                  style: AppTextStyle.bold30.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
              BlocBuilder<MainCubit, MainState>(
                bloc: _cubit,
                builder: (context, state) {
                  if (state is GeoPositionFetched) {
                    return SizedBox(
                      height: 400,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(
                            state.position.latitude,
                            state.position.longitude,
                          ),
                          initialZoom: 10,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          RichAttributionWidget(
                            attributions: [
                              TextSourceAttribution(
                                'OpenStreetMap contributors',
                                onTap: () => launchUrl(Uri.parse(
                                    'https://openstreetmap.org/copyright')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is ErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return Center(
                      child: Text('inital state'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
