var timer, length_str = 100, length_item = 4;


$(document).on('keyup', '.search-form', function() {
  if ($('#search').val().length > 0){
    $( ".results" ).show();
  }else{
    $( ".results" ).hide();
  }
  clearTimeout(timer);
  timer = setTimeout(function () {
    var search = $('.search-form').val();
    $.ajax({
      url: '/companies/search?search=' + search,
      context: document.body,
      dataType: 'json'
    }).done(function(data) {
      $('.results').empty();
      var companies = data.results;
      if(companies.length) {
        for (i = 0; i < companies.length; i++) {
          $('.results').append(`
            <a href = "/companies/${companies[i].id}" class="media">
              <div>
              <img class="mr-3" src="${cover_company(companies[i])}" width="80" height="auto">
              </div>
              <div class="media-body">
                <h5 class="mt-0 mb-1">${companies[i].name.substring(0, length_str)}</h5>
                  Programming language: ${companies[i].code_language.substring(0, length_str)}
              </div>
            </a>
          `)
          if (i != companies.length - 1){
            $('.results').append(`<hr>`);
          }
          if(i == length_item) {
            $('.results').append('<a href="/companies/search?search=' + search + '"><li><p>View more</p></li></a>');
            break;
          }
        }
      }
    });
  }, 100);
});

function cover_company(company) {
  if(company.picture.url != null) {
    return company.picture.url;
  } else {
    return '../../assets/cover_company.jpg';
  }
}
