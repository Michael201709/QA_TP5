<?php

namespace app\admin\model;

use think\Model;

class User extends Model
{
    // 大多情况下，我们无需为模型定义任何的属性和方法即可完成基础的操作
    protected $table = 'lamp_user';
}
