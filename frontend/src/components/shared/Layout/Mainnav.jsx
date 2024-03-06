import React from "react";
import logo from "../../../assets/blood_logo-removebg-preview.png";
import image1 from "../../../assets/OIP.jpeg.jpg";
export const Mainnav = () => {
  return (
    <div>
      <nav className="navbar" style={{ backgroundColor: "#f1f1f1" }}>
        {/* <ToastContainer/> */}
        <div className="container-fluid ">
          <div
            className="navbar-brand"
            style={{ fontFamily: "Franklin Gothic Medium:sans-serif" }}
          >
            <img src={logo} alt="" className="logo" />
            <h4>Blood Chain</h4>
          </div>
          <h4
            style={{
              fontStyle: "italic",
              color: "red",
              // animation: 'blink 1s infinite',  // Apply the blink animation
            }}
          >
            Preserving Life, One Donation at a Time🩸🩸
          </h4>

          <ul className="navbar-nav flex-row">
            <li className="nav-item mx-3">
              <p className="nav-link">
                <a href="https://www.google.com/maps/search/hospitals+near+me/@28.6682818,77.1127373,14.53z?entry=ttu">
                  <button className="btn btn-success" href="">
                    Search Hospitals Nearby
                  </button>
                </a>
                &ensp; &ensp;
                <a
                  href="https://www.google.com/maps/search/hospitals+near+me/@28.6682818,77.1127373,14.53z?entry=ttu"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  <img
                    src={image1}
                    alt=""
                    height="50"
                    width="250"
                    style={{ cursor: "pointer" }}
                  />
                </a>
              </p>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  );
};

export default Mainnav;
