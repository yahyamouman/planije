/**
 * 
 */

$(document).on("click", ".open-editTask", function (e) {

	e.preventDefault();

	var _self = $(this);

	var taskId = _self.data('id');
	$("#taskId").val(taskId);

	$(_self.attr('href')).modal('show');
});