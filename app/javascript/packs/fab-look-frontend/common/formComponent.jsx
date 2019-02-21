import React, { Component } from 'react';

class Form extends Component {
  constructor(props) {
    super(props);
    this.state = { 
      fields: this.props.fields
     }
  }

  inputField = (formField) => {
    let { field } = formField
    return(
      <div className="fieldGroup">
        <label htmlFor={field.id}> {field.name} </label>
        <input
          type={field.type}
          className={field.class}
          id={field.id}
          onChange={field.changeCallback}
          rows={field.rows}
          cols={field.cols}
          />
      </div>
    )
  }

  buttonField = () => {
    const { button } = this.props
    console.log(button)
    return (
      <div className="fieldGroup">
        <button type={button[0].type} className={button[0].class} >
          {button[0].value}
        </button>
      </div>
    )
  }
  inputFields = () => {
    let { fields } = this.state
    let fieldsNode = fields.map((field, index) => (
      <this.inputField field={field} key={index}/>
    ))
    return fieldsNode
  }

  render() { 
    let { submitCallback } = this.props
    return ( 
        <form onSubmit={submitCallback}>
          <this.inputFields />
          <this.buttonField />
        </form>
      
     );
  }
}
 
export default Form; 

