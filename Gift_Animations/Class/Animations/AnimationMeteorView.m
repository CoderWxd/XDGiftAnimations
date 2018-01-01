//
//  AnimationMeteorView.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/11/15.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationMeteorView.h"
#define STATR_WIDHT_HEIGHT 30
#define SAMALL_STATR_WIDHT_HEIGHT 20
@interface AnimationMeteorView()
{
    UIImageView *_groundImV;
    UIImageView *_gound_starImV;
    UIImageView *_gound_starImV2;
    UIImageView *_startImV1;
    UIImageView *_startImV2;
    UIImageView *_startImV3;
    UIImageView *_small_startImV1;
    UIImageView *_small_startImV2;
    UIImageView *_small_startImV3;
    
    UIImageView *_roseImV;
    UIImageView *_leftButterImV;
    UIImageView *_rightButterImV;
}

@end

@implementation AnimationMeteorView
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
    UIImage *image = [UIImage imageNamed:@"meteor_backGround"];
    _groundImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _groundImV.image = image;
    [self addSubview:_groundImV];
    _groundImV.hidden = YES;

    image = [UIImage imageNamed:@"meteor_gound_star1"];
    _gound_starImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _gound_starImV.image = image;
    [self addSubview:_gound_starImV];
    _gound_starImV.hidden = YES;
    
    image = [UIImage imageNamed:@"meteor_gound_star2"];
    _gound_starImV2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _gound_starImV2.image = image;
    [self addSubview:_gound_starImV2];
    _gound_starImV2.hidden = YES;
    
    //星星
    image = [UIImage imageNamed:@"meteor_stat1"];
    _startImV1 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, STATR_WIDHT_HEIGHT, STATR_WIDHT_HEIGHT)];
    _startImV1.image = image;
    [self addSubview:_startImV1];
    

    image = [UIImage imageNamed:@"meteor_stat2"];

    _startImV2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 80, STATR_WIDHT_HEIGHT, STATR_WIDHT_HEIGHT)];
    _startImV2.image = image;
    [self addSubview:_startImV2];

    image = [UIImage imageNamed:@"meteor_stat3"];
    _startImV3 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 + 20, 30, STATR_WIDHT_HEIGHT, STATR_WIDHT_HEIGHT)];
    _startImV3.image = image;
    [self addSubview:_startImV3];

    image = [UIImage imageNamed:@"meteor_stat4"];

    _small_startImV1 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -SAMALL_STATR_WIDHT_HEIGHT - 20, 80, SAMALL_STATR_WIDHT_HEIGHT, SAMALL_STATR_WIDHT_HEIGHT)];
    _small_startImV1.image = image;
    [self addSubview:_small_startImV1];

    image = [UIImage imageNamed:@"meteor_stat5"];

    _small_startImV2 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-SAMALL_STATR_WIDHT_HEIGHT- 40, 20, SAMALL_STATR_WIDHT_HEIGHT, SAMALL_STATR_WIDHT_HEIGHT)];
    _small_startImV2.image = image;
    [self addSubview:_small_startImV2];
    image = [UIImage imageNamed:@"meteor_stat6"];
    _small_startImV3 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-SAMALL_STATR_WIDHT_HEIGHT- 30, 70, SAMALL_STATR_WIDHT_HEIGHT, SAMALL_STATR_WIDHT_HEIGHT)];
    _small_startImV3.image = image;
    [self addSubview:_small_startImV3];

    //玫瑰

    image = [UIImage imageNamed:@"meteor_rose1"];
    float rosewidth_height = ScreenWidth/2;
    _roseImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - rosewidth_height/2, ScreenHeight -rosewidth_height - 60 , rosewidth_height, rosewidth_height)];
    _roseImV.image = image;
    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for (NSInteger i = 1; i <= 10 ; i++) {
        NSString *imageName = [NSString stringWithFormat:@"meteor_rose%zd",i];
        UIImage *roseImage = [UIImage imageNamed:imageName];
        if (roseImage) {
            [images addObject:roseImage];
        }
    }
    _roseImV.animationImages =images;
    _roseImV.animationDuration = 3.5f;
    [self addSubview:_roseImV];


    image = [UIImage imageNamed:@"meteor_yellow_butterfly1"];
    float butterWidth = image.size.width/3;
    float butterHeight = image.size.height/3;
    _leftButterImV = [[UIImageView alloc] initWithFrame:CGRectMake(-butterWidth,self.height - 80, butterWidth, butterHeight)];
    _leftButterImV.image = image;
    [self addSubview:_leftButterImV];
    _leftButterImV.hidden = YES;
    UIImage *butter_Fly1 = [UIImage imageNamed:@"meteor_yellow_butterfly1"];
    UIImage *butter_Fly2 = [UIImage imageNamed:@"meteor_yellow_butterfly2"];
    if (butter_Fly1 && butter_Fly2) {
        _leftButterImV.animationImages =@[butter_Fly1,butter_Fly2];
        _leftButterImV.animationDuration = .8f;
    }
    [_leftButterImV startAnimating];


    image = [UIImage imageNamed:@"meteor_purple_butterfly1"];
    float right_butterWidth = image.size.width/3;
    float right_butterHeight = image.size.height/3;
    _rightButterImV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth ,self.height - 80, right_butterWidth, right_butterHeight)];
    _rightButterImV.image = image;
    [self addSubview:_rightButterImV];
    _rightButterImV.hidden = YES;
    UIImage *right_butter_Fly1 = [UIImage imageNamed:@"meteor_purple_butterfly1"];
    UIImage *right_butter_Fly2 = [UIImage imageNamed:@"meteor_purple_butterfly2"];
    if (right_butter_Fly1 && right_butter_Fly2) {
        _rightButterImV.animationImages =@[right_butter_Fly1,right_butter_Fly2];
        _rightButterImV.animationDuration = .8f;
    }
    [_rightButterImV startAnimating];
    
    _startImV1.hidden = YES;
    _startImV2.hidden = YES;
    _startImV3.hidden = YES;
    _small_startImV1.hidden = YES;
    _small_startImV2.hidden = YES;
    _small_startImV3.hidden = YES;
    _roseImV.hidden = YES;

    [self startAnimation];
    
    
}
- (void)startAnimation{
    _groundImV.hidden = NO;
    _gound_starImV.hidden = NO;
    _gound_starImV2.hidden = NO;
    _groundImV.alpha = 0.0;
    _gound_starImV.alpha = 0.0;
    _gound_starImV2.alpha = 0.0;
    
    _startImV1.hidden = NO;
    _startImV2.hidden = NO;
    _startImV3.hidden = NO;
    _small_startImV1.hidden = NO;
    _small_startImV2.hidden = NO;
    _small_startImV3.hidden = NO;
    
    _startImV1.alpha = 0.0;
    _startImV2.alpha = 0.0;
    _startImV3.alpha = 0.0;
    _small_startImV1.alpha = 0.0;
    _small_startImV2.alpha = 0.0;
    _small_startImV3.alpha = 0.0;
    
    _roseImV.hidden = NO;
    _roseImV.alpha = 0.0;

    ESWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            _groundImV.alpha = 1.0;
            _gound_starImV.alpha = 1.0;
            _gound_starImV2.alpha = 0.0;

        }completion:^(BOOL finished) {
            ESStrongSelf;
            [_self startAnimaStarflashingWithTypeNum:1 withImageV:_gound_starImV];
            [_self startAnimaStarflashingWithTypeNum:2 withImageV:_gound_starImV2];

            [UIView animateWithDuration:0 delay:2.0 options:UIViewAnimationOptionRepeat animations:^{
            } completion:^(BOOL finished) {
            }];
            
        }];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            _startImV1.alpha = 1.0;
            _startImV2.alpha = 1.0;
            _startImV3.alpha = 1.0;
            _small_startImV1.alpha = 1.0;
            _small_startImV2.alpha = 1.0;
            _small_startImV3.alpha = 1.0;
        }completion:^(BOOL finished) {
            
            ESStrongSelf;
            [_self startAnimaStarflashingWithTypeNum:3 withImageV:_startImV1];
            [_self startAnimaStarflashingWithTypeNum:3 withImageV:_startImV2];
            [_self startAnimaStarflashingWithTypeNum:3 withImageV:_startImV3];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_self startAnimaStarflashingWithTypeNum:4 withImageV:_small_startImV1];
                [_self startAnimaStarflashingWithTypeNum:4 withImageV:_small_startImV2];
                [_self startAnimaStarflashingWithTypeNum:4 withImageV:_small_startImV3];
            });
            [UIView animateWithDuration:0 delay:2.0 options:UIViewAnimationOptionRepeat animations:^{
            } completion:^(BOOL finished) {
     

            }];
         
        }];
    });
  
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playMeteorAnimation ];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                _roseImV.alpha = 1.0;
            }completion:^(BOOL finished) {
                [_roseImV startAnimating];
            }];
        });

    });
    //左边蝴蝶
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _leftButterImV.hidden = NO;
        CGRect frame = _leftButterImV.frame;
        _leftButterImV.transform = CGAffineTransformMakeScale(0.1, 0.1);
        frame.origin.x += 110;
        frame.origin.y -= 150;
        ESWeakSelf;
        [UIView animateWithDuration:3.0 animations:^{
            ESStrongSelf;
            _leftButterImV.transform = CGAffineTransformMakeScale(1.0, 1.0);
            _leftButterImV.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
        
    });
    
    //右边蝴蝶
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _rightButterImV.hidden = NO;
        CGRect frame = _rightButterImV.frame;
        _rightButterImV.transform = CGAffineTransformMakeScale(0.1, 0.1);
        frame.origin.x -= 110;
        frame.origin.y -= 200;
        ESWeakSelf;
        [UIView animateWithDuration:3.0 animations:^{
            ESStrongSelf;
            _rightButterImV.transform = CGAffineTransformMakeScale(1.0, 1.0);
            _rightButterImV.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
        
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESWeakSelf;

        [UIView animateWithDuration:2.0 animations:^{
            ESStrongSelf;
            _self.alpha=0.0;
        }completion:^(BOOL finished) {
            ESStrongSelf;
            [_self.layer removeAllAnimations];
            [_self callBackManager];
            [_self removeFromSuperview];
            _self = nil;
        }];
    });
}

