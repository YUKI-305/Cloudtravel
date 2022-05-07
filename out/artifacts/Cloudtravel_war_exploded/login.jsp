<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  <title>Travel in China</title>
  <meta http-equiv="content-type" content="text/html" charset="utf-8" />
  <meta http-equiv="Content-Language" content="en-us" />
  <meta http-equiv="imagetoolbar" content="no" />
  <meta name="MSSmartTagsPreventParsing" content="true" />
  <meta name="description" content="Description" />
  <meta name="keywords" content="Keywords" />
  <meta name="author" content="Enlighten Designs" />
  <style type="text/css" media="all">
    @import "login.css";
  </style>

</head>


<body>
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form action="" method="post" accept-charset="UTF-8">
      <h1>SIGN UP</h1>
      <input id="SignUpName" type="text" placeholder="Name" name="SignUpName"/>
      <input id="SignUpEmail" type="email" placeholder="Email" name="SignUpEmail"/>
      <input id="SignUpPassword" type="password" placeholder="Password" name="SignUpPassword"/>
      <button type="submit">Sign Up</button>
    </form>
  </div>

  <div class="form-container sign-in-container">
    <form action="" method="post">
      <h1>SIGN IN</h1>
      <input id="SignInEmail" type="email" placeholder="Email" name="SignInEmail"/>
      <input id="SignInPassword" type="password" placeholder="Password" name="SignInPassword"/>
      <a href="#">Forgot your password?</a>
      <button type="submit">Sign In</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>Sign in</h1>
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>Sign up</h1>
        <button class="ghost" id="signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
  const signUpButton = document.getElementById("signUp");
  const signInButton = document.getElementById("signIn");
  const container = document.getElementById("container");
  signUpButton.addEventListener("click", ()=>{container.classList.add("right-panel-active")});
  signInButton.addEventListener("click", ()=>{container.classList.remove("right-panel-active")});
</script>
</body>
</html>