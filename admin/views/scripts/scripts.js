$(function(){
	// описание в инфо.txt
//ниже :подкл редактор ckeditor на странице view_edit_product.php( <textarea>..) 
	$( 'textarea.editor' ).ckeditor();

	  $('#autocomplete').autocomplete({
		source: path + 'search_admin/',
		minLength: 1,
		select: function( event, ui ){
			window.location = path + 'search/?search=' + encodeURIComponent(ui.item.value);
			//encodeURIComponent (исп- ся при составлении url(см.док JS))
		}
	});

	//выше:у меня отличается от автора(я игнор не нужные для меня фишки в "поиск")
	// ниже :highlight(подсветка найденного в поиске)
	if(search != ''){
		$('.product h1').highlight(search);
	}
	// конец  highlight

	$('.catalog').dcAccordion();
	$('.cross-times').on('click', function(){
		$('#mes-edit').hide();
		$('#mes-edit .responce').empty();
	});
     
   
	$('.edit').each(function(){
		$(this).change(function(){
			var val = $(this).val();
			var title = $(this).attr('name');
			var url = $(this).parents('.zebra').data('table');			
			updateField(val, title, url);
		});
	});
	//ниже:исп. для изм. настроек(view_category.php)
	$('.edit-price').change(function(){
		var val = $(this).val(),
			id = $(this).data('id'),
			url = $(this).parents('.zebra').data('table');
		updateField(val, id, url);
	});
	//ниже:.del - крестик !!удаление товара из админки 
	$('.del').on('click', function(){
		var id = $(this).data('id'),
			parent = $(this).closest('tr'),
			url = $(this).parents('.zebra').data('table');
		deleteRow(id, parent, url);
	});


	function deleteRow(id, parent, url){
		var res = confirm('Подтвердите удаление');
		if(!res) return false;

		
		$.ajax({
			url: path + url,
			type: 'GET',
			data: {id: id},
			beforeSend : function(){
				$('#loader').fadeIn();
			},
			success: function(res){
				var answer;
				if(res == 'OK'){
					answer = 'Удалено';
				}else{
					answer = 'Ошибка удаления';
				}
				$('#mes-edit .responce').text(answer);
				$('#mes-edit').delay(500).fadeIn(1000, function(){
	//ниже :скрываем строку (после перезагрузки удалится сама изза удал товара в БД)
					if(res == 'OK') parent.hide();
				});
			},
			error: function(){
				alert('Ошибка!');
			},
			complete: function(){
				$('#loader').delay(500).fadeOut();
			}
		});
	}


	function updateField(val, title, url){
		if( !url ) url = '';
		$.ajax({
			url: path + url,
			type: 'GET',
			data: {val: val, title: title},
			beforeSend : function(){
				$('#loader').fadeIn();
			},
			success: function(res){
				$('#mes-edit .responce').text(res);
				$('#mes-edit').delay(500).fadeIn(1000);
			},
			error: function(){
				alert('Ошибка!');
			},
			complete: function(){
				$('#loader').delay(500).fadeOut();
			}
		});
	}
//ниже для загрузки картинок(см.инфо)
	
	var myDropzone = new Dropzone('div#upload', {
	    paramName: "file",
        url: path + "upload",
        maxFiles: 1,
        acceptedFiles: '.jpg, .gif, .png, .svg',
        success: function (file, responce) {
            /*console.log(file);
            console.log(responce);*/
            var url = file.dataURL,
                res = JSON.parse(responce);
            if(res.answer == 'error') {
                //this.defaultOptions.error(file, res.error);
                this.removeFile(file);
                alert(res.error);
            }else{
                this.defaultOptions.success(file);
                //this.removeFile(file);
                //$('.preview').append('<img src="' + url + '" width="120">');
            }
        },
        init: function(){
            $(this.element).html(this.options.dictDefaultMessage);
        },
        processing: function()
        {
            $('.dz-message').remove();
        },
        dictDefaultMessage: '<div class="dz-message">Нажмите здесь или перетащите сюда файлы для загрузки</div>',
        dictMaxFilesExceeded: 'Достигнут лимит загрузки файлов - разрешено {{maxFiles}}'
    });

});
	