#pragma mark 闪烁
- (void)startAnimaStarflashingWithTypeNum:(NSInteger)typeNum withImageV:(UIImageView *)imageV{
    if (typeNum == 1) {
        CAKeyframeAnimation *opacityAnimation;
        opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@(1.0),@(0.8),@(0.6),@(0.6),@(0.4),@(0.2),@(0.0),@(0.2),@(0.4),@(0.6),@(0.6),@(0.8),@(1.0)];
        opacityAnimation.duration = 1;
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.calculationMode = kCAAnimationCubic;
        opacityAnimation.repeatCount = HUGE_VALF;
        opacityAnimation.removedOnCompletion = YES;
        float customeNumber= (float)(1+arc4random()%99)/100;
        
        [imageV.layer addAnimation:opacityAnimation forKey: [NSString stringWithFormat:@"opacityAnimation%.2f",customeNumber]];

    }else if (typeNum == 2) {
        CAKeyframeAnimation *opacityAnimation;
        opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@(0.2),@(0.4),@(0.6),@(0.8),@(1.0),@(1.0),@(0.8),@(0.6),@(0.4),@(0.2)];
        opacityAnimation.duration = 1.0;
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.calculationMode = kCAAnimationCubic;
        opacityAnimation.repeatCount = HUGE_VALF;
        opacityAnimation.removedOnCompletion = YES;
        float customeNumber= (float)(1+arc4random()%99)/100;
        [imageV.layer addAnimation:opacityAnimation forKey: [NSString stringWithFormat:@"opacityAnimation%.2f",customeNumber]];
    }else if (typeNum == 3) {
        CAKeyframeAnimation *opacityAnimation;
        opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@(1.0),@(1.0),@(1.0),@(0.8),@(0.6),@(0.4),@(0.6),@(0.8),@(1.0),@(1.0),@(1.0)];
        opacityAnimation.duration = 1.8;
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.calculationMode = kCAAnimationCubic;
        opacityAnimation.repeatCount = HUGE_VALF;
        opacityAnimation.removedOnCompletion = YES;
        float customeNumber= (float)(1+arc4random()%99)/100;
        [imageV.layer addAnimation:opacityAnimation forKey: [NSString stringWithFormat:@"opacityAnimation%.2f",customeNumber]];
    }else if (typeNum == 4) {
        CAKeyframeAnimation *opacityAnimation;
        opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@(1.0),@(1.0),@(1.0),@(0.8),@(0.6),@(0.4),@(0.6),@(0.8),@(1.0),@(1.0),@(1.0)];
        opacityAnimation.duration = 2.0;
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.calculationMode = kCAAnimationCubic;
        opacityAnimation.repeatCount = HUGE_VALF;
        opacityAnimation.removedOnCompletion = YES;
        float customeNumber= (float)(1+arc4random()%99)/100;
        [imageV.layer addAnimation:opacityAnimation forKey: [NSString stringWithFormat:@"opacityAnimation%.2f",customeNumber]];
    }
    
    
    
}


/**
 *   2、流星划过、月亮出现、云彩飘动
 */
- (void)playMeteorAnimation {
    
    for (int i = 0; i < 100; ++i) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((i * 0.3) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addOneMeteorWithSourcePoint:CGPointMake(arc4random_uniform(100) + (i % 2) * 200 + self.width, -170)];
        });
    }
}

- (void)addOneMeteorWithSourcePoint:(CGPoint)sourcePoint {
    int imageNumber = arc4random()%2 + 1;
    NSLog(@"imageNumber=%d",imageNumber);
    UIImage *image;
    if (imageNumber == 1) {
        image = [UIImage imageNamed:@"meteror1"];
    }else if (imageNumber == 2){
        image = [UIImage imageNamed:@"meteror2"];
    }else{
        image = [UIImage imageNamed:@"meteror3"];
    }
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width / 2, image.size.height / 2)];
    [imageView setImage:image];
    [self addSubview:imageView];
    imageView.center = sourcePoint;
    float scale = arc4random_uniform(5) * 0.1 + 0.5;
    imageView.transform = CGAffineTransformMakeScale(scale, scale);
    [UIView animateWithDuration:1.5 + scale delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.center = CGPointMake(-250, sourcePoint.x + 250 - 170);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
    
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
