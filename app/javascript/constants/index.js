import ApolloClient from "apollo-client";
import { setContext } from 'apollo-link-context';
import { InMemoryCache } from "apollo-cache-inmemory";
import { ApolloLink } from "apollo-link";
import { HttpLink } from "apollo-link-http"
import { createUploadLink } from "apollo-upload-client"

// dogs
// uri: "https://32ypr38l61.sse.codesandbox.io/"
// Conbase
// uri: "https://48p1r2roz4.sse.codesandbox.io"

const options = {
  uri: "/graphql",
}

// Figure out a way to set token here
const authLink = setContext((_, { headers }) => {
  // get the authentication token from local storage if it exists
  const token = localStorage.getItem('token');
  // return the headers to the context so httpLink can read them
  return {
    headers: {
      ...headers,
      authorization: token ? `Bearer ${token}` : "ieuLG4z_c1NtnUkgPstG",
    }
  }
});

// figure out a way to use batchHttp
// if operation has hasUpload===True, uses first link else second
const httpLink = ApolloLink.split(
  (operation) => operation.getContext().hasUpload,
  createUploadLink(options),
  new HttpLink(options)
)


export  const client = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache()
})