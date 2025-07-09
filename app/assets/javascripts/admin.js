document.addEventListener("DOMContentLoaded", function() {
  // Initialize Bootstrap tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  });

  // Make table rows clickable
  document.querySelectorAll('tr[data-url]').forEach(function(row) {
    row.addEventListener('click', function(e) {
      if (e.target.tagName !== 'A' && e.target.tagName !== 'BUTTON' && !e.target.closest('a, button')) {
        window.location = this.dataset.url;
      }
    });
  });
});