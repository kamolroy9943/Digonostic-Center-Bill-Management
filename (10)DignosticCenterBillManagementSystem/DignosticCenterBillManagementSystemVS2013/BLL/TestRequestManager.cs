using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using DignosticCenterBillManagementSystemVS2013.DAL;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013.BLL
{
    public class TestRequestManager
    {
        TestRequestGetWay aTestRequestGetWay = new TestRequestGetWay();

        public int SaveTestGridview(TestClass adropClass, TestRequestClass aTestRequestClass)
        {
            return aTestRequestGetWay.SaveTestGridview(adropClass, aTestRequestClass);

        }

        public int SavePatientTestInfo(TestRequestClass aTestRequestClass)
        {
            return aTestRequestGetWay.SavePatientTestInfo(aTestRequestClass);
        }

        public bool GetAllInfoByMobileNo(string mobileno)
        {
            return aTestRequestGetWay.GetAllInfoByMobileNo(mobileno);
        }

        public void GetAllInfoByMobileNo(TestRequestClass aTestRequestClass)
        {
            aTestRequestGetWay.GetAllInfoByMobileNo(aTestRequestClass);
        }


    }
}