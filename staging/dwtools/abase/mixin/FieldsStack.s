( function _FieldsStack_s_( ) {

'use strict';

var _global = _global_; var _ = _global_.wTools;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

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

  _.include( 'wProto' );

}

//

function onMixin( mixinDescriptor, dstClass )
{
  var dstPrototype = dstClass.prototype;

  _.assert( arguments.length === 2, 'expects exactly two arguments' );
  _.assert( _.routineIs( dstClass ) );
  _.assert( _.mixinHas( dstPrototype,_.Copyable ),'wCopyable should be mixed in first' );

  _.mixinApply( this, dstPrototype );
  // _.mixinApply
  // ({
  //   dstPrototype : proto,
  //   descriptor : Self,
  // });

}

//

function fieldSet( fields )
{
  var self = this;

  if( arguments.length === 2 )
  {
    _.assert( _.strIs( arguments[ 0 ] ) );
    _.assert( arguments[ 1 ] !== undefined );
    fields = { [ arguments[ 0 ] ] : arguments[ 1 ] }
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.mapIs( fields ) )

  for( var s in fields )
  {
    if( !self._fields[ s ] )
    self._fields[ s ] = [];
    self._fields[ s ].push( self[ s ] );
    // logger.log( 'fieldSet ' + s + ' ' + _.toStrShort( self[ s ] ) + ' -> ' + _.toStrShort( fields[ s ] ) );
    self[ s ] = fields[ s ];
    // logger.log( 'fieldSet new value of ' + s + ' ' + self[ s ] );
  }

  return self;
}

//

function fieldReset( fields )
{
  var self = this;
  var result = Object.create( null );

  if( arguments.length === 2 )
  {
    _.assert( _.strIs( arguments[ 0 ] ) );
    _.assert( arguments[ 1 ] !== undefined );
    fields = { [ arguments[ 0 ] ] : arguments[ 1 ] }
  }
  else if( arguments.length === 1 && _.strIs( arguments[ 0 ] ) )
  {
    fields = { [ arguments[ 0 ] ] : _.nothing }
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.mapIs( fields ) );

  for( var s in fields )
  {
    var wasVal = fields[ s ];
    var selfVal = self[ s ];
    var _field = self._fields[ s ];

    // logger.log( 'fieldReset ' + s + ' ' + _.toStrShort( selfVal ) + ' ~ ' + _.toStrShort( wasVal ) );

    _.assert( _.arrayIs( _field ) );
    _.assert( selfVal === wasVal || wasVal === _.nothing, () => 'Decoupled fieldReset ' + _.toStrShort( selfVal ) + ' != ' + _.toStrShort( wasVal ) );
    self[ s ] = _field.pop();
    if( !self._fields[ s ].length )
    delete self._fields[ s ];
    result[ s ] = self[ s ];
  }

  if( !Object.keys( result ).length === 1 )
  debugger;

  if( Object.keys( result ).length === 1 )
  result = result[ Object.keys( result )[ 0 ] ];

  return result;
}

// --
// relations
// --

var Composes =
{
}

var Aggregates =
{
}

var Associates =
{
}

var Restricts =
{
  _fields : Object.create( null ),
}

var Statics =
{
}

// --
// define class
// --

var Supplement =
{

  fieldSet : fieldSet,
  fieldReset : fieldReset,

  fieldPush : fieldSet,
  fieldPop : fieldReset,

  //

  Composes : Composes,
  Aggregates : Aggregates,
  Associates : Associates,
  Restricts : Restricts,
  Statics : Statics,

}

//

var Self =
{

  onMixin : onMixin,
  supplement : Supplement,
  name : 'wFieldsStack',
  shortName : 'FieldsStack',

}

//

_global_[ Self.name ] = _[ Self.shortName ] = _.mixinMake( Self );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
