//
//  GLLinearTransform.m
//  GLNumericalModelingKitCopy
//
//  Created by Jeffrey J. Early on 1/22/13.
//
//

#import "GLLinearTransform.h"
#import "GLEquation.h"
#import "GLDimension.h"
#import "GLVectorVectorOperations.h"

#import "GLLinearTransformationOperations.h"

#include <mach/mach_time.h>

@interface GLLinearTransform ()
@property(readwrite, assign, nonatomic) NSUInteger nDataPoints;
@property(readwrite, assign, nonatomic) NSUInteger nDataElements;
@property(readwrite, assign, nonatomic) NSUInteger dataBytes;
@end

@implementation GLLinearTransform

/************************************************/
/*		Superclass								*/
/************************************************/

#pragma mark -
#pragma mark Superclass
#pragma mark

- (id) init
{
	[NSException raise: @"BadInitialization" format: @"Cannot initialize GLLinearTransfor with -init method."];
	
	return self;
}

@synthesize nDataPoints = _nDataPoints;
@synthesize nDataElements = _nDataElements;
@synthesize dataBytes = _dataBytes;

/************************************************/
/*		Initialization							*/
/************************************************/

#pragma mark -
#pragma mark Initialization
#pragma mark

+ (GLLinearTransform *) transformOfType: (GLDataFormat) dataFormat withFromDimensions: (NSArray *) fromDims toDimensions: (NSArray *) toDims inFormat: (NSArray *) matrixFormats forEquation: (GLEquation *) equation matrix:(GLFloatComplex (^)(NSUInteger *, NSUInteger *)) matrix
{
    return [[self alloc] initTransformOfType: dataFormat withFromDimensions: fromDims toDimensions: toDims inFormat: matrixFormats forEquation: equation matrix:matrix];
}

+ (GLLinearTransform *) transformWithFromDimensions: (NSArray *) fromDims toDimensions: (NSArray *) toDims forEquation: (GLEquation *) equation matrix:(GLFloatComplex (^)(NSUInteger *, NSUInteger *)) matrix {
    return nil;
}

- (id) initTransformOfType: (GLDataFormat) dataFormat withFromDimensions: (NSArray *) fromDims toDimensions: (NSArray *) toDims inFormat: (NSArray *) matrixFormats forEquation: (GLEquation *) theEquation matrix:(GLFloatComplex (^)(NSUInteger *, NSUInteger *)) matrix;
{
	if (!theEquation || fromDims.count != toDims.count || fromDims.count != matrixFormats.count) {
		NSLog(@"Attempted to initialize GLLinearTransform without an equation or consistent set of dimensions!!!");
		return nil;
	}
	
	if ((self = [super initWithType: dataFormat withEquation: theEquation])) {
        self.matrixFormats = matrixFormats;
		self.matrixBlock = matrix;
		self.toDimensions = [NSArray arrayWithArray: toDims];
		self.fromDimensions = [NSArray arrayWithArray: fromDims];
		
		// We loop through the dimensions and allocate enough memory for the variable
		// defined on each dimension.
		_nDataPoints = 0;
		_nDataElements = 0;
		
		for (NSUInteger iDim=0; iDim < fromDims.count; iDim++)
		{
			GLDimension *fromDim = fromDims[iDim];
			GLDimension *toDim = toDims[iDim];
			GLMatrixFormat matrixFormat = [matrixFormats[iDim] unsignedIntegerValue];
			
			if (_nDataPoints == 0 && matrixFormat != kGLIdentityMatrixFormat) {
				_nDataPoints = 1;
				_nDataElements = 1;
			}
			
			if ( matrixFormat == kGLIdentityMatrixFormat) {
				_nDataPoints *= 1;
				_nDataElements *= 1;
			} else if ( matrixFormat == kGLDenseMatrixFormat) {
				_nDataPoints *= fromDim.nPoints * toDim.nPoints;
				_nDataElements *= fromDim.nPoints * toDim.nPoints;
			} else if ( matrixFormat == kGLDiagonalMatrixFormat) {
				_nDataPoints *= toDim.nPoints;
				_nDataElements *= toDim.nPoints;
			} else if ( matrixFormat == kGLSubdiagonalMatrixFormat) {
				_nDataPoints *= toDim.nPoints;
				_nDataElements *= toDim.nPoints;
			} else if ( matrixFormat == kGLSuperdiagonalMatrixFormat) {
				_nDataPoints *= toDim.nPoints;
				_nDataElements *= toDim.nPoints;
			} else if ( matrixFormat == kGLTridiagonalMatrixFormat) {
				_nDataPoints *= 3*toDim.nPoints;
				_nDataElements *= 3*toDim.nPoints;
			}
			
			if (fromDim.basisFunction == kGLDeltaBasis) {
                self.realSymmetry[iDim] = @(kGLNoSymmetry);
                self.imaginarySymmetry[iDim] = (dataFormat == kGLRealDataFormat ? @(kGLZeroSymmetry) : @(kGLNoSymmetry));
            } else if (fromDim.basisFunction == kGLCosineBasis || fromDim.basisFunction == kGLCosineHalfShiftBasis) {
                self.realSymmetry[iDim] = @(kGLEvenSymmetry);
                self.imaginarySymmetry[iDim] = @(kGLZeroSymmetry);
            } else if (fromDim.basisFunction == kGLSineBasis || fromDim.basisFunction == kGLSineHalfShiftBasis) {
                self.realSymmetry[iDim] = @(kGLOddSymmetry);
                self.imaginarySymmetry[iDim] = @(kGLZeroSymmetry);
            } else if (fromDim.basisFunction == kGLExponentialBasis ) {
                self.realSymmetry[iDim] = @(kGLNoSymmetry);
                self.imaginarySymmetry[iDim] = (dataFormat == kGLRealDataFormat ? @(kGLZeroSymmetry) : @(kGLNoSymmetry));
            }
		}
        
        if (dataFormat == kGLSplitComplexDataFormat || dataFormat == kGLInterleavedComplexDataFormat) {
            _nDataElements *= 2;
        }
		
		_dataBytes = _nDataElements*sizeof(GLFloat);
        
        self.matrixDescription = [[GLMatrixDescription alloc] initWithLinearTransform: self];
        
        if (self.matrixBlock) {
            [self populateDataFromMatrixBlock];
        }
	}
	
	return self;
}


