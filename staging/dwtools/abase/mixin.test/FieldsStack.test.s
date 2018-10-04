( function  _FieldsStack_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

  require( '../mixin/FieldsStack.s' );

}

//

var _ = _global_.wTools.withArray.Float32;

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

//

function fieldSet( test )
{

  test.description = 'Add fields map'; //

  var sample = new SampleClass();
  var newFields =
  {
    field1 : null,
    field2 : null,
  }

  sample.fieldSet( newFields );

  var expected1 = null;
  test.identical( sample.field1, expected1 );

  var expected2 = null;
  test.identical( sample.field2, expected2 );

  var expected3 = undefined;
  test.identical( sample.field3, expected3 );

  test.description = 'Set fields map'; //

  var sample = new SampleClass();
  var newFields =
  {
    field1 : 'first value',
    field2 : 'second value',
  }

  sample.fieldSet( newFields );

  var expected1 = 'first value';
  test.identical( sample.field1, expected1 );

  var expected2 = 'second value';
  test.identical( sample.field2, expected2 );

  test.description = 'Change fields map values'; //

  var sample = new SampleClass();
  var newFields =
  {
    field1 : 'New first value',
    field2 : 'New second value',
  }

  sample.fieldSet( newFields );

  var expected1 = 'New first value';
  test.identical( sample.field1, expected1 );

  var expected2 = 'New second value';
  test.identical( sample.field2, expected2 );

  test.description = 'Add single field'; //

  var sample = new SampleClass();
  var field3 = 'third field';

  sample.fieldSet( 'field3', field3 );

  var expected = 'third field';
  test.identical( sample.field3, expected );

  /* */

  if( !Config.debug )
  return;


  var sample = new SampleClass();
  test.shouldThrowErrorSync( () => sample.fieldSet( ));

}

// --
// declare
// --

var Self =
{

  name : 'Tools/base/Mixin',
  silencing : 1,
  enabled : 1,
  // verbosity : 7,
  // debug : 1,
  // routine: 'frustumClosestPoint',

  tests :
  {

    fieldSet : fieldSet,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
