$(document).ready(function(){
    $('#Delete').click(function(event) {
        event.preventDefault();
        var currentForm = $(this).closest('form');
        
        /** Create div element for delete confirmation dialog*/
        var dynamicDialog = $('<div id="conformBox">'+
        '<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;">'+
        '</span>Are you sure to delete the item?</div>');
        
        dynamicDialog.dialog({
                title : "Are you sure?",
                closeOnEscape: true,
                modal : true,
        
               buttons : 
                        [{
                                text : "Yes",
                                click : function() {
                                        $(this).dialog("close");
                                        currentForm.submit();
                                }
                        },
                        {
                                text : "No",
                                click : function() {
                                        $(this).dialog("close");
                                }
                        }]
        });
        return false;
    });
});