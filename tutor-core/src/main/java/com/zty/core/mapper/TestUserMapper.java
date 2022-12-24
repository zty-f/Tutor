package com.zty.core.mapper;

import java.util.List;
import com.zty.core.domain.TestUser;

/**
 * 测试用户信息Mapper接口
 * 
 * @author zty
 * @date 2022-12-24
 */
public interface TestUserMapper 
{
    /**
     * 查询测试用户信息
     * 
     * @param userId 测试用户信息主键
     * @return 测试用户信息
     */
    public TestUser selectTestUserByUserId(Long userId);

    /**
     * 查询测试用户信息列表
     * 
     * @param testUser 测试用户信息
     * @return 测试用户信息集合
     */
    public List<TestUser> selectTestUserList(TestUser testUser);

    /**
     * 新增测试用户信息
     * 
     * @param testUser 测试用户信息
     * @return 结果
     */
    public int insertTestUser(TestUser testUser);

    /**
     * 修改测试用户信息
     * 
     * @param testUser 测试用户信息
     * @return 结果
     */
    public int updateTestUser(TestUser testUser);

    /**
     * 删除测试用户信息
     * 
     * @param userId 测试用户信息主键
     * @return 结果
     */
    public int deleteTestUserByUserId(Long userId);

    /**
     * 批量删除测试用户信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTestUserByUserIds(Long[] userIds);
}
