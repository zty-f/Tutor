package com.zty.core.service.impl;

import java.util.List;
import com.zty.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.core.mapper.TestUserMapper;
import com.zty.core.domain.TestUser;
import com.zty.core.service.ITestUserService;

/**
 * 测试用户信息Service业务层处理
 * 
 * @author zty
 * @date 2022-12-24
 */
@Service
public class TestUserServiceImpl implements ITestUserService 
{
    @Autowired
    private TestUserMapper testUserMapper;

    /**
     * 查询测试用户信息
     * 
     * @param userId 测试用户信息主键
     * @return 测试用户信息
     */
    @Override
    public TestUser selectTestUserByUserId(Long userId)
    {
        return testUserMapper.selectTestUserByUserId(userId);
    }

    /**
     * 查询测试用户信息列表
     * 
     * @param testUser 测试用户信息
     * @return 测试用户信息
     */
    @Override
    public List<TestUser> selectTestUserList(TestUser testUser)
    {
        return testUserMapper.selectTestUserList(testUser);
    }

    /**
     * 新增测试用户信息
     * 
     * @param testUser 测试用户信息
     * @return 结果
     */
    @Override
    public int insertTestUser(TestUser testUser)
    {
        testUser.setCreateTime(DateUtils.getNowDate());
        return testUserMapper.insertTestUser(testUser);
    }

    /**
     * 修改测试用户信息
     * 
     * @param testUser 测试用户信息
     * @return 结果
     */
    @Override
    public int updateTestUser(TestUser testUser)
    {
        testUser.setUpdateTime(DateUtils.getNowDate());
        return testUserMapper.updateTestUser(testUser);
    }

    /**
     * 批量删除测试用户信息
     * 
     * @param userIds 需要删除的测试用户信息主键
     * @return 结果
     */
    @Override
    public int deleteTestUserByUserIds(Long[] userIds)
    {
        return testUserMapper.deleteTestUserByUserIds(userIds);
    }

    /**
     * 删除测试用户信息信息
     * 
     * @param userId 测试用户信息主键
     * @return 结果
     */
    @Override
    public int deleteTestUserByUserId(Long userId)
    {
        return testUserMapper.deleteTestUserByUserId(userId);
    }
}
