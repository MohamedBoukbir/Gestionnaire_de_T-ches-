 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ include file="/Admin/Dashboard.jsp" %>
 <%@ page isELIgnored="false"%>
 <style>

     table td{
         text-align: center; /* Centrer horizontalement */
         vertical-align: middle; /* Centrer verticalement */
         height: 40px;
     }

     table tr:nth-child(even){
         background-color: #e4e3e3
     }

     th {
         background: #052659;
         color: #E0BE81;
         height: 35px;
         font-weight: normal;

         text-align: center; /* Centrer horizontalement */
         vertical-align: middle; /* Centrer verticalement */
     }



     .paginationn li:hover{
         cursor: pointer;
         background-color:#E0BE81;
         color: #052659;
         border-color: #052659;
         text-align: center;



     }
     .paginationn li:focus{
         cursor: pointer;
         background-color:#E0BE81  ;
         border-color: #fff3cd;
         color: #052659;
         text-align: center;


     }
     .paginationn li a:active {
         cursor: pointer;
         background-color: #E0BE81;
         color: #052659;
         border-color: #fff3cd;
         text-align: center;

     }

     .paginationn li{
         cursor: pointer;
         background-color:#052659 ;
         border:  1px solid #E0BE81;
         color: #E0BE81;
         text-align: center;
         display: inline-block;
         margin-right: 8px;
         width: 50%;
         height: 50%;
     }

     .paginationn {

         margin: 0px;
         /* Centrez les éléments de la pagination horizontalement */
     }


     .paginationn-container {
         width: 8%;
         height: 15%;
         float:left;

     }
     .num_rows {
         width: 20%;
         float:left;
     }
     .tb_search{
         width: 35%;
         float:right;
     }



     .rows_count {
         width: 25%;
         text-align:right;
         float: right;
         color: #999;
     }
 </style>
        <div class="page-wrapper">
            <div class="content container-fluid">
                    <div class="col-xl-12 col-sm-12 col-12" >
                        <div class="breadcrumb-path mb-4">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item justify-content-center">
                                    <h3 style="color: #052659"><i class="fa-solid fa-user-tie" style="color: #E0BE81"></i> Bienvenu  dans espace admin</h3>
                                </li>
                            </ul>

                        </div>

                </div>
                <%--<div class="row mb-4">
                    <div class="col-xl-6 col-sm-12 col-12">
                        <div class="row">
                            <div class="col-xl-6 col-sm-6 col-12">
                                <a class="btn-dash" href="#">User Dashboard</a>
                            </div>
                            <div class="col-xl-6 col-sm-6 col-12">
                                <a class="btn-dash" href="#">User Dashboard</a>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <div class="row mb-4">
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card board1 fill1 ">
                            <div class="card-body">
                                <div class="card_widget_header">
                                    <label>Users</label>
                                    <h4>0</h4>
                                </div>
                                <div class="card_widget_img">
                                    <img src="img/employee.svg" alt="card-img" />
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-sm-6 col-12 mt-2">
                        <div class="card board1 fill6 ">
                            <div class="card-body">
                                <div class="card_widget_header">
                                    <label>Groupe</label>
                                    <h4>0</h4>
                                </div>
                                <div class="card_widget_img">
                                    <img src="img/report.svg" alt="card-img" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-xl-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="card-title">Toootal 2</h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <div id="sales_chart"></div>
                            </div>
                        </div>
                    </div>
                <div class="col-xl-6 d-flex">
                    <div class="card flex-fill">
                    <div class="card">
                        <div class="table-responsive  p-4 " >
                            <table class="table table-striped table-class" id= "table-id" >


                                <thead>
                                <tr>
                                    <th style="  font-size: 16px; font-weight: normal" >Projet</th>
                                    <th style="  font-size: 16px;font-weight: normal" >Chef projet</th>
                                    <th style="  font-size: 16px;font-weight: normal" >Membres</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allusers}" var="user">
                                    <tr>
                                        <td> <c:out value="${user.firstname}"/> </td>
                                        <td><c:out value="${user.lastname}"/></td>
                                        <td><c:out value="${user.phoneNumber}"/></td>

                                    </tr>

                                </c:forEach>
                                </tbody>
                            </table>
                            <br>
                            <div class='paginationn-container'>
                                <nav>
                                    <ul class="paginationn">
                                        <!--	Here the JS Function Will Add the Rows -->
                                    </ul>
                                </nav>
                            </div>
                            <br>
                            <div class="rows_count"></div>

                        </div>
                    </div>
                    </div>
                </div>
            </div>

        </div>

        </div>


 <script>
     getPagination('#table-id');
     $('#maxRows').trigger('change');
     function getPagination (table){

         $('#maxRows').on('change',function(){
             $('.paginationn').html('');						// reset paginationn div
             var trnum = 0 ;									// reset tr counter
             var maxRows = parseInt($(this).val());			// get Max Rows from select option

             var totalRows = $(table+' tbody tr').length;		// numbers of rows
             $(table+' tr:gt(0)').each(function(){			// each TR in  table and not the header
                 trnum++;									// Start Counter
                 if (trnum > maxRows ){						// if tr number gt maxRows

                     $(this).hide();							// fade it out
                 }if (trnum <= maxRows ){$(this).show();}// else fade in Important in case if it ..
             });											//  was fade out to fade it in
             if (totalRows > maxRows){						// if tr total rows gt max rows option
                 var pagenum = Math.ceil(totalRows/maxRows);	// ceil total(rows/maxrows) to get ..
                 //	numbers of pages
                 for (var i = 1; i <= pagenum ;){			// for each page append paginationn li
                     $('.paginationn').append('<li data-page="'+i+'">\
								      <span>'+ i++ +'<span class="sr-only">(current)</span></span>\
								    </li>').show();
                 }											// end for i


             } 												// end if row count > max rows
             $('.paginationn li:first-child').addClass('active'); // add active class to the first li


             //SHOWING ROWS NUMBER OUT OF TOTAL DEFAULT
             showig_rows_count(maxRows, 1, totalRows);
             //SHOWING ROWS NUMBER OUT OF TOTAL DEFAULT

             $('.paginationn li').on('click',function(e){		// on click each page
                 e.preventDefault();
                 var pageNum = $(this).attr('data-page');	// get it's number
                 var trIndex = 0 ;							// reset tr counter
                 $('.paginationn li').removeClass('active');	// remove active class from all li
                 $(this).addClass('active');					// add active class to the clicked


                 //SHOWING ROWS NUMBER OUT OF TOTAL
                 showig_rows_count(maxRows, pageNum, totalRows);
                 //SHOWING ROWS NUMBER OUT OF TOTAL



                 $(table+' tr:gt(0)').each(function(){		// each tr in table not the header
                     trIndex++;								// tr index counter
                     // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
                     if (trIndex > (maxRows*pageNum) || trIndex <= ((maxRows*pageNum)-maxRows)){
                         $(this).hide();
                     }else {$(this).show();} 				//else fade in
                 }); 										// end of for each tr in table
             });										// end of on click paginationn list
         });
         // end of on select change

         // END OF PAGINATION

     }




     // SI SETTING
     $(function(){
         // Just to append id number for each row
         default_index();

     });

     //ROWS SHOWING FUNCTION
     function showig_rows_count(maxRows, pageNum, totalRows) {
         //Default rows showing
         var end_index = maxRows*pageNum;
         var start_index = ((maxRows*pageNum)- maxRows) + parseFloat(1);
         var string = 'Affichage de '+ start_index + ' sur ' + totalRows + ' entrées';
         $('.rows_count').html(string);
     }

     // CREATING INDEX
     function default_index() {
         $('table tr:eq(0)').prepend('<th> </th>')

         var id = 0;

         $('table tr:gt(0)').each(function(){
             id++
             $(this).prepend('<td>'+id+'</td>');
         });
     }

     // All Table search script
     function FilterkeyWord_all_table() {

// Count td if you want to search on all table instead of specific column

         var count = $('.table').children('tbody').children('tr:first-child').children('td').length;

         // Declare variables
         var input, filter, table, tr, td, i;
         input = document.getElementById("search_input_all");
         var input_value =     document.getElementById("search_input_all").value;
         filter = input.value.toLowerCase();
         if(input_value !=''){
             table = document.getElementById("table-id");
             tr = table.getElementsByTagName("tr");

             // Loop through all table rows, and hide those who don't match the search query
             for (i = 1; i < tr.length; i++) {

                 var flag = 0;

                 for(j = 0; j < count; j++){
                     td = tr[i].getElementsByTagName("td")[j];
                     if (td) {

                         var td_text = td.innerHTML;
                         if (td.innerHTML.toLowerCase().indexOf(filter) > -1) {
                             //var td_text = td.innerHTML;
                             //td.innerHTML = 'shaban';
                             flag = 1;
                         } else {
                             //DO NOTHING
                         }
                     }
                 }
                 if(flag==1){
                     tr[i].style.display = "";
                 }else {
                     tr[i].style.display = "none";
                 }
             }
         }else {
             //RESET TABLE
             $('#maxRows').trigger('change');
         }
     }</script>


