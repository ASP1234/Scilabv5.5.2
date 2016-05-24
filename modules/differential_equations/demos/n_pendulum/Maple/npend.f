c      
c     SUBROUTINE npend
c      
      subroutine npend(neq,t,th,ydot)
        parameter (n=10)
        doubleprecision t,th(2*n),ydot(2*n),r(n),j(n),m(n)
        doubleprecision me3s(n,n),cc3s(n,n),const(n,1)
        doubleprecision w(3*n),rcond	
        integer i,k,neq,ierr
        data g / 9.81/
        data r / n*1.0/
        data m / n*1.0/
        data j / n*0.3/
      t1 = r(1)**2
      t12 = t1*m(10)+t1*m(4)+t1*m(8)+t1*m(9)+t1*m(2)+m(1)*t1+t1*m(6)+t1*
     +m(5)+t1*m(7)+J(1)+t1*m(3)
      t15 = cos(th(1)-th(2))
      t18 = r(1)*r(2)*t15*(m(5)+m(4)+m(2)+m(10)+m(6)+m(8)+m(7)+m(3)+m(9)
     +)
      t21 = cos(th(1)-th(3))
      t22 = m(5)+m(9)+m(3)+m(7)+m(4)+m(6)+m(10)+m(8)
      t24 = r(1)*r(3)*t21*t22
      t27 = cos(th(1)-th(4))
      t28 = m(5)+m(6)+m(7)+m(4)+m(9)+m(10)+m(8)
      t30 = r(1)*r(4)*t27*t28
      t33 = cos(th(1)-th(5))
      t34 = m(5)+m(9)+m(8)+m(6)+m(10)+m(7)
      t36 = r(1)*r(5)*t33*t34
      t39 = cos(th(1)-th(6))
      t40 = m(7)+m(10)+m(8)+m(9)+m(6)
      t42 = r(1)*r(6)*t39*t40
      t45 = cos(th(1)-th(7))
      t46 = m(7)+m(9)+m(8)+m(10)
      t48 = r(1)*r(7)*t45*t46
      t51 = cos(th(1)-th(8))
      t52 = m(10)+m(8)+m(9)
      t54 = r(1)*r(8)*t51*t52
      t57 = cos(th(1)-th(9))
      t58 = m(9)+m(10)
      t60 = r(1)*r(9)*t57*t58
      t63 = cos(th(1)-th(10))
      t65 = r(1)*m(10)*r(10)*t63
      t66 = r(2)**2
      t79 = cos(th(2)-th(3))
      t81 = r(2)*r(3)*t79*t22
      t84 = cos(th(2)-th(4))
      t86 = r(2)*r(4)*t84*t28
      t89 = cos(th(2)-th(5))
      t91 = r(2)*r(5)*t89*t34
      t94 = cos(th(2)-th(6))
      t96 = r(2)*r(6)*t94*t40
      t99 = cos(th(2)-th(7))
      t101 = r(2)*r(7)*t99*t46
      t104 = cos(th(2)-th(8))
      t106 = r(2)*r(8)*t104*t52
      t109 = cos(th(2)-th(9))
      t111 = r(2)*r(9)*t109*t58
      t114 = cos(th(2)-th(10))
      t116 = r(2)*m(10)*r(10)*t114
      t117 = r(3)**2
      t129 = cos(th(3)-th(4))
      t131 = r(3)*r(4)*t129*t28
      t134 = cos(th(3)-th(5))
      t136 = r(3)*r(5)*t134*t34
      t139 = cos(th(3)-th(6))
      t141 = r(3)*r(6)*t139*t40
      t144 = cos(th(3)-th(7))
      t146 = r(3)*r(7)*t144*t46
      t149 = cos(th(3)-th(8))
      t151 = r(3)*r(8)*t149*t52
      t154 = cos(th(3)-th(9))
      t156 = r(3)*r(9)*t154*t58
      t159 = cos(th(3)-th(10))
      t161 = r(3)*m(10)*r(10)*t159
      t162 = r(4)**2
      t173 = cos(th(4)-th(5))
      t175 = r(4)*r(5)*t173*t34
      t178 = cos(th(4)-th(6))
      t180 = r(4)*r(6)*t178*t40
      t183 = cos(th(4)-th(7))
      t185 = r(4)*r(7)*t183*t46
      t188 = cos(th(4)-th(8))
      t190 = r(4)*r(8)*t188*t52
      t193 = cos(th(4)-th(9))
      t195 = r(4)*r(9)*t193*t58
      t198 = cos(th(4)-th(10))
      t200 = r(4)*m(10)*r(10)*t198
      t201 = r(5)**2
      t211 = cos(th(5)-th(6))
      t213 = r(5)*r(6)*t211*t40
      t216 = cos(th(5)-th(7))
      t218 = r(5)*r(7)*t216*t46
      t221 = cos(th(5)-th(8))
      t223 = r(5)*r(8)*t221*t52
      t226 = cos(th(5)-th(9))
      t228 = r(5)*r(9)*t226*t58
      t231 = cos(th(5)-th(10))
      t233 = r(5)*m(10)*r(10)*t231
      t234 = r(6)**2
      t243 = cos(th(6)-th(7))
      t245 = r(6)*r(7)*t243*t46
      t248 = cos(th(6)-th(8))
      t250 = r(6)*r(8)*t248*t52
      t253 = cos(th(6)-th(9))
      t255 = r(6)*r(9)*t253*t58
      t258 = cos(th(6)-th(10))
      t260 = r(6)*m(10)*r(10)*t258
      t261 = r(7)**2
      t269 = cos(th(7)-th(8))
      t271 = r(7)*r(8)*t269*t52
      t274 = cos(th(7)-th(9))
      t276 = r(7)*r(9)*t274*t58
      t279 = cos(th(7)-th(10))
      t281 = r(7)*m(10)*r(10)*t279
      t282 = r(8)**2
      t289 = cos(th(8)-th(9))
      t291 = r(8)*r(9)*t289*t58
      t294 = cos(th(8)-th(10))
      t296 = r(8)*m(10)*r(10)*t294
      t297 = r(9)**2
      t303 = cos(th(9)-th(10))
      t305 = r(9)*m(10)*r(10)*t303
      t306 = r(10)**2
         me3s(1,1) = t12
         me3s(1,2) = t18
         me3s(1,3) = t24
         me3s(1,4) = t30
         me3s(1,5) = t36
         me3s(1,6) = t42
         me3s(1,7) = t48
         me3s(1,8) = t54
         me3s(1,9) = t60
         me3s(1,10) = t65
         me3s(2,1) = t18
         me3s(2,2) = t66*m(5)+t66*m(8)+m(2)*t66+t66*m(4)+J(2)+t66*m(7)+t
     +66*m(3)+t66*m(6)+t66*m(10)+t66*m(9)
         me3s(2,3) = t81
         me3s(2,4) = t86
         me3s(2,5) = t91
         me3s(2,6) = t96
         me3s(2,7) = t101
         me3s(2,8) = t106
         me3s(2,9) = t111
         me3s(2,10) = t116
         me3s(3,1) = t24
         me3s(3,2) = t81
         me3s(3,3) = J(3)+t117*m(8)+m(3)*t117+t117*m(4)+t117*m(10)+t117*
     +m(7)+t117*m(6)+t117*m(9)+t117*m(5)
         me3s(3,4) = t131
         me3s(3,5) = t136
         me3s(3,6) = t141
         me3s(3,7) = t146
         me3s(3,8) = t151
         me3s(3,9) = t156
         me3s(3,10) = t161
         me3s(4,1) = t30
         me3s(4,2) = t86
         me3s(4,3) = t131
         me3s(4,4) = t162*m(8)+m(4)*t162+t162*m(10)+t162*m(6)+t162*m(9)+
     +t162*m(5)+t162*m(7)+J(4)
         me3s(4,5) = t175
         me3s(4,6) = t180
         me3s(4,7) = t185
         me3s(4,8) = t190
         me3s(4,9) = t195
         me3s(4,10) = t200
         me3s(5,1) = t36
         me3s(5,2) = t91
         me3s(5,3) = t136
         me3s(5,4) = t175
         me3s(5,5) = t201*m(8)+t201*m(6)+J(5)+t201*m(10)+t201*m(7)+m(5)*
     +t201+t201*m(9)
         me3s(5,6) = t213
         me3s(5,7) = t218
         me3s(5,8) = t223
         me3s(5,9) = t228
         me3s(5,10) = t233
         me3s(6,1) = t42
         me3s(6,2) = t96
         me3s(6,3) = t141
         me3s(6,4) = t180
         me3s(6,5) = t213
         me3s(6,6) = J(6)+t234*m(9)+m(6)*t234+t234*m(10)+t234*m(8)+t234*
     +m(7)
         me3s(6,7) = t245
         me3s(6,8) = t250
         me3s(6,9) = t255
         me3s(6,10) = t260
         me3s(7,1) = t48
         me3s(7,2) = t101
         me3s(7,3) = t146
         me3s(7,4) = t185
         me3s(7,5) = t218
         me3s(7,6) = t245
         me3s(7,7) = t261*m(10)+J(7)+t261*m(8)+t261*m(9)+m(7)*t261
         me3s(7,8) = t271
         me3s(7,9) = t276
         me3s(7,10) = t281
         me3s(8,1) = t54
         me3s(8,2) = t106
         me3s(8,3) = t151
         me3s(8,4) = t190
         me3s(8,5) = t223
         me3s(8,6) = t250
         me3s(8,7) = t271
         me3s(8,8) = t282*m(9)+m(8)*t282+J(8)+t282*m(10)
         me3s(8,9) = t291
         me3s(8,10) = t296
         me3s(9,1) = t60
         me3s(9,2) = t111
         me3s(9,3) = t156
         me3s(9,4) = t195
         me3s(9,5) = t228
         me3s(9,6) = t255
         me3s(9,7) = t276
         me3s(9,8) = t291
         me3s(9,9) = m(9)*t297+t297*m(10)+J(9)
         me3s(9,10) = t305
         me3s(10,1) = t65
         me3s(10,2) = t116
         me3s(10,3) = t161
         me3s(10,4) = t200
         me3s(10,5) = t233
         me3s(10,6) = t260
         me3s(10,7) = t281
         me3s(10,8) = t296
         me3s(10,9) = t305
         me3s(10,10) = m(10)*t306+J(10)
      t3 = sin(th(1)-th(2))
      t6 = r(1)*r(2)*t3*(m(5)+m(4)+m(2)+m(10)+m(6)+m(8)+m(7)+m(3)+m(9))
      t9 = sin(th(1)-th(3))
      t10 = m(5)+m(9)+m(3)+m(7)+m(4)+m(6)+m(10)+m(8)
      t12 = r(1)*r(3)*t9*t10
      t15 = sin(th(1)-th(4))
      t16 = m(5)+m(6)+m(7)+m(4)+m(9)+m(10)+m(8)
      t18 = r(1)*r(4)*t15*t16
      t21 = sin(th(1)-th(5))
      t22 = m(5)+m(9)+m(8)+m(6)+m(10)+m(7)
      t24 = r(1)*r(5)*t21*t22
      t27 = sin(th(1)-th(6))
      t28 = m(7)+m(10)+m(8)+m(9)+m(6)
      t30 = r(1)*r(6)*t27*t28
      t33 = sin(th(1)-th(7))
      t34 = m(7)+m(9)+m(8)+m(10)
      t36 = r(1)*r(7)*t33*t34
      t39 = sin(th(1)-th(8))
      t40 = m(10)+m(8)+m(9)
      t42 = r(1)*r(8)*t39*t40
      t45 = sin(th(1)-th(9))
      t46 = m(9)+m(10)
      t48 = r(1)*r(9)*t45*t46
      t51 = sin(th(1)-th(10))
      t53 = r(1)*m(10)*r(10)*t51
      t56 = sin(th(2)-th(3))
      t58 = r(2)*r(3)*t56*t10
      t61 = sin(th(2)-th(4))
      t63 = r(2)*r(4)*t61*t16
      t66 = sin(th(2)-th(5))
      t68 = r(2)*r(5)*t66*t22
      t71 = sin(th(2)-th(6))
      t73 = r(2)*r(6)*t71*t28
      t76 = sin(th(2)-th(7))
      t78 = r(2)*r(7)*t76*t34
      t81 = sin(th(2)-th(8))
      t83 = r(2)*r(8)*t81*t40
      t86 = sin(th(2)-th(9))
      t88 = r(2)*r(9)*t86*t46
      t91 = sin(th(2)-th(10))
      t93 = r(2)*m(10)*r(10)*t91
      t96 = sin(th(3)-th(4))
      t98 = r(3)*r(4)*t96*t16
      t101 = sin(th(3)-th(5))
      t103 = r(3)*r(5)*t101*t22
      t106 = sin(th(3)-th(6))
      t108 = r(3)*r(6)*t106*t28
      t111 = sin(th(3)-th(7))
      t113 = r(3)*r(7)*t111*t34
      t116 = sin(th(3)-th(8))
      t118 = r(3)*r(8)*t116*t40
      t121 = sin(th(3)-th(9))
      t123 = r(3)*r(9)*t121*t46
      t126 = sin(th(3)-th(10))
      t128 = r(3)*m(10)*r(10)*t126
      t131 = sin(th(4)-th(5))
      t133 = r(4)*r(5)*t131*t22
      t136 = sin(th(4)-th(6))
      t138 = r(4)*r(6)*t136*t28
      t141 = sin(th(4)-th(7))
      t143 = r(4)*r(7)*t141*t34
      t146 = sin(th(4)-th(8))
      t148 = r(4)*r(8)*t146*t40
      t151 = sin(th(4)-th(9))
      t153 = r(4)*r(9)*t151*t46
      t156 = sin(th(4)-th(10))
      t158 = r(4)*m(10)*r(10)*t156
      t161 = sin(th(5)-th(6))
      t163 = r(5)*r(6)*t161*t28
      t166 = sin(th(5)-th(7))
      t168 = r(5)*r(7)*t166*t34
      t171 = sin(th(5)-th(8))
      t173 = r(5)*r(8)*t171*t40
      t176 = sin(th(5)-th(9))
      t178 = r(5)*r(9)*t176*t46
      t181 = sin(th(5)-th(10))
      t183 = r(5)*m(10)*r(10)*t181
      t186 = sin(th(6)-th(7))
      t188 = r(6)*r(7)*t186*t34
      t191 = sin(th(6)-th(8))
      t193 = r(6)*r(8)*t191*t40
      t196 = sin(th(6)-th(9))
      t198 = r(6)*r(9)*t196*t46
      t201 = sin(th(6)-th(10))
      t203 = r(6)*m(10)*r(10)*t201
      t206 = sin(th(7)-th(8))
      t208 = r(7)*r(8)*t206*t40
      t211 = sin(th(7)-th(9))
      t213 = r(7)*r(9)*t211*t46
      t216 = sin(th(7)-th(10))
      t218 = r(7)*m(10)*r(10)*t216
      t221 = sin(th(8)-th(9))
      t223 = r(8)*r(9)*t221*t46
      t226 = sin(th(8)-th(10))
      t228 = r(8)*m(10)*r(10)*t226
      t231 = sin(th(9)-th(10))
      t233 = r(9)*m(10)*r(10)*t231
         cc3s(1,1) = 0
         cc3s(1,2) = t6
         cc3s(1,3) = t12
         cc3s(1,4) = t18
         cc3s(1,5) = t24
         cc3s(1,6) = t30
         cc3s(1,7) = t36
         cc3s(1,8) = t42
         cc3s(1,9) = t48
         cc3s(1,10) = t53
         cc3s(2,1) = -t6
         cc3s(2,2) = 0
         cc3s(2,3) = t58
         cc3s(2,4) = t63
         cc3s(2,5) = t68
         cc3s(2,6) = t73
         cc3s(2,7) = t78
         cc3s(2,8) = t83
         cc3s(2,9) = t88
         cc3s(2,10) = t93
         cc3s(3,1) = -t12
         cc3s(3,2) = -t58
         cc3s(3,3) = 0
         cc3s(3,4) = t98
         cc3s(3,5) = t103
         cc3s(3,6) = t108
         cc3s(3,7) = t113
         cc3s(3,8) = t118
         cc3s(3,9) = t123
         cc3s(3,10) = t128
         cc3s(4,1) = -t18
         cc3s(4,2) = -t63
         cc3s(4,3) = -t98
         cc3s(4,4) = 0
         cc3s(4,5) = t133
         cc3s(4,6) = t138
         cc3s(4,7) = t143
         cc3s(4,8) = t148
         cc3s(4,9) = t153
         cc3s(4,10) = t158
         cc3s(5,1) = -t24
         cc3s(5,2) = -t68
         cc3s(5,3) = -t103
         cc3s(5,4) = -t133
         cc3s(5,5) = 0
         cc3s(5,6) = t163
         cc3s(5,7) = t168
         cc3s(5,8) = t173
         cc3s(5,9) = t178
         cc3s(5,10) = t183
         cc3s(6,1) = -t30
         cc3s(6,2) = -t73
         cc3s(6,3) = -t108
         cc3s(6,4) = -t138
         cc3s(6,5) = -t163
         cc3s(6,6) = 0
         cc3s(6,7) = t188
         cc3s(6,8) = t193
         cc3s(6,9) = t198
         cc3s(6,10) = t203
         cc3s(7,1) = -t36
         cc3s(7,2) = -t78
         cc3s(7,3) = -t113
         cc3s(7,4) = -t143
         cc3s(7,5) = -t168
         cc3s(7,6) = -t188
         cc3s(7,7) = 0
         cc3s(7,8) = t208
         cc3s(7,9) = t213
         cc3s(7,10) = t218
         cc3s(8,1) = -t42
         cc3s(8,2) = -t83
         cc3s(8,3) = -t118
         cc3s(8,4) = -t148
         cc3s(8,5) = -t173
         cc3s(8,6) = -t193
         cc3s(8,7) = -t208
         cc3s(8,8) = 0
         cc3s(8,9) = t223
         cc3s(8,10) = t228
         cc3s(9,1) = -t48
         cc3s(9,2) = -t88
         cc3s(9,3) = -t123
         cc3s(9,4) = -t153
         cc3s(9,5) = -t178
         cc3s(9,6) = -t198
         cc3s(9,7) = -t213
         cc3s(9,8) = -t223
         cc3s(9,9) = 0
         cc3s(9,10) = t233
         cc3s(10,1) = -t53
         cc3s(10,2) = -t93
         cc3s(10,3) = -t128
         cc3s(10,4) = -t158
         cc3s(10,5) = -t183
         cc3s(10,6) = -t203
         cc3s(10,7) = -t218
         cc3s(10,8) = -t228
         cc3s(10,9) = -t233
         cc3s(10,10) = 0
      t1 = cos(th(1))
      t6 = cos(th(2))
      t12 = cos(th(3))
      t17 = cos(th(4))
      t22 = cos(th(5))
      t26 = cos(th(6))
      t32 = cos(th(7))
      t37 = cos(th(8))
      t42 = cos(th(9))
      t47 = cos(th(10))
         const(1,1) = r(1)*t1*g*(m(7)+m(8)+m(5)+m(4)+m(3)+m(2)+m(1)+m(10
     +)+m(9)+m(6))
         const(2,1) = r(2)*t6*g*(m(5)+m(4)+m(2)+m(10)+m(6)+m(8)+m(7)+m(3
     +)+m(9))
         const(3,1) = g*r(3)*t12*(m(5)+m(9)+m(3)+m(7)+m(4)+m(6)+m(10)+m(
     +8))
         const(4,1) = g*r(4)*t17*(m(5)+m(6)+m(7)+m(4)+m(9)+m(10)+m(8))
         const(5,1) = g*r(5)*t22*(m(5)+m(9)+m(8)+m(6)+m(10)+m(7))
         const(6,1) = r(6)*t26*g*(m(7)+m(10)+m(8)+m(9)+m(6))
         const(7,1) = g*r(7)*t32*(m(7)+m(9)+m(8)+m(10))
         const(8,1) = g*r(8)*t37*(m(10)+m(8)+m(9))
         const(9,1) = g*r(9)*t42*(m(9)+m(10))
         const(10,1) = m(10)*g*r(10)*t47
c         
        do 1000, i =1,n ,1
          ydot(i) = th(i+n)
 1000   continue
c       
c         
        do 1001, i =1,n ,1
c           
          do 1002, k =1,n ,1
            Const(i,1) =  Const(i,1)+CC3S(i,k)*(th(k+n)**2)
 1002     continue
c         
           Const(i,1) = -Const(i,1)
 1001   continue
c       
c        we must solve  M z =const 
c        which gives ydot((n+1)..2*n) 
        call dlslv(me3s,n,n,Const,n,1,w, rcond,ierr,1)
        if (ierr.ne.0) then
          write(6,2000) 
 2000     format('Matrice mal conditionnee')
        endif
c         
        do 1003, i =1,n ,1
          ydot(n+i) = const(i,1)
 1003   continue
c       
        return
      end