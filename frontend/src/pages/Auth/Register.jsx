import React from "react";
import Form from "../../components/shared/Form/Form";
import { useSelector } from "react-redux";
import Spinner from "../../components/shared/Spinner";
import image from "../../assets/healthy-man-donating-his-blood.svg"
import logo from '../../assets/bloodlogo.png'


const Register = () => {
  const { loading, error } = useSelector((state) => state.auth);
  return (
    <>
      {error && <span>{alert(error)}</span>}
      {loading ? (
        <Spinner />
      ) : (
        <div className="reg-container">
          <div className="col-md-8 form-banner ">
          <img src={logo} alt="" className="logo" />
            <img src={image} alt="registerImage" className="login-reg-image"/>
          </div>
          <div className="reg-container">
            <Form
              formTitle={"Register"}
              submitBtn={"Register"}
              formType={"register"}
            />
          </div>

         
        </div>
      
        
      )}


    </>
  );
};

export default Register;