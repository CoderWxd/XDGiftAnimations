//
//  AnimationMapWoView.m
// 枫林晚
//
//  Created by 王晓栋 on 2017/7/17.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationMapWoView.h"
typedef NS_ENUM(NSInteger, MapWoStarType) {
    MapWoStarType0,
    MapWoStarType1,
};

#define const_time_duration 3.0

@interface AnimationMapWoView()
{
    UIView *backgroundView;
    UIImageView *thelakeImv;
    UIImageView *sparkImv;
    UIImageView *goldenlakeImv;
    UIImageView *bridgeImv;
    UIImageView *topLeftTreeImv;
    UIImageView *leftTreeImV;
    UIImageView *tRTreeImV;
    UIImageView *roadImv;
    UIImageView *bridgetreeImv;
    UIImageView *rightTree1ImV;
    UIImageView *rightTree2ImV;
    UIImageView *rightTree3ImV;
    UIImageView *sunImV;
    UIImageView *womanImV;
    UIImageView *manImV;
}
@end

@implementation AnimationMapWoView
/**
 * 右树,渐隐出现,男 女 骑车会合
 * 星星出现
 * 星星闪烁,循环移动
 * 烛面闪亮
 */

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
    
    //backgroundView
    backgroundView = [[UIView alloc]initWithFrame:self.bounds];
    backgroundView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
    [self addSubview:backgroundView];
    // 湖水闪光 mapwo_sparkling
    UIImage * image = [UIImage imageNamed:@"mapwo_sparkling"];
    sparkImv = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.width,self.height)];
    sparkImv.image = image;
    [backgroundView addSubview:sparkImv];
    //星星
    [self playStarWithType:MapWoStarType0];
    [self playStarWithType:MapWoStarType1];
    
    //mapwo_thelake
    image = [UIImage imageNamed:@"mapwo_thelake"];
    float imageHeight = image.size.height/2;
    thelakeImv = [[UIImageView alloc]initWithFrame:CGRectMake(0,self.height - imageHeight - 100,self.width,imageHeight)];
    thelakeImv.image = image;
    [backgroundView addSubview:thelakeImv];
    
    
    //烛光 mapwo_goldenlake
    image = [UIImage imageNamed:@"mapwo_goldenlake"];
    float goldeHeight = image.size.height/4;
    goldenlakeImv = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.width,goldeHeight)];
    goldenlakeImv.image = image;
    [backgroundView addSubview:goldenlakeImv];
    goldenlakeImv.bottom = thelakeImv.top +220;
    
    //太阳 mapwo_sun
    image = [UIImage imageNamed:@"mapwo_sun"];
    float sunWidth = image.size.width/3;
    float sunHeight = image.size.height/3;
    sunImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2,20,sunWidth,sunHeight)];
    sunImV.image = image;
    [backgroundView addSubview:sunImV];
    
    //右下 mapwo_righttree1
    image = [UIImage imageNamed:@"mapwo_righttree1"];
    float righttree1Width = image.size.width/3;
    float righttree1Height = image.size.height/3;
    rightTree1ImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - righttree1Width,0,righttree1Width,righttree1Height)];
    rightTree1ImV.image = image;
    [backgroundView addSubview:rightTree1ImV];
    
    rightTree1ImV.bottom = thelakeImv.top+ 50;
    
    //右下左 mapwo_righttree2
    image = [UIImage imageNamed:@"mapwo_righttree2"];
    float righttree2Width = image.size.width/3;
    float righttree2Height = image.size.height/3;
    rightTree2ImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - righttree2Width,0,righttree2Width,righttree2Height)];
    rightTree2ImV.image = image;
    [backgroundView addSubview:rightTree2ImV];
    rightTree2ImV.right = self.width;
    rightTree2ImV.bottom = thelakeImv.top+ 30;
    
    //右下左 mapwo_righttree3
    image = [UIImage imageNamed:@"mapwo_righttree2"];
    float righttree3Width = image.size.width/7;
    float righttree3Height = image.size.height/7;
    rightTree3ImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - righttree3Width,0,righttree3Width,righttree3Height)];
    rightTree3ImV.image = image;
    [backgroundView addSubview:rightTree3ImV];
    rightTree3ImV.right = rightTree2ImV.left+ 40;
    rightTree3ImV.bottom = thelakeImv.top+ 30;
    
    
    //右路 mapwo_road
    image = [UIImage imageNamed:@"mapwo_road"];
    float roadWidth = image.size.width/4;
    float roadHeight = image.size.height/4;
    roadImv = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - roadWidth,0,roadWidth,roadHeight)];
    roadImv.image = image;
    [backgroundView addSubview:roadImv];
    roadImv.bottom = thelakeImv.top+ 120;
    
    //桥下的树 mapwo_bridgetree
    image = [UIImage imageNamed:@"mapwo_bridgetree"];
    float bridgetreeWidth = image.size.width/3.5;
    float bridgetreeHeight = image.size.height/4.5;
    bridgetreeImv = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - bridgetreeHeight - 50,0,bridgetreeWidth,bridgetreeHeight)];
    bridgetreeImv.image = image;
    [backgroundView addSubview:bridgetreeImv];
    bridgetreeImv.top = thelakeImv.top+ 80;
    
    //女生🚗 mapwo_woman
    image = [UIImage imageNamed:@"mapwo_woman"];
    float womanWidth = image.size.width/3;
    float womanHeight = image.size.height/3;
    womanImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,womanWidth,womanHeight)];
    womanImV.image = image;
    [backgroundView addSubview:womanImV];
    womanImV.top = thelakeImv.top +40;
    womanImV.right = 0;
    //男生 mapwo_man
    image = [UIImage imageNamed:@"mapwo_man"];
    float manWidth = image.size.width/3;
    float manHeight = image.size.height/3;
    manImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,manWidth,manHeight)];
    manImV.image = image;
    [backgroundView addSubview:manImV];
    manImV.top = thelakeImv.top +40;
    manImV.left = self.width;
    
    
    //mapwo_bridge 桥
    image = [UIImage imageNamed:@"mapwo_bridge"];
    float bridgeHeight = image.size.height/3;
    bridgeImv = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.width,bridgeHeight)];
    bridgeImv.image = image;
    [backgroundView addSubview:bridgeImv];
    bridgeImv.top = thelakeImv.top +50;
    
    //左上🌲 mapwo_toplefttree
    image = [UIImage imageNamed:@"mapwo_toplefttree"];
    float topLeftTreeWidth = image.size.width/4;
    float topLeftTreeHeight = image.size.height/4;
    topLeftTreeImv = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,topLeftTreeWidth,topLeftTreeHeight)];
    topLeftTreeImv.image = image;
    [backgroundView addSubview:topLeftTreeImv];
    topLeftTreeImv.left -= 100;
    
    //左下🌲 mapwo_lefttree
    image = [UIImage imageNamed:@"mapwo_lefttree"];
    float leftTreeWidth = image.size.width/3;
    float leftTreeHeight = image.size.height/3;
    leftTreeImV = [[UIImageView alloc]initWithFrame:CGRectMake(0,bridgeImv.top,leftTreeWidth,leftTreeHeight)];
    leftTreeImV.image = image;
    [backgroundView addSubview:leftTreeImV];
    leftTreeImV.left -= 110;
    
    //右上 mapwo_toprighttree
    image = [UIImage imageNamed:@"mapwo_toprighttree"];
    float trTreeWidth = image.size.width/3;
    float trTreeHeight = image.size.height/3;
    tRTreeImV = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - trTreeWidth,-trTreeHeight,trTreeWidth,trTreeHeight)];
    tRTreeImV.image = image;
    [backgroundView addSubview:tRTreeImV];
    
    backgroundView.hidden = YES;
    topLeftTreeImv.hidden = YES;
    leftTreeImV.hidden = YES;
    tRTreeImV.hidden = YES;
    roadImv.hidden = YES;
    bridgetreeImv.hidden = YES;
    rightTree1ImV.hidden = YES;
    rightTree2ImV.hidden = YES;
    rightTree3ImV.hidden = YES;
    sunImV.hidden = YES;
    sparkImv.hidden = YES;
    
    [self startAnimation];
}