- (void) populateDataFromMatrixBlock
{
    if (self.matrixBlock) {
        transformMatrix theMatrixBlock = self.matrixBlock;
        
        // This block places the matrix value in the correct spot in memory (memIndex), given a particular choice of row and column indices (rows, col).
        // The assignment is only dependent on the format.
        void (^assignData)(NSUInteger *, NSUInteger *, GLFloat *, NSUInteger) = ^( NSUInteger *row, NSUInteger *col, GLFloat *f, NSUInteger memIndex ) {
                GLFloatComplex value = theMatrixBlock(row, col);
                
                if (self.dataFormat == kGLRealDataFormat) {
                    f[memIndex] = creal(value);
                } else if (self.dataFormat == kGLInterleavedComplexDataFormat) {
                    f[2*memIndex] = creal(value);
                    f[2*memIndex+1] = cimag(value);
                } else if (self.dataFormat == kGLSplitComplexDataFormat) {
                    f[memIndex] = creal(value);
                    f[memIndex+self.nDataPoints] = cimag(value);
                }
        };
        
        void (^assignZeroData)(GLFloat *, NSUInteger) = ^(GLFloat *f, NSUInteger memIndex ) {
            if (self.dataFormat == kGLRealDataFormat) {
                f[memIndex] = 0.0;
            } else if (self.dataFormat == kGLInterleavedComplexDataFormat) {
                f[2*memIndex] = 0.0;
                f[2*memIndex+1] = 0.0;
            } else if (self.dataFormat == kGLSplitComplexDataFormat) {
                f[memIndex] = 0.0;
                f[memIndex+self.nDataPoints] = 0.0;
            }
        };
        
        for (NSInteger iDim = self.matrixDescription.nDimensions-1; iDim >= 0; iDim--)
        {
            GLDataStride stride = self.matrixDescription.strides[iDim];
            
            // This block encapsulates a loop over the appropriate rows and columns of one dimension pair, given the known data format.
            void (^loop)( NSUInteger *, NSUInteger *, GLFloat *, NSUInteger );
        
            if (stride.format == kGLIdentityMatrixFormat) {
                // We store nothing in this case---so there is no loop.
                loop = ^( NSUInteger *row, NSUInteger *col, GLFloat *f, NSUInteger index ) {
                    assignData( row, col, f, index);
                };
            } else if (stride.format == kGLDenseMatrixFormat) {
                // Here we loop over ALL possible rows an columns---this matrix is dense.
                loop = ^( NSUInteger *row, NSUInteger *col, GLFloat *f, NSUInteger index ) {
                    for (NSUInteger i=0; i<stride.nRows; i++) {
                        for (NSUInteger j=0; j<stride.nColumns; j++) {
                            row[iDim] = i;
                            col[iDim] = j;
                            
                            NSUInteger memIndex = index + i*stride.rowStride + j*stride.columnStride;
                            assignData( row, col, f, memIndex);
                        }
                    }
                };
            } else if (stride.format == kGLDiagonalMatrixFormat) {
                // Loop over the diagonal only.
                loop = ^( NSUInteger *row, NSUInteger *col, GLFloat *f, NSUInteger index ) {
                    for (NSUInteger i=0; i<stride.nDiagonalPoints; i++) {
                        row[iDim] = i;
                        col[iDim] = i;
                        
                        NSUInteger memIndex = index + i*stride.stride;
                        assignData( row, col, f, memIndex);
                    }
                };
            } else if (stride.format == kGLSubdiagonalMatrixFormat) {
                // Loop over the sub-diagonal. Assign zero to the first element (which never actually gets used)
                loop = ^( NSUInteger *row, NSUInteger *col, GLFloat *f, NSUInteger index ) {
                    assignZeroData(f, index + 0*stride.stride);
                    for (NSUInteger i=1; i<stride.nDiagonalPoints; i++) {
                        row[iDim] = i;
                        col[iDim] = i-1;
                        
                        NSUInteger memIndex = index + i*stride.stride;
                        assignData( row, col, f, memIndex);
                    }
                };
            } else if (stride.format == kGLSuperdiagonalMatrixFormat) {
                // Loop over the super-diagonal. Assign zero to the last element (which never actually gets used)
                loop = ^( NSUInteger *row, NSUInteger *col, GLFloat *f, NSUInteger index ) {
                    assignZeroData(f, index + (stride.nDiagonalPoints-1)*stride.stride);
                    for (NSUInteger i=0; i<stride.nDiagonalPoints-1; i++) {
                        row[iDim] = i;
                        col[iDim] = i+1;
                        
                        NSUInteger memIndex = index + i*stride.stride;
                        assignData( row, col, f, memIndex);
                    }
                };
            } else if (stride.format == kGLTridiagonalMatrixFormat) {
                // Loop over the super-diagonal. Assign zero to the last element (which never actually gets used)
                loop = ^( NSUInteger *row, NSUInteger *col, GLFloat *f, NSUInteger index ) {
                    assignZeroData(f, index + 0*stride.stride);
                    assignZeroData(f, index + (stride.nDiagonalPoints-1)*stride.stride + 2*stride.diagonalStride);
                    for (NSUInteger i=1; i<stride.nDiagonalPoints; i++) {
                        row[iDim] = i;
                        col[iDim] = i-1;
                        
                        NSUInteger memIndex = index + i*stride.stride;
                        assignData( row, col, f, memIndex);
                    }
                    for (NSUInteger i=0; i<stride.nDiagonalPoints; i++) {
                        row[iDim] = i;
                        col[iDim] = i;
                        
                        NSUInteger memIndex = index + i*stride.stride + 1*stride.diagonalStride;
                        assignData( row, col, f, memIndex);
                    }
                    for (NSUInteger i=0; i<stride.nDiagonalPoints-1; i++) {
                        row[iDim] = i;
                        col[iDim] = i+1;
                        
                        NSUInteger memIndex = index + i*stride.stride + 2*stride.diagonalStride;
                        assignData( row, col, f, memIndex);
                    }
                };
            }
            
            assignData = loop;
        }
        
        // And finally, we can now excute the block.
        NSUInteger *rows = malloc(self.matrixDescription.nDimensions * sizeof(NSUInteger));
        NSUInteger *cols = malloc(self.matrixDescription.nDimensions * sizeof(NSUInteger));
        assignData( rows, cols, self.pointerValue, 0);
        free(rows);
        free(cols);
    }
}

