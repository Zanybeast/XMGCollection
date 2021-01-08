//
//  CollectionButtonsVC.m
//  WelcomePage
//
//  Created by carl on 2021/1/8.
//

#import "CollectionButtonsVC.h"
#import "MenuButton.h"
#import "MenuItem.h"

#define COLUMN 3
#define BUTTON_WIDTH 100

@interface CollectionButtonsVC ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int btnIndex;
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation CollectionButtonsVC

- (NSMutableArray *)buttons {
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    
    return _buttons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllButtons];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(addOneBtnToView)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    PRINT_FUNCTION;
    
}

- (void)addOneBtnToView {
    if (self.btnIndex == self.buttons.count) {
        [self.timer invalidate];
        return;
    }
    
    UIButton *button = self.buttons[_btnIndex];
    
    [self addAnimToOneBtn:button];
    
    ++_btnIndex;
}

- (void)addAnimToOneBtn: (UIButton *)btn {
    [UIView animateWithDuration:0.8 delay:0
         usingSpringWithDamping:0.6 initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        btn.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)setupAllButtons {
    int col = 0;
    int row = 0;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - COLUMN * BUTTON_WIDTH) / (COLUMN + 1);
    
    CGFloat originY = 180;
    
    CGFloat x = 0, y = 0;
    for (int i = 0; i < self.items.count; i++) {
        UIButton *btn = [MenuButton buttonWithType:UIButtonTypeCustom];
        
        col = i % COLUMN;
        row = i / COLUMN;
        
        x = margin + (BUTTON_WIDTH + margin) * col;
        y = originY + (BUTTON_WIDTH + margin) * row;
        
        btn.frame = CGRectMake(x, y, BUTTON_WIDTH, BUTTON_WIDTH);
        
        MenuItem *item = self.items[i];
        
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setImage:item.image forState:UIControlStateNormal];
        
        btn.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
        
        [btn addTarget:self action:@selector(touchDownAnim:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(touchUpInsideAnim:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttons addObject:btn];
        
        [self.view addSubview:btn];
    }
}

//MARK: - 按钮动画
//手指按下时的动画
- (void)touchDownAnim: (UIButton *)btn {
    [UIView animateWithDuration:0.5 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:nil];
}

//手指抬起时动画
- (void)touchUpInsideAnim: (UIButton *)btn {
    [UIView animateWithDuration:0.5 animations:^{
        btn.transform = CGAffineTransformMakeScale(2.0, 2.0);
        btn.alpha = 0.0;
    } completion:nil];
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
