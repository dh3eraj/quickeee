import 'package:get_it/get_it.dart';
import 'package:quickeee/features/flash_drop/data/datasources/local/flash_drop_local_client.dart';
import 'package:quickeee/features/flash_drop/data/repository/flash_drop_repository_impl.dart';
import 'package:quickeee/features/flash_drop/domain/repository/flash_drop_repository.dart';
import 'package:quickeee/features/flash_drop/domain/usecases/load_watch_data_usecase.dart';
import 'package:quickeee/features/flash_drop/presentation/bloc/flash_drop_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*
    >>> Flash Drop
  */
  sl.registerLazySingleton(() => FlashDropLocalClient());
  sl.registerLazySingleton<FlashDropRepository>(
    () => FlashDropRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => LoadWatchDataUsecase(sl()));
  sl.registerFactory(() => FlashDropCubit(sl()));
  /*
    <<< Flash Drop
  */
}
