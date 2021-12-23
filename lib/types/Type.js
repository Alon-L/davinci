"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Types = void 0;
var Types;
(function (Types) {
    class Type {
        constructor(values) {
            this.values = values;
        }
    }
    Types.Type = Type;
    class FixedType extends Type {
        constructor(values, length) {
            super(values);
            this.length = length;
            this.length = length;
        }
    }
    Types.FixedType = FixedType;
    class DynamicType extends Type {
        constructor(values) {
            super(values);
        }
    }
    Types.DynamicType = DynamicType;
})(Types = exports.Types || (exports.Types = {}));
