String extractUserName(String email) {
  if (email.isEmpty) {
    return 'Unknown User';
  }
  
  // Split the email by '@' and take the first part
  final parts = email.split('@');
  
  // Return the first part as the username
  return parts[0];
}