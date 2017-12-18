public class ProgrammaticModel1 {

    public void checkOddEven(Integer num){
        if(Math.mod(num, 2) == 0){
            System.debug('Number  '+num + ' is Even');
        }else{
            System.debug('Number '+num+' is Odd');
        }
    }
    
    public void arraySize(Integer size){
        String[] strArray = new String[size];
        for(Integer i = 0; i<size; i++){
            strArray[i] = 'Num '+i;
        }
        
        for(String str : strArray){
			System.debug(str);
        }
    }
    
    public void sortArray(Integer[] numArray, Boolean isDesc){
        numArray.sort();
        if(isDesc){
            Integer arraySize = numArray.size();
            for(Integer i = (arraySize-1) ; i>= 0; i--){
                System.debug(numArray[i]);
            }
        }else{
            for(Integer val : numArray){
                System.debug(val);
            }
        }
    }
    
    public void maxValue (Integer[] numArray){
        numArray.sort();
        System.debug(numArray[numArray.size() -1]);
    }
    
    public void minValue (Integer[] numArray){
        numArray.sort();
        System.debug(numArray[0]);
    }
    
    public void duplicateCount(Integer[] numArray){
		Map<Integer,Integer> elCount = new Map<Integer,Integer>();

		for(Integer key : numArray){
    		if(!elCount.containsKey(key)){
    			elCount.put(key,0);
    		}
    		Integer currentInt=elCount.get(key)+1;
    		elCount.put(key,currentInt);
		}
        
        for(Integer key : elCount.keySet()){
            System.debug(key + ': '+elCount.get(key));
        }
    }
    
    public void sumNumbers(Integer num){
        Integer sum = 0;
        for(Integer i = 1; i<=num; i++){
            sum += i;
        }
        
        System.debug('Sum is '+sum);
    }
    
    public void simpleInterest(Double principle, Double roi, Double duration){
        Double interest = (principle * roi * duration)/(12*100);
        System.debug('Interest : ' + interest);
    }
    
    
}