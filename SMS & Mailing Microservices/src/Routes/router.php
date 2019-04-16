<?php
    use Libra\Middleware\ApiLoggerMiddleware;

    $app->group('', function() {
        $this->get('/hello', 'API:hello');
        
        $this->group('/mail', function() {
            $this->post('/send', 'API:send_mail');
        });

        $this->group('/sms', function() {
            
        });
    })->add(new ApiLoggerMiddleware($container));
    