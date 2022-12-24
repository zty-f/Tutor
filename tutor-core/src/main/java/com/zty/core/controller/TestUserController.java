package com.zty.core.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.zty.core.domain.TestUser;
import com.zty.core.service.ITestUserService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 测试用户信息Controller
 * 
 * @author zty
 * @date 2022-12-24
 */
@RestController
@RequestMapping("/core/testUser")
public class TestUserController extends BaseController
{
    @Autowired
    private ITestUserService testUserService;

    /**
     * 查询测试用户信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:testUser:list')")
    @GetMapping("/list")
    public TableDataInfo list(TestUser testUser)
    {
        startPage();
        List<TestUser> list = testUserService.selectTestUserList(testUser);
        return getDataTable(list);
    }

    /**
     * 导出测试用户信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:testUser:export')")
    @Log(title = "测试用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TestUser testUser)
    {
        List<TestUser> list = testUserService.selectTestUserList(testUser);
        ExcelUtil<TestUser> util = new ExcelUtil<TestUser>(TestUser.class);
        util.exportExcel(response, list, "测试用户信息数据");
    }

    /**
     * 获取测试用户信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('core:testUser:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return success(testUserService.selectTestUserByUserId(userId));
    }

    /**
     * 新增测试用户信息
     */
    @PreAuthorize("@ss.hasPermi('core:testUser:add')")
    @Log(title = "测试用户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TestUser testUser)
    {
        return toAjax(testUserService.insertTestUser(testUser));
    }

    /**
     * 修改测试用户信息
     */
    @PreAuthorize("@ss.hasPermi('core:testUser:edit')")
    @Log(title = "测试用户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TestUser testUser)
    {
        return toAjax(testUserService.updateTestUser(testUser));
    }

    /**
     * 删除测试用户信息
     */
    @PreAuthorize("@ss.hasPermi('core:testUser:remove')")
    @Log(title = "测试用户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(testUserService.deleteTestUserByUserIds(userIds));
    }
}
