( function _FieldsStack_s_( ) {

'use strict';

var _ = _global_.wTools;
var _hasOwnProperty = Object.hasOwnProperty;

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      require.resolve( toolsPath );
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

function _mixin( cls )
{

  var proto = cls.prototype;

  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( cls ) );
  _.assert( _.mixinHas( proto,_.Copyable ),'wCopyable should be mixed in first' );

  _.mixinApply
  ({
    dstProto : proto,
    descriptor : Self,
  });

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
    self[ s ] = fields[ s ];
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
    var _field = self._fields[ s ];
    _.assert( _.arrayIs( _field ) );
    _.assert( self[ s ] === fields[ s ] || fields[ s ] === _.nothing );
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
// relationships
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
// proto
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

  _mixin : _mixin,
  supplement : Supplement,
  name : 'wFieldsStack',
  nameShort : 'FieldsStack',

}

//

_global_[ Self.name ] = _[ Self.nameShort ] = _.mixinMake( Self );

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_._UsingWtoolsPrivately_ )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
