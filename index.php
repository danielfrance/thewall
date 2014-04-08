<?php  
	session_start();
	require_once('new-connection.php');

?>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>The Wall</title>
    <!-- Bootstrap -->
    
  	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
    <script type="text/javascript" href="js/javascript.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){

    	$('#click_me').click(function(){
    		$('#login_form').show()
    	});

    })



    </script>
</head>
<body>
	<div id="sign_up" class="row">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-3 col-lg-offset-3">
						<h1 class="col-xs-8 col-xs-offset-3 col-sm-offset-4 col-md-offset-4">The Wall</h1>
						<form id="login_form"  method="post" action="process.php" role="form">
							<input type="hidden" name ="action" value ="login">
							<div class="form-group">
								<input  class="form-control" type = "text" name ="email" placeholder="your email" >
							</div>
							<div  class="form-group">
								<input class="form-control" type="password" name = "password" placeholder ="your password">
								<input class="margin-top form-control btn btn-success" type= "submit" value="log in">
							</div>
						</form>	
					<?php
							if (isset($_SESSION['errors'])) 
							{
								foreach ($_SESSION['errors'] as $error) 
								{
									echo "<div class='alert alert-danger'>". $error . "</div>";
								}	
								// unset($_SESSION['errors']);						
							}
						 ?>
					<form id="registration-form" method="post" action="process.php" role="form-horizontal" >
						<input class="form-control" type="hidden" name="action" value="register">
						<div class="form-group">
							<input class="form-control" type="text" name="first_name" placeholder="Your First Name">
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="last_name" placeholder="Your Last Name">
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="email" placeholder="Your Email">	
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="password" placeholder="Enter Password">
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="confirm_password" placeholder="Confirm Your Password">
						</div>
						<div class="form-group">
							<input class="form-control btn btn-primary" type="submit" value="Sign Up" >
							<h6 id="click_me">already a member?</h6>
						</div>
				</form>

				</div>
			</div>

		</div>
			
	</div>

</body>
</html>
<?php 
	$_SESSION = array();


 ?>
