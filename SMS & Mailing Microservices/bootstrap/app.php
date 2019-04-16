<?php
    session_start();

    use Respect\Validation\Validator as v;
    use Libra\Classes\Config;
    use Monolog\Formatter\LineFormatter;

    require __DIR__.'/../vendor/autoload.php';

    $mode = file_get_contents(__DIR__.'/../.env');

    $app = new \Slim\App(Config::configuration($mode));

    $container = $app->getContainer();

    $container['logger'] = function ($container){
        $file = "log-".date('Y-m-d').".log";

        $dateFormat = "Y-m-d H:i:s";
        $output = "[%datetime%] %channel%.%level_name%: %message% %context% %extra%\n";
        
        $formatter = new LineFormatter($output, $dateFormat);

        $logger = new \Monolog\Logger('Libra');
        $file_handler = new \Monolog\Handler\StreamHandler(__DIR__.'/../logs/'.$file, $logger::DEBUG);
        $file_handler->setFormatter($formatter);
        $logger->pushHandler($file_handler);
        
        return $logger;
    };

    $container['validator'] = function ($container){
        return new \Libra\Classes\Validation\Validator;
    };
    $container['mailer'] = function ($container){
        return new \Libra\Classes\Mailer($container);
    };
    $container['sms'] = function ($container){
        return new \Libra\Classes\SMS($container);
    };
    $container['help_me'] = function ($container){
        return new \Libra\Helpers\Helpers;
    };
    

    /*
    * Controllers
    */
    $container['API'] = function ($container){
        return new \Libra\Controllers\ApiController($container);
    };

    v::with('Libra\\Classes\\Validation\\Rules\\');

    require __DIR__.'/../src/Routes/router.php';