/**
 * 湖面,桥,桑树出现,
 */
- (void)startAnimation{
    backgroundView.hidden = NO;
    backgroundView.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        backgroundView.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        topLeftTreeImv.alpha = 0.3;
        topLeftTreeImv.hidden = NO;
        leftTreeImV.hidden = NO;
        tRTreeImV.hidden = NO;
        [UIView animateWithDuration:1.0 animations:^{
            topLeftTreeImv.alpha = 1.0;
            topLeftTreeImv.left += 100;
            leftTreeImV.left += 100;
            tRTreeImV.bottom += 80;
            
        }];
        roadImv.hidden = NO;
        roadImv.alpha = 0.0;
        [UIView animateWithDuration:0.5 delay:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
            roadImv.alpha = 1.0;
        } completion:^(BOOL finished) {
            [self startTreeAppear];
        }];
        sunImV.hidden = NO;
        sunImV.alpha = 0.0;
        [UIView animateWithDuration:0.5 delay:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
            sunImV.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 animations:^{
                sunImV.bottom += 70;
            }];
            
        }];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sparkImv.hidden = NO;
        sparkImv.alpha = 0.0;
        [UIView animateWithDuration:1.0 animations:^{
            sparkImv.alpha = 1.0;
        }completion:^(BOOL finished) {
            [self playSaprkFlashing];
        }];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(13.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            self.alpha = 0.0;
        }completion:^(BOOL finished) {
            [self.layer removeAllAnimations];
            [self callBackManager];
            [self removeFromSuperview];
            
        }];
        
    });
    
}
/**
 * 右树,渐隐出现,男 女 骑车会和
 */
