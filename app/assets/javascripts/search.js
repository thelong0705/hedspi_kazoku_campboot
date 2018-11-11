var timer, length_str = 100, length_item = 4;

$(document).on('keyup', '.search-form', function() {
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
          $('.results').append('<a href="/companies/' + companies[i].id +
            '"><li style="margin:0; margin-top:20px;"><span class="company-image"><img src="'
            + cover_company(companies[i])
            + '" height="40" width="40"></span><span class="company-name"> '
            + '<ul style="padding-left: 50px; margin-top: -50px;"><li>Name: '
            + companies[i].name.substring(0, length_str)
            +'</li><li><span class="company-name">Code language: '
            + companies[i].code_language.substring(0, length_str)
            +'</li><li><span class="company-name">Address: '
            + companies[i].address.substring(0, length_str)
            +'</li></ul></span></li></a><hr>');
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
