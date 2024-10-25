import 'package:midterm_project/services/videos.dart';
import 'package:riverpod/riverpod.dart';

final answerServiceProvider = Provider((ref) => VideoService(ref));
