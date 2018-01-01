//
//  AnimationImageModel.m
//  播放gif
//
//  Created by 王晓栋 on 2017/4/10.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationImageModel.h"
//#import "AnimationImageCache.h"

@implementation AnimationImageModel

-(UIImage *)image{
    if (_imageName == nil)return nil;
//    NSString *path = [IMAGE_CACHE_GIF_LUXURY_PATH stringByAppendingString:self.imageName];
//
//    NSLog(@"path=%@,=imageName=%@",path,self.imageName);
//    return   [UIImage imageWithContentsOfFile:path];

    return [UIImage imageNamed:self.imageName];
}

@end
