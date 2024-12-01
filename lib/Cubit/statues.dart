import 'package:islamic_app/models/hadith_model.dart';
import 'package:islamic_app/models/readio_model.dart';

abstract class AppStates {}
class InitialState extends AppStates {}
class ChangeScreenState extends AppStates {}
class ChangeNumberOfTasbeehBadgeState extends AppStates {}
class ResetNumberOfTasbeehBadgeState extends AppStates {}
class ChangeTasbeehValueState extends AppStates {}
class ChangeModeState extends AppStates {}
class ChangeLanguageState extends AppStates {}
class LoadingRadioState extends AppStates{}
class SuccessRadioState extends AppStates{
  final List<RadioModel> value;
  SuccessRadioState(this.value);
}
class FailedRadioState extends AppStates{
  final String error;
  FailedRadioState({required this.error});

}
class ChangeRadioChannelState extends AppStates {}
class LoadingReadFileState extends AppStates{}
class SuccessReadFileState extends AppStates{
  final String value;
  SuccessReadFileState(this.value);
}
class FailedReadFileState extends AppStates{
  final String error;
  FailedReadFileState({required this.error});

}
class LoadingGetMoshafDataState extends AppStates{}
class SuccessGetMoshafDataState extends AppStates{
  final String value;
  SuccessGetMoshafDataState(this.value);
}
class FailedGetMoshafDataState extends AppStates{
  final String error;
  FailedGetMoshafDataState({required this.error});

}
class LoadingGetHadithDataState extends AppStates{}
class SuccessGetHadithDataState extends AppStates{
  final List<HadithModel> value;
  SuccessGetHadithDataState(this.value);
}
class FailedGetHadithDataState extends AppStates{
  final String error;
  FailedGetHadithDataState({required this.error});

}
class ChangeBottomSheetState extends AppStates{}

