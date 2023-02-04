package com.zty.core.controller.common;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.utils.SecurityUtils;
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
}
