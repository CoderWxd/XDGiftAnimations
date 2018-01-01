//
//  AnimationChestnutView.m
//  栗子动画
//
//  Created by 王晓栋 on 2017/6/23.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationChestnutView.h"

@implementation AnimationChestnutView

- (void)dealloc{
    NSLog(@"%s",__func__);
}
- (instancetype)init{
    if (self = [super init]) {
        [self customUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self customUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self customUI];
        
    }
    return self;
}

- (void)customUI{
    self.userInteractionEnabled = NO;
    [self playAetalsAnimationbirthRate:4.0 lifetime:5.0 imageName:@"chestnut0"scale:0.13 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13];
    [self playAetalsAnimationbirthRate:2.0 lifetime:4.0 imageName:@"chestnut1" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12];
    [self playAetalsAnimationbirthRate:3.0 lifetime:3.0 imageName:@"chestnut2"scale:0.28 alphaRange:0.3 redRange:0.6 greenRange:0.9 blueRange:0.1];
    [self playAetalsAnimationbirthRate:1.0 lifetime:6.0 imageName:@"chestnut3" scale:0.23 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11];
    [self playAetalsAnimationbirthRate:.4 lifetime:3.1 imageName:@"chestnut4" scale:0.14 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11];
    [self playAetalsAnimationbirthRate:.5 lifetime:2.2 imageName:@"chestnut5" scale:0.19 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11];
    
    ESWeakSelf;
    self.alpha = 1.0;
    [UIView animateWithDuration:2.0 delay:3.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        ESStrongSelf;
        _self.alpha = 0.0;
    } completion:^(BOOL finished) {
        ESStrongSelf
        [_self removeFromSuperview];
        [_self callBackManager];
        
    }];
}
//粒子动画
- (void)playAetalsAnimationbirthRate:(float)birthRate lifetime:(float)lifetime imageName:(NSString *)imageName scale:(float)scale alphaRange:(float)alphaRange redRange:(float)redRange greenRange:(float)greenRange blueRange:(float)blueRange{
    
    //粒子发射器
    CAEmitterLayer *cAEmitterLayer = [CAEmitterLayer layer];
    //粒子发射的位置
    cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, 0);
    //发射源的大小
    cAEmitterLayer.emitterSize        = CGSizeMake(ScreenWidth, 0.0);;
    //发射模式
    cAEmitterLayer.emitterMode        = kCAEmitterLayerOutline;
    //发射源的形状
    cAEmitterLayer.emitterShape    =kCAEmitterLayerLine;
    cAEmitterLayer.velocity = 5.0;
    cAEmitterLayer.spin = 3.0;
    //创建花瓣粒子
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    //粒子的名称
    emitterCell.name = @"chestnut";
    
    //粒子参数的速度乘数因子。越大出现的越快
    emitterCell.birthRate        = birthRate;
    //存活时间
    emitterCell.lifetime        = lifetime;
    //粒子速度
    emitterCell.velocity        = 10;
    //粒子速度范围
    emitterCell.velocityRange = 10;
    emitterCell.alphaSpeed = 0.3f;

    emitterCell.xAcceleration = 0;
    emitterCell.yAcceleration = 90;
    emitterCell.zAcceleration = 0;
    //周围发射角度
    emitterCell.emissionRange =  M_PI;        // some variation in angle
    //子旋转角度范围
    emitterCell.spinRange        = 0.25 * M_PI;        // slow spin
    //粒子图片
    emitterCell.contents        = (id) [[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]] CGImage];
    emitterCell.scale = scale;
    // 将粒子添加到粒子发射器上
    cAEmitterLayer.emitterCells = [NSArray arrayWithObject:emitterCell];
    [self.layer addSublayer:cAEmitterLayer];
}
#pragma mark - end

- (void)callBackManager{
    [LuxuManager sharedManager].isShowAnimation = NO;
    [[LuxuManager sharedManager] showLuxuryAnimation];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
