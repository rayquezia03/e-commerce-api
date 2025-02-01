// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "controllers"
import "@hotwired/turbo-rails"
import Rails from '@rails/ujs';
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Rails from 'rails-ujs'
Rails.start()
//= require rails-ujs

Rails.start();
Turbolinks.start()
ActiveStorage.start()

//= require select2
$(document).ready(function() {
    $('.filter-select').select2();
  });
  
  document.addEventListener("DOMContentLoaded", function() {
    // Manipula a resposta do formulário de atualização
    $(document).on("ajax:success", "form", function(event, data) {
      // Verifica se a resposta contém sucesso
      if (data.success) {
        alert(data.message); // Exibe a mensagem de sucesso
      } else {
        alert(data.message); // Exibe a mensagem de erro
      }
    });
  
    // Caso ocorra algum erro na requisição
    $(document).on("ajax:error", "form", function(event) {
      alert("Erro ao atualizar a quantidade. Tente novamente.");
    });
});