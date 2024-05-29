import { useAuth0 } from "@auth0/auth0-react";
import { useEffect, useState } from "react";
import axios from "axios";
import { useDispatch, useSelector } from "react-redux";
import { setUser } from "../../../Redux/Slices/UserSlice";
import { RootState } from "../../../Redux/index";

export const useAuth = () => {
  const {
    loginWithRedirect,
    logout,
    isAuthenticated,
    user,
    getAccessTokenSilently,
  } = useAuth0();
  const dispatch = useDispatch();

  const [userCreated, setUserCreated] = useState(false);
  const userData = useSelector((state: RootState) => state.user.user);

  const checkAndCreateUser = async () => {
    if (!isAuthenticated || userCreated) return;

    try {
      const token = await getAccessTokenSilently();
      console.log("Token obtenido:", token);

      const response = await axios.get(
        `${import.meta.env.VITE_ENDPOINT}/user`,
        {
          headers: { Authorization: `Bearer ${token}` },
        }
      );

      const existingUser = response.data.find(
        (u: any) => u.email === user?.email
      );

      const userData = {
        name: user?.name,
        email: user?.email,
        picture: user?.picture,
        password: "default_password",
        typeuser: "USER",
        address: "default_address",
        country: "default_country",
        city: "default_city",
        state: "default_state",
        postalcode: "00000",
      };

      if (!existingUser) {
        const createUserResponse = await axios.post(
          `${import.meta.env.VITE_ENDPOINT}/user`,
          userData,
          {
            headers: { Authorization: `Bearer ${token}` },
          }
        );
        console.log("Usuario creado:", createUserResponse.data);
        dispatch(setUser(createUserResponse.data));
      } else {
        dispatch(setUser(existingUser));
      }

      setUserCreated(true);
    } catch (error) {
      console.error("Error al verificar o crear el usuario:", error);
    }
  };

  useEffect(() => {
    if (isAuthenticated && !userCreated) {
      console.log(
        "Usuario autenticado y no creado. Llamando a checkAndCreateUser."
      );
      checkAndCreateUser();
    }
  }, [isAuthenticated, userCreated, getAccessTokenSilently, user, dispatch]);

  return {
    loginWithRedirect,
    logout,
    isAuthenticated,
    user,
    userCreated,
    getAccessTokenSilently,
    userData,
  };
};

export default useAuth;
