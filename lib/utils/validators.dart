String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return "Name is required";
  }
  if (value.trim().length < 2) {
    return "Name too short";
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email is required";
  }
  if (!value.contains('@')) {
    return "Invalid email";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }
  if (value.length < 6) {
    return "Password too short";
  }
  return null;
}

String? validateConfirmPassword(String? value, String original) {
  if (value == null || value.isEmpty) {
    return "Confirm password";
  }
  if (value != original) {
    return "Passwords don't match";
  }
  return null;
}
