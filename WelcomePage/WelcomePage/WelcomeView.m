//
//  WelcomeView.m
//  WelcomePage
//
//  Created by carl on 2021/1/8.
//

#import "WelcomeView.h"

@interface WelcomeView ()
@property (weak, nonatomic) IBOutlet UIImageView *slogonImage;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation WelcomeView

+ (instancetype)welcomeView {
    WelcomeView *welView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
    return welView;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    self.avatarImage.transform = CGAffineTransformMakeTranslation(0, 50);
    [UIView animateWithDuration:1 animations:^{
        self.slogonImage.alpha = 0;
    } completion:^(BOOL finished) {
        self.avatarImage.hidden = NO;
        
        [UIView animateWithDuration:0.5 delay:0
             usingSpringWithDamping:0.3 initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear animations:^{
            self.avatarImage.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            self.textLabel.alpha = 0.0;
            self.textLabel.hidden = NO;
            
            [UIView animateWithDuration:1 animations:^{
                self.textLabel.alpha = 1.0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }];
    }];
}

@end
