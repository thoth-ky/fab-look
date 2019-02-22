import React, { Component } from 'react';
import { Mutation } from "react-apollo";
import { CREATE_PROFILE } from "../graphql/mutations/mutation";
import { DisplayErrors } from "../common/errorComponent";
import Form from "../common/formComponent";

class ProfileComponent extends Component {
  state = {
    errorMessages: []
   }

  handleFormSubmit = ( props ) => {
    // get data from state
    let { createProfile} = props;
    let { 
      selectedFile,
      fullnames,
      bio,
      website,
      occupation,
      phonenumber,
    } = this.state
    
    createProfile({
      variables: {
        fullnames: fullnames,
        bio: bio,
        website: website,
        occupation: occupation,
        phonenumber: phonenumber,
        avatar: selectedFile
      }
    })
    .then((response)=>{
      alert('success')
      const { data } = response
      this.setState({
        avatar_url: data.createProfile.profile.avatar_url
      })
      // update cache 
    })
    .catch((e)=> {
      let messages = JSON.parse(e.graphQLErrors[0].message)
      this.setState({
        errorMessages : messages.errors
      })
    })
  }

  handleSelectedFile = (event) => {
    this.setState({
      selectedFile: event.target.files[0],
      loaded: 0
    })
  }

  handleChange = (event) => {
    this.setState({
      [event.target.id]: event.target.value
    })
  }

  render() {
    const fields = [
      { type: "text",name:"Full Names", id: "fullnames", value: "", changeCallback: this.handleChange },
      { type: "file",name: "Avatar", id: "avatar", changeCallback: this.handleSelectedFile },
      { type: "textarea", rows: 10, cols: 60, name: "Bio", id: "bio", value: "", changeCallback: this.handleChange },
      { type: "text",name: "Phone Number", id: "phonenumber", value: "", changeCallback: this.handleChange },
      { type: "text",name: "Location", id: "location", value: "", changeCallback: this.handleChange },
      { type: "text",name: "Occupation", id: "occupation", value: "", changeCallback: this.handleChange },
      { type: "text",name: "Website", id: "website", value: "", changeCallback: this.handleChange },    
    ]

    const button = [
      { type: "submit", value: "Submit", class: "btn btn-primary" },
    ]

    const title = "User Profile Update"

    return (
      <Mutation
        mutation={CREATE_PROFILE}
        context={{ hasUpload: true }}
      >
      {(createProfile) => (
        
        <div className="form">
          
          <DisplayErrors errors={this.state.errorMessages}/>
          <Form
            submitCallback={this.handleFormSubmit}
            createProfile={createProfile}
            fields={fields}
            button={button}
            title={title}/>
        </div>
      )}
      </Mutation>
    )
  }
}

export default ProfileComponent;
