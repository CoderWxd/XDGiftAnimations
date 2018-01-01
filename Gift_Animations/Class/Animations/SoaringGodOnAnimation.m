//
//  SoaringGodOnAnimation.m
//  飞升上神
//
//  Created by 王晓栋 on 2017/5/5.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "SoaringGodOnAnimation.h"
#import "UIView+ESShortcut.h"
#import "LuxuManager.h"

#define const_explosion_time 5.0
#define weak(obj) __weak typeof(obj) _weak##obj = obj;
#define strong(obj) __strong typeof(obj) _strong##obj = obj;


#define ESWeak_(var, weakVar)                   __weak __typeof(&*var) weakVar = var;
#define ESWeak(var)                             ESWeak_(var, weak_##var);
#define ESWeakSelf                              ESWeak(self);

#define ESStrong_DoNotCheckNil(weakVar, var)    __typeof(&*weakVar) var = weakVar;
#define ESStrong_(weakVar, var)                 ESStrong_DoNotCheckNil(weakVar, var); if (!var) return;
#define ESStrong(var)                           ESStrong_(weak_##var, _##var);
#define ESStrongSelf                            ESStrong(self);

@interface SoaringGodOnAnimation()<CAAnimationDelegate>
{
   
   
   //场景1
   UIView *superView1;
   UIImageView *peachIslandImageV;//桃花岛
   UIImageView *cloudPowderImageV1;//云粉1
   UIImageView *cloudPowderImageV2;//云粉2
   UIImageView *silverTreeImageV;//银树
   UIImageView *valleyImageV;//山谷
   UIImageView *cloudsImageV;//云彩
   //UIImageView *craneImageV;//白鹤
   UIImageView *bigLotusImageV;//大荷花
   UIImageView *botterLotusImageV;//中荷花
   UIImageView *smallLotusImageV;//小荷花
   UIImageView *petalsImageV;//超大花瓣
   UIView *contentView;// 小花瓣的父类
   
   //场景2
   UIView *superView2;
   UIImageView *mountainsImageV;//山脉
   UIImageView *phoenixImageV;//凤凰
   UIImageView *mountainUpImageV;//山上
   UIImageView *mountainDownImageV;//山下
   UIImageView *waterImageV;//水
   UIImageView *starsImageV;//星光
   UIImageView *bambooImageV;//竹子
   UIImageView *goddessImageV;//女神
   UIImageView *star1ImageV;//星光闪烁
   UIImageView *star2ImageV;//星光闪烁
   UIImageView *star3ImageV;//星光闪烁
   UIImageView *starsImageSuperV;//星光闪烁的父类
   UIImageView *maceImageV;//权杖
   
   
   
}


@end

@implementation SoaringGodOnAnimation
#define TOTAL_TIME 20.0

- (instancetype)init{
   if (self = [super init]) {
              [self customUI];
//      [self startUIScenarioTwo];
   }
   return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
   if (self = [super initWithCoder:aDecoder]) {
              [self customUI];
//      [self startUIScenarioTwo];
   }
   return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
   if (self = [super initWithFrame:frame]) {
              [self customUI];
//      [self startUIScenarioTwo];
      
   }
   return self;
}


