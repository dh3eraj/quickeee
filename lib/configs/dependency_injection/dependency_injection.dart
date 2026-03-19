import 'package:get_it/get_it.dart';
import 'package:quickeee/features/flash_drop/presentation/bloc/luxury_flash_drop_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*
    >>> Splash
  */
  // sl.registerLazySingleton(
  //   () => SplashRemoteClient(sl<Dio>(), baseUrl: CoreApis.baseUrl),
  // );
  // sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(sl()));
  // sl.registerLazySingleton(() => GetAppConfigUsecase(sl()));
  sl.registerFactory(() => LuxuryFlashDropCubit());
  /*
    <<< Splash
  */
}