/************************************************/
/*		Pre-defined transformations             */
/************************************************/

#pragma mark -
#pragma mark Pre-defined transformations
#pragma mark

+ (GLLinearTransform *) discreteTransformFromDimension: (GLDimension *) aDimension toBasis: (GLBasisFunction) aBasis forEquation: (GLEquation *) equation
{
    if (aDimension.basisFunction == kGLDeltaBasis) {
        GLDimension *x=aDimension;
   
        if (aBasis == kGLExponentialBasis)
        {   // This is the DFT---discrete Fourier transform
            GLDimension *k = [[GLDimension alloc] initAsDimension: x transformedToBasis: aBasis strictlyPositive: NO];
            GLLinearTransform *dft = [self transformOfType: kGLSplitComplexDataFormat withFromDimensions: @[x] toDimensions: @[k] inFormat: @[@(kGLDenseMatrixFormat)] forEquation: equation matrix: ^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                GLFloat *xVal = (GLFloat *) x.data.bytes;
                GLFloat N = x.nPoints;
                
                GLFloatComplex value = cos(2*M_PI*kVal[row[0]]*xVal[col[0]])/N - I*(sin(2*M_PI*kVal[row[0]]*xVal[col[0]])/N);
                
                return value;
            }];
            
            return dft;
        }
        else if (aBasis == kGLCosineHalfShiftBasis)
        {   // This is the DCT---discrete cosine transform
            GLDimension *k = [[GLDimension alloc] initAsDimension: x transformedToBasis: aBasis strictlyPositive: YES];
            GLLinearTransform *dct = [self transformOfType: kGLRealDataFormat withFromDimensions: @[x] toDimensions: @[k] inFormat: @[@(kGLDenseMatrixFormat)] forEquation: equation matrix: ^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                GLFloat *xVal = (GLFloat *) x.data.bytes;
                
                GLFloatComplex value = cos(M_PI*kVal[row[0]]*xVal[col[0]])/x.nPoints ;
                
                return value;
            }];
            
            return dct;
        }
        else if (aBasis == kGLSineHalfShiftBasis)
        {   // This is the DST---discrete sine transform
            GLDimension *k = [[GLDimension alloc] initAsDimension: x transformedToBasis: aBasis strictlyPositive: YES];
            GLLinearTransform *dst = [self transformOfType: kGLRealDataFormat withFromDimensions: @[x] toDimensions: @[k] inFormat: @[@(kGLDenseMatrixFormat)] forEquation: equation matrix: ^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                GLFloat *xVal = (GLFloat *) x.data.bytes;
                
                GLFloatComplex value = sin(M_PI*kVal[row[0]]*xVal[col[0]])/x.nPoints ;
                
                return value;
            }];
            
            return dst;
        }
    }
    else {
        GLDimension *k=aDimension;
        GLDimension *x = [[GLDimension alloc] initAsDimension: k transformedToBasis: kGLDeltaBasis strictlyPositive: NO];
        if (k.basisFunction == kGLExponentialBasis)
        {   // This is the IDFT---inverse discrete Fourier transform
            GLLinearTransform *idft = [self transformOfType: kGLSplitComplexDataFormat withFromDimensions: @[x] toDimensions: @[k] inFormat: @[@(kGLDenseMatrixFormat)] forEquation: equation matrix: ^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                GLFloat *xVal = (GLFloat *) x.data.bytes;
                
                GLFloatComplex value = cos(2*M_PI*kVal[col[0]]*xVal[row[0]]) - I*sin(2*M_PI*kVal[col[0]]*xVal[row[0]]);
                
                return value;
            }];
            
            return idft;
        }
        else if (aBasis == kGLCosineHalfShiftBasis)
        {   // This is the IDCT---inverse discrete cosine transform
            GLDimension *k = [[GLDimension alloc] initAsDimension: x transformedToBasis: aBasis strictlyPositive: YES];
            GLLinearTransform *idct = [self transformOfType: kGLRealDataFormat withFromDimensions: @[x] toDimensions: @[k] inFormat: @[@(kGLDenseMatrixFormat)] forEquation: equation matrix: ^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                GLFloat *xVal = (GLFloat *) x.data.bytes;
                
                GLFloatComplex value = col[0]==0 ? 1.0 : 2.0*cos(M_PI*kVal[col[0]]*xVal[row[0]]);
                
                return value;
            }];
            
            return idct;
        }
        else if (aBasis == kGLSineHalfShiftBasis)
        {   // This is the IDST---inverse discrete sine transform
            GLDimension *k = [[GLDimension alloc] initAsDimension: x transformedToBasis: aBasis strictlyPositive: YES];
            GLLinearTransform *idst = [self transformOfType: kGLRealDataFormat withFromDimensions: @[x] toDimensions: @[k] inFormat: @[@(kGLDenseMatrixFormat)] forEquation: equation matrix: ^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                GLFloat *xVal = (GLFloat *) x.data.bytes;
                
                GLFloatComplex value = col[0]==x.nPoints-1 ? pow(-1.0,x.nPoints) : 2.0*sin(M_PI*kVal[col[0]]*xVal[row[0]]);
                
                return value;
            }];
            
            return idst;
        }
    }
    
    [NSException exceptionWithName: @"BadDimension" reason:@"I don't understand the words that are coming out of your mouth." userInfo:nil];
    
    return nil;
}