- (void)customUI{
   self.userInteractionEnabled = NO;

   
   [self startUIScenarioTwo];
   [self startUIScenarioOne];
   [self startAnimation1];
}
- (void)startUIScenarioOne{
   
   superView1  = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
   superView1.backgroundColor = [UIColor clearColor];
   [self addSubview:superView1];
   superView1.hidden = YES;
   //桃花坞
   UIImage *peachIslandImage = [UIImage imageNamed:@"soar_peachIsland.png"];
   peachIslandImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, peachIslandImage.size.width/2.5, peachIslandImage.size.height/2.5)];
   peachIslandImageV.image = peachIslandImage;
   [superView1 addSubview:peachIslandImageV];
   peachIslandImageV.hidden = YES;
   
   
   //云粉1
   UIImage *cloudPowderImage = [UIImage imageNamed:@"soar_cloudPowder.png"];
   cloudPowderImageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth, 30, cloudPowderImage.size.width/5, cloudPowderImage.size.height/5)];
   cloudPowderImageV1.image = cloudPowderImage;
   [superView1 addSubview:cloudPowderImageV1];
   cloudPowderImageV1.hidden = YES;
   //云粉2
   cloudPowderImageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth, peachIslandImageV.bottom - 50, cloudPowderImage.size.width/3.5, cloudPowderImage.size.height/3.5)];
   cloudPowderImageV2.image = cloudPowderImage;
   [superView1 addSubview:cloudPowderImageV2];
   cloudPowderImageV2.hidden = YES;
   
   //云彩
   UIImage *cloudsImage = [UIImage imageNamed:@"soar_clouds.png"];
   cloudsImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight - cloudsImage.size.height/3 - 50 -60, ScreenWidth, cloudsImage.size.height/3)];
   cloudsImageV.image = cloudsImage;
   [superView1 addSubview:cloudsImageV];
   cloudsImageV.hidden = YES;
   
   //山谷
   UIImage *valleyImage = [UIImage imageNamed:@"soar_valley.png"];
   valleyImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight - valleyImage.size.height/3 - 50 -60, ScreenWidth, valleyImage.size.height/3)];
   valleyImageV.image = valleyImage;
   [superView1 addSubview:valleyImageV];
   valleyImageV.hidden = YES;
   
   //银树
   UIImage *silverTreeImage = [UIImage imageNamed:@"soar_silverTree.png"];
   silverTreeImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight - silverTreeImage.size.height/3 - 30 -60, ScreenWidth, silverTreeImage.size.height/3)];
   silverTreeImageV.image = silverTreeImage;
   [superView1 addSubview:silverTreeImageV];
   silverTreeImageV.hidden = YES;
   
   
   // 荷花大
   UIImage *bigLotusImage = [UIImage imageNamed:@"soar_bigLotus.png"];
   bigLotusImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - 150, valleyImageV.bottom - bigLotusImage.size.width/2, bigLotusImage.size.width/3, bigLotusImage.size.height/3)];
   bigLotusImageV.image = bigLotusImage;
   [superView1 addSubview:bigLotusImageV];
   bigLotusImageV.hidden = YES;
   
   // 荷花中
   UIImage *botterLotusImage = [UIImage imageNamed:@"soar_botterLotus.png"];
   botterLotusImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - 250, valleyImageV.bottom - botterLotusImage.size.width/2, botterLotusImage.size.width/3, botterLotusImage.size.height/3)];
   botterLotusImageV.image = botterLotusImage;
   [superView1 addSubview:botterLotusImageV];
   botterLotusImageV.hidden = YES;
   
}
/*
 * 场景1
 */
- (void)startAnimation1{
   superView1.hidden = NO;
   // 1、桃花坞出现、云彩飘动
   [self playMeteorAnimation];
   // 2.银树,云彩,山谷出现
   ESWeakSelf
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      ESStrongSelf
      [_self playsilverAnimation];
   });
   
   
}

/**
 *   1、桃花坞出现、云彩飘动
 */
- (void)playMeteorAnimation {
   ESWeakSelf
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      peachIslandImageV.hidden = NO;
      peachIslandImageV.alpha = 0.0;
      [UIView animateWithDuration:3.0 animations:^{
         peachIslandImageV.alpha = 1.0;
      }completion:^(BOOL finished) {
      }];
   });
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      cloudPowderImageV1.hidden = NO;
      cloudPowderImageV2.hidden = NO;
      
      [UIView animateWithDuration:4.0 animations:^{
         cloudPowderImageV1.left = 140;
         cloudPowderImageV2.left = 30;
      }completion:^(BOOL finished) {
         ESStrongSelf
         [_self playCloudPowderWithImageV:cloudPowderImageV1 andCount:1];
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ESStrongSelf
            [_self playCloudPowderWithImageV:cloudPowderImageV2 andCount:2];
         });
      }];
   });
   
   
   
   
}
#pragma mark 云彩循环移动
-(void)playCloudPowderWithImageV:(UIImageView *)imageView andCount:(int)count;

{
   CABasicAnimation  *animation = [CABasicAnimation animationWithKeyPath:@"position"];
   [animation setDuration:3.0];//设置动画时间，单次动画时间
   [animation setRemovedOnCompletion:NO];//默认为YES,设置为NO时setFillMode有效
   [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
   [animation setAutoreverses:YES];
   [animation setFillMode:kCAFillModeBoth];
   animation.repeatCount = MAXFLOAT;
   if (count == 1) {
      //setFromValue不设置,默认以当前状态为准
      [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(cloudPowderImageV1.centerX + 70,cloudPowderImageV1.centerY)]];
      [cloudPowderImageV1.layer addAnimation:animation forKey:@"cloudPowderImageV1Anim1"];
      
   }else{
      //setFromValue不设置,默认以当前状态为准
      [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(cloudPowderImageV2.centerX + 70,cloudPowderImageV2.centerY)]];
      [cloudPowderImageV2.layer addAnimation:animation forKey:@"cloudPowderImageV1Anim2"];
      
   }
   
}
/**
 *   2.银树,云彩,山谷出现
 *   场景1与场景2的交换
 */
