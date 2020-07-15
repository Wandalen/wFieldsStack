
# module::FieldsStack [![Status](https://github.com/Wandalen/wFieldsStack/workflows/Publish/badge.svg)](https://github.com/Wandalen/wFieldsStack/actions?query=workflow%3APublish) [![experimental](https://img.shields.io/badge/stability-experimental-orange.svg)](https://github.com/emersion/stability-badges#experimental)

Mixin adds fields rotation mechanism to your class. It's widespread problem to change the value of a field and then after some steps revert old value, no matter what it was. FieldsStack does it for you behind the scene. FieldsStack mixins methods fieldPush, fieldPop which allocate a map of stacks of fields and manage it to avoid any corruption. Use the module to keep it simple and don't repeat yourself.

### Try out
```
npm install
node sample/Sample.s
```


































































