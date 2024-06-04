<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 29/05/2024
  Time: 10:44 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
  <link href="../css/styles.css" rel="stylesheet" type="text/css">
  <link rel ="stylesheet" href = "../css/bootstrap.min.css">
</head>
<body>

  <nav class="navbar">
    <div class="navbar-container">
      <a class="navbar-brand" href="../index.jsp">Inicio</a>
    </div>
  </nav>
  <div class="container text-center">
    <div class="row">
      <div class="col">
        1 of 2
      </div>
      <div class="col">
        2 of 2
      </div>
    </div>
    <div class="row">
      <div class="col">
        1 of 3
      </div>
      <div class="col">
        <form action="../SvLogin" method="post">
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" aria-describedby="username" name="username" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <button type="submit" class="btn btn-primary">Iniciar sesion</button>
        </form>
      </div>
      <div class="col">
        3 of 3
      </div>
    </div>
  </div>




</body>
</html>
