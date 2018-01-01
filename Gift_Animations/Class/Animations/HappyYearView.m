//
//  HappyYearView.m
//  飞升上神
//
//  Created by 王晓栋 on 2018/1/18.
//  Copyright © 2018年 com.qinqin.www. All rights reserved.
//

#import "HappyYearView.h"

#define const_time_duration 0.3
#define const_fires_explosion_time 1.0
@interface HappyYearView()
{
    UIImageView *_blossomLeftImV;
    UIImageView *_lanternLeftImV;
    UIImageView *_blossomRightImV;
    UIImageView *_lanternRightImV;
    UIImageView *_bottomImV;

    UIImageView *_happyYearImV;
    
    UIImageView *_fire1ImV;
    UIImageView *_fire2ImV;
    
}
@end

@implementation HappyYearView
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
    //Year_plum_blossom_left
    UIImage *blossomImg = [UIImage imageNamed:@"Year_plum_blossom_left"];
    _blossomLeftImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, blossomImg.size.width/3, blossomImg.size.height/3)];
    _blossomLeftImV.image = blossomImg;
    [self addSubview:_blossomLeftImV];
    _blossomLeftImV.hidden = YES;
    _blossomLeftImV.right = 0;

    //Year_lantern_left
    UIImage *lanternImg = [UIImage imageNamed:@"Year_lantern_left"];

   _lanternLeftImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, lanternImg.size.width/3, lanternImg.size.height/3)];
    _lanternLeftImV.image = lanternImg;
    [_blossomLeftImV addSubview:_lanternLeftImV];
    _lanternLeftImV.hidden = YES;
    _lanternLeftImV.centerX =_blossomLeftImV.width/2;
    
    //Year_plum_blossom_right
    UIImage *rightBlossomImg = [UIImage imageNamed:@"Year_plum_blossom_right"];
    _blossomRightImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, rightBlossomImg.size.width/3, rightBlossomImg.size.height/3)];
    _blossomRightImV.image = rightBlossomImg;
    [self addSubview:_blossomRightImV];
    _blossomRightImV.hidden = YES;
    _blossomRightImV.left = ScreenWidth;

    //Year_lantern_right
    UIImage *rightLanternImg = [UIImage imageNamed:@"Year_lantern_right"];
    _lanternRightImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rightLanternImg.size.width/3, rightLanternImg.size.height/3)];
    _lanternRightImV.image = rightLanternImg;
    [_blossomRightImV addSubview:_lanternRightImV];
    _lanternRightImV.hidden = YES;
    _lanternRightImV.right =_blossomRightImV.width;

    
    //Year_bottom
    UIImage *bottomImg = [UIImage imageNamed:@"Year_bottom"];
    _bottomImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bottomImg.size.width/3, bottomImg.size.height/3)];
    _bottomImV.image = bottomImg;
    [self addSubview:_bottomImV];
    _bottomImV.hidden = YES;
    _bottomImV.top = ScreenHeight;

    //Year_HappyYear1
    UIImage *happyYearImg = [UIImage imageNamed:@"Year_HappyYear1"];
    _happyYearImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, happyYearImg.size.width/3, happyYearImg.size.height/3)];
    _happyYearImV.image = happyYearImg;

    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 1 ; i <= 19; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Year_HappyYear%zd",i];
        UIImage *image = [UIImage imageNamed:imageName];

        if (image) {
            [images addObject:image];
        }
    }
    _happyYearImV.animationDuration = 3.0;
    _happyYearImV.animationImages = images;
    [self addSubview:_happyYearImV];
    _happyYearImV.hidden = YES;
    _happyYearImV.center =CGPointMake(ScreenWidth/2, ScreenHeight/2)  ;

    //Year_fire1
    UIImage *fireImg = [UIImage imageNamed:@"Year_fire1"];
    _fire1ImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, fireImg.size.width/3, fireImg.size.height/3)];
    _fire1ImV.image = fireImg;

    NSMutableArray *fireimages = [NSMutableArray array];
    for (NSInteger i = 1 ; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Year_fire%zd",i];
        UIImage *image = [UIImage imageNamed:imageName];

        if (image) {
            [fireimages addObject:image];
        }
    }
    _fire1ImV.animationDuration = 2.0;
    _fire1ImV.animationImages = fireimages;

    [self addSubview:_fire1ImV];
    _fire1ImV.hidden = YES;
    _fire1ImV.center =CGPointMake(ScreenWidth/2 + 30, 60);


    //Year_fire2
    _fire2ImV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, fireImg.size.width/3, fireImg.size.height/3)];
    _fire2ImV.image = fireImg;

    NSMutableArray *fire2images = [NSMutableArray array];
    for (NSInteger i = 1 ; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Year_fire%zd",i];
        UIImage *image = [UIImage imageNamed:imageName];

        if (image) {
            [fire2images addObject:image];
        }
    }
    _fire2ImV.animationDuration = 2.0;
    _fire2ImV.animationImages = fire2images;
    [self addSubview:_fire2ImV];
    _fire2ImV.hidden = YES;
    _fire2ImV.center =CGPointMake(60, 60);


    [self startAnimation];
}
- (void)startAnimation{
    _blossomLeftImV.hidden = NO;
    ESWeakSelf;
    [UIView animateWithDuration:1.5 animations:^{
        ESStrongSelf;
        _self -> _blossomLeftImV.left = 0;
    }completion:^(BOOL finished) {
        ESStrongSelf;
        _self -> _lanternLeftImV.hidden = NO;
         _self ->_lanternLeftImV.alpha = 0.0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESWeakSelf;
        [UIView animateWithDuration:2.0 animations:^{
            ESStrongSelf;
            _self -> _lanternLeftImV.alpha = 1.0;
            _self -> _lanternLeftImV.bottom += 40;
        }completion:^(BOOL finished) {

        }];

    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _blossomRightImV.hidden = NO;
        ESWeakSelf;
        [UIView animateWithDuration:2.0 animations:^{
            _blossomRightImV.right -= _blossomRightImV.width;
        }completion:^(BOOL finished) {
            ESStrongSelf;
            _self -> _lanternRightImV.hidden = NO;
           _self -> _lanternRightImV.alpha = 0.0;
            [UIView animateWithDuration:2.0 animations:^{
                ESStrongSelf;
               _self -> _lanternRightImV.alpha = 1.0;
               _self -> _lanternRightImV.bottom += 30;
            }completion:^(BOOL finished) {

            }];
        }];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _bottomImV.hidden = NO;
        [UIView animateWithDuration:2.0 animations:^{
            _bottomImV.top -= _bottomImV.height;
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playAetalsAnimationbirthRate:3.0 lifetime:1 imageName:@"Year_garden1"scale:0.13 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:2];
        [self playAetalsAnimationbirthRate:2.0 lifetime:2 imageName:@"Year_garden2" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:2];
        [self playAetalsAnimationbirthRate:4.0 lifetime:2 imageName:@"Year_garden3" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:2];
        [self playAetalsAnimationbirthRate:4.0 lifetime:2 imageName:@"Year_garden4" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:2];

    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [self playAetalsAnimationbirthRate:0.4 lifetime:8 imageName:@"Year_redleaves"scale:0.3 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:3];
//        [self playAetalsAnimationbirthRate:0.5 lifetime:7 imageName:@"Year_redleaves"scale:0.331 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:3];

        [self playAetalsAnimationbirthRate:1.9 lifetime:10 imageName:@"Year_blessing1" scale:0.31 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.2 withType:3];

        [self playAetalsAnimationbirthRate:0.3 lifetime:10 imageName:@"Year_blessing1" scale:0.01 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.2 withType:3];

        [self playAetalsAnimationbirthRate:1.4 lifetime:7 imageName:@"Year_blessing2" scale:0.24 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
        [self playAetalsAnimationbirthRate:0.2 lifetime:9 imageName:@"Year_blessing2" scale:0.1 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
//
        [self playAetalsAnimationbirthRate:0.8 lifetime:16 imageName:@"Year_blessing3" scale:0.1 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
//        [self playAetalsAnimationbirthRate:0.6 lifetime:17.3 imageName:@"Year_blessing3" scale:0.42 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
//
        [self playAetalsAnimationbirthRate:1 lifetime:10 imageName:@"Year_blessing4" scale:0.5 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
//
        [self playAetalsAnimationbirthRate:0.16 lifetime:10.5 imageName:@"Year_blessing4" scale:0.123 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
//
        [self playAetalsAnimationbirthRate:0.777 lifetime:13.44 imageName:@"Year_blessing5" scale:0.345 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
        [self playAetalsAnimationbirthRate:0.33 lifetime:11.4 imageName:@"Year_blessing5" scale:0.5 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];

    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(11 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playAnimationFirework];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _happyYearImV.hidden = NO;
        _happyYearImV.alpha = 0.0;
        [_happyYearImV startAnimating];
        [UIView animateWithDuration:0.1 animations:^{
            _happyYearImV.alpha = 1.0;
        }completion:^(BOOL finished) {
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_happyYearImV stopAnimating];
            [UIView animateWithDuration:2.0 animations:^{
                _happyYearImV.alpha = 0.0;

            }completion:^(BOOL finished) {
                [_happyYearImV removeFromSuperview];

            }];
        });
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(24.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ESWeakSelf;
        [UIView animateWithDuration:1.0 animations:^{
            ESStrongSelf;
            _self.alpha = 0.0;
        }completion:^(BOOL finished) {
            ESStrongSelf;
            [_self->_happyYearImV stopAnimating];
            [_self->_fire1ImV stopAnimating];
            [_self->_fire2ImV stopAnimating];
            [_self removeFromSuperview];
            [_self.layer removeAllAnimations];
            [_self callBackManager];
            _self = nil;
        }];
    });
}

#pragma mark 烟花

- (void)playAnimationFirework{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playFireWithImageName:@"Year_firework_3_" imageCount: 9 bottom: 100 left: 20];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playFireWithImageName:@"Year_firework_4_" imageCount: 9 bottom: 80 left: 120];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playFireWithImageName:@"Year_firework" imageCount: 16 bottom: 130 left: ScreenWidth/2];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playFireWithImageName:@"Year_firework_3_" imageCount: 9 bottom: 100 left: 20];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playFireWithImageName:@"Year_firework_4_" imageCount: 9 bottom: 80 left: 120];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playFireWithImageName:@"Year_firework_4_" imageCount: 9 bottom: 80 left: 120];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playFireWithImageName:@"Year_firework" imageCount: 16 bottom: 130 left: ScreenWidth/2];
    });
    _fire1ImV.hidden = NO;
    [_fire1ImV startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_fire1ImV stopAnimating];
        _fire1ImV.hidden = YES;

        _fire2ImV.hidden = NO;
        [_fire2ImV startAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_fire2ImV stopAnimating];
            _fire2ImV.hidden = YES;
        });
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _fire1ImV.hidden = NO;
        [_fire1ImV startAnimating];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_fire1ImV stopAnimating];
            _fire1ImV.hidden = YES;
            
            _fire2ImV.hidden = NO;
            [_fire2ImV startAnimating];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_fire2ImV stopAnimating];
                _fire2ImV.hidden = YES;
            });
        });

    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big1"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2  - meteorHeight/2, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big1"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2  - meteorHeight/2, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big2"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2  - meteorHeight/2, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big2"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2  - meteorHeight/2, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big3"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake(meteorWidth/2, ScreenHeight/2  - meteorHeight/2, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big3"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake(meteorWidth/2, ScreenHeight/2  - meteorHeight/2, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big4"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake( meteorWidth/5, ScreenHeight/2  - meteorHeight, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *firework_bigImage = [UIImage imageNamed:@"Year_firework_big4"];
        float meteorWidth = firework_bigImage.size.width/3;
        float meteorHeight = firework_bigImage.size.height/3;
        UIImageView *fireWorkBigImV = [[UIImageView alloc]initWithFrame:CGRectMake( meteorWidth/5, ScreenHeight/2  - meteorHeight, meteorWidth, meteorHeight)];
        fireWorkBigImV.image = firework_bigImage;
        [self addSubview:fireWorkBigImV];
        [self playColorFireworksWithCenter:CGPointMake(0, 0) withImage:fireWorkBigImV];
    });

}
- (void)playFireWithImageName:(NSString *)imageName imageCount:(NSInteger)count bottom:(CGFloat)bottom left:(CGFloat)left{
    
    
    //Year_firework_3_1
    UIImage *fireImg = [UIImage imageNamed:[NSString stringWithFormat:@"%@1",imageName]];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, fireImg.size.width/3, fireImg.size.height/3)];
    imageView.image = fireImg;
    NSMutableArray *fire2images = [NSMutableArray array];
    for (NSInteger i = 1 ; i <= count; i++) {
        NSString *imName = [NSString stringWithFormat:@"%@%zd",imageName,i];
        UIImage *image = [UIImage imageNamed:imName];
        
        if (image) {
            [fire2images addObject:image];
        }
    }
    imageView.animationDuration = 2.0;
    imageView.animationImages = fire2images;
    
    [self addSubview:imageView];
    [imageView startAnimating];
    imageView.bottom =ScreenHeight - bottom;
    imageView.left = left;
    [UIView animateWithDuration:2.0 animations:^{
        imageView.alpha = 0.0;
    }completion:^(BOOL finished) {
        [imageView stopAnimating];
        [imageView removeFromSuperview];
    }];
}


