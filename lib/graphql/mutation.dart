String signinMutation() {
  final String mutation = """
      mutation SIGNIN_MUTATION(\$email: String! \$password: String!){
        signin(email: \$email password: \$password){
          token
        }
      }
    """;

  return mutation;
}

String signupMutation() {
  final String mutation = """
      mutation SIGNUP_MUTATION(
        \$email: String! 
        \$name: String!
        \$cell: String!
        \$password: String!
      ){
        signup(
          email: \$email 
          name: \$name
          cell: \$cell
          password: \$password
        ){
          token
        }
      }
    """;

  return mutation;
}