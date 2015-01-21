//
//  TestViewController.m
//  Animation
//
//  Created by Erik Griffin on 1/21/15.
//  Copyright (c) 2015 Erik Griffin. All rights reserved.
//

#import "TestViewController.h"
#import "JNWSpringAnimation.h"

@interface TestViewController ()

@property (nonatomic) UIView *redBall;
@property (nonatomic) UIView *blueSquare;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat boundHeight = self.view.bounds.size.height;
    CGFloat boundWidth = self.view.bounds.size.width;

    UIView *redBall = [[UIView alloc]initWithFrame:CGRectMake(boundWidth/2-50, boundHeight/3, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    redBall.layer.cornerRadius = 50.0;
    [self.view addSubview:redBall];
    self.redBall = redBall;
    NSLog(@"Red y coord %f",self.redBall.frame.origin.y);
    
    
    self.blueSquare = [[UIView alloc]initWithFrame:CGRectMake(boundWidth/2-50, boundHeight*(2.0/3.0)+25.0, 100, 100)];
    self.blueSquare.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueSquare];
    NSLog(@"Blue y coord %f",self.blueSquare.frame.origin.y);

}

- (IBAction)animate:(UIButton *)sender {
    
    
    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    
    scale.damping = 6.0;
    scale.stiffness = 18.0;
    scale.mass = 0.8;
    
    scale.fromValue = @(1.0);
    scale.toValue = @(2.0);
    
    [self.redBall.layer addAnimation:scale forKey:scale.keyPath];
    
    self.redBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
    
    JNWSpringAnimation *rotate = [JNWSpringAnimation animationWithKeyPath:@"transform.rotation"];
    
    rotate.damping = 50.0;
    rotate.stiffness = 125;
    rotate.mass = 20.0;
    
    rotate.fromValue = @(0);
    rotate.toValue = @(M_PI_2);
    
    [self.blueSquare.layer addAnimation:rotate forKey:rotate.keyPath];
    //[self.blueSquare.layer addAnimation:scale forKey:scale.keyPath];
    self.blueSquare.transform = CGAffineTransformMakeRotation(M_PI_2);
    //self.blueSquare.transform = CGAffineTransformMakeScale(2.0, 2.0);
    

    
    /*
     
    // iOS 7 native animation.

    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                         // Animate the ball
                         self.redBall.backgroundColor = [UIColor greenColor];
                         self.redBall.transform = CGAffineTransformConcat(
                                        CGAffineTransformMakeScale(2.0, 2.0),
                                        CGAffineTransformMakeTranslation(0.0, 70.0));
                         
                         
                     }
                     completion:NULL];
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
