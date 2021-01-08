//
//  MenuItem.m
//  WelcomePage
//
//  Created by carl on 2021/1/8.
//

#import "MenuItem.h"

@implementation MenuItem

+ (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image {
    MenuItem *item = [[MenuItem alloc] init];
    
    item.title = title;
    item.image = image;
    
    return item;
}

@end
