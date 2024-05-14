
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Util.UserStatus" %>
<%@ page isELIgnored="false"%>
<%@ include file="/Gestionner/Dashboard.jsp" %>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="row">
            <div class="col-xl-12 col-sm-12 col-12">
                <div class="breadcrumb-path mb-4">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#"><img src="img/dash.png" class="mr-2" alt="breadcrumb" />Home</a>
                        </li>
                        <li class="breadcrumb-item active">Project</li>
                    </ul>
                    <h3>Users</h3>
                </div>
            </div>
            <div class="col-xl-12 col-sm-12 col-12 mb-4">
                <div class="head-link-set">

                    <a class="btn-add" href="#" data-toggle="modal" data-target="#AddModal"
                    ><i data-feather="plus"></i> Projet</a
                    >                </div>
            </div>
            <div class="col-xl-12 col-sm-12 col-12 mb-4">
                <div class="row">
                    <div class="col-xl-10 col-sm-8 col-12">
                        <label class="employee_count">0   Projects</label>
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
                                <th >Project Name</th>
                                <th >Date creation</th>
                                <th >Description</th>
                                <th >Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listProject}" var="project">
                                <tr>
                                    <td> <c:out value="${project.name}"/> </td>
                                    <td><c:out value="${project.datep}"/></td>
                                    <td><c:out value="${project.description}"/></td>

                                    <td>
                                        <a type="button" class="btn btn-danger text-light" data-toggle="modal" data-target="#deleteModal${project.id}">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>

                                <%--                            /// delete //--%>
                                <div class="modal fade" id="deleteModal${project.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="GestionnerHomeServlet?action=delete&id=<c:out value='${project.id}' />" method="POST" enctype="multipart/form-data">

                                                <div class="modal-header">
                                                    <h4 class="modal-title">Supprimer Project</h4>
                                                    <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                                    </a>
                                                </div>
                                                <div class="modal-body">
                                                    Voulez-vous supprimer le projet ${project.name}  </b> ?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn gray btn-outline-secondary"
                                                            data-dismiss="modal">Annuler</button>
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
                <h2 class="modal-title fs-5" id="exampleModalLabel"> Ajouter Projet  </h2>
                <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img"></a>
            </div>
            <div class="modal-body">
                <form action="GestionnerHomeServlet?action=addProject" method="POST">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="name" class="col-form-label" >Name:</label>
                                <input type="text" id="name" name="name"  class="form-control p-3 my-2"  />
                                <div class="form-group">
                                    <div class="form-group">
                                        <label for="datep" class="col-form-label">Date affectation :</label>
                                        <input id="datep" name="datep" class="form-control" value="<%= request.getAttribute("dateaffectation") %>" readonly />
                                    </div>
                                </div>
                                <label for="description" class="col-form-label" >Description:</label>
                                <input type="text"  id="description" name="description"  class="form-control p-3 my-2"  />

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
    </div></div>