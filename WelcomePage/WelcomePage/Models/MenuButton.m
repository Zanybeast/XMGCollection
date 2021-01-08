//
//  MenuButton.m
//  WelcomePage
//
//  Created by carl on 2021/1/8.
//

#import "MenuButton.h"

#define IMAGE_HEIGHT_RATIO 0.8

@implementation MenuButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

//初始化
- (void)setup {
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

//重新布局子视图
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * IMAGE_HEIGHT_RATIO;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat labelX = imageX;
    CGFloat labelY = imageH;
    CGFloat labelW = imageW;
    CGFloat labelH = self.bounds.size.height - labelY;
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
}



@end
