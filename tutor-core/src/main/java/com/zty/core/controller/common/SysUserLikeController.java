package com.zty.core.controller.common;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.core.domain.entity.SysUser;
import com.zty.common.utils.SecurityUtils;
import com.zty.framework.web.domain.server.Sys;
import com.zty.system.domain.Student;
import com.zty.system.domain.vo.StudentVo;
import com.zty.system.mapper.SysPostMapper;
import com.zty.system.mapper.SysUserMapper;
import com.zty.system.mapper.SysUserPostMapper;
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
import com.zty.system.domain.SysUserLike;
import com.zty.system.service.ISysUserLikeService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 用户点赞关联Controller
 * 
 * @author zty
 * @date 2023-02-03
 */
@RestController
@RequestMapping("/core/like")
public class SysUserLikeController extends BaseController
{
    @Autowired
    private ISysUserLikeService sysUserLikeService;

    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private SysPostMapper postMapper;

    @Autowired
    private ISysUserService userService;

    /**
     * 新增用户点赞关联
     */
    @Log(title = "用户点赞关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserLike sysUserLike)
    {
        return toAjax(sysUserLikeService.insertSysUserLike(sysUserLike));
    }

    /**
     * 删除用户点赞关联
     */
    @Log(title = "用户点赞关联", businessType = BusinessType.DELETE)
	@DeleteMapping
    public AjaxResult remove(@RequestBody SysUserLike sysUserLike)
    {
        return toAjax(sysUserLikeService.deleteSysUserLike(sysUserLike));
    }

    /**
     * 获取用户点赞信息
     */
    @GetMapping(value = "/{userId}")
    public AjaxResult getLikeNum(@PathVariable("userId") Long userId)
    {
        AjaxResult ajax = AjaxResult.success();
        int likeNum = sysUserLikeService.selectSysUserLikeNum(userId);
        ajax.put("likeNum", likeNum);
        return ajax;
    }


    /**
     * 查询喜欢列表
     */
    @GetMapping("/list")
    public TableDataInfo list()
    {
        Long userId = SecurityUtils.getUserId();
        List<Long> likeIds = sysUserLikeService.selectSysUserLikeIds(userId);
        if (likeIds.size()<=0){
            return getDataTable(new ArrayList<>());
        }
        return getDataTable(getUserInfos(likeIds));
    }

    /**
     * 查询粉丝列表
     */
    @GetMapping("/fans")
    public TableDataInfo fans()
    {
        Long userId = SecurityUtils.getUserId();
        List<Long> fansIds = sysUserLikeService.selectSysUserFansIds(userId);
        if (fansIds.size()<=0){
            return getDataTable(new ArrayList<>());
        }
        return getDataTable(getUserInfos(fansIds));
    }

    public List<SysUser> getUserInfos(List<Long> ids){
        List<SysUser> list = userMapper.selectUserByIds(ids.toArray(new Long[0]));
        for (SysUser sysUser : list) {
            sysUser.setPostIds(postMapper.selectPostListByUserId(sysUser.getUserId()).toArray(new Long[0]));
            sysUser.setPostGroup(userService.selectUserPostGroup(sysUser.getUserName()));
        }
        return list;
    }
}
