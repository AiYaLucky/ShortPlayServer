package com.aiyalucky.shortplayserver.service.impl;
import com.aiyalucky.shortplayserver.dao.VideoData;
import com.aiyalucky.shortplayserver.mapper.VideoDataMapper;
import com.aiyalucky.shortplayserver.service.VideoDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 视频数据服务impl
 *
 * @Author xu xiao wei
 * @ClassName ItemDataServiceImpl
 * @Package com.aiyalucky.shortplayserver.service.impl
 * @Date 2023/3/2 22:33
 * @Version 1.0
 */
@Service
public class VideoDataServiceImpl implements VideoDataService {

    private final VideoDataMapper videoDataMapper;

    @Autowired
    public VideoDataServiceImpl(VideoDataMapper videoDataMapper) {
        this.videoDataMapper = videoDataMapper;
    }


    @Override
    @Transactional
    public List<VideoData> selectAll() {
        return videoDataMapper.selectAll();
    }

    @Override
    @Transactional
    public int insert(VideoData videoData) {
        return videoDataMapper.insert(videoData);
    }
}
