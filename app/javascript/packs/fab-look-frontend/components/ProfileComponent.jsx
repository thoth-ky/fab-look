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
    
    console.log('fullname>>', fullnames)
    createProfile({
      variables: {
        fullnames: fullnames,
        bio: bio,
        website: website,
        occupation: occupation,
        phonenumber: phonenumber,
      }
    })
    .then((data)=>{
      alert('success')
      // update cache 
    })
    .catch((e)=> {
      // debugger
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
    return (
        <Form submitCallback={this.handleFormSubmit} fields={fields} button={button}/>
    )
    return (
      <Mutation mutation={CREATE_PROFILE}>
      {(createProfile) => (
        
        <div className="form">
          <h3>User Profile</h3>
          <DisplayErrors errors={this.state.errorMessages}/>
          <form onSubmit={ e => {
            e.preventDefault()
            this.handleFormSubmit({ createProfile}) 
            }
          } id="user-profile-form">
          <div className="fieldGroup">
                <label htmlFor="fullnames"> Full Names: </label>
                <input type="text" field="fullnames" id="fullnames" onChange={this.handleChange}/>
              </div>

              <div className="fieldGroup">
                <label htmlFor="avatar"> Avatar: </label>
                <input type="file" field="avatar" id="avatar" onChange={this.handleSelectedFile}/>
              </div>

              <div className="fieldGroup">
                <label htmlFor="bio"> Bio: </label>
                <textarea field="bio" id="bio" cols="60" rows="10" onChange={this.handleChange}/>
              </div>

              <div className="fieldGroup">
                <label htmlFor="phonenumber"> Phone Number: </label>
                <input type="text" field="phonenumber" id="phonenumber" onChange={this.handleChange}/>
              </div>

              <div className="fieldGroup">
                <label htmlFor="occupation"> Occupation: </label>
                <input type="text" field="occupation" id="occupation" onChange={this.handleChange}/>
              </div>

              <div className="fieldGroup">
                <label htmlFor="website"> Website: </label>
                <input type="text" field="website" id="website" onChange={this.handleChange}/>
              </div>
              
              <div className="fieldGroup">
                <button type="submit" className="btn btn-primary">
                  SUBMIT
                </button>
              </div>

          </form>
        </div>
      )}
      </Mutation>
    )
  }
}

export default ProfileComponent;
