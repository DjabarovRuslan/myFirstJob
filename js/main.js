//$(function(){
//Живой поиск
$(document).ready(function() {
    $("#complete").bind(" keyup ", function() {
        if (this.value.length >= 1) {
            $.ajax({
                type: 'post',
                url: path + "search",
                data: { 'search_q': this.value },
                response: 'text',
                success: function(data) {
                    $(".search_result").html(data).fadeIn(); //Выводим полученые данные в списке
                }
            })
        }
    });

    $(".search_result").on("click", "li", function() {

        s_user = $(this).text();
        //  window.location = path +'one-product'+'?alias='+ encodeURIComponent(s_user);
        window.location = path + 'search?search_q=' + encodeURIComponent(s_user);

        // s_user = $(this).text();
        //console.log(s_user);
        //$(".who").val(s_user).attr('disabled', 'disabled'); //деактивируем input, если нужно
        // $(".search_result").fadeOut();
    });

    // при клике вне выпадающего списка поиска скрывает список
    $(document).click(function(event) {
        if ($(event.target).closest(".search_result").length) return;
        $(".search_result").html("").hide("slow");
        event.stopPropagation();
    });

    $('.catalog').dcAccordion();

   
/*при нажатии добавить  в корзину показывал кол - во товаров в 
корзине (на любой странице),не входим пока в корзину*/
    $(".add-to-cart").click(function() {
        var idForCart = $(this).attr("data-id");
        $.ajax({
            type: 'post',
            url: path ,
            data: { idForCart: idForCart },
           // response: 'text',
            success: function(data) {
                $("#cart-count").html(data); //Выводим полученые данные в списке
            }
        })
    });
//нажатие на "очистить корзину"

      $(".clear-cart").click(function() {
        var clearCart = 'clearCart';
        $.ajax({
            type: 'post',
            url: path ,
            data: { clearCart: 'clearCart' },
           

        })
    });

    //ниже: регистрация 
  //url: path!!path  константа для js(путь) объявлена в <script> view_footer.php 
   $(".access").change(function(){
        var $this = $(this);
        var val = $.trim($this.val());
        var dataField = $this.attr('data-field');
        var span = $this.next();//для значков(крестик ,галочка...)

        span.removeClass();
        if(val == ''){
            span.addClass('reg-cross');
            span.next().text('Заполните поле');
        }else{
            span.addClass('reg-loader');
            $.ajax({
                url: path + 'registration',
                type: 'POST',
                data: {val: val, dataField: dataField},
                success: function(res){
                    var result = JSON.parse(res);
                   // console.log(result);
                    span.removeClass();
    //2 раза .next() означает след -ий span после значков крестик ,галочка ..
                    span.next().text('');
                    if( result.answer == 'no' ){
                        span.addClass('reg-cross');
                        span.next().text(result.info);
                    }else{
                        span.addClass('reg-check');
                    }
                }
            });
        }
    });
  //кнопка забыл пароль
  $('#forgot-link').click(function(){
        $('#auth').fadeOut(300, function(){
            $('#forgot').fadeIn();
        });
        return false;
    });
});