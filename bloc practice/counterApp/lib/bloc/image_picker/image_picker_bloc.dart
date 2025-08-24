import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/image_picker/image_picker_event.dart';
import 'package:counter_app/bloc/image_picker/image_picker_states.dart';
import 'package:counter_app/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerStates()) {
    on<CameraCapture>(cameraCapture);
  }

  Future<void> cameraCapture(CameraCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
