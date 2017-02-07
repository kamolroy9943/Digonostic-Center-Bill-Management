using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DignosticCenterBillManagementSystemVS2013.DAL;
using DignosticCenterBillManagementSystemVS2013.Model;
using DignosticCenterBillManagementSystemVS2013.Model.ViewModel;

namespace DignosticCenterBillManagementSystemVS2013.BLL
{
    public class TestSetupManger
    {
        TestSetupGetWay aTestGetWay = new TestSetupGetWay();
        public int SaveTestInfo(TestClass aTestClass)
        {
            return aTestGetWay.SaveTestInfo(aTestClass);
        }

        public List<TestClass> GetAllTestInfo()
        {
            return aTestGetWay.GetAllTestInfo();
        }

        public TestClass GetAllInfoByTestName(string testname)
        {
            return aTestGetWay.GetAllInfoByTestName(testname);
        }


        public TestClass GetAllInfoByTestId(string testId)
        {
            return aTestGetWay.GetAllInfoByTestId(testId);
        }
        public List<ViewTestAndTest_Type> GetAllTestInfoWithType()
        {
            return aTestGetWay.GetAllTestInfoWithType();
        }

    }
}