- (void)playsilverAnimation{
   cloudsImageV.hidden = NO;
   cloudsImageV.alpha = 0.0;
   ESWeakSelf
   [UIView animateWithDuration:2.0 animations:^{
      cloudsImageV.alpha = 1.0;
   }completion:^(BOOL finished) {
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [UIView animateWithDuration:2.0 animations:^{
            //云彩上移到小树根位置
            cloudsImageV.top -= 50;
         }];
         
      });
   }];
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      valleyImageV.hidden = NO;
      valleyImageV.alpha = 0.0;
      [UIView animateWithDuration:2.0 animations:^{
         valleyImageV.alpha = 1.0;
      }];
   });
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      silverTreeImageV.hidden = NO;
      silverTreeImageV.alpha = 0.0;
      [UIView animateWithDuration:2.0 animations:^{
         silverTreeImageV.alpha = 1.0;
      }];
   });
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      ESStrongSelf
      [_self playLotusAnimation];
   });
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         ESStrongSelf
         [_self playCraneFlyOutWithCenter:CGPointMake(ScreenWidth/2 - 250, ScreenHeight/2-50)];

      });
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         ESStrongSelf
         [_self playCraneFlyOutWithCenter:CGPointMake(ScreenWidth/2-50 - 250, ScreenHeight/2+50-50)];

      });
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         ESStrongSelf
         [_self playCraneFlyOutWithCenter:CGPointMake(ScreenWidth/2-100 - 250, ScreenHeight/2 +40-50)];

      });
   });
   

   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(14.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      UIImage *petalsImage = [UIImage imageNamed:@"soar_fda.png"];
      petalsImageV = [[UIImageView alloc]init];
      petalsImageV.frame = CGRectMake(-ScreenWidth, -ScreenHeight, ScreenWidth, ScreenHeight);
      petalsImageV.image = petalsImage;
      [superView2 addSubview:petalsImageV];
      
      
   });
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      ESStrongSelf
      //场景1与场景2
      [_self start1WithStart2Animation];
      
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         ESStrongSelf
         [_self playAetalsAnimationbirthRate:15.0 lifetime:10.0 imageName:@"soar_fda"scale:0.1 alphaRange:0.5 redRange:0.4 greenRange:0.3 blueRange:0.13];
         [_self playAetalsAnimationbirthRate:13.0 lifetime:13.0 imageName:@"soar_fen" scale:0.1 alphaRange:0.4 redRange:0.8 greenRange:0.9 blueRange:0.12];
         //
         [_self playAetalsAnimationbirthRate:3.0 lifetime:5.0 imageName:@"soar_fda"scale:0.3 alphaRange:0.3 redRange:0.6 greenRange:0.9 blueRange:0.1];
         [_self playAetalsAnimationbirthRate:8.0 lifetime:11.0 imageName:@"soar_fen" scale:0.2 alphaRange:0.8 redRange:0.2 greenRange:0.2 blueRange:0.11];
         
      });
      
      
   });
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(18.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      ESStrongSelf
      [_self startAnimation2];
   });
   

}
/*
 * 3.所有荷花的动画
 */
- (void)playLotusAnimation{
   bigLotusImageV.hidden = NO;
   botterLotusImageV.hidden = NO;
   bigLotusImageV.alpha = 0.0;
   botterLotusImageV.alpha = 0.0;
   [UIView animateWithDuration:2.0 animations:^{
   bigLotusImageV.alpha = 1.0;
      botterLotusImageV.alpha = 1.0;
   }];
   
   // 荷花中
   UIImage *smallLotusImage = [UIImage imageNamed:@"soar_smallLotus.png"];
   contentView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
   contentView.backgroundColor = [UIColor clearColor];
   [superView1 addSubview:contentView];
   for (int i = 0; i < 4; i++) {
      
      smallLotusImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - 200, valleyImageV.bottom - 50, smallLotusImage.size.width/3, smallLotusImage.size.height/3)];
      smallLotusImageV.image = smallLotusImage;
      [contentView addSubview:smallLotusImageV];
      smallLotusImageV.alpha = 0.0;
      [UIView animateWithDuration:2.0 animations:^{
      smallLotusImageV.alpha = 1.0;
         
      }];
      int coustom = arc4random()%40;
      int coustom1 = arc4random()%40;
      NSLog(@"%d",coustom);
      smallLotusImageV.center = CGPointMake(smallLotusImageV.centerX + coustom, smallLotusImageV.centerY + coustom1);
      [self smallLotusWithImageV:smallLotusImageV withCoustom:coustom];
      
   }
   
}
/**
 * 3.1荷花移动
 */
