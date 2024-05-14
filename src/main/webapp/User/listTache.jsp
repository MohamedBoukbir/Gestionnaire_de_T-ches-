
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Util.Status" %>
<%@ page isELIgnored="false"%>
<%@ include file="/User/Dashboard.jsp" %>
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
<%--                        <label class="employee_count">${tacheListCount}   Users</label>--%>
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
                                <th >TO DO</th>
                                <th >IN PROGRESS</th>
                                <th >COMPLETED</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
<tr>
    <td>
<%--        // to do ///--%>
        <c:forEach items="${todoList}" var="todo">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"> <c:out value="${todo.titretache}" /></h5>
                        <p class="card-text"> <c:out value="${todo.deadline}" /></p>
                         <a type="button" class="btn btn-success text-light" data-toggle="modal" data-target="#updateModal${todo.id}">
                             <i class="fa-solid fa-pen"></i></a>
                        <a href="UserHomeServlet?action=commentlist&id=<c:out value='${todo.id}' />" >
                            <i class="fa-solid fa-pen"></i></a>

                    </div>
                </div>
            </div>

            <%--                            /// delete //--%>
            <div class="modal fade" id="updateModal${todo.id}" tabindex="-1" role="dialog" aria-labelledby="updateModallabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${todo.id}' />" method="POST">

                            <div class="modal-header">
                                <h4 class="modal-title">changer le status</h4>
                                <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                </a>
                            </div>
                            <div class="modal-body">
                                Voulez-vous modifier  le status de  ${todo.titretache}  </b> ?
                            </div>
                            <label for="user_id" class="form-label">Status</label>
                            <select class="form-select" style="height: 50px;" name="status" id="status" aria-label="Default select example" required>
<%--                                <option value="<c:out value='${Status.TODO}' />">TO DO</option>--%>
                                <option value="<c:out value='${Status.IN_PROGRESS}' />"> IN PROGRESS</option>
                                <option value="<c:out value='${Status.COMPLETED}' />"> COMPLETED</option>
                            </select>
                            <div class="modal-footer">
                                <button type="button" class="btn gray btn-outline-secondary"
                                        data-dismiss="modal">Anuller</button>
                                <button type="submit"
                                        class="btn gray btn-outline-danger">save</button>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--     ///  end delete //--%>
        </c:forEach>
    <%--        // end  to do ///--%>
    </td>
    <td>
        <%--        //   In progress ///--%>
        <c:forEach items="${inProgressList}" var="inProgress">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"> <c:out value="${inProgress.titretache}" /></h5>
                        <p class="card-text"> <c:out value="${inProgress.deadline}" /></p>
                        <a type="button" class="btn btn-success text-light" data-toggle="modal" data-target="#updateModal${inProgress.id}">
                            <i class="fa-solid fa-pen"></i></a>
                        <a href="UserHomeServlet?action=commentlist&id=<c:out value='${inProgress.id}' />" >
                            <i class="fa-solid fa-pen"></i></a>
                    </div>
                </div>
            </div>

            <%--                            /// delete //--%>
            <div class="modal fade" id="updateModal${inProgress.id}" tabindex="-1" role="dialog" aria-labelledby="updateModallabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${inProgress.id}' />" method="POST">

                            <div class="modal-header">
                                <h4 class="modal-title">changer le status</h4>
                                <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                </a>
                            </div>
                            <div class="modal-body">
                                Voulez-vous modifier  le status de  ${inProgress.titretache}  </b> ?
                            </div>
                            <label for="user_id" class="form-label">Status</label>
                            <select class="form-select" style="height: 50px;" name="status"  aria-label="Default select example" required>
                                <option value="<c:out value='${Status.TODO}' />">TO DO</option>
<%--                                <option value="<c:out value='${Status.IN_PROGRESS}' />"> IN PROGRESS</option>--%>
                                <option value="<c:out value='${Status.COMPLETED}' />"> COMPLETED</option>
                            </select>
                            <div class="modal-footer">
                                <button type="button" class="btn gray btn-outline-secondary"
                                        data-dismiss="modal">Anuller</button>
                                <button type="submit"
                                        class="btn gray btn-outline-danger">save</button>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--     ///  end delete //--%>
        </c:forEach>
            <%--        // end  In progress ///--%>
    </td>
    <td>
        <%--        //   completed ///--%>
        <c:forEach items="${completedList}" var="completed">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"> <c:out value="${completed.titretache}" /></h5>
                        <p class="card-text"> <c:out value="${completed.deadline}" /></p>
                        <a type="button" class="btn btn-success text-light" data-toggle="modal" data-target="#updateModal${completed.id}">
                            <i class="fa-solid fa-pen"></i></a>
                        <a href="UserHomeServlet?action=commentlist&id=<c:out value='${completed.id}' />" >
                            <i class="fa-solid fa-pen"></i></a>
                    </div>
                </div>
            </div>

            <%--                            /// delete //--%>
            <div class="modal fade" id="updateModal${completed.id}" tabindex="-1" role="dialog" aria-labelledby="updateModallabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${completed.id}' />" method="POST">

                            <div class="modal-header">
                                <h4 class="modal-title">changer le status</h4>
                                <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                </a>
                            </div>
                            <div class="modal-body">
                                Voulez-vous modifier  le status de  ${completed.titretache}  </b> ?
                            </div>
                            <label for="user_id" class="form-label">Status</label>
                            <select class="form-select" style="height: 50px;" name="status"  aria-label="Default select example" required>
                                <option value="<c:out value='${Status.TODO}' />">TO DO</option>
                                <option value="<c:out value='${Status.IN_PROGRESS}' />"> IN PROGRESS</option>
<%--                                <option value="<c:out value='${Status.COMPLETED}' />"> COMPLETED</option>--%>
                            </select>
                            <div class="modal-footer">
                                <button type="button" class="btn gray btn-outline-secondary"
                                        data-dismiss="modal">Anuller</button>
                                <button type="submit"
                                        class="btn gray btn-outline-danger">save</button>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--     ///  end delete //--%>
        </c:forEach>
            <%--        // end  completed ///--%>

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
