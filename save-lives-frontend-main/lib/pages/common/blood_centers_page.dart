import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/services/blood-center/blood_center_service.dart';
import 'package:savelives/services/utils/validators.dart';

class BloodCentersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BloodCentersPage();
  }
}

class _BloodCentersPage extends State<BloodCentersPage> {
  final _bloodCenterService = BloodCenterService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hemocentros'),
      ),
      body: FutureBuilder(
        future: _bloodCenterService.getAllBloodCenterWithCriticity(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Constants.APP_COLORS.PRIMARY_COLOR,
              ),
            );
          }

          List<UserModel> users = snapshot.data as List<UserModel>;

          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                direction: Axis.horizontal,
                children: List.generate(
                  users.length,
                  (index) {
                    HemocentroModel hemo = users[index] as HemocentroModel;

                    return SizedBox(
                      width: kIsWeb
                          ? MediaQuery.of(context).size.width / 3
                          : MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Card(
                        margin: EdgeInsets.all(10),
                        semanticContainer: true,
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            Modular.to.pushNamed(
                              '/blood-center-detail',
                              arguments: hemo.userid,
                            );
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.bloodtype,
                                color: Utils.getCriticityColorFromList(
                                  hemo.bloodBankList!,
                                ),
                                size: 55,
                              ),
                              SizedBox(
                                child: Text(
                                  hemo.name!,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  hemo.state!,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                    hemo.bloodBankList!.length,
                                    (index) {
                                      return Container(
                                        width: 150,
                                        child: ListTile(
                                          minLeadingWidth: 0,
                                          minVerticalPadding: 0,
                                          visualDensity: VisualDensity.compact,
                                          contentPadding: EdgeInsets.all(0),
                                          leading: Icon(
                                            Icons.water_drop,
                                            color: Utils
                                                .getCriticityColorFromStatus(
                                              hemo.bloodBankList![index]
                                                  .status!,
                                            ),
                                          ),
                                          title: Text(hemo.bloodBankList![index]
                                              .bloodType!),
                                          subtitle: Text(hemo
                                              .bloodBankList![index].status!),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
