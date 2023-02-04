package com.zty.core.controller.common;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.system.domain.SysUserLike;
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
}
