//
//  AnimationBlueLoveView.m
//  蓝色之恋
//
//  Created by 王晓栋 on 2017/11/17.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "AnimationBlueLoveView.h"
@interface AnimationBlueLoveView()
{
    UIImageView *_trRoseImV;
    UIImageView *_tlRoseImV;
    
    UIImageView *_loveRoseImV;
    
    
    UIImageView *_loveImV;
    
    UIImageView *_wingImV;
    
    UIImageView *_loveGroundImV;
    
    UIImageView  *_couplesImV;
}
@end

@implementation AnimationBlueLoveView
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
    
    UIImage *image = [UIImage imageNamed:@"blueLove_love_ground"];
    _loveGroundImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight -image.size.height/3 , ScreenWidth, image.size.height/3)];
    _loveGroundImV.image = image;
    [self addSubview:_loveGroundImV];
    
    //right
    image  = [UIImage imageNamed:@"blueLove_top_rose"];
    _trRoseImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - image.size.width/3 + image.size.width/3,-image.size.height/3 , image.size.width/3, image.size.height/3)];
    _trRoseImV.image = image;
    [self addSubview:_trRoseImV];
    //left
    image  = [UIImage imageNamed:@"blueLove_top_left_rose"];
    _tlRoseImV = [[UIImageView alloc]initWithFrame:CGRectMake(-image.size.width/3, -image.size.height/3, image.size.width/3, image.size.height/3)];
    _tlRoseImV.image = image;
    [self addSubview:_tlRoseImV];
    
    //blueLove_rose
    image  = [UIImage imageNamed:@"blueLove_rose"];
    _loveRoseImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -image.size.width/3/2 , ScreenHeight/2 + 50 , image.size.width/3, image.size.height/3)];
    _loveRoseImV.image = image;
    [self addSubview:_loveRoseImV];
    
    //loveImV
    image  = [UIImage imageNamed:@"blueLove_love"];
    _loveImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -image.size.width/3/2 , ScreenHeight/2 - image.size.width/3/2  , image.size.width/3, image.size.height/3)];
    _loveImV.image = image;
    [self addSubview:_loveImV];
    
    // blueLove_wing1
    image  = [UIImage imageNamed:@"blueLove_wing1"];
    _wingImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -image.size.width/3/2 ,_loveRoseImV.top - 30  , image.size.width/3, image.size.height/3)];
    _wingImV.image = image;
    NSMutableArray<UIImage *> *images = [NSMutableArray array];
    for (NSInteger i = 1; i <= 17 ; i++) {
        NSString *imageName = [NSString stringWithFormat:@"blueLove_wing%zd",i];
        UIImage *roseImage = [UIImage imageNamed:imageName];
        if (roseImage) {
            [images addObject:roseImage];
        }
    }
    _wingImV.animationImages =images;
    _wingImV.animationDuration = 2.5f;
    [self addSubview:_wingImV];
    
    //blueLove_couples
    
    image  = [UIImage imageNamed:@"blueLove_couples"];
    _couplesImV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -image.size.width/3/2 + 10 , ScreenHeight/2 + 30 , image.size.width/3, image.size.height/3)];
    _couplesImV.image = image;
    [self addSubview:_couplesImV];

    _loveGroundImV.hidden = YES;
    _trRoseImV.hidden = YES;
    _tlRoseImV.hidden = YES;
    _loveImV.hidden = YES;
    _loveRoseImV.hidden = YES;
    _couplesImV.hidden = YES;
    _wingImV.hidden = YES;
    
    [self startAnimation];
}
- (void)startAnimation{
    _loveGroundImV.hidden = NO;
    _trRoseImV.hidden = NO;
    _tlRoseImV.hidden = NO;
    _loveGroundImV.alpha = 0.0;
    _trRoseImV.alpha = 0.0;
    _tlRoseImV.alpha = 0.0;
    
    UIImage *trRoseimage  = [UIImage imageNamed:@"blueLove_top_rose"];
    UIImage *tlRoseimage  = [UIImage imageNamed:@"blueLove_top_left_rose"];

    [UIView animateWithDuration:2.0f animations:^{
        _loveGroundImV.alpha = 1.0;
        _trRoseImV.alpha = 1.0;
        _tlRoseImV.alpha = 1.0;
        _trRoseImV.right -= trRoseimage.size.width/3 -20;
        _trRoseImV.bottom += trRoseimage.size.height/3- 20;
        _tlRoseImV.right += tlRoseimage.size.width/3 -20;
        _tlRoseImV.bottom += tlRoseimage.size.height/3- 20;
    }completion:^(BOOL finished) {
        [self creatStarWithImV:_tlRoseImV withType:1];
        [self creatStarWithImV:_trRoseImV withType:1];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self playAetalsAnimationbirthRate:4.0 lifetime:3.0 imageName:@"blueLove_petal1"scale:0.13 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:1];
        [self playAetalsAnimationbirthRate:2.0 lifetime:3.0 imageName:@"blueLove_petal1" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:1];
        [self playAetalsAnimationbirthRate:3.0 lifetime:3.0 imageName:@"blueLove_petal2"scale:0.28 alphaRange:0.3 redRange:0.6 greenRange:0.9 blueRange:0.1 withType:1];
        [self playAetalsAnimationbirthRate:1.0 lifetime:3.0 imageName:@"blueLove_petal3" scale:0.23 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
        [self playAetalsAnimationbirthRate:.4 lifetime:3.0 imageName:@"blueLove_petal4" scale:0.14 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
        [self playAetalsAnimationbirthRate:.5 lifetime:3.0 imageName:@"blueLove_petal5" scale:0.19 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:1];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self playAetalsAnimationbirthRate:1.0 lifetime:4.0 imageName:@"blueLove_drop_rose1"scale:0.3 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:3];
        
        [self playAetalsAnimationbirthRate:2.3 lifetime:3.5 imageName:@"blueLove_drop_rose2" scale:0.6 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:3];
        
        [self playAetalsAnimationbirthRate:1.5 lifetime:7.0 imageName:@"blueLove_drop_rose3" scale:0.3 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11 withType:3];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playAetalsAnimationbirthRate:4.0 lifetime:1.5 imageName:@"blueLove_love1"scale:0.13 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13 withType:2];
        [self playAetalsAnimationbirthRate:2.0 lifetime:1.5 imageName:@"blueLove_love2" scale:0.21 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12 withType:2];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _loveRoseImV.hidden = NO;
        _loveRoseImV.alpha = 0.0;
        _loveRoseImV.transform = CGAffineTransformMakeScale(0.0, 0.0);
        
        [UIView animateWithDuration:2.0 animations:^{
            _loveRoseImV.alpha = 1.0;
            _loveRoseImV.transform = CGAffineTransformIdentity;
        }completion:^(BOOL finished) {
            [self creatStarWithImV:_loveRoseImV withType:2];
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _couplesImV.hidden = NO;
        _couplesImV.alpha = 0.0;
        
        
        [UIView animateWithDuration:2.0 animations:^{
            _couplesImV.alpha = 1.0;
            
        }completion:^(BOOL finished) {
            
            _wingImV.hidden = NO;
            [_wingImV startAnimating];
        }];
        
        [self playRoseAnimation];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _loveImV.hidden = NO;

        CAShapeLayer* circleLayer = [CAShapeLayer layer];
        circleLayer.fillColor = [UIColor clearColor].CGColor;//这个必须透明，因为这样内圆才是不透明的
        circleLayer.strokeColor = [UIColor yellowColor].CGColor;//注意这个不能透明，因为实际上是这个显示出后面的图片了
        circleLayer.path = [self pathWithDiameter:1 uiview:_loveImV].CGPath;
        _loveImV.layer.mask = circleLayer;
        
        //让圆的变大的动画
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        UIBezierPath *toPath = [self pathWithDiameter: sqrt(CGRectGetWidth(_loveImV.bounds)*CGRectGetWidth(_loveImV.bounds) + CGRectGetHeight(_loveImV.bounds) *CGRectGetHeight(_loveImV.bounds)) uiview:_loveImV];
        pathAnimation.toValue = (id)toPath.CGPath;
        pathAnimation.duration = 1.0;
        
        
        CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
        lineWidthAnimation.toValue = @(sqrt(CGRectGetWidth(_loveImV.bounds)*CGRectGetWidth(_loveImV.bounds) + CGRectGetHeight(_loveImV.bounds) *CGRectGetHeight(_loveImV.bounds)));
        lineWidthAnimation.duration = 1.0;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = @[pathAnimation, lineWidthAnimation];
        group.duration = 1.0;
        group.removedOnCompletion = NO;//这两句的效果是让动画结束后不会回到原处，必须加
        group.fillMode = kCAFillModeForwards;//这两句的效果是让动画结束后不会回到原处，必须加
        [circleLayer addAnimation:group forKey:@"revealAnimation"];
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.toValue = @(1.1);
        scaleAnimation.duration = const_explosion_time;
        
        CABasicAnimation *fallAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
        fallAnimation.toValue = @(_loveImV.layer.position.y + 2);
        fallAnimation.duration = const_explosion_time;
        
        
        CAAnimationGroup *colorImageGroup = [CAAnimationGroup animation];
        colorImageGroup.animations = @[scaleAnimation, fallAnimation];
        colorImageGroup.duration = const_explosion_time;
        colorImageGroup.removedOnCompletion = NO;
        colorImageGroup.fillMode = kCAFillModeForwards;
        [_loveImV.layer addAnimation:colorImageGroup forKey:@"imageAnimation"];

        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        ESWeakSelf
        [UIView animateWithDuration:0.5 animations:^{
            ESStrongSelf;
            _self.alpha = 0;
        } completion:^(BOOL finished) {
            ESStrongSelf;
            [_self.layer removeAllAnimations];
            [_self removeFromSuperview];
            [_self callBackManager];
            _self = nil;
        }];
    });
}
/**
 玫瑰花
 */
- (void)creatRoseWithImv:(UIImageView *)imageView withX:(CGFloat)X withY:(CGFloat)Y{
    
    for (NSInteger i = 1; i <= 15; i++) {
        
        int imageNumber = arc4random()%6 + 1;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(imageNumber * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            int number = arc4random()%3 + 1;
            
            NSString *imageName = [NSString stringWithFormat:@"blueLove_drop_rose%zd",number];
            UIImage *image  = [UIImage imageNamed:imageName];
            UIImageView *roseImV1 = [[UIImageView alloc]initWithFrame:CGRectMake(X , Y, image.size.width/3, image.size.height/3)];
            if (i == 2) {
                roseImV1.right += 30;
                roseImV1.bottom += 15;
            }else if(i == 3){
                roseImV1.right += 10;
                roseImV1.bottom += 30;
            }
            roseImV1.image = image;
            [self addSubview:roseImV1];
            roseImV1.alpha = 0.0;
            [UIView animateWithDuration:2.0 animations:^{
                roseImV1.alpha = 1.0;
            }completion:^(BOOL finished) {
                
                float duration = 7.0 + arc4random_uniform(40) / 40.0;
                float delay = arc4random()%3 + 1;
                float distance = arc4random()%80 + 250;
                
                NSLog(@"distance=%.2f",distance);
                [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
                    roseImV1.bottom += distance;
                    roseImV1.alpha = 0.0;
                    
                } completion:^(BOOL finished) {
                    [roseImV1 removeFromSuperview];
                    
                }];
                
            }];
            
            
            
        });
    }
    
}

