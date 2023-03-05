package com.aiyalucky.shortplayserver.mapper;

import com.aiyalucky.shortplayserver.dao.VideoData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author xu xiao wei
 * @ClassName VideoDataMapper
 * @Package com.aiyalucky.shortplayserver.mapper
 * @Date 2023/3/2 22:49
 * @Version 1.0
 */
@Mapper
public interface VideoDataMapper {

    List<VideoData> selectAll();

    int update(VideoData videoData);

    int insert(VideoData videoData);
}