// 烟花绽放
- (void)playColorFireworksWithCenter:(CGPoint)centerPoint withImage:(UIImageView *)imageView{
    
    CAShapeLayer* circleLayer = [CAShapeLayer layer];
    circleLayer.fillColor = [UIColor clearColor].CGColor;//这个必须透明，因为这样内圆才是不透明的
    circleLayer.strokeColor = [UIColor yellowColor].CGColor;//注意这个不能透明，因为实际上是这个显示出后面的图片了
    circleLayer.path = [self pathWithDiameter:1 uiview:imageView].CGPath;
    imageView.layer.mask = circleLayer;
    
    //让圆的变大的动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    UIBezierPath *toPath = [self pathWithDiameter: sqrt(CGRectGetWidth(imageView.bounds)*CGRectGetWidth(imageView.bounds) + CGRectGetHeight(imageView.bounds) *CGRectGetHeight(imageView.bounds)) uiview:imageView];
    pathAnimation.toValue = (id)toPath.CGPath;
    pathAnimation.duration = const_time_duration;
    
    
    CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    lineWidthAnimation.toValue = @(sqrt(CGRectGetWidth(imageView.bounds)*CGRectGetWidth(imageView.bounds) + CGRectGetHeight(imageView.bounds) *CGRectGetHeight(imageView.bounds)));
    lineWidthAnimation.duration = const_time_duration;
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[pathAnimation, lineWidthAnimation];
    group.duration = const_time_duration;
    group.removedOnCompletion = NO;//这两句的效果是让动画结束后不会回到原处，必须加
    group.fillMode = kCAFillModeForwards;//这两句的效果是让动画结束后不会回到原处，必须加
    [circleLayer addAnimation:group forKey:@"revealAnimation"];
    
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = @(1.3);
    scaleAnimation.duration = const_fires_explosion_time;
    
    CABasicAnimation *fallAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    fallAnimation.toValue = @(imageView.layer.position.y + 2);
    fallAnimation.duration = const_fires_explosion_time;
    
    
    CAAnimationGroup *colorImageGroup = [CAAnimationGroup animation];
    colorImageGroup.animations = @[scaleAnimation, fallAnimation];
    colorImageGroup.duration = const_fires_explosion_time;
    colorImageGroup.removedOnCompletion = NO;
    colorImageGroup.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:colorImageGroup forKey:@"colorimageAnimation"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(const_fires_explosion_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            imageView.alpha = 0.0;
        }completion:^(BOOL finished) {
            [imageView.layer removeAnimationForKey:@"colorimageAnimation"];
            [imageView removeFromSuperview];
            
        }];
    });
}

