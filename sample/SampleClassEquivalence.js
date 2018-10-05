if( typeof module !== 'undefined' )
{
  require( 'wTools' );
  require( 'wfieldsstack' );
  require( 'wCopyable' );
}

var _ = wTools;

console.log( 'wFieldsStack mixin included' );

/*
!!! write sample of mixin it in
*/

// Instance of the class
var sample = _.FieldsStack.__mixin__.prototype.declareMixinClass( );
logger.log( '' )
logger.log( 'Initial class Sample' )
logger.log( sample )

var expected = _.FieldsStack.__mixin__.prototype.declareMixinClass( );

logger.log( '' )
logger.log( 'Empty class to compare' )
logger.log( expected )

logger.log( '' )
logger.log( 'Sample and Expected are equivalent =', sample.equivalentWith( expected ) );  // Shouldn´t it be true?

var newFields =
{
  field0 : null,
}

sample.fieldSet( newFields );

logger.log( '' )
logger.log( 'Initial classwith added field' )
logger.log( sample )

var expected = _.FieldsStack.__mixin__.prototype.declareMixinClass( );

logger.log( '' )
logger.log( 'Empty class to compare' )
logger.log( expected )

logger.log( '' )
logger.log( 'Sample and Expected are equivalent =', sample.equivalentWith( expected ) );  // Since sample has an extra field, shouldn´t it be false?
logger.log( 'Sample has field0 =', sample.hasField(  'field0', null ) ) // Shouldn´t this be true?
