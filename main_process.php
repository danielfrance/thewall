<?php
	if (isset($_POST['action']) && $_POST['action'] == 'logout' )
    {
        logout($_POST);
    }
    elseif (isset($_POST['action']) &&  $_POST['action'] == 'message'  ) 
    {
          add_message($_POST);
     }
     elseif (isset($_POST['action']) &&  $_POST['action'] == 'comment'  ) 
    {
          add_comment($_POST);
     }


        
        function add_message($post)
        {
            if (!empty($post['new_message'])) 
            {
                 $query = "INSERT INTO messages (message, created_at, updated_at, users_id)
                        VALUES ( '{$post['new_message']}', NOW(), NOW(), {$_SESSION['user_id']})   ";
                    // var_dump($query);
                        run_mysql_query($query);
                        header('location: main.php');
                    

            }

            else  
            {
                // var_dump($_SESSION);
                $_SESSION['errors'][] = "sorry you can't post an empty field"; 
                header('location:main.php');
            }

        }


         function add_comment($post)
        {
            if (!empty($post['new_comment'])) 
            {
                 $query = "INSERT INTO comments (comment, created_at, updated_at, users_id)
                        VALUES ( '{$post['messages_id']}', '{$post['new_comment']}', NOW(), NOW(), {$_SESSION['user_id']})   ";
                    // var_dump($query);
                        run_mysql_query($query);

                        header('location: main.php');

            }

            else  
            {
                // var_dump($_SESSION);
                $_SESSION['errors'][] = "sorry you can't post an empty field"; 
                header('location:main.php');
            }

        }

         


  ?>