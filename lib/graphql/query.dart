String userQuery() {
  final String query = """
    query USER_QUERY(\$token: String!){
      user(token: \$token){
        id
        name
        email
        roles
      }
    }
  """;

  return query;
}