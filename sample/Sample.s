
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
logger.log( 'Initial class' )
logger.log( sample )

//Add new fields
var newFields =
{
  field1 : null,
  field2 : null,
}
sample.fieldSet( newFields );
logger.log('')
logger.log('New fields set')
logger.log( sample )

//Change fields value
newFields =
{
  field1 : 'Hi',
  field2 : 'World',
}
sample.fieldSet( newFields );
logger.log('')
logger.log('New fields set')
logger.log( sample )

//Reset fields
sample.fieldReset( newFields );
logger.log('')
logger.log('New fields reset')
logger.log( sample )
