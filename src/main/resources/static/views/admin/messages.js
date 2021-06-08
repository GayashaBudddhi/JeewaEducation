$(document).ready(function(){

	//alert();
	$('#example').DataTable( {
        "ajax": 'admin-get-messages',
        //processing: true,
       	//serverSide: true,
        columns: [
        	{data : 'title'},
        	{data : 'status'},
        	/*{data : 'nic'},
        	{data : 'address'},
        	{data : 'email'},*/
        	{ 
        		data : 'id',
        		render : function(data,arg,full){
        			var str = '<a class="btn btn-success btn-sm" href="/admin-message-view/'+data+'">View</a>';               
	                str += '<a class="btn btn-danger btn-sm" style="margin-left:10px;cursor:pointer" onclick="delete_student('+data+')">Delete</a>';
	                return str;
        		}
        	}
        ]
    });

});


function delete_student(_id){
	var res = confirm('Do you want to delete this message?');
	if(res == true){
		window.open("/admin-delete-message/" + _id, '_self');
	}
}