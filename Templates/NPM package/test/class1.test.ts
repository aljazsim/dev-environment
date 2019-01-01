import "mocha";
import { Class1 } from "../source/class1";
import { expect } from "chai";

describe("test Class1", () =>
{
    const tmp = new Class1("aaa", "type5");

    it("should have name set to 'aaa'", () => expect(tmp.name).to.equal("aaa"));
    it("should have name set to 'type5'", () => expect(tmp.type).to.equal("type5"));
});