+ (GLLinearTransform *) differentialOperatorOfOrder: (NSUInteger) numDerivs fromDimension: (GLDimension *) k forEquation: (GLEquation *) equation
{
    GLLinearTransform *diff;
    if (numDerivs == 0)
    {
		diff = [GLLinearTransform transformOfType: kGLRealDataFormat withFromDimensions: @[k] toDimensions: @[k] inFormat: @[@(kGLDiagonalMatrixFormat)] forEquation: equation matrix:^( NSUInteger *row, NSUInteger *col ) {
            return (GLFloatComplex) (row[0]==col[0] ? 1.0 : 0.0);
        }];
    }
	else if (k.basisFunction == kGLExponentialBasis)
    {
        // i^0=1, i^1=i, i^2=-1, i^3=-i
        GLDataFormat dataFormat = numDerivs % 2 == 0 ? kGLRealDataFormat : kGLSplitComplexDataFormat;
		diff = [GLLinearTransform transformOfType: dataFormat withFromDimensions: @[k] toDimensions: @[k] inFormat: @[@(kGLDiagonalMatrixFormat)] forEquation: equation matrix:^( NSUInteger *row, NSUInteger *col ) {
            GLFloat *kVal = (GLFloat *) k.data.bytes;
            return (GLFloatComplex) (row[0]==col[0] ? cpow(I*2*M_PI*kVal[row[0]], numDerivs) : 0.0);
        }];
        diff.isRealPartZero = numDerivs % 2 == 1;
        diff.isImaginaryPartZero = numDerivs % 2 == 0;
	}
    else if (k.basisFunction == kGLCosineHalfShiftBasis)
    {
        if (numDerivs % 2 == 1) {
            GLDimension *transformedDimension = [[GLDimension alloc] initAsDimension: k transformedToBasis: kGLSineHalfShiftBasis strictlyPositive: YES];
            GLFloat sign = (numDerivs-1)/2 % 2 ? 1. : -1.;
            diff = [GLLinearTransform transformOfType: kGLRealDataFormat withFromDimensions: @[k] toDimensions: @[transformedDimension] inFormat: @[@(kGLSuperdiagonalMatrixFormat)] forEquation: equation matrix:^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                return (GLFloatComplex) (row[0]+1==col[0] ? sign*pow(2*M_PI*kVal[row[0]+1], numDerivs) : 0.0);
            }];
        } else {
            GLFloat sign = numDerivs/2 % 2 ? -1. : 1.;
            diff = [GLLinearTransform transformOfType: kGLRealDataFormat withFromDimensions: @[k] toDimensions: @[k] inFormat: @[@(kGLDiagonalMatrixFormat)] forEquation: equation matrix:^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                return (GLFloatComplex) (row[0]==col[0] ? sign*pow(2*M_PI*kVal[row[0]], numDerivs) : 0.0);
            }];
        }
	}
    else if (k.basisFunction == kGLSineHalfShiftBasis)
    {
        if (numDerivs % 2 == 1) {
            GLDimension *transformedDimension = [[GLDimension alloc] initAsDimension: k transformedToBasis: kGLCosineHalfShiftBasis strictlyPositive: YES];
            GLFloat sign = (numDerivs-1)/2 % 2 ? -1. : 1.;
            diff = [GLLinearTransform transformOfType: kGLRealDataFormat withFromDimensions: @[k] toDimensions: @[transformedDimension] inFormat: @[@(kGLSubdiagonalMatrixFormat)] forEquation: equation matrix:^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                return (GLFloatComplex) (row[0]-1==col[0] ? sign*pow(2*M_PI*kVal[row[0]-1], numDerivs) : 0.0);
            }];
        } else {
            GLFloat sign = numDerivs/2 % 2 ? -1. : 1.;
            diff = [GLLinearTransform transformOfType: kGLRealDataFormat withFromDimensions: @[k] toDimensions: @[k] inFormat: @[@(kGLDiagonalMatrixFormat)] forEquation: equation matrix:^( NSUInteger *row, NSUInteger *col ) {
                GLFloat *kVal = (GLFloat *) k.data.bytes;
                return (GLFloatComplex) (row[0]==col[0] ? sign*pow(2*M_PI*kVal[row[0]], numDerivs) : 0.0);
            }];
        }
	} else if (k.basisFunction == kGLChebyshevBasis)
    {
        if (numDerivs > 1) [NSException exceptionWithName: @"NotYetImplemented" reason:@"Chebyshev derivatives greater than 1 are not yet implemented" userInfo:nil];
		diff = [GLLinearTransform transformOfType: kGLRealDataFormat withFromDimensions: @[k] toDimensions: @[k] inFormat: @[@(kGLDenseMatrixFormat)] forEquation: equation matrix:^( NSUInteger *row, NSUInteger *col ) {
            GLFloat *kVal = (GLFloat *) k.data.bytes;
            return (GLFloatComplex) (  (col[0] >= row[0]+1 && (row[0]+col[0])%2==1)  ? 2.*kVal[col[0]] : 0.0);
        }];
	} else {
        [NSException exceptionWithName: @"NotYetImplemented" reason:@"Derivatives for that basis are not yet implemented" userInfo:nil];
    }
    
    return diff;
}

