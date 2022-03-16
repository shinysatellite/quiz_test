import axios from "axios";
import Swal from "sweetalert2";
import router from "../router/index";

axios.defaults.baseURL = process.env.MIX_SPA_URL;
axios.defaults.withCredentials = true;

// Response interceptor
axios.interceptors.response.use(
  response => {
    return response;
  },
  error => {
    const { status } = error.response;

    if (status >= 500) {
      Swal.fire({
        icon: "error",
        title: "Internal Server Error",
        text: error.response.data.message
      });
    }

    if (status === 401) {
      Swal.fire({
        icon: "error",
        title: "Authentication Error",
        text: "You don't have permission for this operation"
      });

      router.push({ name: "login" });
    }

    if (status === 422) {
      Swal.fire({
        icon: "error",
        title: "422 Error",
        text: error.response.data.message
      });
    }

    return Promise.reject(error);
  }
);

window.axios = axios;
