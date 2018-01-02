<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Db;
use think\Request;

class User extends Base
{
    public function index()
    {
        // 助手函数查询 排除userpass字段
        $admins = Db('admin')->field('userpass', true)->select();
        $arr = Db('user')->field('userpass', true)->select();
        // dump($list, $arr);

        // $list = array();
        foreach ($admins as $v) {
            // 查询"用户_角色表",当user_role中对应user中id时，获取roleids，可能为一个数组
            $rids = Db('user_role')->field('rid')->where(array(
                'uid' => $v['id']))
                ->select();

            // 如果未分配权限，则需要事先声明一个空数组
            $rnames = array();

            // 遍历
            foreach ($rids as $value) {
                $rnames[] = Db('role')->where(array(
                    'id' => array('eq', $value['rid']),
                    'status' => array('eq', 1)))
                    ->value('name');
            }

            // 将查询到的角色名称[]塞入用户表中,组成一个新的表。
            $v['rname'] = $rnames;
            $list[] = $v;
        }
        // 将组建的新表返回html文件中，遍历
        return view('admin@main/user', [
            'title' => "用户管理",
            'list' => $list,
            'arr' => $arr
        ]);
    }

    public function save(Request $request)
    {
        $p = $request->post();

        $data = [
            'username' => $p['username'],
            'userpass' => md5($p['userpass']),
            'name' => $p['name'],
            'sex' => $p['sex']
        ];
        // 执行添加保存
        $result = Db::name('admin')->data($data)->insert();

        // 判断结果
        if ($result > 0) {
            return $this->success('添加成功', url('admin/user/index'));
        } else {
            return $this->error('添加失败');
        }
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int $id
     * @return \think\Response
     */
    public function edit($id)
    {
        // 查询该用户所拥有的所有信息；用户表、角色表联查
        // $data = Db::view('admin', 'id,username,name,sex')
        //     ->view('user_role', 'rid,uid', 'uid=user.id')
        //     ->view('role', ['name'=>'rname'], 'role.uid=rid');
        //
        // dump($data);
        // die();

        $admins = Db('admin')->field('userpass', true)->where(array('id' => $id))->select();
        $rnames = Db('role')->field('name')->select();
        return view('admin@main/edit', [
            'title' => '用户编辑和查看',
            'admins' => $admins,
            'rnames' => $rnames
        ]);
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request $request
     * @param  int $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
        $info = $request->put();

        $data = [
            'username' => $info['username'],
            'name' => $info['name'],
            'sex' => $info['sex'],
        ];

        // 执行编辑更新
        $result = Db::name('admin')->where('id',$id)->update($data);

        // 判断
        if ($result) {
            return $this->success('编辑成功', url('admin/user/index'));
        } else {
            return $this->error('编辑失败');
        }
    }

    public function delete($id)
    {
        $data = Db('admin')->where('id', $id)->delete($id);

        if ($data) {
            return $this->success('删除成功(((((((((((っ･ω･)っ Σ(σ｀･ω･´)σ 起飞！', url('admin/user/index'));
        } else {
            return $this->error('删除失败(o＞ω＜o)雅蠛蝶');
        }
    }
}