+ (GLLinearTransform *) differentialOperatorWithDerivatives: (NSArray *) numDerivs fromDimensions: (NSArray *) dimensions forEquation: (GLEquation *) equation
{
    NSMutableArray *linearTransformations = [NSMutableArray array];
    NSMutableArray *toDimensions = [NSMutableArray array];
    NSMutableArray *matrixFormat = [NSMutableArray array];
    NSMutableArray *matrixBlocks = [NSMutableArray array];
    BOOL isComplex = NO;
    for (NSUInteger i=0; i<dimensions.count; i++) {
        GLLinearTransform *diffOp = [self differentialOperatorOfOrder: [numDerivs[i] unsignedIntegerValue] fromDimension: dimensions[i] forEquation:equation];
        linearTransformations[i] = diffOp;
        toDimensions[i] = diffOp.toDimensions[0];
        isComplex |= diffOp.isComplex;
        matrixFormat[i] = diffOp.matrixFormats[0];
        matrixBlocks[i] = diffOp.matrixBlock;
    }
    GLDataFormat format = isComplex ? kGLSplitComplexDataFormat : kGLRealDataFormat;
    
    // We are just taking the outer product (tensor product) of the different transformations.
    GLLinearTransform *diffOp = [GLLinearTransform transformOfType:format withFromDimensions: dimensions toDimensions: toDimensions inFormat:matrixFormat forEquation:equation matrix: ^( NSUInteger *row, NSUInteger *col ) {
        transformMatrix theMatrixBlock = matrixBlocks[0];
        GLFloatComplex value = theMatrixBlock(&(row[0]), &(col[0]));
        for (NSUInteger i=1;i<matrixBlocks.count;i++) {
            value *= theMatrixBlock(&(row[i]), &(col[i]));
        }
        return value;
    }];
    
    return diffOp;
}


