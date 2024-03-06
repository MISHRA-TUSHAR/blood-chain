import React from "react";
import {  BiUserCircle } from "react-icons/bi";
import { useNavigate, useLocation, Link } from "react-router-dom";
import { useSelector } from "react-redux";
import logo from "../../../assets/blood_logo-removebg-preview.png";
import "./Header.css";
import { ToastContainer, toast } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';

const Header = () => {
  const { user } = useSelector((state) => state.auth);
  const navigate = useNavigate();
  const location = useLocation();
  // logout handler
  const handleLogout = () => {
    toast.success("Logout Successfully");
    localStorage.clear();
    navigate("/login");
  };

  return (
    <>
      <nav className="navbar" style={{backgroundColor:'#f1f1f1'}}>
    <ToastContainer/>
        <div className="container-fluid ">
          <div className="navbar-brand">
            <img src={logo} alt="" className="logo" /> Blood Chain
          </div>
          <ul className="navbar-nav flex-row">
          <li className="nav-item mx-3">
          <p className="nav-link">
            {/* <div> */}
            <a href="https://github.com/MISHRA-TUSHAR/blood-chain" target="_blank" rel="noopener noreferrer">
  <i className="fab fa-github" style={{ height: '1.5rem', width: '1.5rem' }}></i>
</a>

              &ensp;
            {/* </div> */}
            <BiUserCircle /> Welcome{" "}
            
            {user?.name || user?.hospitalName || user?.organisationName}
            &nbsp;
            <span className="badge bg-secondary"><h6>{user?.role}</h6></span>
          </p>
        </li>
            {location.pathname === "/" ||
            location.pathname === "/donar" ||
            location.pathname === "/hospital" ? (
              <li className="nav-item mx-3">
                <Link to="/analytics" className="nav-link btn btn-secondary">
                  <h5>Analytics</h5>
                </Link>
              </li>
            ) : (
              <li className="nav-item mx-3">
                <Link to="/" className="nav-link">
                  <h4>Home</h4>
                </Link>
              </li>
            )}
            <li className="nav-item mx-3">
              <button className="btn btn-danger" onClick={handleLogout}>
                Logout

              </button>
            
            </li>
          </ul>
        </div>
      </nav>
    </>
  );
};

export default Header;