//
//  ORKAnswerFormat+YesNoUnknown.m
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/4/20.
//

#import "ORKAnswerFormat+YesNoUnknown.h"

@implementation ORKAnswerFormat (YesNoUnknown)

+ (ORKAnswerFormat *)yesNoUnknown
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Yes", @"") value:@"Yes"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"No", @"") value:@"No"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];

	return ([ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices]);
}

@end