- (void)smallLotusWithImageV:(UIImageView *)imageV withCoustom:(int)coustom{
   float delayIn = coustom/80.0;
   int coustom2 = arc4random()%15;
   int coustom3 = arc4random()%15;
   NSLog(@"%f",delayIn);
   float customeNumber= (float)(1+arc4random()%99)/100;
//   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(customeNumber * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      CABasicAnimation  *animation = [CABasicAnimation animationWithKeyPath:@"position"];
      //setFromValue不设置,默认以当前状态为准
      [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(imageV.centerX +coustom3,imageV.centerY + coustom2)]];
      [animation setDuration:3.0];//设置动画时间，单次动画时间
      [animation setRemovedOnCompletion:NO];//默认为YES,设置为NO时setFillMode有效
      [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
      [animation setAutoreverses:YES];
      [animation setFillMode:kCAFillModeBoth];
      animation.repeatCount = MAXFLOAT;
      animation.beginTime =customeNumber;
      [imageV.layer addAnimation:animation forKey:[NSString stringWithFormat:@"imageV%d",coustom]];
//   });
   
   
}
/**
 * 4.白鹤飞出
 */
- (void)playCraneFlyOutWithCenter:(CGPoint)point{
   
   //白鹤
   UIImage *craneImage = [UIImage imageNamed:@"soar_crane1.png"];
   UIImageView *craneImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - craneImage.size.width/4, valleyImageV.bottom - 100, craneImage.size.width/4, craneImage.size.height/4)];
   craneImageV.image = craneImage;
   [superView1 addSubview:craneImageV];
   NSMutableArray *images = [NSMutableArray array];
   for (int i = 1; i< 4; i++) {
      NSString *imageName = [NSString stringWithFormat:@"soar_crane%i.png",i];
      UIImage *image = [UIImage imageNamed:imageName];
      [images addObject:image];
   }
   craneImageV.animationImages= images;
   craneImageV.animationDuration = 1.0;
   craneImageV.animationRepeatCount = MAXFLOAT;
   
   [superView1 insertSubview:craneImageV belowSubview:valleyImageV];
   [craneImageV startAnimating];
   [UIView animateWithDuration:3.0 animations:^{
      craneImageV.center = point;
      
   }];
   

}

//粒子动画
- (void)playAetalsAnimationbirthRate:(float)birthRate lifetime:(float)lifetime imageName:(NSString *)imageName scale:(float)scale alphaRange:(float)alphaRange redRange:(float)redRange greenRange:(float)greenRange blueRange:(float)blueRange{
   
   //粒子发射器
   CAEmitterLayer *cAEmitterLayer = [CAEmitterLayer layer];
   //粒子发射的位置
   cAEmitterLayer.emitterPosition = CGPointMake(0, 0);
   //发射源的大小
   cAEmitterLayer.emitterSize        = CGSizeMake(ScreenWidth, 0.0);;
   //发射模式
   cAEmitterLayer.emitterMode        = kCAEmitterLayerOutline;
   //发射源的形状
   cAEmitterLayer.emitterShape    =kCAEmitterLayerLine;
   cAEmitterLayer.velocity = 5;
   cAEmitterLayer.spin = 3.0;
   //创建花瓣粒子
   CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
   //粒子的名称
   emitterCell.name = @"snow";
   
   //粒子参数的速度乘数因子。越大出现的越快
   emitterCell.birthRate        = birthRate;
   //存活时间
   emitterCell.lifetime        = lifetime;
   //粒子速度
   emitterCell.velocity        = 10;                // falling down slowly
   //粒子速度范围
   emitterCell.velocityRange = 10;
   //粒子y方向的加速度分量
   emitterCell.yAcceleration = 120;
   emitterCell.xAcceleration = 90;
   emitterCell.zAcceleration = 120;
   //周围发射角度
   emitterCell.emissionRange =  M_PI;        // some variation in angle
   //子旋转角度范围
   emitterCell.spinRange        = 0.25 * M_PI;        // slow spin
   //粒子图片
   emitterCell.contents        = (id) [[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]] CGImage];
   emitterCell.scale = scale;
   emitterCell.alphaRange = alphaRange;
   emitterCell.redRange = redRange;
   emitterCell.greenRange = greenRange;
   emitterCell.blueRange = blueRange;
   // 将粒子添加到粒子发射器上
   cAEmitterLayer.emitterCells = [NSArray arrayWithObject:emitterCell];
   [superView1.layer addSublayer:cAEmitterLayer];
   

   
}


