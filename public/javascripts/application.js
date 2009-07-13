$(document).ready( function() {
	$("#average_book_price").corners('10px')
	$("#flash_success, #flash_failure, #flash_notice").corners('top 10px')
	$(".formError").corners();
	$("#tag_list li").corners('10px');
	$("#show_tags_link").corners('bottom 10px');
	$('#average_price_text, #book_list_text').corners();
	// Books#edit 
		$('input.autocomplete').each(function(){
	    var input = $(this);
	      input.autocomplete(input.attr('autocomplete_url'),{
	      //matchContains:1,//also match inside of strings when caching
	    	//mustMatch:1,//allow only values from the list
	    	//selectFirst:1,//select the first item on tab/enter
	      //removeInitialValue:0//when first applying $.autocomplete
	    });
		}); 
  
})//document
