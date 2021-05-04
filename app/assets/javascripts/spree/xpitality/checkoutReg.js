const handleToggleForm = () => {
  showLogin();
  showReg();
  handleActiveMethod();
};

const showLogin = () => {
  const form = document.getElementById("login-holder");
  const formReg = document.getElementById("reg-holder");
  const btn = document.getElementById("login_btn_show");
  const btnReg = document.getElementById("reg_btn_show");
  btn.addEventListener("click", () => {
    if (form.clientHeight) {
      form.style.height = 0;
      btn.style.display = "block";
    } else {
      const wrapper = document.querySelector(".measuringWrapper");
      form.style.height = wrapper.clientHeight + "px";
      btn.style.display = "none";
      formReg.style.height = 0;
      btnReg.style.display = "block";
    }
  });
};
const showReg = () => {
  const form = document.getElementById("reg-holder");
  const formLog = document.getElementById("login-holder");
  const btn = document.getElementById("reg_btn_show");
  const btnLog = document.getElementById("login_btn_show");
  btn.addEventListener("click", () => {
    if (form.clientHeight) {
      form.style.height = 0;
      btn.style.display = "block";
    } else {
      const wrapper = document.querySelector(".measuringWrapper");
      form.style.height = wrapper.clientHeight + 70 + "px";
      btn.style.display = "none";
      formLog.style.height = 0;
      btnLog.style.display = "block";
    }
  });
};
const handleActiveMethod = () => {
  const methods = document.querySelectorAll(".show-content-wrapper");
  if (methods) {
    methods.forEach((method, index) => {
      method.addEventListener("click", () => {
        methods.forEach((link) => {
          link.classList.remove("active");
        });
        method.classList.add("active");
        toggleMethods(index);
      });
    });
  }
};
const toggleMethods = (index) => {
  const forms = document.querySelectorAll(".platform_wrapper");
  if (forms) {
    if (index === 0) {
      forms[0].style.height = "auto";
      forms[1].style.height = 0;
      const form = document.getElementById("login-holder");
      const formReg = document.getElementById("reg-holder");
      const btn = document.getElementById("login_btn_show");
      const btnReg = document.getElementById("reg_btn_show");
      if (form.clientHeight) {
        form.style.height = 0;
        btn.style.display = "block";
      } else {
        const wrapper = document.querySelector(".measuringWrapper");
        form.style.height = wrapper.clientHeight + "px";
        btn.style.display = "none";
        formReg.style.height = 0;
        btnReg.style.display = "block";
      }
    } else {
      forms[0].style.height = 0;
      forms[1].style.height = "auto";
      const form = document.getElementById("reg-holder");
      const formLog = document.getElementById("login-holder");
      const btn = document.getElementById("reg_btn_show");
      const btnLog = document.getElementById("login_btn_show");
      if (form.clientHeight) {
        form.style.height = 0;
        btn.style.display = "block";
      } else {
        const wrapper = document.querySelector(".measuringWrapper");
        form.style.height = wrapper.clientHeight + 70 + "px";
        btn.style.display = "none";
        formLog.style.height = 0;
        btnLog.style.display = "block";
      }
    }
  }
};