#pragma mark 场景2
- (void)startUIScenarioTwo{
   superView2 = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
   superView2.backgroundColor = [UIColor clearColor];
   [self addSubview:superView2];
   superView2.hidden = YES;
   //水
   UIImage *waterImage = [UIImage imageNamed:@"soar_water.png"];
   waterImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2+10, ScreenWidth, waterImage.size.height/3)];
   waterImageV.image = waterImage;
   [superView2 addSubview:waterImageV];
   waterImageV.hidden = YES;
   
   //山脉
   UIImage *mountainsImage = [UIImage imageNamed:@"soaring_mountains.png"];
   mountainsImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mountainsImage.size.width/3.5, mountainsImage.size.height/3.5)];
   mountainsImageV.image = mountainsImage;
   [superView2 addSubview:mountainsImageV];
   mountainsImageV.hidden = YES;
   //竹子
   UIImage *bambooImage = [UIImage imageNamed:@"soar_bamboo.png"];
   bambooImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-bambooImage.size.width/3.5, 0, bambooImage.size.width/3.5, bambooImage.size.height/3.5)];
   bambooImageV.image = bambooImage;
   [superView2 addSubview:bambooImageV];
   bambooImageV.hidden = YES;
   //山下
   UIImage *mountainDownImage = [UIImage imageNamed:@"soar_mouup.png"];
   mountainDownImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2+ 50, ScreenWidth, mountainDownImage.size.height/3.5)];
   mountainDownImageV.image = mountainDownImage;
   [superView2 addSubview:mountainDownImageV];
   mountainDownImageV.hidden = YES;
   //山上
   UIImage *mountainUpImage = [UIImage imageNamed:@"soaring_mountain.png"];
   mountainUpImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2-50, mountainUpImage.size.width/2.5, mountainUpImage.size.height/2.5)];
   mountainUpImageV.image = mountainUpImage;
   [superView2 addSubview:mountainUpImageV];
   mountainUpImageV.hidden = YES;
   //星光
   UIImage *starsImage = [UIImage imageNamed:@"soar_star.png"];
   starsImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - starsImage.size.width/3/2, -starsImage.size.height/3, starsImage.size.width/3, starsImage.size.height/3)];
   starsImageV.image = starsImage;
   [superView2 addSubview:starsImageV];
   starsImageV.hidden = YES;
   //闪烁星光的super
   starsImageSuperV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - starsImage.size.width/3/2,0, starsImage.size.width/3, starsImage.size.height/3)];
   starsImageSuperV.backgroundColor = [UIColor clearColor];
   [superView2 addSubview:starsImageSuperV];
   

   
   //女神
   UIImage *goddessImage = [UIImage imageNamed:@"soar_tianshi1.png"];
   goddessImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - goddessImage.size.width/3/2, -goddessImage.size.height/3, goddessImage.size.width/3, goddessImage.size.height/3)];
   goddessImageV.image = goddessImage;
   [superView2 addSubview:goddessImageV];
   NSMutableArray *images = [NSMutableArray array];
   for (int i = 1 ; i< 4; i++) {
      NSString *imageName = [NSString stringWithFormat:@"soar_tianshi%i",i];
      UIImage *tanShiImage = [UIImage imageNamed:imageName];
      [images addObject:tanShiImage];
      
   }
   goddessImageV.animationImages = images;
   goddessImageV.animationDuration = 0.4;
   goddessImageV.hidden = YES;
   

}
- (void)start1WithStart2Animation{
   superView2.hidden = NO;
   //2.
   mountainsImageV.hidden = NO;
   mountainsImageV.alpha = 0.0;
   bambooImageV.hidden = NO;
   bambooImageV.alpha = 0.0;
   //1
   peachIslandImageV.alpha = 1.0;
   cloudPowderImageV1.alpha = 1.0;
   cloudPowderImageV2.alpha = 1.0;
   [UIView animateWithDuration:2.0 animations:^{
      mountainsImageV.alpha = 1.0;
      bambooImageV.alpha = 1.0;
      peachIslandImageV.alpha = 0.0;
  cloudPowderImageV1.alpha = 0.0;
      cloudPowderImageV2.alpha = 0.0;

   }];
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
      mountainUpImageV.hidden = NO;
      mountainUpImageV.alpha = 0.0;
      mountainDownImageV.hidden = NO;
      mountainDownImageV.alpha = 0.0;
      waterImageV.hidden = NO;
      waterImageV.alpha = 0.0;

      
      silverTreeImageV.alpha = 1.0;
      valleyImageV.alpha = 1.0;
      cloudsImageV.alpha = 1.0;
      bigLotusImageV.alpha = 1.0;
      smallLotusImageV.alpha = 1.0;
      botterLotusImageV.alpha = 1.0;
      contentView.alpha = 1.0;
         [UIView animateWithDuration:2.0 animations:^{
         mountainDownImageV.alpha = 1.0;
         mountainUpImageV.alpha = 1.0;
         silverTreeImageV.alpha = 0.0;
            waterImageV.alpha = 1.0;

            
         valleyImageV.alpha = 0.0;
            cloudsImageV.alpha = 0.0;
            bigLotusImageV.alpha = 0.0;
            smallLotusImageV.alpha = 0.0;
            botterLotusImageV.alpha = 0.0;
            contentView.alpha = 0.0;
      }];
   });

}
/**
 * 场景2动画
 */
