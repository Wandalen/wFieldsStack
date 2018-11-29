( function  _FieldsStack_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../Tools.s' );

  _.include( 'wTesting' );

  require( '../l7_mixin/FieldsStack.s' );
  require( 'wCopyable' );

}

//

var _ = _global_.wTools.withArray.Float32;

function fieldSet( test )
{

  test.description = 'Compare two maps'; //

  var sample = this.declareMixinClass();
  var expected = sample.clone();
  test.is( sample.equivalentWith( expected ) );

  var newFields =
  {
    field0 : 1,
  }

  sample.fieldSet( newFields );
  _.mapExtend( sample.Associates, newFields );
  expected.fieldSet( newFields );
  _.mapExtend( expected.Associates, newFields );

  test.is( sample.equivalentWith( expected ) );

  sample.fieldSet( 'field0', 0 );
  test.is( !sample.equivalentWith( expected ) );

  test.description = 'Add fields map'; //

  var sample = this.declareMixinClass();
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

  var sample = this.declareMixinClass();
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

  var sample = this.declareMixinClass();
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

  var sample = this.declareMixinClass();
  var field3 = 'third field';

  sample.fieldSet( 'field3', field3 );

  var expected = 'third field';
  test.identical( sample.field3, expected );

  test.description = 'Change single field'; //

  var sample = this.declareMixinClass();
  var field3 = 'New third field';

  sample.fieldSet( 'field3', field3 );

  var expected = 'New third field';
  test.identical( sample.field3, expected );

  test.description = 'Change field to number'; //

  var sample = this.declareMixinClass();
  var field3 = 3;

  sample.fieldSet( 'field3', field3 );

  var expected = 3;
  test.identical( sample.field3, expected );

  test.description = 'Change field to array'; //

  var sample = this.declareMixinClass();
  var field3 = [ 0, 1, 2 ];

  sample.fieldSet( 'field3', field3 );

  var expected = [ 0, 1, 2 ];
  test.identical( sample.field3, expected );

  test.description = 'Change field to map'; //

  var sample = this.declareMixinClass();
  var field3 = { 'one' : 1, 'two' : 2, 'three' : 3, };

  sample.fieldSet( 'field3', field3 );

  var expected = { 'one' : 1, 'two' : 2, 'three' : 3, };
  test.identical( sample.field3, expected );

  test.description = 'Change field to null'; //

  var sample = this.declareMixinClass();
  var field3 = null;

  sample.fieldSet( 'field3', field3 );

  var expected = null;
  test.identical( sample.field3, expected );

  test.description = 'Change field to NaN'; //

  var sample = this.declareMixinClass();
  var field3 = NaN;

  sample.fieldSet( 'field3', field3 );

  var expected = NaN;
  test.identical( sample.field3, expected );

  /* */

  if( !Config.debug )
  return;

  var sample = this.declareMixinClass();
  test.shouldThrowErrorSync( () => sample.fieldSet( ));

  var newFields =
  {
    field1 : null,
    field2 : null,
  }
  test.shouldThrowErrorSync( () => sample.fieldSet( newFields, newFields ));
  test.shouldThrowErrorSync( () => sample.fieldSet( null ));
  test.shouldThrowErrorSync( () => sample.fieldSet( NaN ));
  test.shouldThrowErrorSync( () => sample.fieldSet( 3 ));
  test.shouldThrowErrorSync( () => sample.fieldSet( 'Fields' ));
  test.shouldThrowErrorSync( () => sample.fieldSet( null, 'Fields'));
  test.shouldThrowErrorSync( () => sample.fieldSet( NaN, 'Fields'));
  test.shouldThrowErrorSync( () => sample.fieldSet( 3, 'Fields'));
  test.shouldThrowErrorSync( () => sample.fieldSet( 'Fields', 'Value1', 'Value2' ));

}

//

