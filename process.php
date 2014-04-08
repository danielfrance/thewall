<?php
    session_start();
    require ('new-connection.php');

    if (isset($_POST['action']) && $_POST['action'] == 'register') 
    {
           register_user($_POST); 
    }
     else if(isset($_POST['action']) && $_POST['action'] == 'login')
    {
         login_user($_POST);

    }
    else if (isset($_POST['action']) && $_POST['action'] == 'logout' )
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



    else //malicious navigation to process.php OR someone is trying to log off
    {
        session_destroy();
        header('location: index.php');
        exit();
    }

    function register_user($post)
    {
        $_SESSION['errors'] = array();


        if (empty($post['first_name'])) 
        {
            $_SESSION['errors'][] = "first name can not be left blank";
        }

        if (empty($post['last_name'])) 
        {
            $_SESSION['errors'][] = "last name can not be left blank";
        }
        if (empty($post['password'])) 
        {
            $_SESSION['errors'][] = "password can not be left blank";
        }
        if ($post['password'] !==  $post['confirm_password'])
        {
            $_SESSION['errors'][] = "your password did not match";
        }

       if (!filter_var($post['email'], FILTER_VALIDATE_EMAIL  )) 
       {
           $_SESSION['errors'][] = "sorry, your email was not valid";
       }

       if ( count($_SESSION['errors']) > 0) 
       {
           header('location: index.php');
            die();
       }

        else
        {
            $salt = bin2hex(openssl_random_pseudo_bytes(22)); 
            $hash = crypt($post['password'], $salt); // hashing out a password;

            //escape string -- do this and then in the VALUES portion, just call the variable
            // $first_name= escape_this_string($_POST['first_name'])

            $query = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at)
                       VALUES ( '{$post['first_name']}', '{$post['last_name']}', '{$post['email']}',  '{$hash}', NOW(), NOW()) ";
            run_mysql_query($query);

            login_user ($post);

           header('location: main.php');

        }

    }

// log in function

         function login_user($post)
        {
            $query = "SELECT * FROM users WHERE  users.email = '{$post['email']}' ";
            $user = fetch_all($query); //go and attempt to grab users with above credentials 
            if (count($user) > 0 && crypt($post['password'], $user[0]['password']) === $user[0]['password'] ) 
            {
                $_SESSION['user_id'] = $user[0]['id'];
                $_SESSION['first_name'] = $user[0]['first_name'];
                $_SESSION['logged_in'] = TRUE;
                header('location: main.php');
            }
            else
            {
                $_SESSION['errors'][]= "email and/or password did not match";
                header('location:index.php');
                exit();
            }

        }


        
        function add_message($post)
        {
            if (!empty($post['new_message'])) 
            {
                $esc_message= escape_this_string($post['new_message']);


                 $query = "INSERT INTO messages (message, created_at, updated_at, users_id)
                        VALUES ( '{$esc_message}', NOW(), NOW(), {$_SESSION['user_id']})  ";


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
                $esc_comment = escape_this_string($post['new_comment']);
                 $query = "INSERT INTO comments (messages_id, comment, created_at, updated_at, users_id)
                             VALUES ( {$post['messages_id']}, '{$esc_comment}', NOW(), NOW(), {$_SESSION['user_id']} )   ";
                             // var_dump($query);
                       run_mysql_query($query);
                        header('location: main.php');

            }

            else  
            {
                
                $_SESSION['errors'][] = "sorry you can't post an empty field"; 
                header('location:main.php');
            }

        }

         

 ?>