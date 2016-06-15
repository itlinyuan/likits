$(document).ready(function(){

    //Set tabs
    $('#tabsMenu').tabs({
        onSelect:function(title,index){
            if(index == 0){
                showDatagrid('#check');
            }else if(index == 1){
                showDatagrid('#push');
            }else if(index ==2){
                showDatagrid('#pushed');
            }
        }
    });
});

function showDatagrid(tabsId){
    $(tabsId).datagrid({
        url:'datagrid_data.json',
        columns:[[
            {field:'code',title:'Code',width:100},
            {field:'name',title:'Name',width:100},
            {field:'price',title:'Price',width:100,align:'right'}
        ]]
    });
}



var url;

function normalCheck(){
    var row = $('#check').datagrid('getSelected');
    if (row){
        $('#check-dlg').dialog('open').dialog('center').dialog('setTitle','待审核');
        $('#fm').form('load',row);
        url = 'update_user.php?id='+row.id;
    }
}

function multipleCheck(){

}

function saveUser(){
    $('#fm').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if (result.errorMsg){
                $.messager.show({
                    title: 'Error',
                    msg: result.errorMsg
                });
            } else {
                $('#dlg').dialog('close');        // close the dialog
                $('#check').datagrid('reload');    // reload the user data
            }
        }
    });
}
