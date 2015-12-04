//
//  ZSPasswordView.m
//  Password
//
//  Created by 张森 on 15/12/4.
//  Copyright © 2015年 张森. All rights reserved.
//

#import "ZSPasswordView.h"

@interface ZSPasswordView()<UITextFieldDelegate>
@property (nonatomic ,strong)UITextField *textFiled;
@end

@implementation ZSPasswordView
static const NSInteger passwordLength = 6;
static const NSInteger space = 10;

- (UITextField *)textFiled{
    if (!_textFiled) {
        _textFiled = [[UITextField alloc]init];
        _textFiled.backgroundColor = [UIColor whiteColor];
        _textFiled.layer.masksToBounds = YES;
        _textFiled.layer.borderColor = [UIColor grayColor].CGColor;
        _textFiled.layer.borderWidth = 1;
        _textFiled.layer.cornerRadius = space*0.5;
        _textFiled.secureTextEntry = YES;
        _textFiled.delegate = self;
        _textFiled.tintColor = [UIColor clearColor];//看不到光标
        _textFiled.textColor = [UIColor clearColor];//看不到输入内容
        _textFiled.font = [UIFont systemFontOfSize:30];
        _textFiled.keyboardType = UIKeyboardTypeNumberPad;
        [_textFiled addTarget:self action:@selector(textFiledEdingChanged) forControlEvents:UIControlEventEditingChanged];
        _textFiled.frame = CGRectMake(0,0, self.frame.size.width, self.frame.size.height);
    }
    return _textFiled;
}

- (NSString *)textFiledString{
    return _textFiled.text;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI:frame];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self createUI:frame];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location >= passwordLength)
        return NO;
    return YES;
}

-(void)textFiledEdingChanged{
    NSInteger length = _textFiled.text.length;
    for(NSInteger i=0;i<passwordLength;i++){
        UILabel *dotLabel = (UILabel *)[self viewWithTag: i+1];
        if(dotLabel){
            [self bringSubviewToFront:dotLabel];
            dotLabel.hidden = length <= i;
        }
    }
    [_textFiled sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)createUI:(CGRect)frame{
    [self addSubview:self.textFiled];
    CGFloat perWidth=(frame.size.width-passwordLength+1)*1.0/passwordLength;
    for (int i = 0; i < passwordLength; i++) {
        if (i<passwordLength-1) {
            UILabel * lineLabel = [[UILabel alloc]init];
            lineLabel.backgroundColor = [UIColor lightGrayColor];
            lineLabel.frame = CGRectMake((i+1)*frame.size.width / passwordLength + 1, 0, 1, frame.size.height);
            [self addSubview:lineLabel];
        }
        
        UILabel *dotLabel = (UILabel *)[self viewWithTag: i+1];
        if(!dotLabel){
            dotLabel = [[UILabel alloc]init];
            dotLabel.tag = i+1;
            [self addSubview:dotLabel];
        }
        dotLabel.frame = CGRectMake((perWidth + 1)*i + (perWidth - space)*0.5, (frame.size.height-space) *0.5, space, space);
        dotLabel.layer.masksToBounds = YES;
        dotLabel.layer.cornerRadius = space*0.5;
        dotLabel.backgroundColor = [UIColor blackColor];
        dotLabel.hidden = YES;
    }
}


@end
