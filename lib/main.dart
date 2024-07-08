import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/screens/open_jobs_screen.dart';
import 'package:flutter_elo7/screens/our_team_screen.dart';
import 'package:flutter_elo7/screens/results_screen.dart';
import 'package:flutter_elo7/screens/seller_word_screen.dart';
import 'package:flutter_elo7/screens/work_with_us_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 64),
            DecoratedBox(
                decoration: BoxDecoration(color: UIColor.white),
                child: WorkWithUsWidget()),
            DecoratedBox(
                decoration: BoxDecoration(color: UIColor.backgroundGray),
                child: SizedBox(
                    width: double.infinity, child: SellerWordWidget())),
            DecoratedBox(
                decoration: BoxDecoration(color: UIColor.white),
                child:
                    SizedBox(width: double.infinity, child: OurTeamWidget())),
            DecoratedBox(
                decoration: BoxDecoration(color: UIColor.backgroundYellow),
                child: SizedBox(
                    width: double.infinity, child: ResultsScreenWidget())),
            Image(image: AssetImage("assets/images/openJobs.jpg")),
            DecoratedBox(
                decoration: BoxDecoration(color: UIColor.white),
                child: SizedBox(
                    width: double.infinity, child: OpenJobsScreenWidget())),
            SizedBox(height: 64),
          ],
        )),
      ),
    );
  }
}
