<?php
    namespace Libra\Middleware;

    class ApiLoggerMiddleware extends Middleware
    {
        public function __invoke($request, $response, $next)
        {
            $route = $request->getAttribute('route');
            
            $this->container->logger->info($request->getMethod() . ' ' . $route->getPattern(), [
                'status' => $response->getStatusCode() . ' ' . $response->getReasonPhrase(),
                'response' => (string)$response->getBody(),
                'query' => $request->getParams()
            ]);

            $response = $next($request, $response);
            
            return $response;
        }
    }