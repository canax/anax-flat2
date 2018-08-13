<?php
/**
 * Routes to ease development and debugging.
 */
return [
    // Path where to mount the routes, is added to each route path.
    "mount" => "dev",

    // All routes in order
    "routes" => [
        [
            "info" => "Development and debugging information.",
            "handler" => "\Anax\Controller\DevelopmentController",
        ],
    ]
];
