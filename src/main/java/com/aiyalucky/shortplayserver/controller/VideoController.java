package com.aiyalucky.shortplayserver.controller;

import com.aiyalucky.shortplayserver.dao.VideoData;
import com.aiyalucky.shortplayserver.service.impl.VideoDataServiceImpl;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 视频控制器
 *
 * @Author xu xiao wei
 * @ClassName VideoController
 * @Package com.aiyalucky.shortplayserver.controller
 * @Date 2023/3/2 22:39
 * @Version 1.0
 */

@RestController
@RequestMapping("/video")
public class VideoController {

    private final VideoDataServiceImpl itemDataService;
    private static ConcurrentHashMap<Integer, VideoData> VIDEO_DATALIST = null;
    {
        VIDEO_DATALIST = new ConcurrentHashMap<>();
    }

    public VideoController(VideoDataServiceImpl itemDataService) {
        this.itemDataService = itemDataService;
        List<VideoData> videoDataList = itemDataService.selectAll();
        for (VideoData videoData : videoDataList) {
            VIDEO_DATALIST.put(videoData.getVideoid(), videoData);
        }
    }

    @PostMapping("/getList")
    public List<VideoData> getList(@RequestBody String parameterValue) {
        // 根据参数值查询对应的数据
        List<VideoData> dataList = itemDataService.selectAll();
        return dataList;
    }


    /**
     * 添加视频数据
     *
     * @param videoData 视频数据
     * @return {@link String}
     */
    @PostMapping("/addVideo")
    public String addVideoData(VideoData videoData) {

        if (contains(videoData)) {
            return "已经存在类似数据";
        }
        itemDataService.insert(videoData);
        VIDEO_DATALIST.put(videoData.getVideoid(), videoData);
        return "添加成功!";
    }

    private boolean contains(VideoData videoData) {
        VideoData data = VIDEO_DATALIST.get(videoData.getVideoid());
        if (data != null) {
            return true;
        }
        return false;
    }
}
