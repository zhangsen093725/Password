//
//  ViewController.m
//  Password
//
//  Created by 张森 on 15/12/4.
//  Copyright © 2015年 张森. All rights reserved.
//

#import "ViewController.h"
#import "ZSPasswordView.h"

@interface ViewController (){
    ZSPasswordView * _pwd;
}
@property (nonatomic ,strong) UIButton * button;
@end

@implementation ViewController

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*0.5*0.5, 300, [UIScreen mainScreen].bounds.size.width*0.5, 30);
        [_button setTitle:@"确定" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _pwd = [[ZSPasswordView alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 40)];
    [self.view addSubview:_pwd];
    
    [self.view addSubview:self.button];
}

- (void)click{
    NSLog(@"%@",_pwd.textFiledString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
