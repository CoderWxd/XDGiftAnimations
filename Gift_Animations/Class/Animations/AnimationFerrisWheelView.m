//
//  AnimationFerrisWheelView.m
//  摩天轮
//
//  Created by 王晓栋 on 2017/6/26.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationFerrisWheelView.h"
#import "UIView+ESShortcut.h"
#import "AnimationModel.h"

@interface AnimationFerrisWheelView()
{
    
}
@property(nonatomic,strong)UIImageView *cloudImV1;
@property(nonatomic,strong)UIImageView *cloudImV2;
@property(nonatomic,strong)UIImageView *cloudImV3;
@property(nonatomic,strong)UIImageView *cloudImV4;

@property(nonatomic,strong)AnimationModel *animationModel;

@property(nonatomic,strong)UIImageView *ferrisWheelImV;
@end

@implementation AnimationFerrisWheelView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self customInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)customInit{
    self.userInteractionEnabled = NO;
    
    UIImage *image = [UIImage imageNamed:@"ferris_wheel1"];
    self.ferrisWheelImV = [[UIImageView alloc]initWithFrame:self.bounds];
    self.ferrisWheelImV.image = image;
    [self addSubview:self.ferrisWheelImV];
    ESWeakSelf;
    self.ferrisWheelImV.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        ESStrongSelf;
        _self.ferrisWheelImV.alpha = 1.0;
    }completion:^(BOOL finished) {
        ESStrongSelf;
        [_self startAnimation];
    }];
}

#define TOTAL_TIME 5

- (void)startAnimation{
    
    NSMutableArray<UIImage *> *images = [NSMutableArray<UIImage *> array];
    for (int i = 1; i < 30; ++i) {
        //        UIImage *img = [[AnimationImageCache shareInstance] getDriveImageWithName:[NSString stringWithFormat:@"drive_bull_run%02d.png", i]];
        NSString *imageN = [NSString stringWithFormat:@"ferris_wheel_%d.png", i];
        NSLog(@">>>>>>%@",imageN);
        UIImage *img = [UIImage imageNamed:imageN];
        if (img) {
            [images addObject:img];
        }
    }
    self.ferrisWheelImV.animationImages = images;
    self.ferrisWheelImV.animationDuration = 2.0;
    [self.ferrisWheelImV startAnimating];
    
    //ferris_wheel_cloud4
    //左边云
    UIImage *image = [UIImage imageNamed:@"ferris_wheel_cloud1"];
    float cloud1Width = image.size.width/2;
    float cloud1Height = image.size.height/2;
    self.cloudImV1 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2,ScreenHeight/2 -50, cloud1Width, cloud1Height)];
    self.cloudImV1.image = image;
    [self addSubview:self.cloudImV1];
    //下边云
    image = [UIImage imageNamed:@"ferris_wheel_cloud2"];
    float cloud2Width = image.size.width/2;
    float cloud2Height = image.size.height/2;
    self.cloudImV2 = [[UIImageView alloc]initWithFrame:CGRectMake(0,0 , cloud2Width, cloud2Height)];
    self.cloudImV2.top = self.cloudImV1.bottom - 20;
    self.cloudImV2.right = self.cloudImV1.left +40;
    self.cloudImV2.image = image;
    [self addSubview:self.cloudImV2];
    
    //左边云
    image = [UIImage imageNamed:@"ferris_wheel_cloud3"];
    float cloud3Width = image.size.width/2;
    float cloud3Height = image.size.height/2;
    self.cloudImV3 = [[UIImageView alloc]initWithFrame:CGRectMake(0,0 , cloud3Width, cloud3Height)];
    self.cloudImV3.top = self.cloudImV1.top;
    self.cloudImV3.right = self.cloudImV2.left +30;
    self.cloudImV3.image = image;
    [self addSubview:self.cloudImV3];
    
    // 上部云
    image = [UIImage imageNamed:@"ferris_wheel_cloud4"];
    float cloud4Width = image.size.width/2;
    float cloud4Height = image.size.height/2;
    self.cloudImV4 = [[UIImageView alloc]initWithFrame:CGRectMake(0,0 , cloud4Width, cloud4Height)];
    self.cloudImV4.bottom = self.cloudImV3.top;
    self.cloudImV4.left = self.cloudImV3.left -10;
    self.cloudImV4.image = image;
    [self addSubview:self.cloudImV4];
    
    self.cloudImV1.hidden = YES;
    self.cloudImV2.hidden = YES;
    self.cloudImV3.hidden = YES;
    self.cloudImV4.hidden = YES;
    [self startCloudMobile];
    
}
/**
 * 云彩移动
 */
- (void)startCloudMobile{
    
    self.cloudImV1.hidden = NO;
    self.cloudImV2.hidden = NO;
    self.cloudImV3.hidden = NO;
    self.cloudImV4.hidden = NO;
    self.cloudImV1.alpha = 0.0;
    self.cloudImV2.alpha = 0.0;
    self.cloudImV3.alpha = 0.0;
    self.cloudImV4.alpha = 0.0;
    
    ESWeakSelf;
    [UIView animateWithDuration:1.0 delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
        ESStrongSelf;
        _self.cloudImV1.alpha = 1.0;
        _self.cloudImV2.alpha = 1.0;
        _self.cloudImV3.alpha = 1.0;
        _self.cloudImV4.alpha = 1.0;
    } completion:^(BOOL finished) {
        ESStrongSelf;
        [_self playCloudPowderWithImageV:_self.cloudImV1 andCount:2];
        [_self playCloudPowderWithImageV:_self.cloudImV2 andCount:1];
        [_self playCloudPowderWithImageV:_self.cloudImV3 andCount:3];
        [_self playCloudPowderWithImageV:_self.cloudImV4 andCount:4];
        
        _self.alpha = 1.0;
        [UIView animateWithDuration:1.5 delay:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [_self.cloudImV1.layer removeAnimationForKey:@"cloudAnim2"];
            [_self.cloudImV2.layer removeAnimationForKey:@"cloudAnim1"];
            [_self.cloudImV3.layer removeAnimationForKey:@"cloudAnim3"];
            [_self.cloudImV4.layer removeAnimationForKey:@"cloudAnim4"];
            [_self.ferrisWheelImV stopAnimating];
            [_self removeFromSuperview];
            [_self callBackManager];
            
        }];

    }];
    

    
    
}

-(void)playCloudPowderWithImageV:(UIImageView *)imageView andCount:(int)count;
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 2.0;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setAutoreverses:YES];
    animation.removedOnCompletion = NO;//yes的话，又返回原位置了。
    animation.repeatCount = MAXFLOAT;
//    animation.beginTime = arc4random_uniform(10)/15.0;
    animation.fillMode = kCAFillModeBackwards;
    NSValue *p1 = [NSValue valueWithCGPoint:imageView.center];
    NSValue *p2 = nil;
    if (count % 2 == 0) {
        p2 = [NSValue valueWithCGPoint:CGPointMake(imageView.center.x + 60, imageView.centerY)];
    }else{
        p2 = [NSValue valueWithCGPoint:CGPointMake(imageView.center.x - 60, imageView.centerY)];
    }
    [animation setValues:@[p1,p2]];
    float times = arc4random_uniform(10)/15.0;
    NSLog(@"%.2f",times);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(times * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [imageView.layer addAnimation:animation forKey:[NSString stringWithFormat:@"cloudAnim%d",count]];
    });

    
    
    
}
#pragma mark - end

- (void)callBackManager{
    [LuxuManager sharedManager].isShowAnimation = NO;
    [[LuxuManager sharedManager] showLuxuryAnimation];
}


@end
