Smarandache:= module()

option `Copyright (c) 2022 Bertrand Teguia Tabuguia`, package;

export Sm, Smr;

local alphar:=table(),mur:=table(),thetar:=table(),Smrtable:=table(),PSmr:=table(),numalphar,t:=table(),
	  conc, numtheta, Smtable:=table(), alpha:=table(), mu:=table(), theta:=table();

conc:=(a,b,l)-> a*10^l+b:

numtheta := proc(l)
		local s2, s1, s0;
		option `Copyright (c) 2022 Bertrand Teguia Tabuguia`;
		if l=1 then
			return 100
		else
			s0:=conc(Sm(t[l]-1),t[l]+1,l);
			s1:=conc(s0,t[l]+2,l);
			s2:=conc(s1,t[l]+3,l);
			return s2-2*s1+s0
		end if
	end proc:

Sm := proc(n)
		local l,d;
		option `Copyright (c) 2022 Bertrand Teguia Tabuguia`;
		if assigned(Smtable[n]) then
			return Smtable[n]
		end if;
		l:=ceil(log10(n+2));
		if not assigned(alpha[l]) then
			d:=(10^l-1)^2;
			t[l]:=10^(l-1)-1;
			alpha[l]:=-(10^(2*l-1)+9*10^(l-1))/d;
			mu[l]:=-1/(10^l-1);
			theta[l]:=numtheta(l)/d
		end if;
		Smtable[n]:=alpha[l]+mu[l]*(n-t[l])+theta[l]*10^(l*(n-t[l]))
	end proc:
	
#reverse Smarandache numbers

numalphar := proc(l)
		local s2, s1, s0, lr:=PSmr[l]-l;
		option `Copyright (c) 2022 Bertrand Teguia Tabuguia`;
		if l=1 then
			return 1
		else
			s0:=conc(t[l]+1,Smr(t[l]-1),lr);
			s1:=conc(t[l]+2,s0,lr+l);
			s2:=conc(t[l]+3,s1,lr+2*l);
			return 10^(2*l)*s0 - 2*10^l*s1 + s2
		end if
	end proc:

Smr := proc(n)
		local l,d;
		option `Copyright (c) 2022 Bertrand Teguia Tabuguia`;
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
			alphar[l]:=numalphar(l)/d
		end if;
		Smrtable[n]:= alphar[l]+mur[l]*10^(l*(n-t[l]))+thetar[l]*(n-t[l])*10^(l*(n-t[l]))
	end proc:
	
end module:

savelib('Smarandache',"YOUR-PATH/Smarandache.mla"):


