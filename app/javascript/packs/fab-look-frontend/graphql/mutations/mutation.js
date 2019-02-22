import gql from "graphql-tag";

export const CREATE_PROFILE = gql`
  mutation CreateProfile($fullnames: String, $bio: String, $website: String, $occupation: String, $phonenumber: String, $avatar: File ){
    createProfile(
      input: {
        profileDetails: {
          fullnames: $fullnames
          bio: $bio
          website: $website
          occupation: $occupation
          phonenumber: $phonenumber
          avatar: $avatar
        }
      }

    ){
      profile {
        id
        fullnames
        avatar
        bio
        user {
          id
          email

        }
      }
    }
  }`;

