//
//  AlertTestViewController.m
//  Animation
//
//  Created by Erik Griffin on 1/22/15.
//  Copyright (c) 2015 Erik Griffin. All rights reserved.
//

#import "AlertTestViewController.h"

@interface AlertTestViewController ()

@end

@implementation AlertTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIView *overlayShadow = [[UIView alloc]initWithFrame:self.view.bounds];
    overlayShadow.backgroundColor = [UIColor blackColor];
    overlayShadow.alpha = 0.0;
    [self.view addSubview:overlayShadow];
    
    CGFloat alertSize = 250.0;
    CGFloat boundHeight = self.view.bounds.size.height;
    CGFloat boundWidth = self.view.bounds.size.width;

    
    UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(boundWidth/2-alertSize/2, boundHeight/2-alertSize/2, alertSize, alertSize)];
    



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
