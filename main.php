<?php
	session_start();
	require_once('new-connection.php')
	

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
    <script type="text/javascript" href="js/javascript.js"></script>
</head>
 <body>
 	<div id="header" class="row">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="">
						<h1 class="pull-left">The Wall</h1>
						<?php
							$query = "SELECT first_name
										FROM users
										WHERE id = {$_SESSION['user_id']}   ";
										echo "<h3 class='pull-right'>{$_SESSION['first_name']} <small><a id='logout_link' class='btn btn-warning' href='process.php'>logout</a></small> </h3>";
						 ?> 


						

					 	
						  
				</div>

			</div>
		</div>
	</div>

	<div id="new_message" class="container">
		
			
		
			<?php 
				
						if (isset($_SESSION['errors'])) 
							{
								foreach ($_SESSION['errors'] as $error) 
								{
									echo "<div class='alert alert-danger'>". $error . "</div>";
								}							
							}
							unset($_SESSION['errors']);

			 ?>
		<form class="form" method="post" action="process.php">
		

			<input type="hidden" name="action" value="message">
		
			<div class="form-group">
				<textarea type="text" name="new_message" class="form-control"></textarea>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary" value="Post Message">
			</div>
		</form>
	</div>
	<div class="container">
		<?php


			$message_query = " SELECT first_name, last_name, message, messages.id, messages.created_at 
								from messages
								LEFT JOIN users ON messages.users_id = users.id 
								ORDER BY messages.created_at DESC ";
			$message_data = fetch_all($message_query);
			// var_dump($message_data);

			foreach ($message_data as $message ) 
			{
				////////////////////  HI DAN!  ////////////////////////
				$text = htmlspecialchars($message['message']);
				////////////////////  BYE DAN <3 TREY //////////////////
				echo "<div><h5>{$message['first_name']}, {$message['last_name']},{$message['created_at']}</h3></div>";
				echo "<div><h4> {$text}</h4> </div>";
				echo "<div class='container new_comment'>
						<div class='col-md-8 col-md-offset-1'>
							
						</div>
					</div>";

				$comment_query ="SELECT first_name, last_name, comment, comments.created_at
									FROM comments
									LEFT JOIN messages ON messages.id = comments.messages_id
									LEFT JOIN users ON comments.users_id = users.id
									WHERE messages.id = '{$message['id']}'
									ORDER BY comments.created_at ASC";
								
				$comment_data = fetch_all($comment_query);
				 // var_dump($comment_data);
			 	if (count($comment_data)>0) 
				{
					foreach ($comment_data as $comment) 
					{
						$comment_text = htmlspecialchars($comment['comment']);
						echo "<div class='col-md-offset-1 comment_box'><h6>{$comment['first_name']},{$comment['last_name']}, {$comment['created_at']}</h5> ";
						echo  "<div><h5> {$comment_text}</h5> </div> ";
						echo "</div>";
					}
				}
				echo "<form class='form' method='post' action='process.php'>
								<input type='hidden' name='messages_id' value='{$message['id']}'>
								<input type='hidden' name='action' value='comment'>
								<div class='form-group'>
									
									<textarea type='text' name='new_comment' class='margin-top form-control'></textarea>
								</div>
								<div class='form-group'>
									<input type='submit' class='btn btn-info' value='Post Comment'>

								</div>
							</form>";	
			}

		 ?>

		<h3>UserName</h3>
		<h3>Date</h3>
		<h5>Maecenas eu tellus odio. Morbi eget magna at erat vehicula accumsan. Aliquam dignissim fermentum diam ut porttitor. In luctus ac magna sed porttitor. Nulla ut erat dui. Integer massa quam, laoreet eu sagittis eu, tristique eget leo. Maecenas dictum luctus ante sit amet tincidunt. Aliquam in diam sit amet magna dapibus tincidunt</h5>
	</div>
	<div id='new_comment' class='container'>
		<div class='col-md-8 col-md-offset-1'>
			<form class='form' method='post' action='process.php'>
				<input type='hidden' name='action' value='comment'>
				<div class='form-group'>
					
					<textarea type='text' name='new_comment' class='form-control'></textarea>
				</div>
				<div class='form-group'>
					<input type='submit' class='btn btn-info' value='Post Comment'>

				</div>
			</form>
		</div>
	</div>
 </body>
 </html>

