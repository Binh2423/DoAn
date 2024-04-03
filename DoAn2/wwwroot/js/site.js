// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function checkPasswordMatch(input) {
    var passwordInput = document.getElementById('password');
    var confirmPasswordInput = input;
    if (passwordInput.value !== confirmPasswordInput.value) {
        confirmPasswordInput.setCustomValidity('Mật khẩu không khớp');
    } else {
        confirmPasswordInput.setCustomValidity('');
    }
}