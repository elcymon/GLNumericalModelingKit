//
//  GLVectorVectorOperations.h
//  GLNumericalModelingKit
//
//  Created by Jeffrey Early on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <GLNumericalModelingKit/GLVariableOperations.h>
#import <GLNumericalModelingKit/GLScalar.h>

/************************************************/
/*		GLAdditionOperation						*/
/************************************************/
/** C = A + B. This operation takes scalar-scalar, scalar-vector, vector-vector, scalar-matrix and matrix-matrix arguments. At the moment, the matrices must be in the same format.
 @param A An input scalar, vector or matrix.
 @param B An input scalar, vector or matrix.
 @returns The result C.
 */
@interface GLAdditionOperation : GLVariableOperation
- (id) initWithFirstOperand: (GLVariable *) A secondOperand: (GLVariable *) B;
@end


/************************************************/
/*		GLSubtractionOperation					*/
/************************************************/
/** C = A - B. This operation takes scalar-scalar, scalar-vector, vector-vector, scalar-matrix and matrix-matrix arguments. At the moment, the matrices must be in the same format.
 @param A An input scalar, vector or matrix.
 @param B An input scalar, vector or matrix.
 @returns The result C.
 */
@interface GLSubtractionOperation : GLVariableOperation
- (id) initWithFirstOperand: (GLVariable *) A secondOperand: (GLVariable *) B;
@end


/************************************************/
/*		GLMultiplicationOperation				*/
/************************************************/
/** C = A * B. This operation takes scalar-scalar, scalar-vector, vector-vector, scalar-matrix and matrix-matrix arguments. At the moment, the matrices must be diagonal matrices. This will also multiply functions of different dimensions together, such as h(x,y) = f(x)*g(x,y).
 @param A An input scalar, vector or matrix.
 @param B An input scalar, vector or matrix.
 @returns The result C.
 */
@interface GLMultiplicationOperation : GLVariableOperation
- (id) initWithFirstOperand: (GLVariable *) A secondOperand: (GLVariable *) B;
@end

/************************************************/
/*		GLDivisionOperation						*/
/************************************************/
/** C = A / B. This operation takes scalar-scalar, scalar-vector and vector-vector arguments.
 @param A An input scalar or vector.
 @param B An input scalar or vector
 @returns The result C.
 */
@interface GLDivisionOperation : GLVariableOperation

- (id) initWithFirstOperand: (GLVariable *) A secondOperand: (GLVariable *) B;

// You can optionally set useComplexDivision to NO, and it will simply do an element-wise divide, ignoring complex math.
- (id) initWithFirstOperand: (GLVariable *) A secondOperand: (GLVariable *) B shouldUseComplexArithmetic: (BOOL) useComplexArithmetic;
@property BOOL useComplexArithmetic;

@end

/************************************************/
/*		GLAbsoluteLargestOperation				*/
/************************************************/
/** C = max( abs(A), abs(B) ). This operation takes two tensors of the same rank, in the same format. Comparison is element-wise (no complex abs).
 @param A An input scalar, function, or linear transform.
 @param B An input scalar, function, or linear transform.
 @returns The result C, a tensor of the same rank in the same format.
 */
@interface GLAbsoluteLargestOperation : GLVariableOperation
- (id) initWithFirstOperand: (GLVariable *) A secondOperand: (GLVariable *) B;
@end

/************************************************/
/*		GLInverseTangent2Operation				*/
/************************************************/

/** C = atan2( A, B). This computes the inverse tangent of y=A, B=x.
 @param A An input function or scalar.
 @param B An input function or scalar.
 @returns The result C, a tensor of the same rank in the same format.
 */
@interface GLInverseTangent2Operation : GLVariableOperation
- (id) initWithFirstOperand: (GLFunction *) A secondOperand: (GLFunction *) B;
@end

/************************************************/
/*		GLDotProductOperation					*/
/************************************************/

/** C =A • B. This computes the dot product of two functions.
 @param A An input function.
 @param B An input function.
 @returns The result C, a scalar.
 */
@interface GLDotProductOperation : GLVariableOperation
- (id) initWithFirstOperand: (GLFunction *) A secondOperand: (GLFunction *) B;
@end

/************************************************/
/*		GLSetVariableValueOperation				*/
/************************************************/

/** Sets the given scalar value to the desired index range. The index ranges are given in matlab style format.
 @param aFunction An existing function.
 @param aScalar Scalar that you wish to set.
 @param indexString String indicating the index range.
 @returns The result C, a function..
 */
@interface GLSetVariableValueOperation : GLVariableOperation
- (id) initWithVectorOperand: (GLFunction *) aFunction scalarVariableOperand: (GLScalar *) aScalar indexString: (NSString *) indexString;
@property(copy) NSString * indexString;
@end