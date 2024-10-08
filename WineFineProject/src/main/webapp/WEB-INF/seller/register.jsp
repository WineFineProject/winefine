<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#itemregister{
  margin: 20px auto;
}
.row{
   margin: 0px auto;
   width: 1140px;
}
.sellretext{
	resize:none;
	width:90%;
	float:center;
}
.form-control{
	display:inline-block;
	width:90%;
	margin: 0 auto;
}
.gList , .mList {
    position: absolute;  
    background: white;   
    border: 1px solid #ccc;  
    z-index: 1000;   
    cursor: pointer;  
}
.form-range{
	width:80%;
	float:left;
}
.rname{
	width:90%;
}
.rnation{
	width:24%;
	float:left;
	margin-right: 3px;
	margin-left: 2px;
}
</style>
</head>
<body>
<div class="container" id="itemregister">
    <h3 class="text-center" style="width:100%;"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;상품 등록</h3>
    <h1>&nbsp;</h1>
     <div class="row">
     <form @submit.prevent="submitForm">
     	<table class="text-center">
     		<tr>
     		  <th width="15%">이름 (한글/영어)</th>
     		  <th width="15%">종류</th>
     		  <th width="15%">가격</th>
     		  <th width="15%">용량</th>
     		  <th width="10%">도수</th>
     		  <th width="10%">재고</th>
     		  <th colspan="2" width="20%">맛</th>
     		 </tr>
     	 <tr>
     		 	<td width="15%">
     		 	<input type=text size=10 v-model="namekor" ref="namekor" class="form-control" placeholder="이름 (한글)">
     		 </td>
     		  <td width="15%">
     		  <select id="rwtype" v-model="type" ref="type" class="form-control">
                    <option value="" disabled selected>종류 선택 ▼</option>
                    <option value="레드">레드</option>
                    <option value="화이트">화이트</option>
                    <option value="스파클링">스파클링</option>
                    <option value="로제">로제</option>
                    <option value="주정강화">주정강화</option>
                    <option value="기타">기타</option>
         	 </select>
     		  </td>
     		  <td width="15%">
     		  <input type=text size=13 v-model="price" ref="price" class="form-control" placeholder="ex) 140000"></td>
     		  <td width="15%">
     		  <input type=text size=8 v-model="vol" ref="vol" class="form-control" placeholder="ex) 750ml"></td>
     		  <td width="10%">
     		  <input type=text size=8 v-model="alcohol" ref="alcohol" class="form-control" placeholder="ex) 14"></td>
     		  <td width="10%">
     		  <input type=text size=13 v-model="stack" ref="stack" class="form-control" placeholder="ex) 200"></td>
     		  <td width="7%"> 당도 :</td>
     		  <td width="13%"> 
     		  	<input type="range" class="rrange form-range" v-model="sugar" ref="sugar" min="0" max="5" step="1" style="width: 80%;">
                <span style="font-weight: bold;">{{ sugar }}</span>
     		  </td>
     	  </tr>
     	  <tr>
     		 <td width="15%"> 
     		 	<input type=text size=13 v-model="nameeng" ref="nameeng" class="form-control" placeholder="이름 (영어)">
     		 </td>
     		 <td width="15%">  </td>
     		 <td width="15%"> </td>
     		 <td width="15%"> </td>
     		 <td width="10%"> </td>
     		 <td width="10%">  </td>
     		 <td width="7%"> 산도 :</td>
     		  <td width="13%"> 
     		  	<input type="range" class="rrange form-range" v-model="acid" ref="acid" min="0" max="5" step="1">
                <span style="font-weight: bold;">{{ acid }}</span>
     		  </td>
     		 </tr>
     		 <tr>
     		 	<td width="15%"> </td>
     		 	<td width="15%"> </td>
     		 	<td width="15%"> </td>
     		 	<td width="15%"> </td>
     		 	<td width="10%"> </td>
     		 	<td width="10%"> </td>
     		 	<td width="7%" style="padding-bottom: 10px;"> 바디 :</td>
     		  	<td width="13%" style="padding-bottom: 10px;"> 
     		  	<input type="range" class="rrange form-range" v-model="body" ref="body" min="0" max="5" step="1">
                <span style="font-weight: bold;">{{ body }}</span>
     		  	</td>
     		 </tr>
     		  <tr>
     		 	<td width="15%"> </td>
     		 	<td width="15%"> </td>
     		 	<td width="15%"> </td>
     		 	<td width="15%">  </td>
     		 	<td width="10%"> </td>
     		 	<td width="10%"> </td>
     		 	<td width="7%"> 타닌 :</td>
     		  	<td width="13%"> 
     		  	<input type="range" class="rrange form-range" v-model="tannin" ref="tannin" min="0" max="5" step="1">
                <span style="font-weight: bold;">{{ tannin }}</span>
     		  	</td>
     		 </tr>
     	 </table>
     	 <table class="text-center" style="margin-top:15px;">
     	 	 <tr>
     	 	  <th colspan="2" width="35%">아로마</th>
     		  <th colspan="2" width="35%">음식매칭</th>
     		  <th width="30%">상품이미지</th>
     		</tr>
     		 <tr>
     		  <td width="30%"> 
     		  <input type="text" v-model="aromaInput" @keyup.enter="addAroma" class="sellretext form-control" placeholder=" ex) 베리 (1개씩 입력해주세요)">
     		  </td>
     		  <td width="5%">
     		  	<button @click="clearAromas" class="form-control" style="width:90%; font-size:9px;">전체 <br> 삭제</button>
     		  </td>
     		  <td width="30%">
     		  <input type="text" v-model="foodInput" @keyup.enter="addfood" class="sellretext form-control" placeholder=" ex) 피자 (1개씩 입력해주세요)">
     		  </td>
     		  <td width="5%">
     		  <button @click="clearFoods" class="form-control" style="width:90%; font-size:9px;">전체 <br> 삭제</button>
     		  </td>
     		  <td width="30%">
     			<input type=text size=60 v-model="poster" ref="poster" class="form-control" placeholder="이미지 주소를 입력하세요">
     		    </td>
     		  </tr>
     		 <tr>
     		  <td colspan="2" width="35%"> 
     		  	<span class="rname">선택한 아로마: {{ aroma }}</span>
     		  </td>
     		  <td colspan="2" width="35%">
     		  	<span class="rname">선택한 음식: {{ food }}</span>
     		  </td>
     		  <td width="30%">
     		  </td>
     		  </tr>
     		 </table>
     		 <table class="text-center" style="margin-top:15px;">
     		 <tr class="">
     		  <th width="25%">생산자</th>
     		  <th width="25%">품종</th>
     		  <th width="50%">지역</th>
     		 </tr>
     		 <tr>
     	 	  <td width="25%">
     	 	  <input type="text" class="form-control" v-model="fmaker" placeholder="생산자명(한글) 검색" @keyup.enter="searchmaker">
                <div class="mList" v-if="mList.length > 0">
                	<ul>
                        <li v-for="mvo in mList" :key="mvo.no" @click="selectmaker(mvo)">
                            <a>{{mvo.namekor}}</a> 
                        </li>
                     </ul>
                </div>
     	 	  </td>
     		  <td width="25%">
     		  <input type="text" class="form-control" v-model="fgrape" placeholder="품종명(한글) 검색" @keyup.enter="searchgrape">
                <div class="gList" v-if="gList.length > 0">
                	<ul>
                        <li v-for="gvo in gList" :key="gvo.no" @click="selectgrape(gvo)">
                            <a>{{gvo.namekor}}</a> 
                        </li>
                     </ul>
                </div>
     		  </td>
     		  <td width="50%">
     		  <select id="n1" v-model="nation1" ref="nation1" class="rnation form-control" @click="nation1list()">
                    <option value="" disabled selected>나라 선택 ▼</option>
                    <option  v-for="n1 in n1List" :key="n1.no" :value="n1.no">{{n1.namekor}}</option>
         	 </select>
     		  <select id="n2" v-model="nation2" ref="nation2" class="rnation form-control" @click="nation2list(n1no)">
                    <option value="" disabled selected>지역1 선택 ▼</option>
                    <option  v-for="n2 in n2List" :key="n2.no" :value="n2.no">{{n2.namekor}}</option>
         	 </select>
         	 <select id="n3" v-model="nation3" ref="nation3" class="rnation form-control" @click="nation3list(n2no)">
                    <option value="" disabled selected>지역2 선택 ▼</option>
                    <option  v-for="n3 in n3List" :key="n3.no" :value="n3.no">{{n3.namekor}}</option>
         	 </select>
         	 <select id="n4" v-model="nation4" ref="nation4" class="rnation form-control" @click="nation4list(n3no)">
                    <option value="" disabled selected>지역3 선택 ▼</option>
                    <option  v-for="n4 in n4List" :key="n4.no" :value="n4.no">{{n4.namekor}}</option>
         	 </select>
     		  </td>
     		</tr>
     		 <tr>
     	 	  <td width="25%">
     	 	  <span class="rname">생산자: {{ makername }}</span></td>
     		  <td width="25%">
     		  <span class="rname">선택한 품종: {{ selectedGrapes.grapenames }}</span>
     		  </td>
     		  <td width="50%"></td>
     		</tr>
     	</table>
     	<table class="text-center" style="width:100%; margin-top:15px;">
     	<tr>
        <td style="text-align: center;">
          <input type="submit"  class="btn btn-danger" value="등록">
          &nbsp;
          <input type="button"  class="btn btn-secondary" value="취소"
           onclick="javascript:history.back()">
        </td>
      </tr>
     	</table>
     	</form>
     </div>
 </div>
 <script>
 let registerApp=Vue.createApp({
 	data(){
 		return {
 			namekor:'',
 			nameeng:'',
 			type:'',
 			price:'',
 			vol:'',
 			sugar:0, 
 			acid:0, 
 			body:0,
 			tannin:0,
 			stack:'',
 			aroma:'',
 			food:'',
 			alcohol:'',
 			find:'',
 			nation:[],
 			grape:[],
 			grapes:'',
 			grapenames:'',
 			grapename:[],
 			gList:[],
 			fgrape:'',
 			maker:'',
 			makername:'',
 			mList:[],
 			fmaker:'',
 			poster:'',
 			n1List:[],
 			nation1:'',
 			n2List:[],
 			nation2:'',
 			n3List:[],
 			nation3:'',
 			n4List:[],
 			nation4:'',
 			n1no:0,
 			n2no:0,
 			n3no:0,
 			aromaInput:'',
 			aromaList:[],
 			foodInput:'',
 			foodList:[],
 			id:'${sessionScope.userId}',
 			nickname:'${sessionScope.nickName}'	
 		}
 	},
	mounted(){
 
 	},
 	methods:{
 		searchmaker(){
 			 if (this.fmaker.length === 0) {
                 return
 			 }
             axios.get('../seller/register_maker_find_vue.do', { 
                     params: { 
                     	find: this.fmaker 
                     }
                 }).then(response => {
                     this.mList = response.data
                 }).catch(error => {
                 	alert(error.response)
    				console.log(error.response)
                 })
 		},
 		searchgrape(){
			 if (this.fgrape.length === 0) {
                return
			 }
            axios.get('../seller/register_grape_find_vue.do', { 
                    params: { 
                    	find: this.fgrape 
                    }
                }).then(response => {
                    this.gList = response.data
                }).catch(error => {
                	alert(error.response)
   				console.log(error.response)
                })
		},
		selectmaker(mvo){
			this.maker = mvo.no
			this.makername = mvo.namekor
			this.mList = []
		},
		selectgrape(gvo) {
		    this.grape.push(gvo.no)
		    this.grapename.push(gvo.namekor)
		    this.fgrape = ''
		    this.gList = []
		},
		nation1list(){
            axios.get('../seller/register_nation1_list_vue.do', { 
                    
                }).then(response => {
                	if (response.data.length === 0) {
                        alert("나라를 선택해주세요.") 
                    } else {
                        this.n1List = response.data
                    }  
                }).catch(error => {
                	console.log(error.response)
                })
		},
		nation2list(n1no){
				this.n1no = this.nation1
		         axios.get('../seller/register_nation2_list_vue.do', { 
            	 params: { no: this.n1no }
                }).then(response => {
                	if (response.data.length === 0) {
                        alert("하위 지역이 없습니다.") 
                    } else {
                        this.n2List = response.data
                    }  
                }).catch(error => {
   				   console.log(error.response)
                })
		},
		nation3list(n2no){
			this.n2no = this.nation2
            axios.get('../seller/register_nation3_list_vue.do', { 
            	 params: { no: this.n2no }
                }).then(response => {
                	if (response.data.length === 0) {
                        alert("하위 지역이 없습니다.") 
                    } else {
                        this.n3List = response.data
                    }                   
                }).catch(error => {
   					console.log(error.response)
                })
		},
		nation4list(n3no){
			this.n3no = this.nation3
            axios.get('../seller/register_nation4_list_vue.do', { 
            	 params: { no: this.n3no }
                }).then(response => {
                	if (response.data.length === 0) {
                        alert("하위 지역이 없습니다.") 
                    } else {
                        this.n4List = response.data
                    }                   
                }).catch(error => {
   					console.log(error.response)
                })
		},
		addAroma(event) {
			event.preventDefault()
	        if (this.aromaInput.trim() !== '') {
	            this.aromaList.push(this.aromaInput.trim()) 
	            this.aromaInput = ''
	            this.updateAroma()
	        }
	    },
	    updateAroma() {
	        this.aroma = this.formattedAroma
	    },
		addfood(event) {
	    	event.preventDefault()
	        if (this.foodInput.trim() !== '') {
	            this.foodList.push(this.foodInput.trim()) 
	            this.foodInput = ''
	            this.updatefood()
	        }
	    },
	    updatefood() {
	        this.food = this.formattedfood
	    },
	    clearAromas() {
	        this.aromaList = []
	        this.updateAroma()
	    },
	    clearFoods() {
	        this.foodList = []
	        this.updatefood()
	    },
 		submitForm(){
 			if(this.namekor==="")
 			{
 				this.$refs.namekor.focus()
 				return
 			}
 			if(this.nameeng==="")
 			{
 				this.$refs.nameeng.focus()
 				return
 			}
 			if(this.price==="")
 			{
 				this.$refs.price.focus()
 				return
 			}
 			if(this.vol==="")
 			{
 				this.$refs.vol.focus()
 				return
 			}
 			if(this.aroma==="")
 			{
 				this.$refs.aroma.focus()
 				return
 			}
 			if(this.food==="")
 			{
 				this.$refs.food.focus()
 				return
 			}
 	
 			let formData=new FormData()
 			formData.append("namekor",this.namekor)
 			formData.append("nameeng",this.nameeng)
 			formData.append("type",this.$refs.type.value) 			
 			formData.append("price",this.price)    			
 			formData.append("vol",this.vol)
 			formData.append("aroma",this.aroma)
 			formData.append("food",this.food)
 			formData.append("alcohol",this.alcohol)
 			formData.append("stack",this.stack)
 			formData.append("poster",this.poster)
 			formData.append("sugar",this.$refs.sugar.value)
 			formData.append("acid",this.$refs.acid.value)
 			formData.append("body",this.$refs.body.value)
 			formData.append("tannin",this.$refs.tannin.value)
 			formData.append("grape",this.grapes)
 			formData.append("maker",this.maker)
 			
 			
 			axios.post('../seller/register_vue.do',formData,{
 			}).then(response=>{
 				if(response.data==='yes')
 				{
 				    console.log(response)	
 				}
 				else
 				{
 					alert(response.data)
 				}
 			}).catch(error=>{
 				console.log(error.response)
 			})
 		}
 	},
 computed: {
 	   selectedGrapes() {
 	        return {
 	        	grapes:this.grape.join(', '), 
 	        	grapenames:this.grapename.join(', ')  
 	        }
 	    },
 	   formattedAroma() {
 	        return this.aromaList.join(', ')
 	    },
 	   formattedfood() {
 	        return this.foodList.join(', ')
 	    },
 	   formattedPrice: {
 	        get() {
 	            return this.price ? this.price.replace(/\B(?=(\d{3})+(?!\d))/g, ',') : ''
 	        },
 	        set(value) {
 	            this.price = value.replace(/ 원$/, '') + ' 원' 
 	        }
 	    }
 	}
 }).mount('#itemregister')
 </script>
</body>
</html>