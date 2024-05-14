<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Util.UserStatus" %>
<%@ page isELIgnored="false"%>
<%@ include file="/Gestionner/Dashboard.jsp" %>
<div class="page-wrapper">
    <div class="content container-fluid">
        <form   method="POST" action="GestionnerHomeServlet?action=profileGestionner">
            <div class="main-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">

                                    <%--                                @if ($admin->image)--%>
                                    <%--                                {{-- <img class="flex-shrink-0 img-fluid rounded"--%>
                                    <%--                                          src="/storage/{{ $candidat->image }}" alt=""--%>
                                    <%--                                          style="width: 80px; height: 80px;"> --}}--%>

                                    <%--                                {{-- <img src="/storage/{{ $candidat->image }}" alt="Admin"--%>
                                    <%--                                          class="rounded-circle p-1" style="width: 110;height: 110px;"> --}}--%>
                                    <%--                                <span class="user-img">--%>
                                    <%--                                            <img class="rounded-circle mb-3" src="/storage/{{ Auth::user()->image }}"--%>
                                    <%--                                                 alt="" style="width: 100px;height: 100px;">--%>
                                    <%--                                            <span class="status online"></span>--%>
                                    <%--                                        </span>--%>
                                    <%--                                @else--%>
                                    <%--                                <img src="https://ui-avatars.com/api/?name={{ urlencode($admin->username) }}"--%>
                                    <%--                                     alt="Admin" class="rounded-circle p-1"--%>
                                    <%--                                     style="width: 110;height: 110px;">--%>
                                    <%--                                @endif--%>



                                    <img src="https://ui-avatars.com/api/?name=${user.firstname}"
                                         alt="Admin" class="rounded-circle p-1"
                                         style=" width: 110px; height: 110px;">

                                    <div class=" profile mt-3">
                                    </div>
                                </div>
                                <hr class="my-4">
                                <ul class="list-group list-group-flush">
                                    <li
                                            class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                 class="feather feather-mail me-2 icon-inline">
                                                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                                                <polyline points="22,6 12,13 2,6" />
                                            </svg>
                                            Gmail
                                        </h6>
                                        <span class="text-secondary"><c:out value='${user.email}'/></span>
                                    </li>
                                    <li
                                            class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                              height="24" viewBox="0 0 24 24" fill="none"
                                                              stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                              stroke-linejoin="round"
                                                              class="feather feather-facebook me-2 icon-inline ">
                                            <path
                                                    d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z">
                                            </path>
                                        </svg>Facebook</h6>

                                        <span class="text-secondary">HERE FACEBOOK</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <% if(request.getAttribute("error")!=null){ String error = request.getAttribute("error").toString();%>
                        <div  style="color : red"><%=error%></div>
                        <% }%>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="<c:out value='${user.firstname}'/> <c:out value='${user.lastname}'/>"
                                               disabled>

                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="<c:out value='${user.email}'/>"
                                               disabled>

                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Mobile</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" name="phonenumber" class="form-control"
                                               value="${user.phoneNumber}" autocomplete="off">

                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Profession</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" name="profession" class="form-control"
                                               value="${user.profession}" autocomplete="off">

                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Role</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" name="role" class="form-control"
                                               value="${user.role}" autocomplete="off" disabled>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="d-flex align-items-center mb-5">Password</h5>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Current password</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="password" class="form-control" name="current_password"
                                               id="current_password" autocomplete="off" value="">
                                        <% if(request.getAttribute("erroremailcurrent")!=null){ String erroremailcurrent = request.getAttribute("erroremailcurrent").toString();%>
                                        <div  style="color : red"><%=erroremailcurrent%></div>
                                        <% }%>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">New password</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="password" class="form-control" name="password" id="password">

                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Confirmation</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="password" class="form-control" name="password_confirmation"
                                               id="password_confirmation">
                                        <% if(request.getAttribute("erroremailconfir")!=null){ String erroremailconfir = request.getAttribute("erroremailconfir").toString();%>
                                        <div  style="color : red"><%=erroremailconfir%></div>
                                        <% }%>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-9 text-secondary">
                                        <button type="submit" class="btn btn-primary px-4"> Save Changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>