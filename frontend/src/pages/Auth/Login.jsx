import React from "react";
import Form from "../../components/shared/Form/Form";
import { useSelector } from "react-redux";
import Spinner from "../../components/shared/Spinner";
import image from "../../assets/healthy-man-donating-his-blood.svg";
import './login-reg.css'

const Login = () => {
  const { loading, error } = useSelector((state) => state.auth);
  return (
    <>
      {error && <span>{alert(error)}</span>}
      {loading ? (
        <Spinner />
      ) : (
        <div className="login-reg-container">
          <div className="col-md-8 form-banner">
            <img src={image} alt="age2" className="imageback" />
          </div>
          <div className="#">
            <Form
              formTitle={"Login Page"}
              submitBtn={"Login"}
              formType={"login"}
            />
            <br />
            <br />
            <button>VALIDATE WITH PAN CARD/VOTER ID</button>
          </div>
        </div>
      )}
    </>
  );
};

export default Login;