- (void) setVariableAlongDiagonal: (GLVariable *) diagonalVariable
{
    if (self.matrixDescription.nDimensions == 1)
    {
        if (self.matrixDescription.strides[0].format == kGLDenseMatrixFormat) {
            
            GLFloat *f = self.pointerValue;
            GLFloat *a = diagonalVariable.pointerValue;
            
            NSUInteger rowStride = self.matrixDescription.strides[0].rowStride;
            NSUInteger columnStride = self.matrixDescription.strides[0].columnStride;
            
            for ( NSUInteger i=0; i<self.matrixDescription.strides[0].nRows; i++) {
                for ( NSUInteger j=0; j<self.matrixDescription.strides[0].nColumns; j++) {
                    if (i==j) {
                        f[i*rowStride + j*columnStride] = a[j];
                    } else {
                        f[i*rowStride + j*columnStride] = 0.0;
                    }
                }
            }
            
        }
    }
}

- (void) setVariablesAlongTridiagonal: (NSArray *) tridiagonalVariables
{
    NSUInteger triIndex = NSNotFound;
	NSUInteger firstNonTriIndex = NSNotFound;
	NSUInteger numTriIndices = 0;
    for ( NSNumber *num in self.matrixFormats) {
        if ([num unsignedIntegerValue] == kGLTridiagonalMatrixFormat) {
            triIndex = [self.matrixFormats indexOfObject: num];
			numTriIndices++;
        } else if ([num unsignedIntegerValue] != kGLIdentityMatrixFormat && firstNonTriIndex == NSNotFound ) {
			firstNonTriIndex = [self.matrixFormats indexOfObject: num];
		}
    }
    
    GLFloat *a = [tridiagonalVariables[0] pointerValue];
    GLFloat *b = [tridiagonalVariables[1] pointerValue];
    GLFloat *c = [tridiagonalVariables[2] pointerValue];
    
    GLFloat *d = self.pointerValue;
    NSUInteger elementStride = self.matrixDescription.strides[triIndex].stride;
    NSUInteger diagonalStride = self.matrixDescription.strides[triIndex].diagonalStride;
    NSUInteger m,n;
    for ( NSUInteger i=0; i<[tridiagonalVariables[0] nDataPoints]; i++) {
        m = i%diagonalStride;
        n = i/diagonalStride;
        d[ (3*n+0)*diagonalStride + m*elementStride] = a[i];
        d[ (3*n+1)*diagonalStride + m*elementStride] = b[i];
        d[ (3*n+2)*diagonalStride + m*elementStride] = c[i];
    }
}

/************************************************/
/*		Dimensionality							*/
/************************************************/

#pragma mark -
#pragma mark Dimensionality
#pragma mark

- (BOOL) isHermitian {
	if (self.hermitianDimension) {
		NSUInteger i = [self.fromDimensions indexOfObject: self.hermitianDimension];
		return ( ([self.realSymmetry[i] unsignedIntegerValue] == kGLEvenSymmetry || self.isRealPartZero) && ([self.imaginarySymmetry[i] unsignedIntegerValue] == kGLOddSymmetry || self.isImaginaryPartZero) );
	}
	return NO;
}

- (NSUInteger) rank {
	return 2;
}

/************************************************/
/*		Operations								*/
/************************************************/

#pragma mark -
#pragma mark Operations
#pragma mark

