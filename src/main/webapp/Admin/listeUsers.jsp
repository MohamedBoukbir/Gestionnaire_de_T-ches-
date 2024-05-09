
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Util.UserStatus" %>
<%@ page isELIgnored="false"%>
  <%@ include file="/Admin/Dashboard.jsp" %>
<div class="page-wrapper">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-xl-12 col-sm-12 col-12">
                    <div class="breadcrumb-path mb-4">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#"><img src="img/dash.png" class="mr-2" alt="breadcrumb" />Home</a>
                            </li>
                            <li class="breadcrumb-item active">User</li>
                        </ul>
                        <h3>Users</h3>
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
                        ><i data-feather="plus"></i> User</a
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
                            <c:forEach items="${allusers}" var="user">
                            <tr>
                              <td> <c:out value="${user.firstname}"/> </td>
                               <td><c:out value="${user.lastname}"/></td>
                                <td><c:out value="${user.phoneNumber}"/></td>
                                <td><c:out value="${user.profession}"/></td>
                                <td><c:out value="${user.email}"/></td>
                                <td><c:out value="${user.role}"/>  </td>
                                <td>
                                    <c:if test="${user.userStatus == UserStatus.ENABLED}">
                                        <a type="button" href="#" class="btn btn-success" data-toggle="modal" data-target="#enableModal${user.id}" > <i class="fa-solid fa-check"></i></a>
                                    </c:if>
                                    <c:if test="${user.userStatus == UserStatus.DISABLED}">
                                        <a  type="button" href="#" class="btn btn-danger" data-toggle="modal" data-target="#enableModal${user.id}" ><i class="fa-solid fa-eye-slash"></i></a>
                                    </c:if>

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
                                <%--         /// enable //--%>
                                <div class="modal fade" id="enableModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="AdminServlet?action=enable&id=<c:out value='${user.id}' />" method="POST" enctype="multipart/form-data">

                                                <div class="modal-header">
                                                    <h4 class="modal-title">Activer Utilisateur</h4>
                                                    <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                                    </a>
                                                </div>
                                                <div class="modal-body">
                                                    Voulez-vous activer l utiliasateur ${user.firstname}  </b> ?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn gray btn-outline-secondary"
                                                            data-dismiss="modal">Anuller</button>
                                                    <button type="submit"
                                                            class="btn gray btn-outline-danger">confirmer</button>


                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <%--     ///  end enable //--%>
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
              <h2 class="modal-title fs-5" id="exampleModalLabel"> Ajouter Gestionner  </h2>
              <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img"></a>
          </div>
          <div class="modal-body">
                           <form action="AdminServlet?action=addGestionner" method="POST" >
                  <div class="row">
                      <div class="col-12">
                          <div class="form-group mb-3">
                              <label for="user_id" class="form-label">Name</label>
                              <select class="form-select" style="height: 50px;" name="user_id" id="user_id" aria-label="Default select example" required>
                                  <option value="">Choose</option>
                                  <c:forEach items="${users}" var="u">
                                      <option value="<c:out value='${u.id}' />"> <c:out value="${u.firstname}"/>  <c:out value="${u.lastname}"/></option>
                                  </c:forEach>
                              </select>
                              <% if(request.getAttribute("error")!=null){ String error = request.getAttribute("error").toString();%>
                              <div  style="color : red"><%=error%></div>
                              <% }%>
                          </div>
                      </div>

                      <div class="col-12">
                          <div class="mb-3">
                              <button class="btn btn-success w-100 mt-4" type="submit" id="submit_button">Sauvegarder</button>
                          </div>
                      </div>
                  </div>
              </form>
          </div>
      </div>
  </div>
</div>