function fieldReset( test )
{

  test.description = 'Add fields map and reset it'; //

  var sample = this.declareMixinClass();
  var newFields =
  {
    field1 : null,
    field2 : null,
  }

  sample.fieldSet( newFields );
  sample.fieldReset( newFields );

  var expected1 = undefined;
  test.identical( sample.field1, expected1 );

  var expected2 = undefined;
  test.identical( sample.field2, expected2 );

  var expected3 = undefined;
  test.identical( sample.field3, expected3 );

  test.description = 'Add fields map and reset just one value'; //

  var sample = this.declareMixinClass();
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

  sample.fieldReset( 'field1', 'first value' );

  var expected1 = undefined;
  test.identical( sample.field1, expected1 );

  var expected2 = 'second value';
  test.identical( sample.field2, expected2 )

  test.description = 'Set fields, change them and reset them twice'; //

  var sample = this.declareMixinClass();
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

  var newFields =
  {
    field1 : 1,
    field2 : 2,
  }
  sample.fieldSet( newFields );

  var expected1 = 1;
  test.identical( sample.field1, expected1 );
  var expected2 = 2;
  test.identical( sample.field2, expected2 );  // Fields changed twice

  sample.fieldReset( 'field1', 1 );           // Reset first value

  var expected1 = 'first value';
  test.identical( sample.field1, expected1 );
  var expected2 = 2;
  test.identical( sample.field2, expected2 );

  var fields =
  {
    field1 : 'first value',
    field2 : 2,
  }
  sample.fieldReset( fields );                  // Reset both values

  var expected1 = null;
  test.identical( sample.field1, expected1 );
  var expected2 = 'second value';
  test.identical( sample.field2, expected2 );

  sample.fieldReset( 'field2', 'second value' ); // Reset second value

  var expected1 = null;
  test.identical( sample.field1, expected1 );
  var expected2 = null;
  test.identical( sample.field2, expected2 );

  test.description = 'Reset field just by name'; //

  var sample = this.declareMixinClass();
  var newFields =
  {
    field1 : null,
    field2 : null,
  }
  sample.fieldSet( newFields );
  sample.fieldSet( 'field1', 'one' );

  var expected1 = 'one';
  test.identical( sample.field1, expected1 );
  var expected2 = null;
  test.identical( sample.field2, expected2 );

  sample.fieldReset( 'field1' );

  var expected1 = null;
  test.identical( sample.field1, expected1 );
  var expected2 = null;
  test.identical( sample.field2, expected2 );

  /* */

  if( !Config.debug )
  return;

  var sample = this.declareMixinClass();
  test.shouldThrowErrorSync( () => sample.fieldReset( ));

  var newFields =
  {
    field1 : null,
    field2 : null,
  }
  test.shouldThrowErrorSync( () => sample.fieldReset( newFields, newFields ));
  test.shouldThrowErrorSync( () => sample.fieldReset( null ));
  test.shouldThrowErrorSync( () => sample.fieldReset( NaN ));
  test.shouldThrowErrorSync( () => sample.fieldReset( 3 ));
  test.shouldThrowErrorSync( () => sample.fieldReset( 'Fields' ));
  test.shouldThrowErrorSync( () => sample.fieldReset( null, 'Fields'));
  test.shouldThrowErrorSync( () => sample.fieldReset( NaN, 'Fields'));
  test.shouldThrowErrorSync( () => sample.fieldReset( 3, 'Fields'));
  test.shouldThrowErrorSync( () => sample.fieldReset( 'Fields', 'Value1', 'Value2' ));

  var newFields =
  {
    field1 : null,
    field2 : null,
  }
  sample.fieldSet( newFields );
  test.shouldThrowErrorSync( () => sample.fieldReset( 'Field1', 'Value1' ));
  test.shouldThrowErrorSync( () => sample.fieldReset( 'Field1', 1 ));
  test.shouldThrowErrorSync( () => sample.fieldReset( 'Field2', 'Value2' ));
  test.shouldThrowErrorSync( () => sample.fieldReset( 'Field2', 2 ));
  test.shouldThrowErrorSync( () => sample.fieldReset( 'Field3' ));

}

//

function declareMixinClass()
{
  let _ = _global_.wTools.withArray.Float32;

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

  let sample = new SampleClass();
  return sample;
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

  context :
  {
    declareMixinClass : declareMixinClass,
  },

  tests :
  {

    fieldSet : fieldSet,
    fieldReset : fieldReset,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
