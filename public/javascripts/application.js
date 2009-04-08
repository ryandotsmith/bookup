$(document).ready( function() {
	$("#session_bar").corners('10px');
	$("#waiting_divs").corners('10px');
	$("#books_index_table").tablesorter({ widgets: ['zebra']});
	$("#show_book_listings_table").tablesorter();
	$("#average_book_price").corners('10px')
	$("#flash_notice").corners()
	$("#flash_failure").corners()
	$("#flash_success").corners()
	$(".formError").corners()
})//document