//粒子动画
- (void)playAetalsAnimationbirthRate:(float)birthRate lifetime:(float)lifetime imageName:(NSString *)imageName scale:(float)scale alphaRange:(float)alphaRange redRange:(float)redRange greenRange:(float)greenRange blueRange:(float)blueRange withType:(NSInteger )type{
    
    //粒子发射器
    CAEmitterLayer *cAEmitterLayer = [CAEmitterLayer layer];
    //粒子发射的位置
    if (type == 1) {
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, 0);
        
    }else if(type == 2){
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, ScreenHeight - 60);
        
    }else if(type == 3){
        cAEmitterLayer.emitterPosition = CGPointMake(ScreenWidth/2, -150);
        
    }
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
    
    emitterCell.emissionLongitude =  M_PI / 2;
    
    //粒子参数的速度乘数因子。越大出现的越快
    emitterCell.birthRate        = birthRate;
    //存活时间
    emitterCell.lifetime        = lifetime;
    
    if (type == 3) {
        //粒子速度
        emitterCell.velocity        = 5;
        //粒子速度范围
        emitterCell.velocityRange = 6;
    }else{
        //粒子速度
        emitterCell.velocity        = 5;
        //粒子速度范围
        emitterCell.velocityRange = 10;
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

- (void)creatStarWithImV:(UIImageView *)contentView withType:(NSInteger)typeNumber{
    
    NSInteger viewNumber;
    NSInteger rowNumber;
    NSInteger colNumber;
    NSInteger starNumber;
    if (typeNumber == 1) {
        viewNumber = 4;
        rowNumber = 2;
        colNumber = 2;
        starNumber = 2;
        
    }else{
        viewNumber = 9;
        rowNumber = 3;
        colNumber = 3;
        starNumber = 2;
    }
    
    for (NSInteger i = 0; i <viewNumber; i++) {
        NSInteger row = i/rowNumber;
        NSInteger col = i%colNumber;
        UIView *subView  = [[UIImageView alloc]initWithFrame:CGRectMake(col*contentView.height/3, row*contentView.height/3, contentView.width/3, contentView.height/3)];
        [contentView addSubview:subView];
        
        for (NSInteger i = 0; i < starNumber; i ++) {
            float randomTime = arc4random()%100/30;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(randomTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     
            NSInteger number = arc4random()%2 +1;
            NSString *imageName = [NSString stringWithFormat:@"blueLove_flash%zd",number];
            
            UIImage *image = [UIImage imageNamed:imageName];
            UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(subView.width/2, subView.height/2, image.size.width/3, image.size.height/3)];
            imageView.image = image;
            [subView addSubview:imageView];
            int width = subView.width/3*2;
            int height = subView.height/3*2;
            float distancex = arc4random()%width ;
            float distancey = arc4random()%height;
            
            int arcNumber = arc4random()%100;
            
            if (arcNumber % 2 == 0 ) {
                imageView.centerX -= distancex;
                imageView.centerY -= distancey;
                imageView.width = image.size.width/3;
                imageView.height = image.size.height/3;
                
            }else{
                imageView.centerX += distancex;
                imageView.centerY += distancey;
                imageView.width = image.size.width/5;
                imageView.height = image.size.height/5;
            }
                imageView.alpha = 0.0;
                [UIView animateWithDuration:2.0 animations:^{
                    imageView.alpha = 1.0;
                }];
                CAKeyframeAnimation *opacityAnimation;
                opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
                opacityAnimation.values = @[@(0), @(1), @(0)];
                opacityAnimation.duration = 1.5;
                opacityAnimation.fillMode = kCAFillModeBoth;
                opacityAnimation.calculationMode = kCAAnimationCubic;
                opacityAnimation.repeatCount = HUGE_VALF;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((0.75) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [imageView.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
                });
            });
            
            
        }
        
    }
    
}

