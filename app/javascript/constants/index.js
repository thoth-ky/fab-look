import ApolloClient from "apollo-boost";
import { InMemoryCache } from "apollo-cache-inmemory";
import { ApolloLink } from "apollo-link";
import { BatchHttpLink } from "apollo-link-batch-http"
import { createUploadLink } from "apollo-upload-client"

// dogs
// uri: "https://32ypr38l61.sse.codesandbox.io/"
// Conbase
// uri: "https://48p1r2roz4.sse.codesandbox.io"

const options = {
  uri: "http://localhost:3000/graphql",
  credentials: "include"
}

const httpLink = ApolloLink.split(
  operation => operation.getContext().hasUpload,
  createUploadLink(options),
  new BatchHttpLink(options)
)

export  const client = new ApolloClient({
  uri: '/graphql',
  cache: new InMemoryCache()
})