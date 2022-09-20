bool isValidResult(
    {required Map<String, dynamic>? result, required String keyValue}) {
  if (result != null && result.containsKey(keyValue) && result[keyValue]) {
    return true;
  } else {
    return false;
  }
}
