package com.aiyalucky.shortplayserver.controller;

import com.aiyalucky.shortplayserver.dao.VideoData;
import com.aiyalucky.shortplayserver.service.impl.VideoDataServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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
    /**
     * 视频数据,ConcurrentHashMap<视频的videoid,剧集id, 对应剧集的所有数据>
     */
    private static ConcurrentHashMap<Integer, List<VideoData>> VIDEO_DATALIST = null;

    /**
     * 视频数据,List<视频整体数据>
     */
    private static List<VideoData> videoDataList = null;

    {
        VIDEO_DATALIST = new ConcurrentHashMap<>();
        videoDataList = new ArrayList<>();
    }

    /**
     * 视频控制器构造方法，首次启动构造的时候会从数据库加载全部的数据，进行分类整合到 VIDEO_DATALIST
     *
     * @param itemDataService 项数据服务
     */
    @Autowired
    public VideoController(VideoDataServiceImpl itemDataService) {
        this.itemDataService = itemDataService;
        videoDataList = this.itemDataService.selectAll();
        for (VideoData videoData : videoDataList) {
            //根据类别进行整理电视剧
            int videoId = videoData.getVideoid();
            if (VIDEO_DATALIST.containsKey(videoId)) {
                VIDEO_DATALIST.get(videoId).add(videoData);
            } else {
                List<VideoData> tmpVideoList = new ArrayList<>();
                tmpVideoList.add(videoData);
                VIDEO_DATALIST.put(videoData.getVideoid(), tmpVideoList);
            }
        }
    }

    /**
     * 获取视频数据
     *
     * @param num 获取的条目数量
     * @return {@link List}<{@link VideoData}>
     */
    @PostMapping("/getList")
    public List<VideoData> getList(@RequestBody Integer num) {
        List<VideoData> dataList = new ArrayList<>();
        int number = num > videoDataList.size() ? videoDataList.size() : num;
        for (int i = 0; i < number; i++) {
            Random random = new Random();
            int index = random.nextInt(videoDataList.size());
            VideoData videoData = videoDataList.get(index);
            if (dataList.contains(videoData)) {
                i--;
                continue;
            }
            dataList.add(videoData);
        }

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
        int videoId = videoData.getVideoid();
        if (VIDEO_DATALIST.containsKey(videoId)) {
            VIDEO_DATALIST.get(videoId).add(videoData);
        } else {
            List<VideoData> tmpVideoList = new ArrayList<>();
            tmpVideoList.add(videoData);
            VIDEO_DATALIST.put(videoData.getVideoid(), tmpVideoList);
        }
        return "添加成功!";
    }

    /**
     * 遍历查找是否存在相同的视频id了
     *
     * @param videoData
     * @return
     */
    private boolean contains(VideoData videoData) {
        int videoId = videoData.getVideoid();
        List<VideoData> videoDataList = VIDEO_DATALIST.get(videoData.getVideoid());
        for (VideoData data : videoDataList) {
            if (videoId == data.getVideoid()) {
                return false;
            }
        }
        return true;
    }
}
