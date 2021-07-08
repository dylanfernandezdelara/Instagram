//
//  ComposeViewController.m
//  Instagram
//
//  Created by dylanfdl on 7/6/21.
//

#import "ComposeViewController.h"
#import "SceneDelegate.h"
#import "FeedViewController.h"
#import "Post.h"

@interface ComposeViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *composedText;
@property (weak, nonatomic) IBOutlet UIButton *composedPhoto;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.composedText layer] setBorderColor:[[UIColor systemGrayColor] CGColor]];
    [[self.composedText layer] setBorderWidth:1];
    [[self.composedText layer] setCornerRadius:15];
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    // UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Resize
    CGSize temp_size = CGSizeMake(600, 400);
    UIImage *temp = [self resizeImage:editedImage withSize:temp_size];
    [self.composedPhoto setImage:temp forState:UIControlStateNormal];
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelNow:(UIBarButtonItem *)sender {
    SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FeedViewController *feedViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabController"];
    myDelegate.window.rootViewController = feedViewController;
}

- (IBAction)shareNow:(UIBarButtonItem *)sender {
    [Post postUserImage:self.composedPhoto.currentImage withCaption:self.composedText.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (error != nil){
            NSLog(@"Could not post!");
        }
        else {
            NSLog(@"Posted successfully!");
            SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            FeedViewController *feedViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabController"];
            myDelegate.window.rootViewController = feedViewController;
        }
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
