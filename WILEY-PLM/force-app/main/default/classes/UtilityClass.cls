/**
* @description This class has helper methods.
*/

public with sharing class UtilityClass {
    
    /**
    
    * @description Gets the type name of the SObject.
    * @param SObject The SObject for which the name to be obtained.
    * @return String - The type name.
    */
    public static String getSObjectTypeName(SObject so) {
        return so.getSObjectType().getDescribe().getName();
    }
}