- (GLVariable *) transform: (GLVariable *) x
{
	NSUInteger numIdentityIndices = 0;
	NSUInteger numDiagonalIndices = 0;
	NSUInteger numSubDiagonalIndices = 0;
	NSUInteger numSuperDiagonalIndices = 0;
	NSUInteger numTriIndices = 0;
	NSUInteger numDenseIndices = 0;
	for ( NSNumber *num in self.matrixFormats ) {
        if ([num unsignedIntegerValue] == kGLIdentityMatrixFormat) {
			numIdentityIndices++;
        } else if ([num unsignedIntegerValue] == kGLDiagonalMatrixFormat) {
			numDiagonalIndices++;
        } else if ([num unsignedIntegerValue] == kGLSubdiagonalMatrixFormat) {
			numSubDiagonalIndices++;
        } else if ([num unsignedIntegerValue] == kGLSuperdiagonalMatrixFormat) {
			numSuperDiagonalIndices++;
        } else if ([num unsignedIntegerValue] == kGLTridiagonalMatrixFormat) {
			numTriIndices++;
        } else if ([num unsignedIntegerValue] == kGLDenseMatrixFormat) {
			numDenseIndices++;
        }
    }
		
	if (numDenseIndices == 0 && numSubDiagonalIndices == 0 && numSuperDiagonalIndices == 0 && numTriIndices == 1 && numDenseIndices == 0) {
		// Tridiagonal matrix transformations.
		GLTriadiagonalTransformOperation *operation = [[GLTriadiagonalTransformOperation alloc] initWithLinearTransformation: self function: x];
		operation = [self replaceWithExistingOperation: operation];
		return operation.result[0];
	} else if (numDenseIndices == 1 && numDiagonalIndices == 0 && numSubDiagonalIndices == 0 && numSuperDiagonalIndices == 0 && numTriIndices == 0 && numDenseIndices == 0) {
		// Dense matrix transformations.
		GLDenseMatrixTransformOperation *operation = [[GLDenseMatrixTransformOperation alloc] initWithLinearTransformation: self function: x];
		operation = [self replaceWithExistingOperation: operation];
		return operation.result[0];
	}  else if (numDenseIndices == 0 && numIdentityIndices == 0 && numSubDiagonalIndices == 0 && numSuperDiagonalIndices == 0 && numTriIndices == 0 && numDenseIndices == 0) {
		// Diagonal matrix transformation
		GLMultiplicationOperation *operation = [[GLMultiplicationOperation alloc] initWithFirstOperand: self secondOperand: x];
		operation = [self replaceWithExistingOperation: operation];
		return operation.result[0];
	}  else if (numDenseIndices == 0 && numIdentityIndices == 0 && numTriIndices == 0 && numDenseIndices == 0) {
		// General diagonal matrix transformation
		GLSingleDiagonalTransformOperation *operation = [[GLSingleDiagonalTransformOperation alloc] initWithLinearTransformation: self function: x];
		operation = [self replaceWithExistingOperation: operation];
		return operation.result[0];
	}
	
	NSString *descrip = [NSString stringWithFormat: @"No algorithm implemented to solve problem. This matrix contains (identity, diagonal, sub-diagonal, super-diagonal, tri-diagonal, dense)=(%lu,%lu,%lu,%lu,%lu,%lu) indices", numIdentityIndices, numDiagonalIndices,numSubDiagonalIndices, numSuperDiagonalIndices, numTriIndices, numDenseIndices];
	[NSException exceptionWithName: @"BadFormat" reason:descrip userInfo:nil];
	
	return nil;
}

- (GLVariable *) solve: (GLVariable *) b
{
	NSUInteger numIdentityIndices = 0;
	NSUInteger numDiagonalIndices = 0;
	NSUInteger numSubDiagonalIndices = 0;
	NSUInteger numSuperDiagonalIndices = 0;
	NSUInteger numTriIndices = 0;
	NSUInteger numDenseIndices = 0;
	for ( NSNumber *num in self.matrixFormats ) {
        if ([num unsignedIntegerValue] == kGLIdentityMatrixFormat) {
			numIdentityIndices++;
        } else if ([num unsignedIntegerValue] == kGLDiagonalMatrixFormat) {
			numDiagonalIndices++;
        } else if ([num unsignedIntegerValue] == kGLSubdiagonalMatrixFormat) {
			numSubDiagonalIndices++;
        } else if ([num unsignedIntegerValue] == kGLSuperdiagonalMatrixFormat) {
			numSuperDiagonalIndices++;
        } else if ([num unsignedIntegerValue] == kGLTridiagonalMatrixFormat) {
			numTriIndices++;
        } else if ([num unsignedIntegerValue] == kGLDenseMatrixFormat) {
			numDenseIndices++;
        }
    }
	
	if ( numIdentityIndices && !numDiagonalIndices && !numTriIndices && !numDenseIndices )
	{	// Trivially solution.
		return b;
	}
	else if ( numDiagonalIndices && !numTriIndices && !numDenseIndices )
	{	// Diagonal only
		
	}
	else if ( numTriIndices == 1 && !numDenseIndices )
	{	// A single tridiagonal dimension
		GLTriadiagonalSolverOperation *operation = [[GLTriadiagonalSolverOperation alloc] initWithLinearTransformation: self function: b];
		operation = [self replaceWithExistingOperation: operation];
		return operation.result[0];
	}
	else if ( !numTriIndices && numDenseIndices == 1 )
	{	// A single dense dimension
		GLDenseMatrixSolver *operation = [[GLDenseMatrixSolver alloc] initWithLinearTransformation: self function: b];
		operation = [self replaceWithExistingOperation: operation];
		return operation.result[0];
	}
	
	NSString *descrip = [NSString stringWithFormat: @"No algorithm implemented to solve problem. This matrix contains (identity, diagonal, sub-diagonal, super-diagonal, tri-diagonal, dense)=(%lu,%lu,%lu,%lu,%lu,%lu) indices", numIdentityIndices, numDiagonalIndices,numSubDiagonalIndices, numSuperDiagonalIndices, numTriIndices, numDenseIndices];
	[NSException exceptionWithName: @"BadFormat" reason:descrip userInfo:nil];
	
	return nil;
}


