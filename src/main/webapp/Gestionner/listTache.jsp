 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                        <label class="employee_count">0   Users</label>
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
                              <th >Nom</th>
                              <th >Prenom</th>
                              <th >Classe</th>
                              <th >Civilite</th>
                              <th >Level</th>
                              <th >Email</th>
                              <th >Action</th>
                            </tr>
                          </thead>
                          <tbody>




                            <tr>

                                <td>Mohamed/td>
                                <td>mohamed</td>
                                <td>ok</td>
                                <td>ok</td>
                                <td>ok</td>
                                <td>ok</td>


                                <td>
                                  <a type="button" class="btn btn-danger text-light" data-toggle="modal" data-target="#deleteModal{{ $user->id }}">
                                    <i data-feather="trash-2"></i>
                                  </a>

                                  </td>
                            </tr>

                            <div class="modal fade" id="deleteModal{{ $user->id }}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                                  <div class="modal-content">
                                      <form action="#" method="POST" enctype="multipart/form-data">

                                          <div class="modal-header">
                                              <h4 class="modal-title">Supprimer Utilisateur</h4>
                                              <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                              </a>
                                          </div>
                                          <div class="modal-body">
                                            Voulez-vous supprimer l utiliasateur x</b> ?
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
              <h2 class="modal-title fs-5" id="exampleModalLabel"> Ajouter Utilisateur  </h2>
              <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img"></a>
          </div>
          <div class="modal-body">
            <form action="#" method="POST"
            enctype="multipart/form-data">
            <div class="row">
                <div class="col-12 ">
                    <div class="col-12">
                        <div class="mb-3">
                            <label for="nom" class="form-label">Nom</label>
                            <input class="form-control" required  name="nom" type="text"
                                id="nom"  >

                        </div>
                    </div>
                </div>

                            <div class="col-12">
                                <div class="mb-3">
                                    <button class="btn btn-success w-100 mt-4" type="submit"> Sauvegarder</button>
                                </div>
                            </div>

          </div>
        </form>
      </div>
      </div>
  </div>
</div>