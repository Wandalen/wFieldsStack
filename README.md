
# module::FieldsStack [![status](https://github.com/Wandalen/wFieldsStack/workflows/publish/badge.svg)](https://github.com/Wandalen/wFieldsStack/actions?query=workflow%3Apublish) [![experimental](https://img.shields.io/badge/stability-experimental-orange.svg)](https://github.com/emersion/stability-badges#experimental)

Mixin adds fields rotation mechanism to your class. It's widespread problem to change the value of a field and then after some steps revert old value, no matter what it was. FieldsStack does it for you behind the scene. FieldsStack mixins methods fieldPush, fieldPop which allocate a map of stacks of fields and manage it to avoid any corruption. Use the module to keep it simple and don't repeat yourself.

### Try out from the repository
```
git clone https://github.com/Wandalen/wFieldsStack
cd wFieldsStack
npm install
node sample/Sample.s
```

## To add to your project
```
npm add 'wfieldsstack@alpha'
```



































































