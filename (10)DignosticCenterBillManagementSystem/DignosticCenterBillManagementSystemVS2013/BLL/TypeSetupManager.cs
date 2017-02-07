using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DignosticCenterBillManagementSystemVS2013.DAL;
using DignosticCenterBillManagementSystemVS2013.Model;

namespace DignosticCenterBillManagementSystemVS2013.BLL
{
    public class TypeSetupManager
    {
        TypeSetupGetWay aTypeGetWay = new TypeSetupGetWay();

        public int SaveTypeName(TypeClass aTypeClass)
        {
            return aTypeGetWay.SaveTypeName(aTypeClass);
        }

        public List<TypeClass> GetAllTypeName()
        {
            return aTypeGetWay.GetAllTypeName();
        }

        public bool IsTypeNameExist(string typename)
        {
            if (GetAllInfoByTypeName(typename) != null)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public TypeClass GetAllInfoByTypeName(string typename)
        {
            return aTypeGetWay.GetAllInfoByTypeName(typename);
        }
    }
}