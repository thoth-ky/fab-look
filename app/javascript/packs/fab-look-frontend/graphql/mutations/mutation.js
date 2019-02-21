import gql from "graphql-tag";

// export const CREATE_PROFILE = gql`
//   mutation CreateProfile($fullnames: String!, $bio: String!, $website: String!){
//     createProfile(fullnames: $fullnames, bio: $bio, website: $website){
//       id
//       fullnames
//       bio
//       website
//       occupation
//     }
//   }
// `;
// website: website,
//         occupation: occupation,
//         phonenumber: phonenumber,

export const CREATE_PROFILE = gql`
  mutation CreateProfile($fullnames: String, $bio: String, $website: String, $occupation: String, $phonenumber: String){
    createProfile(
      input: {
        profileDetails: {
          fullnames: $fullnames
          bio: $bio
          website: $website
          occupation: $occupation
          phonenumber: $phonenumber
        }
      }

    ){
      profile {
        id
        fullnames
        user {
          id
          email

        }
      }
    }
  }`;

