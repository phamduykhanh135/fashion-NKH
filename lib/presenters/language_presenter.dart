
import 'package:sales_application/presenters/language.dart';
import 'package:sales_application/presenters/setting_presenter.dart';


class LanguagePresenter {
  static Language language = Language(SettingPresenter.setting.language);

  static updateLanguage(){
    language = Language(SettingPresenter.setting.language);
  }
}