// LINKAGEM DOS BOTÕES COM A BOLHA DE CHAT

const chatbotToggler = document.querySelector(".chatbot-toggler");
const chatbotToggler2 = document.querySelector(".btn-chat");
const chatbotCloseBtn = document.querySelector(".close-btn");



chatbotToggler.addEventListener("click", () => document.body.classList.toggle("show-chatbot"));
chatbotToggler2.addEventListener("click", () => document.body.classList.toggle("show-chatbot"));
chatbotCloseBtn.addEventListener("click", () => document.body.classList.remove("show-chatbot"));