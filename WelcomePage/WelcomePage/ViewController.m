//
//  ViewController.m
//  WelcomePage
//
//  Created by carl on 2021/1/8.
//

#import "ViewController.h"
#import "MenuItem.h"
#import "CollectionButtonsVC.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)toMenuButton:(UIButton *)sender {
    // 创建模型对象
    MenuItem *item = [MenuItem initWithTitle:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    MenuItem *item1 = [MenuItem initWithTitle:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    MenuItem *item2 = [MenuItem initWithTitle:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    MenuItem *item3 = [MenuItem initWithTitle:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    MenuItem *item4 = [MenuItem initWithTitle:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    MenuItem *item5 = [MenuItem initWithTitle:@"签到" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    
    CollectionButtonsVC *vc = [[CollectionButtonsVC alloc] init];
    vc.items = @[item,item1,item2,item3,item4,item5];
//    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
