/**
 * Conecta a la API y retorna la respuesta
 *
 * @return INT respuesta
 */
const Solution = async () => {

  const url = "http://localhost:7284/api/chocolate_feast";

  let valueResult;
  let value1 = document.getElementById('money').value;
  let value2 = document.getElementById('price').value;
  let value3 = document.getElementById('numWrappers').value;

  if(value1 < 2 || value2 < 2 || value3 < 2) {
    alert('No se puede realizar la operación, hay campos vacios con valores menores a 2');    

  }else if(value1 > 1000 || value2 > 1000 || value3 > 1000){
    alert('No se puede realizar la operación, hay campos con valores mayores a 1000');    
  }else{    
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
  
    var raw = JSON.stringify({
      money: value1,
      price: value2,
      NumWrapper: value3,
    });
  
    var requestOptions = {
      mode: "cors",
      method: "POST",
      headers: myHeaders,
      body: raw,
      redirect: "follow",
    };
  
    await fetch(url, requestOptions)
      .then((response) => response.json())
      .then((result) => {   
        console.log(result)   
        valueResult = result.response; 
      })
      .catch((err) => {
        alert(`No fue posible conectarse a ${url}, [ERROR] ${err.message}`);
      });
  
      console.log(valueResult);

      document.getElementById('result').innerHTML = valueResult; 
  }
};


