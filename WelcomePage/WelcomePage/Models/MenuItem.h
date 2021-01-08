//
//  MenuItem.h
//  WelcomePage
//
//  Created by carl on 2021/1/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)initWithTitle: (NSString *)title image: (UIImage *)image;

@end

NS_ASSUME_NONNULL_END
