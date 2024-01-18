import { Application } from '@hotwired/stimulus';
//= require flatpickr

// document.addEventListener('DOMContentLoaded', function () {
//   flatpickr('.date_trigger');
// });

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
