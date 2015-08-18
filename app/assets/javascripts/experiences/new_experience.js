$( '.new-form' ).submit(function( event ) {
  if ($('#current_experience-container input[type=checkbox')[0].value == 1) {
    $('#end-date-container').remove();
  };
});
