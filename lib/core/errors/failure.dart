abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ReadFailure extends Failure {
  ReadFailure({required super.errorMessage});
}

class WriteFailure extends Failure {
  WriteFailure({required super.errorMessage});
}

class UpdateFailure extends Failure {
  UpdateFailure({required super.errorMessage});
}

class DeleteFailure extends Failure {
  DeleteFailure({required super.errorMessage});
}
