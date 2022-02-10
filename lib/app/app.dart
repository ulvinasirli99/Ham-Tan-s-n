import 'package:everyone_know_app/domain/repository/create_user.repo.dart';
import 'package:everyone_know_app/domain/repository/usecr_all_data.repo.dart';
import 'package:everyone_know_app/domain/repository/user_profile_upload.repo.dart';
import 'package:everyone_know_app/domain/state/create_status_cubit/create_status_cubit.dart';
import 'package:everyone_know_app/domain/state/navigation_cubit/navigation_cubit_cubit.dart';
import 'package:everyone_know_app/domain/state/profile_img_upload_cubit/user_profile_upload_cubit.dart';
import 'package:everyone_know_app/domain/state/user_profile_data_cubit/user_profil_data_cubit_cubit.dart';
import 'package:everyone_know_app/screen/home/addStatus_screen.dart';
import 'package:everyone_know_app/screen/profile/profile_screen.dart';
import 'package:everyone_know_app/screen/splash/splash_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  var repo = UserProfileUploadRepository();
  var userAllRepo = UserAllDataRepository();
  var statusRepository = CreateUserRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubitCubit>(
          create: (context) => NavigationCubitCubit(),
        ),
        BlocProvider<UserProfileUploadCubit>(
          create: (context) => UserProfileUploadCubit(repo),
        ),
        BlocProvider<UserProfilDataCubit>(
          create: (context) => UserProfilDataCubit(userAllRepo),
        ),
        BlocProvider<CreateStatusCubit>(
          create: (context) => CreateStatusCubit(statusRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProfileScreen(),
      ),
    );
  }
}
