//
//  AnimationModel.m
//  播放gif
//
//  Created by 王晓栋 on 2017/4/10.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationModel.h"


@interface AnimationModel ()
{
    NSTimer *_timer;
    NSInteger _imageIndex;
    NSMutableArray *_animationModelArr;
    NSMutableArray *_imageModels;
}

@end

@implementation AnimationModel

-(instancetype)init{
    if (self = [super init]) {
        _animationView = [[UIImageView alloc]init];
        _animationView.backgroundColor = [UIColor clearColor];
        _animationView.contentMode = UIViewContentModeScaleAspectFit;
        _imageModels = [NSMutableArray array];
    }
    return self;
}

-(void)runQueue{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSInteger i = 1; i < self.nameEnd; i++) {
        AnimationImageModel *model = [[AnimationImageModel alloc]init];
        model.imageName = [NSString stringWithFormat:@"%@%@",self.imageName,@(i)];
        NSLog(@">>>>>>>:%@",model.imageName);
        [array addObject:model];
    }
    _imageModels = array;
    
    if (_imageModels && _imageModels.count > 0) {
        [self start];
    }
}

-(void)start{
    
    if (self.superView == nil)return;
    if (self.duration  < 0.25)return;
    if (self.imageModels.count == 0)return;
    if (CGRectEqualToRect(self.animationFrame, CGRectZero))return;
    _animationView.frame = self.animationFrame;
    [self.superView addSubview:_animationView];
    
    [self timerStop];
    
    NSTimeInterval interval = self.duration / _imageModels.count * 1.0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                              target:self
                                            selector:@selector(timerRun:)
                                            userInfo:nil
                                             repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    if ([_timer isValid]) {
        [_timer fire];
    }
}

-(void)timerRun:(NSTimer *)timer{
    if (_imageIndex >= self.imageModels.count - 1) {
        [self stop];
        return;
    }
    AnimationImageModel *imageModel = [self.imageModels objectAtIndex:_imageIndex];
    _animationView.image = imageModel.image;
    _imageIndex ++;
}

-(void)timerStop{
    if (_timer && [_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
}

-(void)stop{
    [self timerStop];
    if (self.animationStopBlock) {
        self.animationStopBlock(self);
    }
    _imageIndex = 0;
}


@end
