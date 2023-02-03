import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/pages/auth/login_page.dart';
import 'package:savelives/pages/auth/signup_page.dart';
import 'package:savelives/pages/authenticated/blood_center/insert_blood_criticity_page.dart';
import 'package:savelives/pages/authenticated/blood_center/insert_datetime_page.dart';
import 'package:savelives/pages/authenticated/common/completed_schedules_page.dart';
import 'package:savelives/pages/authenticated/common/december_page.dart';
import 'package:savelives/pages/authenticated/common/pending_schedules_page.dart';
import 'package:savelives/pages/authenticated/common/profile_page.dart';
import 'package:savelives/pages/authenticated/common/schedule_detail_page.dart';
import 'package:savelives/pages/authenticated/common/schedule_page.dart';
import 'package:savelives/pages/authenticated/donor/home_donor.dart';
import 'package:savelives/pages/authenticated/home_page.dart';
import 'package:savelives/pages/common/blood_center_detail_page.dart';
import 'package:savelives/pages/common/blood_centers_page.dart';
import 'package:savelives/pages/common/not_found_page.dart';
import 'package:savelives/pages/home.dart';
import 'package:savelives/pages/questions/questions.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/repositories/images_repository.dart';
import 'package:savelives/repositories/questions_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ImagesRepository(),
        ),
        Bind(
          (i) => QuestionRepository(),
        ),
        Bind(
          (i) => AuthRepository(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        WildcardRoute(
          child: (context, args) => NotFoundPage(),
        ),
        ChildRoute(
          '/',
          child: (context, args) => MapsPage(),
        ),
        ChildRoute(
          '/login',
          child: (context, args) => LoginPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/signup',
          child: (context, args) => SignUpPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/blood-centers',
          child: (context, args) => BloodCentersPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/blood-center-detail',
          child: (context, args) =>
              BloodCenterDetailPage(bloodCenterId: args.data),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/questions',
          child: (context, args) => const QuestionsPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/home',
          child: (context, args) => HomePage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/home-donor',
          child: (context, args) => HomeDonor(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/december-page',
          child: (context, args) => DecemberPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/profile-page',
          child: (context, args) => ProfilePage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/insert-daytime',
          child: (context, args) => InsertDayTimePage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/pending-schedule',
          child: (context, args) => PendingSchedulesPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/schedule-completed',
          child: (context, args) => HistoryPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/schedule',
          child: (context, args) => SchedulePage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/criticity',
          child: (context, args) => InsertBloodCriticityPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/schedule-detail',
          child: (context, args) =>
              ScheduleDetailPage(schedulesModel: args.data),
          transition: TransitionType.fadeIn,
        ),
      ];
}
