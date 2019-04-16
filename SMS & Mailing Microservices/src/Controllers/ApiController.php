<?php
    namespace LIbra\Controllers;

    use Respect\Validation\Validator as v;
    
    use Libra\Controllers\Controller;

    class ApiController extends Controller
    {
        public function hello($request, $response)
        {
            return $response->withJson([
                'status' => 'ok',
                'code' => 200,
                'message' => "Hi!"
            ]);
        }

        public function send_sms($request, $response)
        {
            
        }
        
        public function send_mail($request, $response)
        {
            $mail = $this->mailer->send($request->getParams());
        }
    }
    