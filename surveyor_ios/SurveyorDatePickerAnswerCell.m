//
//  SurveyorDatePickerAnswerCell.m
//  surveyor_ios
//
//  Created by Mark Yoon on 9/13/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SurveyorDatePickerAnswerCell.h"

@interface SurveyorDatePickerAnswerCell()
- (void) datePickerDone;
- (UIDatePickerMode)datePickerModeFromType:(NSString *)type;
@end
@implementation SurveyorDatePickerAnswerCell
@synthesize datePickerViewController, popoverController;
//
// configureForData:tableView:indexPath:
//
// Invoked when the cell is given data. All fields should be updated to reflect
// the data.
//
// Parameters:
//    dataObject - the dataObject (can be nil for data-less objects)
//    aTableView - the tableView (passed in since the cell may not be in the
//		hierarchy)
//    anIndexPath - the indexPath of the cell
//
- (void)configureForData:(id)dataObject
               tableView:(UITableView *)aTableView
               indexPath:(NSIndexPath *)anIndexPath
{
	[super configureForData:dataObject tableView:aTableView indexPath:anIndexPath];
	self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	self.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Pick %@", @""), [dataObject objectForKey:@"type"]];
  
  if (self.datePickerViewController == nil) {
    self.datePickerViewController = [[DatePickerViewController alloc] init];
    self.popoverController = [[UIPopoverController alloc] initWithContentViewController:datePickerViewController];
    [datePickerViewController setupDelegate:self withTitle:[NSString stringWithFormat:NSLocalizedString(@"Pick %@", @""), [dataObject objectForKey:@"type"]]];
    datePickerViewController.now.title = [[dataObject objectForKey:@"type"] isEqualToString:@"date"] ? @"    Today   " : @"      Now     ";
    datePickerViewController.datePicker.datePickerMode = [self datePickerModeFromType:[dataObject objectForKey:@"type"]];
    popoverController.delegate = self;
  }
  
}

- (UIDatePickerMode)datePickerModeFromType:(NSString *)type {
  if ([type isEqualToString:@"datetime"]) {
    return UIDatePickerModeDateAndTime;
  } else if ([type isEqualToString:@"time"]) {
    return UIDatePickerModeTime;
  }
  return UIDatePickerModeDate;
}

//
// handleSelectionInTableView:
//
// An overrideable method to handle behavior when a row is selected.
// Default implementation just deselects the row.
//
// Parameters:
//    aTableView - the table view from which the row was selected
//
- (void)handleSelectionInTableView:(UITableView *)aTableView
{
  [super handleSelectionInTableView:aTableView];
  [popoverController presentPopoverFromRect:self.frame inView:aTableView permittedArrowDirections:UIPopoverArrowDirectionAny animated:NO];
}

- (void) nowPressed{
  [self datePickerDone];
}
- (void) datePickerDone{
  [popoverController dismissPopoverAnimated:NO];
}
- (void) datePickerCancel{
  [popoverController dismissPopoverAnimated:NO];
}

@end