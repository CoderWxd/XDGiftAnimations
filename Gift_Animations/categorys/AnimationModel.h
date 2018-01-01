//
//  AnimationModel.h
//  播放gif
//
//  Created by 王晓栋 on 2017/4/10.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AnimationModel.h"

#import "AnimationImageModel.h"
@class AnimationModel;
typedef void(^AnimationStopBlock)(AnimationModel *model);

@interface AnimationModel : NSObject
@property (nonatomic,strong)NSMutableArray <AnimationImageModel*>*imageModels;
@property (nonatomic,assign)CGFloat duration;
@property (nonatomic,assign)CGFloat delayDuration;
@property (nonatomic,assign)CGRect  animationFrame;
@property(nonatomic,strong)UIImageView *animationView;
@property (nonatomic,strong)UIView *superView;

@property(nonatomic,assign)int nameEnd;
@property(nonatomic,copy)NSString *imageName;

@property(nonatomic,copy)AnimationStopBlock animationStopBlock;

- (void)runQueue;

-(void)start;
-(void)stop;

@end
