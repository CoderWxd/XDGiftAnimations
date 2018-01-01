//
//  AnimationImageCache.m
//  qianchuo
//
//  Created by 林伟池 on 16/7/21.
//  Copyright © 2016年 www.0x123.com. All rights reserved.
//

#import "AnimationImageCache.h"

@interface AnimationImageCache()

@property (nonatomic , strong) NSCache *mImageCache;

@end

@implementation AnimationImageCache
//ES_SINGLETON_IMP(shareInstance);


#pragma mark - init

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mImageCache = [[NSCache alloc] init];
    }
    
    return self;
}

+ (instancetype)shareInstance {
    static id test;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        test = [[[self class] alloc] init];
    });
    return test;
}


#pragma mark - update



#pragma mark - get


- (UIImage *)getImageWithName:(NSString *)name {
    UIImage *ret;
    if (name) {
        NSString *path = [IMAGE_CACHE_BASE_PATH stringByAppendingString:name];
        ret = [self.mImageCache objectForKey:path];
        if (!ret) {
            ret = [UIImage imageWithContentsOfFile:path];
            if (ret) {
                [self.mImageCache setObject:ret forKey:path];
                NSLog(@"第一次.......");
            }
        }
    }
    
    return ret;
}


- (UIImage *)getDriveImageWithName:(NSString *)name {
    UIImage *ret;
    if (name) {
        NSString *path = [IMAGE_CACHE_DRIVE_PATH stringByAppendingString:name];
        ret = [self.mImageCache objectForKey:path];
        if (!ret) {
            ret = [UIImage imageWithContentsOfFile:path];
            if (ret) {
                [self.mImageCache setObject:ret forKey:path];
            }
        }
    }
    
    return ret;
}

- (UIImage *)getLoveImageWithName:(NSString *)name
{
    UIImage *ret;
    if (name) {
        NSString *path = [IMAGE_CACHE_LOVE_PATH stringByAppendingString:name];
        ret = [self.mImageCache objectForKey:path];
        if (!ret) {
            ret = [UIImage imageWithContentsOfFile:path];
            if (ret) {
                [self.mImageCache setObject:ret forKey:path];
            }
        }
    }
    
    return ret;

}

#pragma mark - message


@end
