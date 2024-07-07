import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/widgets/image_with_text.dart';

class WorkWithUsWidget extends StatelessWidget {
  const WorkWithUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
              height: 259,
              width: 360,
              child: ImageWithTextWidget(
                  'assets/images/work_with_us.png', Strings.workWithUs)),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
              width: 328,
              child: Center(
                  child: Text(
                Strings.lorem,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: FontSizes.bodySmall,
                      fontFamily: 'Museo Sans',
                      fontWeight: FontWeight.w400,
                      color: UIColor.textBlack,
                    ),
              ))),
          const SizedBox(
              height: 45, //24 top + 24bottom + 1
              width: 360,
              child: Divider(color: UIColor.dividerGray)),
          InkWell(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(Strings.openJobs,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: FontSizes.bodyMedium,
                        fontFamily: 'Museo Sans',
                        fontWeight: FontWeight.w400,
                        color: UIColor.textGreen,
                      )),
              const Icon(
                Icons.keyboard_arrow_right,
                color: UIColor.textGreen,
              )
            ]),
            onTap: () {
              //TODO - add onClick
            },
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
