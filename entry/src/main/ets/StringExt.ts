declare global {
  interface String {
    isNotEmpty(): boolean;
  }
}

String.prototype.isNotEmpty = function() : boolean {
  return this && this.length >0;
}

export default String.prototype.isNotEmpty;