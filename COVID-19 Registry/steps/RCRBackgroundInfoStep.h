//
//  RCRBackgroundInfoStep.h
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/2/20.
//

#import <ResearchKit/ResearchKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const BackgroundInfoStepIdentifier;

@interface RCRBiographicalInfoStep : ORKFormStep

- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
