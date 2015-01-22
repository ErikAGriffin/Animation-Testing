//
//  AlertTestViewController.m
//  Animation
//
//  Created by Erik Griffin on 1/22/15.
//  Copyright (c) 2015 Erik Griffin. All rights reserved.
//

#import "AlertTestViewController.h"
#import "JNWSpringAnimation.h"

@interface AlertTestViewController ()

@property (nonatomic) UIView *shadowOverlay;
@property (nonatomic) UIView *alertView;


@end

@implementation AlertTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Read documentation for layer, and view.transform
    // UIColors have a property called .CGColor
    

    
    self.shadowOverlay = [[UIView alloc]initWithFrame:self.view.bounds];
    self.shadowOverlay.backgroundColor = [UIColor blackColor];
    self.shadowOverlay.alpha = 0.0;
    [self.view addSubview:self.shadowOverlay];
    
    CGFloat alertSize = 250.0;
    CGFloat boundHeight = self.view.bounds.size.height;
    CGFloat boundWidth = self.view.bounds.size.width;

    
    // I don't believe presetting the transform.scale is necessary, since
    // it is first shown during animation and then it is the size
    // the animation depicts, and furthermore we set the static size after.
    
    self.alertView = [[UIView alloc]initWithFrame:CGRectMake(boundWidth/2-alertSize/2, boundHeight/2-alertSize/2, alertSize, alertSize)];
    self.alertView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"alert_box"]];
    self.alertView.alpha = 0.0;
    //self.alertView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.alertView.layer.cornerRadius = 30.0;
    
    self.alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.alertView.layer.shadowOffset = CGSizeMake(0.0, 9.0);
    self.alertView.layer.shadowOpacity = 0.5;
    self.alertView.layer.shadowRadius = 10.0;
    
    
    [self.view addSubview:self.alertView];



}

- (IBAction)showAlert {
    
    // Perhaps you should always use this animation block style,
    // so that if you later want to add options or a delay it
    // is seamless to add it.
    
        
    
    [UIView animateWithDuration:0.3 delay:0.0 options: 0
                     animations:^{
                         
                         self.shadowOverlay.alpha = 0.4;
                         self.alertView.alpha = 1.0;
                         //self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
                     }
                     completion:NULL];
    
    JNWSpringAnimation *scaleDown = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    
    scaleDown.damping = 12.0;
    scaleDown.stiffness = 24.0;
    scaleDown.mass = 0.9;
    scaleDown.fromValue = @(1.5);
    scaleDown.toValue = @(1.0);
    
    [self.alertView.layer addAnimation:scaleDown forKey:scaleDown.keyPath];
    self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    
    

    
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
