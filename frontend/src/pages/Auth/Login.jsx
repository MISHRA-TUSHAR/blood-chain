import React from "react";
import Form from "../../components/shared/Form/Form";
import { useSelector } from "react-redux";
import image from "../../assets/healthy-man-donating-his-blood.svg";
import './login-reg.css'
import Spinner from "../../components/shared/Spinner";
import Mainnav from "../../components/shared/Layout/Mainnav";
const Login = () => {
  const { loading, error } = useSelector((state) => state.auth);
  
  return (
    <>
    
      <Mainnav/>
      {error && <span>{alert(error)}</span>}
      {loading ? (
        <Spinner/>
      ) : (
        <div className="login-reg-container">
          <div className="col-md-8 form-banner">
            <img src={image} alt="age2" className="imageback"  />
          </div>
          <div className="#">
            <Form
              formTitle={"Login"}
              submitBtn={"Login"}
              formType={"login"}
            />
            <br />
            <center>
            <button className="btn btn-success">VALIDATE WITH PAN CARD/VOTER ID</button>
            </center>
          </div>
        </div>
        
      )}
       <footer style={{backgroundColor:'#f5f5f5'}}>
            <center>
            <h4>Made with 💖 by Pizza Hunters🍕</h4>
            </center>
          </footer>
    </>
  );
};

export default Login;