- (void)startAnimation2{
   
   ESWeakSelf
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [UIView animateWithDuration:2.5 animations:^{
         petalsImageV.frame = CGRectMake(ScreenWidth, ScreenHeight, ScreenWidth, ScreenHeight);
      }];
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         
         peachIslandImageV.alpha = 0.0;
         cloudPowderImageV1.alpha = 0.0;
         cloudPowderImageV2.alpha = 0.0;
         [UIView animateWithDuration:2.0 animations:^{
            peachIslandImageV.alpha = 1.0;
            cloudPowderImageV1.alpha = 1.0;
            cloudPowderImageV2.alpha = 1.0;
            
         }];
         
      });
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         
         silverTreeImageV.alpha = 0.0;
         valleyImageV.alpha = 0.0;
         cloudsImageV.alpha = 0.0;
         bigLotusImageV.alpha = 0.0;
         smallLotusImageV.alpha = 0.0;
         botterLotusImageV.alpha = 0.0;
         contentView.alpha = 0.0;
         [UIView animateWithDuration:2.0 animations:^{
            silverTreeImageV.alpha = 1.0;

            valleyImageV.alpha = 1.0;
            cloudsImageV.alpha = 1.0;
            bigLotusImageV.alpha = 1.0;
            smallLotusImageV.alpha = 1.0;
            botterLotusImageV.alpha = 1.0;
            contentView.alpha = 1.0;
         }];

         
      });

   });
   

   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
      starsImageV.hidden = NO;
      [UIView animateWithDuration:2.0 animations:^{
         starsImageV.bottom +=  starsImageV.size.height;
      }completion:^(BOOL finished) {
      }];
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         ESStrongSelf
         for (int i = 0; i< 20; i++) {
            int customCount = arc4random()%30;
            int customCount1 = arc4random()%30;
            [_self playStartAnimationCenter:CGPointMake(5*customCount1, 8 *customCount)];
         }
      });

      
      
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:2.0 animations:^{
               starsImageSuperV.bottom += 50;
            }];
         });
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            goddessImageV.hidden = NO;
            [goddessImageV startAnimating];
            //女神降落
            [UIView animateWithDuration:2.0 animations:^{
               goddessImageV.bottom +=  goddessImageV.size.height + 200;
            }completion:^(BOOL finished) {
               
               CAKeyframeAnimation *upDownAnimation;
               upDownAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
               upDownAnimation.values = @[@(goddessImageV.layer.position.y), @(goddessImageV.layer.position.y + 5), @(goddessImageV.layer.position.y)];
               upDownAnimation.duration = 2;
               upDownAnimation.fillMode = kCAFillModeBoth;
               upDownAnimation.calculationMode = kCAAnimationCubic;
               upDownAnimation.repeatCount = HUGE_VALF;
               [goddessImageV.layer addAnimation:upDownAnimation forKey:@"upDownAnimation"];
               ESStrongSelf
               //凤凰飞出
               [_self playPhoenixflyOutAnimation];

            }];
         });
      });
      
      
   });
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      ESStrongSelf
      for (int i = 0; i< 20; i++) {
         int customCount = arc4random()%30;
         int customCount1 = arc4random()%30;
         [_self playStartAnimationCenter:CGPointMake(5*customCount1, 8 *customCount)];
      }
   });
  

   
}
/**
 * 凤凰飞出
 */
