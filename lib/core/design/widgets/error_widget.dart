import 'package:tmdb/core/design/widgets/snack_bar.dart';

handleException(Object e, Function? onError, {stack}) async {
  if (onError != null) {
    onError(e);
    return;
  }

  showSnackBarMessage(message: e.toString(), type: SnackBarTypeEnum.error);
  throw e;
}
