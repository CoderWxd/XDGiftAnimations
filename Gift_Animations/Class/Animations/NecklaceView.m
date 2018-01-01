//
//  NecklaceView.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/6/30.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "NecklaceView.h"

@interface NecklaceView()
@property(nonatomic,strong)UIImageView *necklaceBroImV;
@property(nonatomic,strong)UIImageView *elementImV;
@property(nonatomic,strong)UIImageView *smalRoundBroImV;
@property(nonatomic,strong)UIImageView *bigRoundBroImV;


@end
@implementation NecklaceView

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
    self.backgroundColor = [UIColor clearColor];
    // 底图
    UIImage *image = [UIImage imageNamed:@"necklace_star"];

    self.necklaceBroImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, self.width, self.height)];
    self.necklaceBroImV.image = image;
    [self addSubview:self.necklaceBroImV];
    
    // 项链 necklace_element
    image = [UIImage imageNamed:@"necklace_element"];
    float elementWidth = image.size.width/2;
    float elementHeight = image.size.height/2;
    self.elementImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2 - elementWidth/2,self.height/2 - elementHeight/2, elementWidth, elementHeight)];
    self.elementImV.image = image;
    [self addSubview:self.elementImV];
    
    //小圈 necklace_big_round
    image = [UIImage imageNamed:@"necklace_big_round"];
    float smalRoundWidth = image.size.width/2;
    float smalRoundHeight = image.size.height/2;
    self.smalRoundBroImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2 - smalRoundWidth/2,self.height/2 -38, smalRoundWidth, smalRoundHeight)];
    self.smalRoundBroImV.image = image;
    [self addSubview:self.smalRoundBroImV];
    self.smalRoundBroImV.alpha = 0.0;
    self.smalRoundBroImV.transform = CGAffineTransformScale(self.smalRoundBroImV.transform, 0.4, 0.4);
    self.smalRoundBroImV.transform = CGAffineTransformRotate (self.smalRoundBroImV.transform, - M_PI/6.5);
    //大圆 necklace_big_round
    image = [UIImage imageNamed:@"necklace_big_round"];
    float bigRoundWidth = image.size.width/2;
    float bigRoundHeight = image.size.height/2;
    self.bigRoundBroImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2 - bigRoundWidth/2,self.height/2 -38, bigRoundWidth, bigRoundHeight)];
    self.bigRoundBroImV.image = image;
    [self addSubview:self.bigRoundBroImV];
    self.bigRoundBroImV.alpha = 0.0;

    
    self.alpha = 0.0;
    [UIView animateWithDuration:1.5 animations:^{
    self.alpha = 1.0;
    }completion:^(BOOL finished) {
        [self startAnimation];
    }];

    
}
- (void)startAnimation{
    [self startAnimaStarflashing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            self.bigRoundBroImV.alpha = 1.0;
        }completion:^(BOOL finished) {
            
            [self startAnimationRotationAndScal];
        }];

    });

}


#pragma mark - 大圆缩小消失,小圆出现

- (void)startAnimationRotationAndScal{
    // 旋转缩放
    [UIView animateWithDuration:2.0 animations:^{
            self.bigRoundBroImV.transform = CGAffineTransformRotate (self.bigRoundBroImV.transform, - M_PI/6.5);
    }];
    [UIView animateWithDuration:2.3 animations:^{
    
        self.bigRoundBroImV.transform = CGAffineTransformScale(self.bigRoundBroImV.transform, 0.4, 0.4);
     
    }completion:^(BOOL finished) {
    }];
    [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.bigRoundBroImV.alpha = 0.0;
    } completion:^(BOOL finished) {
        
    }];
    
    self.smalRoundBroImV.alpha = 0.0;
    [UIView animateWithDuration:3.0 animations:^{

        self.smalRoundBroImV.alpha = 1.0;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            self.bigRoundBroImV.alpha = 0.0;
        } completion:^(BOOL finished) {
                 [self endAnimation];
        }];
    }];
}

#pragma mark -  结束

- (void)endAnimation{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self callBackManager];
        [self removeFromSuperview];
        
    }];
}

#pragma mark -  星星闪烁

- (void)startAnimaStarflashing{
    
    CAKeyframeAnimation *opacityAnimation;
    opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@(1.0),@(0.8),@(1.0),@(0.8)];
    opacityAnimation.duration = 1.0;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.calculationMode = kCAAnimationCubic;
    opacityAnimation.repeatCount = HUGE_VALF;
    opacityAnimation.removedOnCompletion = YES;
    [self.necklaceBroImV.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

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
