package aspects;

import nesting.User;
import nesting.Account;
import nesting.Transaction;

import larva.*;
public aspect _asp_bank1 {

boolean initialized = false;

after():(staticinitialization(*)){
if (!initialized){
	initialized = true;
	_cls_bank1.initialize();
}
}
before ( User u1) : (call(* User.deleteAccount(..)) && target(u1) && !cflow(adviceexecution())) {

synchronized(_asp_bank0.lock){
User u;
u =u1 ;

_cls_bank1 _cls_inst = _cls_bank1._get_cls_bank1_inst( u);
_cls_inst.u1 = u1;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 7/*deleteAccount*/, 9/*allAccounts*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 7/*deleteAccount*/, 9/*allAccounts*/);
}
}
before ( User u1) : (call(* User.addAccount(..)) && target(u1) && !cflow(adviceexecution())) {

synchronized(_asp_bank0.lock){
User u;
int id;
u =u1 ;
id =u1 .id ;

_cls_bank1 _cls_inst = _cls_bank1._get_cls_bank1_inst( u);
_cls_inst.u1 = u1;
_cls_bank1.id = id;
_cls_inst._call(thisJoinPoint.getSignature().toString(), 5/*addAccount*/, 9/*allAccounts*/);
_cls_inst._call_all_filtered(thisJoinPoint.getSignature().toString(), 5/*addAccount*/, 9/*allAccounts*/);
}
}
}