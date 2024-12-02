import 'package:mastermind_finals/service/answerservice.dart';
import 'package:mastermind_finals/service/playerservice.dart';
import 'package:riverpod/riverpod.dart';

final answerServiceProvider = Provider((ref) => AnswerService(ref));
final playerServiceProvider = Provider((ref) => PlayerService(ref));
