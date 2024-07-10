import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/insert_jobs_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/query_jobs_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/query_jobs_exists_bloc.dart';
import 'package:flutter_elo7/business/bloc/dio_bloc/request_jobs_bloc.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/screens/main_route/open_jobs_screen.dart';
import 'package:flutter_elo7/screens/main_route/our_team_screen.dart';
import 'package:flutter_elo7/screens/main_route/results_screen.dart';
import 'package:flutter_elo7/screens/main_route/seller_word_screen.dart';
import 'package:flutter_elo7/screens/main_route/work_with_us_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => InsertJobsBloc()),
          BlocProvider(create: (_) => RequestJobsBloc()),
          BlocProvider(create: (_) => QueryJobListBloc()),
          BlocProvider(create: (_) => QueryJobExistBloc()),
        ],
        child: Scaffold(
          //appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 64),
                    DecoratedBox(
                        decoration: const BoxDecoration(color: UIColor.white),
                        child: WorkWithUsWidget(callback: scrollToJobs)),
                    const DecoratedBox(
                        decoration:
                            BoxDecoration(color: UIColor.backgroundGray),
                        child: SizedBox(
                            width: double.infinity, child: SellerWordWidget())),
                    const DecoratedBox(
                        decoration: BoxDecoration(color: UIColor.white),
                        child: SizedBox(
                            width: double.infinity, child: OurTeamWidget())),
                    const DecoratedBox(
                        decoration:
                            BoxDecoration(color: UIColor.backgroundYellow),
                        child: SizedBox(
                            width: double.infinity,
                            child: ResultsScreenWidget())),
                    const Image(
                        image: AssetImage("assets/images/openJobs.jpg")),
                    const DecoratedBox(
                        decoration: BoxDecoration(color: UIColor.white),
                        child: SizedBox(
                            width: double.infinity,
                            child: OpenJobsScreenStatefulWidget())),
                  ],
                )),
          ),
        ));
  }

  void scrollToJobs() {
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent - 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease);
  }
}
