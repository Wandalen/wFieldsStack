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

// Declare class

let o =
{
  storageFileName : null,
  storageLoaded : null,
  storageToSave : null,
  fields : null,
  fileProvider : null,
}

let Associates =
{
  storageFileName : o.storageFileName,
  fileProvider : _.define.own( o.fileProvider ),
  field0 : null,
}

function SampleClass( o )
{
  return _.instanceConstructor( SampleClass, this, arguments );
}

function init( o )
{
  _.instanceInit( this );
  Object.preventExtensions( this );
}
let Extend =
{
  init : init,
  storageLoaded : o.storageLoaded,
  storageToSave : o.storageToSave,
  Composes : o.fields,
  Associates : Associates,
}
_.classDeclare
({
  cls : SampleClass,
  extend : Extend,
});

// Mixin
_.Copyable.mixin( SampleClass );
_.FieldsStack.mixin( SampleClass );

// Instance of the class
var sample = new SampleClass();
logger.log( '' )
logger.log( 'Initial class Sample' )
logger.log( sample )

var newFields =
{
  field0 : null,
}

sample.fieldSet( newFields );

logger.log( '' )
logger.log( 'Initial classwith added field' )
logger.log( sample )

var expected = new SampleClass();

logger.log( '' )
logger.log( 'Empty class to compare' )
logger.log( expected )

logger.log( '' )
logger.log( 'Sample and Expected are equivalent =', sample.equivalentWith( expected ) );  // Since sample has an extra field, shouldn´t it be false?
logger.log( 'Sample has field0 =', sample.hasField(  'field0' ) ) // Shouldn´t this be true?
