import 'package:appjam_29th/presentation/views/match/match_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/component/back_button_appbar.dart';
import '../../../core/utils/component/button.dart';
import '../../../core/utils/theme/color.dart';
import '../../../core/utils/theme/typography.dart';
import '../../provider/match_provider.dart';

class MatchOldPage extends StatelessWidget {
  MatchOldPage({super.key});

  final FixedExtentScrollController controller =
  FixedExtentScrollController(initialItem: 1);

  static const List<String> age = [
    '나이를 선택하세요',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '70',
    '71',
    '72',
    '73',
    '74',
    '75',
    '76',
    '77',
    '78',
    '79',
    '80',
    '81',
    '82',
    '83',
    '84',
    '85',
    '86',
    '87',
    '88',
    '89',
    '90',
    '91',
    '92',
    '93',
    '94',
    '95',
    '96',
    '97',
    '98',
    '99',
    '100',
  ];

  @override
  Widget build(BuildContext context) {
    var matchProvider = context.watch<MatchProvider>();

    void showDialog(Widget child) => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          const BackButtonAppbar(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 136),
                  const Text('나이', style: AppTypography.title1Bold),
                  const Spacer(),
                  AppButton(
                    onTap: matchProvider.getOld != null
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => MatchCategory(),
                        ),
                      );
                    }
                        : () {},
                    text: '다음',
                    color: matchProvider.getOld != null
                        ? AppColor.secondaryNormal
                        : AppColor.secondaryAlternative,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              height: 56,
              width: 349,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.staticWhite,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: AppColor.elevationBlack2,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () => showDialog(
                  CupertinoPicker(
                    scrollController: controller,
                    itemExtent: 32.0,
                    onSelectedItemChanged: (index) {
                      if (index != 0) {
                        matchProvider.setOld(int.parse(age[index]));
                      }
                    },
                    children: List<Widget>.generate(age.length, (index) {
                      return Center(
                        child: Text(
                          age[index],
                          style: TextStyle(
                            fontSize: 22.0,
                            color: index == 0 ? Colors.grey : Colors.black,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                child: Text(
                  matchProvider.getOld != null
                      ? matchProvider.getOld.toString()
                      : '나이를 선택하세요',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}