//
//  ImageChooserViewControllerPrivate.m
//  Zuller
//
//  Created by Idan Wender on 5/25/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "ImageChooserViewControllerPrivate.h"
#define kNumberOfPhotos 6
@implementation ImageChooserViewController (Private)

-(void)buildBarButtons
{
    UIBarButtonItem * reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Change!"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(animateReload)];
    
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects: reloadButton, nil];
    
}

-(NSArray*)_imagesFromBundle
{
    NSArray *images = [NSArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    for (int i=0; i< kNumberOfPhotos; i++) {
        NSString *path = [bundle pathForResource:[NSString stringWithFormat:@"%@_%d", self.viewCategoryName, i + 1] ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        if (image) {
            images = [images arrayByAddingObject:image];
        }
    }
    return images;
}


- (void)_demoAsyncDataLoading
{
    _items = [NSArray array];
    //load the placeholder image
    for (int i=0; i < kNumberOfPhotos; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder.png"]];
        imageView.frame = CGRectMake(0, 0, 44, 44);
        imageView.clipsToBounds = YES;
        _items = [_items arrayByAddingObject:imageView];
    }
    self.numberOfItems= _items.count;
    [self reloadData];
    NSArray *images = [self _imagesFromBundle];
    for (int i = 0; i < images.count; i++) {
        UIImageView *imageView = [_items objectAtIndex:i];
        UIImage *image = [images objectAtIndex:i];
        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        
        
        [self performSelector:@selector(animateUpdate:)
                   withObject:[NSArray arrayWithObjects:imageView, image,[NSString stringWithFormat:@"%d",i], nil]
                   afterDelay:0.2 + (arc4random()%3) + (arc4random() %10 * 0.1)];
    }
}

- (void) animateUpdate:(NSArray*)objects
{
    UIImageView *imageView = [objects objectAtIndex:0];
    UIImage* image = [objects objectAtIndex:1];
    int indexOfImage = [[objects objectAtIndex:2] intValue];
    [UIView animateWithDuration:0.5
                     animations:^{
                         imageView.alpha = 0.f;
                     } completion:^(BOOL finished) {
                         imageView.image = image;
                         [UIView animateWithDuration:0.5
                                          animations:^{
                                              imageView.alpha = 1;
                                              UILabel * label = [self createLabelForImageClickedAtIndex:indexOfImage+1];
                                              [imageView addSubview:label];
                                              //if it's the last button
                                              if (_items.count == indexOfImage + 1)
                                                    imageView.alpha = 1.0;
                                          } completion:^(BOOL finished) {
                                              NSArray *visibleRowInfos =  [self visibleRowInfos];
                                              for (BDRowInfo *rowInfo in visibleRowInfos) {
                                                  [self updateLayoutWithRow:rowInfo animiated:YES];
                                              }
                                          }];
                     }];
}
-(UILabel *)createLabelForImageClickedAtIndex:(int)viewIndex
{
    CGRect rect = CGRectMake(5, 0.0, 290, 30);
    UILabel *label = [[GSBorderLabel alloc]initWithTextColor:[UIColor whiteColor] andBorderColor:[UIColor blackColor] andBorderWidth:3];
    [label setFrame:rect];
    label.opaque = NO;
    label.alpha = 0.7;
    label.font = [UIFont systemFontOfSize:20];
    label.numberOfLines = 2;
    label.textAlignment = UITextAlignmentRight;
    label.backgroundColor = [UIColor clearColor];
    NSString * labelText = [self.numberToTitleDictionary objectForKey:[NSString stringWithFormat:@"%d",viewIndex]];
    [label setText:labelText];
    
    
    return label;
}

@end
