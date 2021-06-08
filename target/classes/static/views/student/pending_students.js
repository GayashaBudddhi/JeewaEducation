$(document).ready(function(){

	//alert();
	$('#example').DataTable( {
        "ajax": 'students-get-pending',
        //processing: true,
       	//serverSide: true,
        columns: [
        	{data : 'nameWithInitials'},
        	{data : 'fullName'},
        	{data : 'nic'},
        	{data : 'address'},
        	{data : 'email'},
        	{ 
        		data : 'studentId',
        		render : function(data,arg,full){
        			var str = '<a class="btn btn-success btn-sm" href="/admin-student-view/'+data+'">View</a>';               
	                str += '<a class="btn btn-danger btn-sm" style="margin-left:10px;cursor:pointer" onclick="delete_student('+data+')" >Delete</a>';
	                return str;
        		}
        	}
        ]
    });

});

function delete_student(_id){
	var res = confirm('Do you want to delete this student?');
	if(res == true){
		window.open("/admin-student-delete/" + _id, '_self');
	}
}