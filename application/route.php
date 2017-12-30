<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// return [
//     '__pattern__' => [
//         'id' => '\d+',
//         'name' => '\w+',
//     ],
//     '[users]' => [
//         ':id' => ['admin/user', ['method' => 'get'], ['id' => '\d + ']],
//         ':name' => ['index / hello', ['method' => 'post']],
//     ],
//
// ];
// return [
//     // 定义路由的请求类型和后缀
//     'admin/[:name]' => ['admin/user', ['method' => 'get', 'ext' => 'html']],
// ];
use think\Route;

// 设置RESTFul 请求的资源路由
Route::resource('login', 'admin/index');
