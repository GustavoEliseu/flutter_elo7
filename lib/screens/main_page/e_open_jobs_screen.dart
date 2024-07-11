import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/insert_jobs_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/query_jobs_bloc.dart';
import 'package:flutter_elo7/business/bloc/database_bloc/query_jobs_exists_bloc.dart';
import 'package:flutter_elo7/business/bloc/dio_bloc/request_jobs_bloc.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/job.dart';
import 'package:flutter_elo7/models/network/data_state.dart';
import 'package:flutter_elo7/screens/webview_page/webview_page.dart';
import 'package:flutter_elo7/utils/debouncer.dart';
import 'package:flutter_elo7/widgets/custom_stateless_widgets/open_job_widget.dart';

class OpenJobsScreenStatefulWidget extends StatefulWidget {
  const OpenJobsScreenStatefulWidget({super.key});

  @override
  State<StatefulWidget> createState() => _OpenJobsScreenStatefulWidget();
}

class _OpenJobsScreenStatefulWidget
    extends State<OpenJobsScreenStatefulWidget> {
  late final RequestJobsBloc _requestJobsBloc;
  late final QueryJobExistBloc _queryJobsExistsBloc;
  late final QueryJobListBloc _queryJobsListBloc;
  late final InsertJobsBloc _insertJobsBloc;
  final JobsRepoImpl jobsRepo = JobsRepoImpl();
  int _page = 0;
  String? _term = null;
  bool firstPage = true;
  bool lastPage = false;
  @override
  void initState() {
    super.initState();
    _requestJobsBloc = BlocProvider.of<RequestJobsBloc>(context);
    _queryJobsExistsBloc = BlocProvider.of<QueryJobExistBloc>(context);
    _queryJobsListBloc = BlocProvider.of<QueryJobListBloc>(context);
    _insertJobsBloc = BlocProvider.of<InsertJobsBloc>(context);
  }

  @override
  void dispose() {
    _requestJobsBloc.close();
    _queryJobsExistsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: UIColor.white),
        padding: const EdgeInsets.only(
            top: ProjectSizes.largePadding,
            bottom: ProjectSizes.largePadding,
            left: ProjectSizes.sidePadding,
            right: ProjectSizes.sidePadding),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Strings.openJobs,
                  style: CustomTextStyle.museo(
                      context, FontSizes.title, FontWeight.w600)),
              BlocBuilder<QueryJobExistBloc, DataState?>(
                  bloc: _queryJobsExistsBloc
                    ..add(LocalQueryJobsExistsEvent(jobsRepo)),
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case InitialDataState:
                        return stateIsLoading();
                      case LoadedDataState:
                        if ((state as LoadedDataState).data) {
                          return databaseRequestWidget();
                        } else {
                          return httpRequestWidget();
                        }
                      default:
                        return const Text(
                            "Não foi possível carregar os cargos");
                    }
                  })
            ]));
  }

  Widget httpRequestWidget() {
    return BlocBuilder<RequestJobsBloc, DataState?>(
        bloc: _requestJobsBloc..add(RequestJobsEvent()),
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitialDataState:
              return stateIsLoading();
            case LoadedDataState:
              return BlocBuilder<InsertJobsBloc, DataState?>(
                  bloc: _insertJobsBloc
                    ..add(InsertingJobsEvent(
                        jobsRepo, (state as LoadedDataState).data)),
                  builder: (context, stateSave) {
                    switch (stateSave.runtimeType) {
                      case InitialDataState:
                        return stateIsLoading();
                      case LoadedDataState:
                        return databaseRequestWidget();
                      default:
                        return const Text(
                            "Não foi possível carregar os cargos");
                    }
                  });
            default:
              return const Text("Não foi possível carregar os cargos");
          }
        });
  }

  Widget databaseRequestWidget() {
    return BlocBuilder<QueryJobListBloc, DataState?>(
        bloc: _queryJobsListBloc
          ..add(LocalQueryJobsEvent(jobsRepo, _page, queryTerm: _term)),
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitialDataState:
              return stateIsLoading();
            case LoadedDataState:
              firstPage = _page == 0;
              lastPage = (state as LoadedDataState).data.length < 5;
              return stateIsLoaded(state.data);
            default:
              return const Text("Não foi possível carregar os cargos");
          }
        });
  }

  Widget stateIsLoading() {
    return const Visibility(
      visible: true,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      ),
    );
  }

  Widget stateIsLoaded(List<Job> jobs) {
    final _debouncer = Debouncer(milliseconds: 500);
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SEARCH PLACEHOLDER
          const SizedBox(height: ProjectSizes.smallPadding), //24px
          TextField(
            decoration: InputDecoration(
                suffixIcon: Image.asset('assets/images/ic_search.png'),
                hintText: Strings.search_hint,
                hintStyle: CustomTextStyle.museo(context, FontSizes.bodySmall,
                    FontWeight.w400, UIColor.textHint),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                )),
            keyboardType: TextInputType.multiline,
            onChanged: (value) => {
              _debouncer.run(() {
                if (value != _term) {
                  _term = value;
                  _page = 0;
                  _queryJobsListBloc.add(
                      LocalQueryJobsEvent(jobsRepo, _page, queryTerm: _term));
                }
              })
            },
            onTapOutside: (event) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            //...
          ), // PLACEHOLDER

          const SizedBox(height: ProjectSizes.mediumPadding), //32px
          Text(Strings.development,
              textAlign: TextAlign.start,
              style: CustomTextStyle.museo(
                  context, FontSizes.bodyLarge, FontWeight.w600)),

          ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 8),
              itemCount: jobs.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebViewPage(jobTitle: jobs[index].title)),
                      );
                    },
                    child:
                        OpenJobWidget(jobs[index].title, jobs[index].location));
              },
              separatorBuilder: (context, index) {
                return const Divider();
              }),

          if (jobs.isEmpty) const SizedBox(height: ProjectSizes.mediumPadding),
          if (jobs.isEmpty) const Text("Todas as vagas foram exibidas"),
          if (jobs.isEmpty) const SizedBox(height: ProjectSizes.mediumPadding),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: !firstPage,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: InkWell(
                      onTap: () {
                        if (_page > 0) {
                          _page--;
                          _queryJobsListBloc.add(LocalQueryJobsEvent(
                              jobsRepo, _page,
                              queryTerm: _term));
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.keyboard_arrow_left,
                            color: UIColor.textGreen,
                          ),
                          Text(Strings.previous,
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.museo(
                                  context,
                                  FontSizes.bodyMedium,
                                  FontWeight.w400,
                                  UIColor.textGreen)),
                        ],
                      ))),
              const Spacer(),
              Visibility(
                  visible: !lastPage,
                  child: InkWell(
                      onTap: () {
                        if (!lastPage) {
                          _page++;
                          _queryJobsListBloc.add(LocalQueryJobsEvent(
                              jobsRepo, _page,
                              queryTerm: _term));
                        }
                      },
                      child: Row(
                        children: [
                          Text(Strings.next,
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.museo(
                                  context,
                                  FontSizes.bodyMedium,
                                  FontWeight.w400,
                                  UIColor.textGreen)),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: UIColor.textGreen,
                          )
                        ],
                      )))
            ],
          ),
        ]);
  }
}
