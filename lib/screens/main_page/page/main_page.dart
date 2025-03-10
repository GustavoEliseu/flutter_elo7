import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/insert_jobs_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/query_jobs_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/query_jobs_exists_bloc.dart';
import 'package:flutter_elo7/business/bloc/dio_bloc/request_jobs_bloc.dart';
import 'package:flutter_elo7/models/network/data_state.dart';
import 'package:flutter_elo7/screens/main_page/e_open_jobs_screen.dart';
import 'package:flutter_elo7/screens/main_page/c_our_team_screen.dart';
import 'package:flutter_elo7/screens/main_page/d_results_screen.dart';
import 'package:flutter_elo7/screens/main_page/b_seller_word_screen.dart';
import 'package:flutter_elo7/screens/main_page/a_work_with_us_screen.dart';

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
          BlocProvider(create: (_) => InsertJobsBloc(InitialDataState())),
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
                    WorkWithUsWidget(callback: scrollToJobs),
                    const SellerWordWidget(),
                    const OurTeamWidget(),
                    const ResultsScreenWidget(),
                    const Image(
                        image: AssetImage("assets/images/openJobs.jpg")),
                    const OpenJobsScreenStatefulWidget(),
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