- (void)playPhoenixflyOutAnimation{
   //凤凰
   UIImage *phoenixImage = [UIImage imageNamed:@"soaring_phoenix.png"];
   phoenixImageV = [[UIImageView alloc]initWithFrame:CGRectMake(-phoenixImage.size.width/4, ScreenHeight/2, phoenixImage.size.width/4, phoenixImage.size.height/4)];
   phoenixImageV.image = phoenixImage;
   [self addSubview:phoenixImageV];
   
   phoenixImageV.transform =CGAffineTransformMakeRotation(M_PI/3);
   
   CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
   scaleAnimation.fromValue = @(0.1);
   scaleAnimation.toValue = @(1.0);
   scaleAnimation.duration = 1.0;
   CABasicAnimation *big1Animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
   [big1Animation setRepeatCount:1];
   [big1Animation setToValue:@(-M_PI)];
   big1Animation.duration = const_explosion_time ;
   
   // 初始化UIBezierPath
   UIBezierPath *path = [UIBezierPath bezierPath];
   // 首先设置一个起始点
   CGPoint startPoint = CGPointMake(phoenixImageV.origin.x ,phoenixImageV.origin.y -50);
   // 以起始点为路径的起点
   [path moveToPoint:startPoint];
   // 设置一个终点
   CGPoint endPoint = CGPointMake(ScreenWidth/2 - 50, ScreenHeight-140);
   // 设置第一个控制点
   CGPoint controlPoint1 = CGPointMake(70, ScreenHeight/2+100);
   // 设置第二个控制点
   CGPoint controlPoint2 = CGPointMake(100, ScreenHeight/2 + 170);
   // 添加三次贝塞尔曲线
   [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
   // 设置另一个起始点
   [path moveToPoint:endPoint];
   CGPoint endPoint2 = CGPointMake(ScreenWidth - 50,ScreenHeight/2 -10);
   // 设置第三个控制点
   CGPoint controlPoint3 = CGPointMake(endPoint.x+50, endPoint.y -50);
   // 设置第四个控制点
   CGPoint controlPoint4 = CGPointMake(endPoint.x+80, endPoint.y -80);
   // 添加三次贝塞尔曲线
   [path addCurveToPoint:endPoint2 controlPoint1:controlPoint4 controlPoint2:controlPoint3];
   
   // 设置另一个起始点
   [path moveToPoint:endPoint2];
   CGPoint endPoint3 = CGPointMake(goddessImageV.origin.x + goddessImageV.size.width - 70,260);
   
   // 设置第三个控制点
   CGPoint controlPoint5 = CGPointMake(endPoint2.x-10, endPoint2.y -10);
   // 设置第四个控制点
   CGPoint controlPoint6 = CGPointMake(endPoint2.x-60, endPoint2.y -90);
   // 添加三次贝塞尔曲线
   [path addCurveToPoint:endPoint3 controlPoint1:controlPoint5 controlPoint2:controlPoint6];
   
   CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
   animation.path = path.CGPath;
   animation.duration = const_explosion_time;
   
   CAAnimationGroup *colorImageGroup = [CAAnimationGroup animation];
   colorImageGroup.animations = @[scaleAnimation, animation,big1Animation];
   colorImageGroup.duration = const_explosion_time;
   colorImageGroup.removedOnCompletion = NO;//这两句的效果是让动画结束后不会回到原处，必须加
   colorImageGroup.fillMode = kCAFillModeForwards;//这两句的效果是让动画结束后不会回到原处,必须加
   colorImageGroup.delegate = self;
   [colorImageGroup setValue:@"imageAnimati" forKey:@"id"];
   [phoenixImageV.layer addAnimation:colorImageGroup forKey:@"imageAnimation"];
}
/**
 * 凤凰消失,旋转
 */
- (void)animation2{
   
   CABasicAnimation *big1Animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
   [big1Animation setRepeatCount:1];
   [big1Animation setToValue:@(-2*M_PI)];
   big1Animation.duration = 2.0;
   
   CABasicAnimation *scale1Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
   scale1Animation.fromValue = @(1.0);
   scale1Animation.toValue = @(0.0000);
   CAKeyframeAnimation *opacityAnimation;
   opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
   opacityAnimation.values = @[@(1.0),@(0)];
   
   opacityAnimation.fillMode = kCAFillModeBoth;
   opacityAnimation.calculationMode = kCAAnimationCubic;
   
   CAAnimationGroup *color1ImageGroup = [CAAnimationGroup animation];
   color1ImageGroup.animations = @[big1Animation,scale1Animation,opacityAnimation];
   color1ImageGroup.duration = 2.0;
   color1ImageGroup.removedOnCompletion = YES;
   color1ImageGroup.fillMode = kCAFillModeForwards;
   [phoenixImageV.layer addAnimation:color1ImageGroup forKey:@"imageAnimation1"];
   
   
   ESWeakSelf
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      ESStrongSelf
      [_self playmaceImageAnimation];
   });
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 + 3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
      [maceImageV.layer removeAnimationForKey:@"maceImageAnimation"];
      [phoenixImageV.layer removeAllAnimations];
      [phoenixImageV.layer removeAnimationForKey:@"imageAnimation1"];
      [phoenixImageV.layer removeAnimationForKey:@"imageAnimation"];
      [self.layer removeAllAnimations];
      
      ESWeakSelf;
      self.alpha = 1.0;
      [UIView animateWithDuration:2.0 animations:^{
         ESStrongSelf;
         _self.alpha = 0.0;
      }completion:^(BOOL finished) {
         [superView1 removeFromSuperview];
         [superView2 removeFromSuperview];
         superView1 = nil;
         superView2 = nil;
         ESStrongSelf;
         [_self removeFromSuperview];
         [self callBackManager];
         _self = nil;
         
      }];
   });

 


}


