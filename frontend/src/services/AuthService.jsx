import { toast} from "react-toastify";
import { userLogin, userRegister } from "../redux/features/Auth/authActions";
import store from "../redux/store";
import 'react-toastify/dist/ReactToastify.css';
export const handleLogin = async(e, email, password, role) => {
  e.preventDefault();
  try {
    if (!role || !email || !password) {
       toast.error("Please fill all fields");
    }
    toast.success('Login successful');
    store.dispatch(userLogin({ email, password, role }));
  } catch (error) {
    console.log(error);
  }
};

export const handleRegister =async(
  e,
  name,
  role,
  email,
  password,
  phone,
  organisationName,
  address,
  hospitalName,
  website
) => {
  e.preventDefault();
  try {
    store.dispatch(
      userRegister({
        name,
        role,
        email,
        password,
        phone,
        organisationName,
        address,
        hospitalName,
        website,
      })
    );
  } catch (error) {
    console.log(error);
  }
};