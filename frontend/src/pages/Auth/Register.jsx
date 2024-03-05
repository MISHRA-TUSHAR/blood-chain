import React from "react";
import Form from "../../components/shared/Form/Form";
import { useSelector } from "react-redux";
import Spinner from "../../components/shared/Spinner";
import image from "../../assets/healthy-man-donating-his-blood.svg";
import './login-reg.css'

const Register = () => {
  const { loading, error } = useSelector((state) => state.auth);
  return (
    <>
      {error && <span>{alert(error)}</span>}
      {loading ? (
        <Spinner />
      ) : (
        <div className="login-reg-container">
          <div className="col-md-8 form-banner ">
            <img src={image} alt="age1" className="imageback" />
          </div>
          <div className="#">
            <Form
              formTitle={"Register"}
              submitBtn={"Register"}
              formType={"register"}
            />
            <br />
          <button className="btn btn-success">Validate with Aadhar/Pan Card</button>
          </div>
        
        </div>
      )}
    </>
  );
};

export default Register;