/**
     旋转,渐变消失
 */
- (void)animation2With:(UIImageView *)imageView index:(int)index{
    
    CABasicAnimation *big1Animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [big1Animation setRepeatCount:1];
    if (index%2 == 0) {
        [big1Animation setToValue:@(-M_PI/3)];
        
    }else{
        [big1Animation setToValue:@(M_PI/3)];
    }
    big1Animation.duration = 2.0;
    
    CAKeyframeAnimation *opacityAnimation;
    opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@( 1.0 ),@(0.0)];
    
    opacityAnimation.fillMode = kCAFillModeBoth;
    opacityAnimation.calculationMode = kCAAnimationCubic;
    
    CAAnimationGroup *color1ImageGroup = [CAAnimationGroup animation];
    color1ImageGroup.animations = @[big1Animation,opacityAnimation];
    color1ImageGroup.duration = 2.0;
    color1ImageGroup.removedOnCompletion = NO;
    color1ImageGroup.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:color1ImageGroup forKey:@"imageAnimation1"];
}

/**
 玫瑰花
 */
- (void)playRoseAnimation{
    
    [self playRoseAnimationWithType:1];
    [self playRoseAnimationWithType:2];
 
}
- (void)playRoseAnimationWithType:(int)typeInt{
    
    for (int i = 1; i <= 4; i++) {
        
        float randomTime = arc4random()%100/30;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(randomTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageNamed:@"blueLove_samllrose"];
            float imageWidth = image.size.width/4;
            float imageHeight = image.size.height/4;
            UIImageView *imageView;
            if (typeInt == 1) {
                imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(10+ i * 20 , ScreenHeight - 230 + i *imageWidth, imageWidth, imageHeight)];
         
            }else if (typeInt == 2){
              imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - imageWidth - i * 20 , ScreenHeight - 230 + i *imageWidth, imageWidth, imageHeight)];
            }
            imageView.image = image;
            [self addSubview:imageView];
            [self playRoseAndStarWithImV:imageView];
            imageView.alpha = 0.0;
            float randomTime = arc4random()%100/40;
            ESWeakSelf;
            [UIView animateWithDuration:randomTime animations:^{
                imageView.alpha = 1.0;
            }completion:^(BOOL finished) {
                ESStrongSelf;
                [_self animation2With:imageView index:i];
            }];
        });

        
    }
}


