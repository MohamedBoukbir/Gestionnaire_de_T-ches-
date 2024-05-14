<%--
  Created by IntelliJ IDEA.
  User: Mohamed
  Date: 5/14/2024
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ include file="/User/Dashboard.jsp" %>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <br>
            <br>
            <c:forEach items="${commentaires}" var="commentaire">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"> <c:out value="${commentaire.user.firstname}" /> <c:out value="${commentaire.user.lastname}" /></h5>
                            <p class="card-text"> <c:out value="${commentaire.contenu_cm}" /></p>
                            <p class="card-text"> <c:out value="${commentaire.date_cm}" /></p>
                                <%--                        <a href="#" class="btn btn-primary"></a>--%>
                            <a type="button" class="btn btn-danger text-light" data-toggle="modal" data-target="#deleteModal${commentaire.id}">
                                <i class="fa-solid fa-trash"></i>
                            </a>

                        </div>
                    </div>
                </div>
                <%--                            /// delete //--%>
                <div class="modal fade" id="deleteModal${commentaire.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="UserHomeServlet?action=deletecommentaire&id=<c:out value='${commentaire.id}' />" method="POST" enctype="multipart/form-data">

                                <div class="modal-header">
                                    <h4 class="modal-title">Supprimer commentaire</h4>
                                    <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                    </a>
                                </div>
                                <div class="modal-body">
                                    Voulez-vous supprimer cette commentaire   </b> ?
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
            <form action="UserHomeServlet?action=addcommentaire" method="POST">
                <div class="form-group mb-3">
                    <input type="hidden" name="id" value="${id}" class="form-control" placeholder="Commentaire" required/>
                    <input type="text" name="comment" class="form-control" placeholder="Commentaire" required/>
                </div>
                <div class="mb-3">
                    <button class="btn btn-success w-100 mt-4" type="submit" id="submit_button">Sauvegarder</button>
                </div>
            </form>
        </div>
    </div>
</div>
