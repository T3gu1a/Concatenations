#Old code, I don't remember testing this...

ConcArithmetic:= module()

option `Copyright (c) 2021 Bertrand Teguia Tabuguia`, package;

export Sm, Smr, Smd, Smrd, Smrld;

local alphar:=table(),mur:=table(),thetar:=table(),Smrtable:=table(),PSmr:=table(),numalphaSmr,t:=table(),
	  conc, ModuleApply, numthetaSm, Smtable:=table(), alpha:=table(), mu:=table(), theta:=table();

conc:=(a,b,l)-> a*10^l+b:

#Smarandache numbers

numthetaSm := proc(l)
		local s2, s1, s0;
		if l=1 then
			return 100
		else
			s0:=conc(Smarandache(t[l]-1),t[l]+1,l);
			s1:=conc(s0,t[l]+2,l);
			s2:=conc(s1,t[l]+3,l);
			return s2-2*s1+s0
		end if
	end proc:

Sm := proc(n)
		local l,d;
		if assigned(Smtable[n]) then
			return Smtable[n]
		end if;
		l:=ceil(log10(n+2));
		if not assigned(alpha[l]) then
			d:=(10^l-1)^2;
			t[l]:=10^(l-1)-1;
			alpha[l]:=-(10^(2*l-1)+9*10^(l-1))/d;
			mu[l]:=-1/(10^l-1);
			theta[l]:=numthetaSm(l)/d
		end if;
		Smtable[n]:=alpha[l]+mu[l]*(n-t[l])+theta[l]*10^(l*(n-t[l]))
	end proc:
	
#reverse Smarandache numbers

numalphaSmr := proc(l)
		local s2, s1, s0;
		if l=1 then
			return 1
		else
			s0:=conc(t[l]+1,Smr(t[l]-1),l);
			s1:=conc(t[l]+2,s0,l);
			s2:=conc(t[l]+3,s1,l);
			return 10^(2*l)*s0 - 2*10^l*s1 + s2
		end if
	end proc:

Smr := proc(n)
		local l,d;
		if assigned(Smrtable[n]) then
			return Smrtable[n]
		end if;
		l:=ceil(log10(n+2));
		if not assigned(PSmr[l]) then
			PSmr[l]:=10^(l-1)*(l-10/9)+l+1/9;
			d:=(10^l-1)^2;
			t[l]:=10^(l-1)-1;
			mur[l]:=10^PSmr[l]*(10^(2*l-1)-10^(l-1)-1)/d;
			thetar[l]:=10^PSmr[l]/(10^l-1);
			alphar[l]:=numalphaSmr(l)/d
		end if;
		Smrtable[n]:= alphar[l]+mur[l]*10^(l*(n-t[l]))+thetar[l]*(n-t[l])*10^(l*(n-t[l]))
	end proc:
	
#Concatenation of arithmetic progression

numthetaSmd := proc(l)
		local s2, s1, s0;
		if l=1 then
			return 100
		else
			s0:=conc(Smarandache(t[l]-1),t[l]+1,l);
			s1:=conc(s0,t[l]+2,l);
			s2:=conc(s1,t[l]+3,l);
			return s2-2*s1+s0
		end if
	end proc:

Smd := proc(n,u0,d)
		local l,d;
		if assigned(Smdtable[n]) then
			return Smdtable[n]
		end if;
		l:=ceil(log10(n+2));
		if not assigned(alphad[l]) then
			d:=(10^l-1)^2;
			t[l]:=10^(l-1)-1;
			alpha[l]:=-(10^(2*l-1)+9*10^(l-1))/d;
			mu[l]:=-1/(10^l-1);
			theta[l]:=numthetaSmd(l)/d
		end if;
		Smtable[n]:=alpha[l]+mu[l]*(n-t[l])+theta[l]*10^(l*(n-t[l]))
	end proc:

#Reverse concatenation of arithmetic progression
	
end module:

savelib('ConcArithmetic',"C:/Users/bertr/maple/toolbox/personal/lib/ConcArithmetic.mla"):