- (void)playRoseAndStarWithImV:(UIImageView *)imageV{
    
        NSInteger number = arc4random()%2 +1;
        NSString *imageName = [NSString stringWithFormat:@"blueLove_flash%zd",number];
        
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(imageV.width/2 - image.size.width/3/2,imageV.height/2 -image.size.width/3/2  , image.size.width/3, image.size.height/3)];
        imageView.image = image;
        [imageV addSubview:imageView];
        int arcNumber = arc4random()%100;
        
        if (arcNumber % 2 == 0 ) {
       
            imageView.width = image.size.width/3;
            imageView.height = image.size.height/3;
            
        }else{
            imageView.width = image.size.width/5;
            imageView.height = image.size.height/5;
        }
        float animation = arc4random()%100/30;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animation * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            CAKeyframeAnimation *opacityAnimation;
            opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
            opacityAnimation.values = @[@(0), @(1), @(0)];
            opacityAnimation.duration = 1.5;
            opacityAnimation.fillMode = kCAFillModeBoth;
            opacityAnimation.calculationMode = kCAAnimationCubic;
            opacityAnimation.repeatCount = HUGE_VALF;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((0.75) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [imageView.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
            });
            
        });

}
/**
 *  根据直径生成圆的path，圆点是中心点
 */
- (UIBezierPath *)pathWithDiameter:(CGFloat)diameter uiview:(UIView *)uiview {
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake((CGRectGetWidth(uiview.bounds) - diameter) / 2, (CGRectGetHeight(uiview.bounds) - diameter) / 2, diameter, diameter)];
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
