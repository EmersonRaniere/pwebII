/**
 * Default JS
 */

$('button.close').click(function(){
	$(this).closest('.alert').fadeOut(1000).remove();
});