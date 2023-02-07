package com.zty.core.controller.common;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.core.domain.entity.SysUser;
import com.zty.common.utils.SecurityUtils;
import com.zty.system.domain.Parent;
import com.zty.system.domain.Student;
import com.zty.system.domain.SysUserLike;
import com.zty.system.domain.vo.ParentVo;
import com.zty.system.domain.vo.StudentVo;
import com.zty.system.mapper.*;
import com.zty.system.service.ISysUserLikeService;
import com.zty.system.service.ISysUserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.zty.common.annotation.Log;
import com.zty.common.core.controller.BaseController;
import com.zty.common.core.domain.AjaxResult;
import com.zty.common.enums.BusinessType;
import com.zty.system.domain.SysUserCollect;
import com.zty.system.service.ISysUserCollectService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 用户收藏关联Controller
 * 
 * @author zty
 * @date 2023-02-04
 */
@RestController
@RequestMapping("/core/collect")
public class SysUserCollectController extends BaseController
{
    @Autowired
    private ISysUserCollectService sysUserCollectService;

    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private SysPostMapper postMapper;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysUserLikeService userLikeService;

    @Autowired
    private ISysUserCollectService userCollectService;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ParentMapper parentMapper;

    @Autowired
    private SysDeptMapper deptMapper;

    @Autowired
    private SysRoleMapper roleMapper;


    /**
     * 获取用户收藏关联详细信息
     */
    @GetMapping(value = "/{userId}")
    public AjaxResult getCollectNum(@PathVariable("userId") Long userId)
    {
        AjaxResult ajax = AjaxResult.success();
        int collectNum = sysUserCollectService.selectSysUserCollectNum(userId);
        ajax.put("collectNum", collectNum);
        return ajax;
    }

    /**
     * 新增用户收藏关联
     */
    @Log(title = "用户收藏关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserCollect sysUserCollect)
    {
        return toAjax(sysUserCollectService.insertSysUserCollect(sysUserCollect));
    }

    /**
     * 删除用户收藏关联
     */
    @Log(title = "用户收藏关联", businessType = BusinessType.DELETE)
	@DeleteMapping
    public AjaxResult remove(@RequestBody SysUserCollect sysUserCollect)
    {
        return toAjax(sysUserCollectService.deleteSysUserCollect(sysUserCollect));
    }

    /**
     * 查询收藏列表
     */
    @GetMapping("/list")
    public TableDataInfo list()
    {
        Long userId = SecurityUtils.getUserId();
        Long roleId = roleMapper.selectRolePermissionByUserId(userId).get(0).getRoleId();
        List<Long> collectIds = sysUserCollectService.selectSysUserCollectIds(userId);
        if (collectIds.size()<=0){
            return getDataTable(new ArrayList<>());
        }
        if (roleId==3){
            return getDataTable(getParentInfos(collectIds));
        }else if (roleId==4){
            return getDataTable(getStudentInfos(collectIds));
        }
        return getDataTable(getUserInfos(collectIds));
    }

    public List<SysUser> getUserInfos(List<Long> ids){
        List<SysUser> list = userMapper.selectUserByIds(ids.toArray(new Long[0]));
        for (SysUser sysUser : list) {
            sysUser.setPostIds(postMapper.selectPostListByUserId(sysUser.getUserId()).toArray(new Long[0]));
            sysUser.setPostGroup(userService.selectUserPostGroup(sysUser.getUserName()));
        }
        return list;
    }

    public List<StudentVo> getStudentInfos(List<Long> ids){
        Long loginUserId = SecurityUtils.getUserId();
        List<StudentVo> res = new ArrayList<>();
        for (Long userId : ids) {
            Student student = studentMapper.selectStudentByUserId(userId);
            StudentVo studentVo = new StudentVo(student);
            studentVo.setDeptName(deptMapper.selectDeptById(studentVo.getStudent().getDeptId()).getDeptName());
            studentVo.setRoleName(roleMapper.selectRolePermissionByUserId(userId).get(0).getRoleName());
            studentVo.setPosts(postMapper.selectPostsByUserId(userId));
            studentVo.setLike(userLikeService.selectSysUserLikeByUserIdAndLikeId(loginUserId,userId));
            studentVo.setLikeNum(userLikeService.selectSysUserLikeNum(userId));
            studentVo.setCollect(userCollectService.selectSysUserCollectByUserIdAndCollectId(loginUserId,userId));
            studentVo.setCollectNum(userCollectService.selectSysUserCollectNum(userId));
            res.add(studentVo);
        }
        return res;
    }

    public List<ParentVo> getParentInfos(List<Long> ids){
        Long loginUserId = SecurityUtils.getUserId();
        List<ParentVo> res = new ArrayList<>();
        for (Long userId : ids) {
            Parent parent = parentMapper.selectParentByUserId(userId);
            ParentVo parentVo = new ParentVo(parent);
            parentVo.setDeptName(deptMapper.selectDeptById(parentVo.getParent().getDeptId()).getDeptName());
            parentVo.setRoleName(roleMapper.selectRolePermissionByUserId(userId).get(0).getRoleName());
            parentVo.setPosts(postMapper.selectPostsByUserId(userId));
            parentVo.setLike(userLikeService.selectSysUserLikeByUserIdAndLikeId(loginUserId,userId));
            parentVo.setLikeNum(userLikeService.selectSysUserLikeNum(userId));
            parentVo.setCollect(userCollectService.selectSysUserCollectByUserIdAndCollectId(loginUserId,userId));
            parentVo.setCollectNum(userCollectService.selectSysUserCollectNum(userId));
            res.add(parentVo);
        }
        return res;
    }
}