- (void)startTreeAppear{
    
    bridgetreeImv.hidden = NO;
    bridgetreeImv.alpha = 0.0;
    [UIView animateWithDuration:1.0 animations:^{
        bridgetreeImv.alpha = 1.0;
        bridgetreeImv.top -= 60;
    }];
    rightTree1ImV.hidden = NO;
    
    rightTree1ImV.alpha = 0.0;
    
    [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveLinear animations:^{
        rightTree1ImV.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];
    rightTree2ImV.hidden = NO;
    rightTree2ImV.alpha = 0.0;
    [UIView animateWithDuration:0.5 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
        rightTree2ImV.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];
    rightTree3ImV.hidden = NO;
    rightTree3ImV.alpha = 0.0;
    [UIView animateWithDuration:0.5 delay:2.7 options:UIViewAnimationOptionCurveLinear animations:^{
        rightTree3ImV.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            womanImV.right += self.width/2 -20;
            womanImV.top -= 40;
            manImV.left -= self.width/2+20;
            manImV.top -= 40;
        }];
    });
    
}

/**
 * 星星出现
 */
- (void)playStarWithType:(MapWoStarType)type{
    NSInteger starsCount;
    float starX;
    float starY;
    float starImageWidth;
    float starImageHeight = 0.0;
    UIImage *image = [UIImage imageNamed:@"mapwo_likesun"];
    UIImageView *starImV;
    if (type == MapWoStarType0) {
        starsCount = 20;
        starX = self.width/2- 30;
        starY = self.height/2 + 80;
    }else{
        starsCount = 15;
        starX = self.width/2;
        starY = self.height/2 - 50;
    }
    
    for (NSInteger i = 0 ; i < starsCount; i++) {
        if (type == MapWoStarType0) {
            starImageWidth = image.size.width/8;
            starImageHeight = image.size.height/8;
          }else{
            if (i < 7) {
                starImageWidth = image.size.width/9;
                starImageHeight = image.size.height/9;
            }else{
                starImageWidth = image.size.width/4;
                starImageHeight = image.size.height/4;
            }
        }
        starImV = [[UIImageView alloc]initWithFrame:CGRectMake(starX,starY,starImageWidth,starImageHeight)];
        starImV.image = image;
        starImV.transform = CGAffineTransformMakeRotation(M_PI/6);
        [sparkImv addSubview:starImV];
        NSInteger customX = arc4random_uniform(30);
        NSInteger customY = arc4random_uniform(50);
        if (customX % 2 == 0) {
            starImV.centerX += customX;
        }else{
            starImV.centerX -= customX;
        }
        if (customY % 2 == 0) {
            starImV.centerY += customY;
        }else{
            starImV.centerY -= customY;
        }
        
        CGPoint point = CGPointMake(arc4random_uniform(50), arc4random_uniform(50));
        [self playStarAnimationWithImV:starImV point:point];
    }
 
    
}

/**
 * 星星闪烁,循环移动
 */
- (void)playStarAnimationWithImV:(UIImageView *)ImV point:(CGPoint)point{
    CABasicAnimation*animation=[CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration=0.2;
    animation.repeatCount = 100000;
    animation.autoreverses=YES;
    animation.fromValue=[NSValue valueWithCATransform3D:CATransform3DRotate
                         
                         (ImV.layer.transform, -0.03, 0.0, 0.0, 0.03)];
    animation.toValue=[NSValue valueWithCATransform3D:CATransform3DRotate
                       
                       (ImV.layer.transform, 0.03, 0.0, 0.0, 0.03)];
    CAKeyframeAnimation *opacityAnimation;
    opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@(1),@(0.0) ,@(1), @(0.0)];
    opacityAnimation.duration = 1.0;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation, opacityAnimation];
    group.duration = const_time_duration;
    group.repeatCount = MAXFLOAT;
    [group setRemovedOnCompletion:NO];//默认为YES,设置为NO时setFillMode有效,保持动画在最后位置,继续执行
    [group setAutoreverses:YES];
    [group setFillMode:kCAFillModeBoth];
    
    float duration = arc4random_uniform(100);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration / 80.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ImV.layer addAnimation:group forKey:@"revealAnimation"];
    });
}
/**
 * 烛面闪亮
 */
- (void)playSaprkFlashing{
    
    CAKeyframeAnimation *opacityAnimation;
    opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@(1),@(0.8),@(0.6), @(1.0), @(0.8),@(0.6)];
    opacityAnimation.autoreverses = YES;
    
    opacityAnimation.duration = 1.0;
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.calculationMode = kCAAnimationCubic;
    opacityAnimation.repeatCount = HUGE_VALF;
    [sparkImv.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
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
