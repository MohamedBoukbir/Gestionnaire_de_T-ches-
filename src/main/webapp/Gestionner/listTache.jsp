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
                                <a href="#"><img src="img/dash.png" class="mr-2" alt="breadcrumb" />Home</a>
                            </li>
                            <li class="breadcrumb-item active">Tache</li>
                        </ul>
                        <h3>Taches</h3>
                    </div>
                </div>
                <div class="col-xl-12 col-sm-12 col-12 mb-4">
                    <div class="head-link-set">
                      <ul>
                        <li><a class="active" href="#">All</a></li>
                        <li><a href="#">Teams</a></li>
                        <li><a href="#">Offices</a></li>
                      </ul>


                  <a class="btn-add" href="#" data-toggle="modal" data-target="#AddTaskModal"
                        ><i data-feather="plus"></i> Tache</a
                      >
                    </div>
                  </div>
                  <div class="col-xl-12 col-sm-12 col-12 mb-4">
                    <div class="row">
                      <div class="col-xl-10 col-sm-8 col-12">
                        <label class="employee_count">${allTachesCount}    Taches</label>
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
                              <th >Titre tache</th>
                              <th >Date affectation</th>
                              <th >Deadline</th>
                              <th >Priorite</th>
                              <th >Status</th>
                              <th >Action</th>
                            </tr>
                          </thead>
                            <tbody>
                            <c:forEach items="${alltache}" var="tache">
                                <tr>
                                    <td> <c:out value="${tache.titretache}"/> </td>
                                    <td><c:out value="${tache.dateaffectation}"/></td>
                                    <td><c:out value="${tache.deadline}"/></td>
                                    <td><c:out value="${tache.priority}"/></td>
                                    <td><c:out value="${tache.status}"/></td>

<%--                                    <td><c:out value="${tache.projet_id.id}"/></td>--%>

                                    <td>
                                        <a type="button" class="btn btn-danger text-light" data-toggle="modal" data-target="#deleteModal${tache.id}">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>

                                <%--                            /// delete //--%>
                                <div class="modal fade" id="deleteModal${tache.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="POST" action="GestionnerHomeServlet?action=deletetache&id=<c:out value='${tache.id}' />">

                                                <div class="modal-header">
                                                    <h4 class="modal-title">Supprimer Tache</h4>
                                                    <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                                    </a>
                                                </div>
                                                <div class="modal-body">
                                                    Voulez-vous supprimer la tache ${tache.titretache}  </b> ?
<%--                                                    <label><c:out value='${tache.id}' /></label>--%>
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


 <!-- Ajout du formulaire pour ajouter des tâches -->
 <div class="modal fade" id="AddTaskModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h2 class="modal-title fs-5" id="exampleModalLabel"> Ajouter Tâche </h2>
                 <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img"></a>
             </div>
             <div class="modal-body">
                 <form action="GestionnerHomeServlet?action=addTask" method="POST">
                     <div class="row">
                         <div class="col-12">
                             <div class="form-group">
                             <label for="projectId">Sélectionnez le projet :</label>
                             <select id="projectId" name="projectId">
                                 <c:forEach items="${projects}" var="project">
                                     <option value="${project.id}">${project.name}</option>
                                 </c:forEach>
                             </select>
                             </div></div>
                         <div class="col-12">
                             <div class="form-group">
                                 <label for="titretache" class="col-form-label">Titre tache:</label>
                                 <input id="titretache" name="titretache" class="form-control p-3 my-2" />
                             </div>


                                 <%--                                 <div class="datepicker date input-group">--%>
                                 <%--                                     <input type="text" name="dateaffectation" placeholder="Choose Date" class="form-control" id="fecha1">--%>
                                 <%--                                     <span class="input-group-text"><i class="fa fa-calendar"></i></span>--%>
                                 <%--                                 </div>--%>
                                 <%--                             </div>--%>
                             <div class="form-group">
                                 <label for="dateaffectation" class="col-form-label">Date affectation :</label>
                                 <input id="dateaffectation" name="dateaffectation" class="form-control" value="<%= request.getAttribute("dateaffectation") %>" readonly />
                             </div>
                             <%--  Deadline--%>
                             <div class="form-group">
                                 <label for="deadline">Deadline</label>
                                 <div class="datepicker date input-group">
                                     <input type="text" name="deadline" placeholder="Deadline" class="form-control" id="deadline" style="padding-right: 60px;"> <!-- Augmenter le padding-right pour l'icône -->
                                     <span class="input-group-append" style="position: absolute; right: 5px; top: 0; bottom: 0; margin: auto; margin-right: 5px;"> <!-- Ajuster la position de l'icône -->
            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
        </span>
                                 </div>
                             </div>


                         <%--  Priority--%>
                                         <div class="form-group">
                                             <label>Task Priority</label>
                                             <div class="custom-control custom-radio custom-control-inline">
                                                 <input type="radio" id="customRadioInline11" value="LOW" name="priority" class="custom-control-input" checked="">
                                                 <label class="custom-control-label" for="customRadioInline11">Low</label>
                                             </div>
                                             <div class="custom-control custom-radio custom-control-inline">
                                                 <input type="radio" id="customRadioInline2" value="HEIGH" name="priority" class="custom-control-input">
                                                 <label class="custom-control-label" for="customRadioInline2">Heigh</label>
                                             </div>
                                             <div class="custom-control custom-radio custom-control-inline">
                                                 <input type="radio" id="customRadioInline3" value="MEDIUM" name="priority" class="custom-control-input">
                                                 <label class="custom-control-label" for="customRadioInline3">Medium</label>
                                             </div>

                                             <div class="custom-control custom-radio custom-control-inline">
                                                 <input type="radio" id="customRadioInline4" value="CRITICAL" name="priority" class="custom-control-input">
                                                 <label class="custom-control-label" for="customRadioInline4">Critical</label>
                                             </div>
                                         </div>

                             <div class="form-group">
                             <label for="membreEquipeId">Membre de l'équipe :</label>
                             <select id="membreEquipeId" name="membreEquipeId">
                                 <c:forEach items="${membresEquipe}" var="membre">
                                     <option value="${membre.id}">${membre.firstname} ${membre.lastname}</option>
                                 </c:forEach>
                             </select>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-12">
                             <div class="mb-3">
                                 <button class="btn btn-success w-100 mt-4" type="submit">Ajouter Tâche</button>
                             </div>
                         </div>
                     </div>
                         </div> </div></form>
             </div>
         </div>
     </div>
 </div>

</div>