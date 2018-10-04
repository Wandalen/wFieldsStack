
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
o =
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
}

function SampleClass( o )
{
  return _.instanceConstructor( SampleClass, this, arguments );
}
function init( o )
{
  _.instanceInit( this );
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
let sample = new SampleClass();
logger.log( 'Initial class' )
logger.log( sample )

//Add new fields
let newFields =
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
