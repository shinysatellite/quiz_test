import Swal from "sweetalert2";

const alertMessage = (type, message) => {
  Swal.fire({
    icon: type,
    text: message
  });
};

export default alertMessage;
