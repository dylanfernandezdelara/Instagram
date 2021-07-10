//
//  ProfileViewController.h
//  Instagram
//
//  Created by dylanfdl on 7/9/21.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController

@property (nonatomic, strong) PFUser *curr_user;

@end

NS_ASSUME_NONNULL_END
