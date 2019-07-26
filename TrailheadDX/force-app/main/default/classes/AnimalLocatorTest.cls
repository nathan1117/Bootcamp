@isTest
private class AnimalLocatorTest{
    
    @isTest static  void animalLocatorResponseTest() {
        
        Test.SetMock(HttpCallOutMock.class, new AnimalLocatorMock());
        
        Test.startTest();
            String result = AnimalLocator.getAnimalNameById(1);
            String expectedResult = 'pig';
        Test.stopTest();
        
        System.assert(result == expectedResult , result);
    }
}