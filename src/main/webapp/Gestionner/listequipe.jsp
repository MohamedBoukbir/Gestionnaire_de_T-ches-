 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ include file="/Gestionner/Dashboard.jsp" %>
 <%@ page isELIgnored="false"%>
 <div class="page-wrapper">
     <div class="content container-fluid">
         <div class="row">
             <div class="col-xl-12 col-sm-12 col-12">
                 <div class="breadcrumb-path mb-4">
                     <ul class="breadcrumb">
                         <li class="breadcrumb-item">
                             <a href="#"><img src="img/dash.png" class="mr-2" alt="breadcrumb" />equipe</a>
                         </li>
                         <li class="breadcrumb-item active">Equipe</li>
                     </ul>
                     <h3>Equipe</h3>
                 </div>
             </div>
             <div class="col-xl-12 col-sm-12 col-12 mb-4">
                 <div class="head-link-set">
                     <ul>
                         <li><a class="active" href="#">All</a></li>
                         <li><a href="#">Teams</a></li>
                         <li><a href="#">Offices</a></li>
                     </ul>
                     <a class="btn-add" href="#" data-toggle="modal" data-target="#AddModal"
                     ><i data-feather="plus"></i> Equipe</a
                     >
                 </div>
             </div>
             <div class="col-xl-12 col-sm-12 col-12 mb-4">
                 <div class="row">
                     <div class="col-xl-10 col-sm-8 col-12">
                         <label class="employee_count">${allUsersCount}   Users</label>
                     </div>
                     <div class="col-xl-1 col-sm-2 col-12">
                         <a href="#" class="btn-view"
                         ><i data-feather="grid"></i>
                         </a>
                     </div>
                     <div class="col-xl-1 col-sm-2 col-12">
                         <a href="#" class="btn-view active"
                         ><i data-feather="list"></i>
                         </a>
                     </div>
                 </div>
             </div>

             <div class="col-xl-12 col-sm-12 col-12 mb-4">
                 <div class="card">
                     <div class="table-responsive p-4" >
                         <table  id="example" class="table  spacethtd custom-table no-footer" >
                             <thead>
                             <tr>
                                 <th >First name</th>
                                 <th >Last name</th>
                                 <th >Phone Number</th>
                                 <th >Profession</th>
                                 <th >Email</th>
                                 <th >Role</th>
                                 <th >Action</th>
                             </tr>
                             </thead>
                             <tbody>
                             <c:forEach items="${membresEquipe}" var="user">
                                 <tr>
                                     <td> <c:out value="${user.firstname}"/> </td>
                                     <td><c:out value="${user.lastname}"/></td>
                                     <td><c:out value="${user.phoneNumber}"/></td>
                                     <td><c:out value="${user.profession}"/></td>
                                     <td><c:out value="${user.email}"/></td>
                                     <td><c:out value="${user.role}"/>  </td>
                                     <td>
                                         <a type="button" class="btn btn-danger text-light" data-toggle="modal" data-target="#deleteModal${user.id}">
                                             <i class="fa-solid fa-trash"></i>
                                         </a>
                                     </td>
                                 </tr>
                                 <%--                            /// delete //--%>
                                 <div class="modal fade" id="deleteModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                                     <div class="modal-dialog">
                                         <div class="modal-content">
                                             <form action="AdminServlet?action=delete&id=<c:out value='${user.id}' />" method="POST" enctype="multipart/form-data">

                                                 <div class="modal-header">
                                                     <h4 class="modal-title">Supprimer Utilisateur</h4>
                                                     <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                         <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                                     </a>
                                                 </div>
                                                 <div class="modal-body">
                                                     Voulez-vous supprimer l utiliasateur ${user.firstname}  </b> ?
                                                 </div>
                                                 <div class="modal-footer">
                                                     <button type="button" class="btn gray btn-outline-secondary"
                                                             data-dismiss="modal">Anuller</button>
                                                     <button type="submit"
                                                             class="btn gray btn-outline-danger">Supprimer</button>


                                                 </div>
                                             </form>
                                         </div>
                                     </div>
                                 </div>
                                 <%--     ///  end delete //--%>

                             </c:forEach>
                             </tbody>
                         </table>
                     </div>
                 </div>
             </div>
         </div>
     </div>

 </div>




 <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title fs-5" id="exampleModalLabel"> Ajouter membre  </h2>
                    <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img"></a>
                </div>
                <div class="modal-body">
                    <form action="GestionnerHomeServlet?action=addMemberToTeam" method="post">
                        <label for="user">Select User:</label>
                        <select id="user" name="user">
                            <c:forEach items="${allUsers}" var="user">
                                <option value="<c:out value='${user.id}' />"> <c:out value="${user.firstname} "/>  <c:out value="${user.lastname}"/></option>

                            </c:forEach>
                        </select>
                        <input type="hidden" name="equipe_en_charge_id" value="${equipe_en_charge_id}">
                        <button type="submit" name="action" value="addMemberToTeam">Add Member to Team</button>
                    </form>
            </div>
        </div>
    </div>




</div>