/**
 *  根据直径生成圆的path，圆点是中心点
 */
- (UIBezierPath *)pathWithDiameter:(CGFloat)diameter uiview:(UIView *)uiview {
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake((CGRectGetWidth(uiview.bounds) - diameter) / 2, (CGRectGetHeight(uiview.bounds) - diameter) / 2, diameter, diameter)];
}

//粒子动画
- (void)playAetalsAnimationbirthRate:(float)birthRate lifetime:(float)lifetime imageName:(NSString *)imageName scale:(float)scale alphaRange:(float)alphaRange redRange:(float)redRange greenRange:(float)greenRange blueRange:(float)blueRange withType:(NSInteger )type{
    
    //粒子发射器
    CAEmitterLayer *cAEmitterLayer = [CAEmitterLayer layer];
    //粒子发射的位置
    if (type == 1) {
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, 0);
        
    }else if(type == 2){
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, ScreenHeight);
        
    }else if(type == 3){
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, -150);
        
    }
    //发射源的大小
    cAEmitterLayer.emitterSize        = CGSizeMake(ScreenWidth, 0.0);;
    //发射模式
    cAEmitterLayer.emitterMode        = kCAEmitterLayerOutline;
    //发射源的形状
    cAEmitterLayer.emitterShape    =kCAEmitterLayerLine;
    
    cAEmitterLayer.velocity = 1.0;
    
    cAEmitterLayer.spin = 1.0;
    //创建花瓣粒子
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    //粒子的名称
    emitterCell.name = @"chestnut";
    
    emitterCell.emissionLongitude =  M_PI / 2;
    
    //粒子参数的速度乘数因子。越大出现的越快
    emitterCell.birthRate        = birthRate;
    //存活时间
    emitterCell.lifetime        = lifetime;
    
    if (type == 3) {
        //粒子速度
        emitterCell.velocity        = 3;
        //粒子速度范围
        emitterCell.velocityRange = 10;
    }else{
        //粒子速度
        emitterCell.velocity   = -10;
        //粒子速度范围
        emitterCell.velocityRange = 5;
    }
    
    
    emitterCell.alphaSpeed = 0.3f;
    
    emitterCell.xAcceleration = 0;
    if (type == 1) {
        emitterCell.yAcceleration = 90;
        
    }else if(type == 2){
        emitterCell.yAcceleration = -90;
        
    }else if(type == 3){
        emitterCell.yAcceleration = 90;
        
    }
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
