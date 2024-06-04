<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude
  Date: 01/06/2024
  Time: 12:37 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
  <title>Inicio - Subli-Art</title>
  <link href="../css/styles.css" rel="stylesheet" type="text/css">
  <link href="../css/dropdown-menu.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Barra de navegación -->
<nav class="nav">

  <div class="nav__container">

    <h1 class="nav__title">SubliArt</h1>

    <a href="#menu" class="nav__menu">
      <img src="../assets/menu.svg" class="nav__icon">
    </a>

    <a href="#" class="nav__menu nav__menu--second">
      <img src="../assets/close.svg" class="nav__icon ">
    </a>

    <ul class="dropdown" id="menu">

      <li class="dropdown__list">
        <a href="../index.jsp" class="dropdown__link">
          <img src="../assets/house.svg" class="dropdown__icon">
          <span class="dropdown__span">Inicio</span>
        </a>
      </li>

      <li class="dropdown__list">
        <a href="#" class="dropdown__link">
          <img src="../assets/projects.svg" class="dropdown__icon">
          <span class="dropdown__span">Projects</span>
          <img src="../assets/down.svg" class="dropdown__arrow">

          <input type="checkbox" class="dropdown__check">
        </a>

        <div class="dropdown__content">

          <ul class="dropdown__sub">

            <li class="dropdown__li">
              <a href="#" class="dropdown__anchor">Project 1</a>
            </li>
            <li class="dropdown__li">
              <a href="#" class="dropdown__anchor">Project 2</a>
            </li>
            <li class="dropdown__li">
              <a href="#" class="dropdown__anchor">Project 3</a>
            </li>

          </ul>

        </div>
      </li>

      <li class="dropdown__list">
        <a href="#" class="dropdown__link">
          <img src="../assets/email.svg" class="dropdown__icon">
          <span class="dropdown__span">Contacto</span>
          <img src="../assets/down.svg" class="dropdown__arrow">

          <input type="checkbox" class="dropdown__check">
        </a>

        <div class="dropdown__content">

          <ul class="dropdown__sub">

            <li class="dropdown__li">
              <a href="#" class="dropdown__anchor">Contact 1</a>
            </li>
            <li class="dropdown__li">
              <a href="#" class="dropdown__anchor">Contact 2</a>
            </li>


          </ul>

        </div>
      </li>

      <li class="dropdown__list">
        <a href="#" class="dropdown__link">
          <img src="../assets/help.svg" class="dropdown__icon">
          <span class="dropdown__span">Ayuda</span>
        </a>
      </li>

    </ul>

  </div>

</nav>


</body>
</html>
