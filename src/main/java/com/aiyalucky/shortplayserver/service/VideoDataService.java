package com.aiyalucky.shortplayserver.service;

import com.aiyalucky.shortplayserver.dao.VideoData;

import java.util.List;

/**
 * 视频数据mapper
 *
 * @Author xu xiao wei
 * @ClassName ItemDataService
 * @Package com.aiyalucky.shortplayserver.service
 * @Date 2023/3/2 22:34
 * @Version 1.0
 */


public interface VideoDataService {
    /**
     * 查询所有
     *
     */
    List<VideoData> selectAll();

    /**
     * 插入
     *
     * @param videoData 项数据
     * @return int
     */
    int insert(VideoData videoData);
}
