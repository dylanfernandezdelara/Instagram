//
//  DetailsViewController.m
//  Instagram
//
//  Created by dylanfdl on 7/8/21.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentPhoto;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.usernameLabel.text = [@"@" stringByAppendingString:self.post.author.username];
    self.captionLabel.text = self.post.caption;
    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:self.post.createdAt dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle];
    PFFileObject *temp_file = self.post.image;
    [temp_file getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            UIImage *thumbnailImage = [UIImage imageWithData:imageData];
            UIImageView *thumbnailImageView = [[UIImageView alloc] initWithImage:thumbnailImage];
            self.contentPhoto.image = thumbnailImageView.image;
        }];
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
