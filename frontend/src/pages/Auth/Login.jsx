import React from "react";
import Form from "../../components/shared/Form/Form";
import { useSelector } from "react-redux";
import Spinner from "../../components/shared/Spinner";
import image from "../../assets/healthy-man-donating-his-blood.svg"
import './login-reg.css'
import logo from '../../assets/bloodlogo.png'



const Login = () => {
  const { loading, error } = useSelector((state) => state.auth);
  return (
    <>
      {error && <span>{alert(error)}</span>}
      {loading ? (
        <Spinner />
      ) : (
        <div className="login-container">
          <div className="col-md-8 form-banner">
            <img src={logo} alt="" className="logo" />
            <img src={image} alt="loginImage" className="login-reg-image"/>
          </div>
          <div className="login-form-container">
            <Form
              formTitle={"Login Page"}
              submitBtn={"Login"}
              formType={"login"}
            />
          </div>
        </div>
      )}
    </>
  );
};

export default Login;