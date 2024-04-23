 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ include file="/Admin/Dashboard.jsp" %>
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-name 	mb-4">
                    <h4 class="m-0"><img src="img/profile.png" class="mr-1" alt="profile" /> Welcome Admin</h4>
                    <label>2024/12/20</label>
                </div>
                <div class="row mb-4">
                    <div class="col-xl-6 col-sm-12 col-12">
                        <div class="breadcrumb-path ">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><img
                                            src="img/dash.png" class="mr-3" alt="breadcrumb" />Home</a>
                                </li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ul>
                            <h3>Admin Dashboard</h3>
                        </div>
                    </div>

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
                </div>

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
                    <div class="col-xl-6 d-flex mobile-h">
                        <div class="card flex-fill">
                            <div class="card-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="card-title">TOOOTAL 1</h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <div id="invoice_chart"></div>
                                <div class="text-center text-muted">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="mt-4">
                                                <p class="mb-2 text-truncate"><i class="fas fa-circle custom-coloret mr-1"></i>
                                                    Users</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mt-4">
                                                <p class="mb-2 text-truncate"><i class="fas fa-circle custom-colorpro  mr-1"></i>
                                                    Groups</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mt-4">
                                                <p class="mb-2 text-truncate"><i class="fas fa-circle custom-colordoc  mr-1"></i>
                                                    Bachelors  </p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mt-4">
                                                <p class="mb-2 text-truncate"><i class="fas fa-circle custom-colordoct mr-1"></i>
                                                    Mastères </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                </div>



                <div class="col-xl-12 col-sm-12 col-12">
                    <div class="card">
                  <a class="btn-add m-2" href="#" style="width: 200px; height: 60px;" data-toggle="modal" data-target="#AddModal">
                                       <i data-feather="plus"></i>Ajouter
                                   </a>

                        <div class="table-responsive  p-4 " >
                            <table  id="example" class="table custom-table no-footer spacethtd ">
                                <thead>
                                    <tr>

                                        <th>Nom gorup</th>
                                        <th>Total masters</th>
                                        <th>Total bachlors</th>
                                        <th>Etat</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <td>ok</td>
                                        <td>ok</td>
                                        <td>ok</td>
                                        <td>Complete</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>




    <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title fs-5" id="exampleModalLabel"> Ajouter annee universitaire  </h2>
                    <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 25px; height: 25px; margin-top: 10px;" src="{{ asset('img/close.png') }}" alt="sidebar_img"></a>
                </div>
                <div class="modal-body">
                    <form action="#" method="POST"
                           enctype="multipart/form-data">
                         <div class="row">
                            <div class="col-12 ">
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label for="anneeDebut" class="form-label">Annee Debut</label>
                                        <input class="form-control" required  name="anneeDebut" type="number"
                                            id="anneeDebut"  >
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mb-3">
                                        <label for="anneeFin" class="form-label">Annee Fin</label>
                                        <input class="form-control" required  name="anneeFin" type="number"
                                            id="anneeFin"  >
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mb-3">
                                        <button class="btn btn-success w-100 mt-4" type="submit"> Sauvegarder</button>
                                    </div>
                                </div>


                         </div>

                </div>
            </form>
            </div>
        </div>
    </div>




