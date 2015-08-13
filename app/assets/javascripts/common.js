function showToggle(targetSelector) {
  $(targetSelector).toggle('show');
};

$('.new-form #experience_current').on('click', function() {
  showToggle('#end-date-container');
});