#pragma mark CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim{
   
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
   
   if (flag) {
   NSString *logoID = [anim valueForKey:@"id"];
   if ([logoID isEqualToString:@"imageAnimati"]) {
            [self animation2];
   }
      
   }
}
/**
 * 星光闪烁
 */
- (void)playStartAnimationCenter:(CGPoint )point {
   
   UIImage *startImage = [UIImage imageNamed:@"soar_risingstar1.png"];
   UIImageView *startImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, startImage.size.width/2, startImage.size.height/2)];
   startImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"soar_risingstar%d",arc4random_uniform(3)]];
   [starsImageSuperV addSubview:startImageV];
   startImageV.center = point;
   CAKeyframeAnimation *opacityAnimation;
   opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
   opacityAnimation.values = @[@(0), @(1.5), @(0)];
   
   opacityAnimation.duration = 1.0;
   //ESRandomNumber(5, 15) / 5.0;
   opacityAnimation.fillMode = kCAFillModeBoth;
   opacityAnimation.calculationMode = kCAAnimationCubic;
   opacityAnimation.repeatCount = HUGE_VALF;

   float customeNumber= (float)(1+arc4random()%99)/100;
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(customeNumber * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [startImageV.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
   });
}


/**
 * 权杖动画
 */
- (void)playmaceImageAnimation{
   UIImage *maceImage = [UIImage imageNamed:@"soar_mace.png"];
   maceImageV =  [[UIImageView alloc]initWithFrame:CGRectMake(goddessImageV.size.width - maceImage.size.width/2 -30, 40, maceImage.size.width/2, maceImage.size.height/2)];
   maceImageV.image = maceImage;
   [goddessImageV addSubview:maceImageV];
   CABasicAnimation* rotationAnimation;
   rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
   rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
   rotationAnimation.duration = 2.0;
   rotationAnimation.cumulative = YES;
   rotationAnimation.repeatCount = MAXFLOAT;
   CAKeyframeAnimation *opacityAnimation;
   opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
   opacityAnimation.values = @[@(1),@(0.8),@(0.6),@(0.5),@(0.6),@(0.8),@(1)];
   opacityAnimation.duration = 2.0;
   opacityAnimation.repeatCount = MAXFLOAT;
   opacityAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
   CAAnimationGroup *color1ImageGroup = [CAAnimationGroup animation];
   color1ImageGroup.animations = @[rotationAnimation,opacityAnimation];
   color1ImageGroup.duration = 2.0;
   color1ImageGroup.removedOnCompletion = NO;
   color1ImageGroup.fillMode = kCAFillModeForwards;
   color1ImageGroup.repeatCount = MAXFLOAT;
   [maceImageV.layer addAnimation:color1ImageGroup forKey:@"maceImageAnimation"];
}
- (void)dealloc{
   NSLog(@"dealloc");
}
- (void)callBackManager{
   [LuxuManager sharedManager].isShowAnimation = NO;
   [[LuxuManager sharedManager] showLuxuryAnimation];
}

@end
