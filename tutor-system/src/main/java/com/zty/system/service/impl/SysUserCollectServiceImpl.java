package com.zty.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.system.mapper.SysUserCollectMapper;
import com.zty.system.domain.SysUserCollect;
import com.zty.system.service.ISysUserCollectService;

/**
 * 用户收藏关联Service业务层处理
 * 
 * @author zty
 * @date 2023-02-04
 */
@Service
public class SysUserCollectServiceImpl implements ISysUserCollectService 
{
    @Autowired
    private SysUserCollectMapper sysUserCollectMapper;


    @Override
    public boolean selectSysUserCollectByUserIdAndCollectId(Long userId, Long collectId) {
        SysUserCollect sysUserCollect = new SysUserCollect(userId, collectId);
        return sysUserCollectMapper.selectSysUserCollectByUserIdAndCollectId(sysUserCollect) > 0;
    }

    @Override
    public int selectSysUserCollectNum(Long userId) {
        return sysUserCollectMapper.selectSysUserCollectNum(userId);
    }

    @Override
    public int insertSysUserCollect(SysUserCollect sysUserCollect) {
        return sysUserCollectMapper.insertSysUserCollect(sysUserCollect);
    }

    @Override
    public int deleteSysUserCollect(SysUserCollect sysUserCollect) {
        return sysUserCollectMapper.deleteSysUserCollect(sysUserCollect);
    }
}
