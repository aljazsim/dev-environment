using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace ProjectTemplate.Test
{
    [TestClass]
    public class Test1
    {
        #region Public Methods

        [TestMethod]
        public void ThenAddition()
        {
            Assert.AreEqual(Class1.Add(1, 5), 6);
        }

        #endregion Public Methods
    }
}