- (GLVariable *) times: (GLVariable *) otherVariable
{
	return [self multiply: otherVariable];
}

- (GLVariable *) multiply: (GLVariable *) otherVariable
{
	GLMatrixMatrixMultiplicationOperation *operation = [[GLMatrixMatrixMultiplicationOperation alloc] initWithFirstOperand: self secondOperand: otherVariable];
    operation = [self replaceWithExistingOperation: operation];
	return operation.result;
}

- (GLLinearTransform *) inverse
{
    GLMatrixInversionOperation *operation = [[GLMatrixInversionOperation alloc] initWithOperand: self];
    operation = [self replaceWithExistingOperation: operation];
	return operation.result;
}

- (GLLinearTransform *) plus: (GLLinearTransform *) otherVariable
{
	GLLinearTransformAdditionOperation *operation = [[GLLinearTransformAdditionOperation alloc] initWithFirstOperand: self secondOperand: otherVariable];
    operation = [self replaceWithExistingOperation: operation];
	return operation.result;
}

- (NSString *) matrixDescriptionString
{
	NSUInteger n = self.matrixDescription.strides[0].rowStride;
	n = n==0?1:n;
	NSMutableString *descrip = [NSMutableString string];
	
	GLFloat max, min;
	vGL_maxv( self.data.mutableBytes, 1, &max, self.nDataElements);
	vGL_minv( self.data.mutableBytes, 1, &min, self.nDataElements);
	
	if ( fabs(min) > max) {
		max = fabs(min);
	}
	
	GLFloat divisor = pow(10, floor(log10(max)));
	if ( divisor == 0.0) divisor = 1;
	
	if (0 && self.dataFormat == kGLSplitComplexDataFormat)
	{
		GLSplitComplex splitComplex = self.splitComplex;
		[descrip appendFormat: @"%f * ", divisor];
        //		for (NSUInteger i=0; i<self.nDataPoints; i++)
        //		{
        //			if ( i % n == 0 ) {
        //				[descrip appendFormat: @"\n"];
        //			}
        //			[descrip appendFormat: @"%1.1f ", sqrt(fabs(splitComplex.realp[i] * splitComplex.realp[i] - splitComplex.imagp[i] * splitComplex.imagp[i]))/divisor];
        //		}
		
		for (NSUInteger i=0; i<self.nDataPoints; i++)
		{
			if ( i % n == 0 ) {
				[descrip appendFormat: @"\n"];
			}
			[descrip appendFormat: @"%+1.1f ", splitComplex.realp[i]/divisor];
		}
		
		[descrip appendFormat: @" imagp \n"];
		for (NSUInteger i=0; i<self.nDataPoints; i++)
		{
			if ( i % n == 0 ) {
				[descrip appendFormat: @"\n"];
			}
			[descrip appendFormat: @"%+1.1f ", splitComplex.imagp[i]/divisor];
		}
	}
    if ( self.fromDimensions.count == 3)
    {
        NSUInteger m = [self.fromDimensions[2] nPoints] * [self.fromDimensions[1] nPoints];
        GLFloat *f = self.pointerValue;
		[descrip appendFormat: @"%g * ", divisor];
		for (NSUInteger i=0; i<self.nDataElements; i++)
		{
			if ( i % m == 0 ) {
				[descrip appendFormat: @"\n"];
			}
            if ( i % n == 0 ) {
				[descrip appendFormat: @"\n"];
			}
            
			[descrip appendFormat: @"%+1.1f ", f[i]/divisor];
		}
    }
	else
	{
		GLFloat *f = self.pointerValue;
		[descrip appendFormat: @"%g * ", divisor];
		for (NSUInteger i=0; i<self.nDataElements; i++)
		{
			if ( i % n == 0 ) {
				[descrip appendFormat: @"\n"];
			}
			[descrip appendFormat: @"%+1.1f ", f[i]/divisor];
		}
	}
	
	return descrip;
}

@end
