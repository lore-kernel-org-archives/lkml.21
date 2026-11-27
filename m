Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795665;
	b=qDlFowi6ydeUUa9KqRxLbpZjjIDxodK9dP6wVCvy+7Uta8LG1TXsoN2E77Fs9b+yTVSe
	 0pta2P2Gh/AKH0DMNC3lEcWFm9s6w7CZXkxHVckeN3YjVdo75+4XbOn65dam3kQW4cXcQ
	 /iCppxAwkSLfhteuJ3DH9wBGiv2/oyrFcBJ/hZJTdnI8pvHhAacLwtpmFz7ITTmTWpW/H
	 cgq5t0z4TP9dyBSwm023S752WuMF9pIb8bk/fgAhE1FgEmDmdaYyyG9SZ43kAfkPRD33J
	 8/LyXEz+VPzJqqDmTtLFcrsS2PGd5ZVGwhezTa0xBb/ro3DUngYkEAt8aUNRZ4UsLbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
	b=3UKWB9WvKRfxxNHCLuK6fzp10X6gNCI2mKaQmhPsrwe0R2kjlaOyYPjFe3rM8Q5HrDL0
	 xzx8JYnIECmXG0O+daP0vAB1sz0SyGhsCCiuimuFotCLMYRCJqeeP3KBT+ahLdxmhebvO
	 Bt23mPludQiAcqlWISctYglTWqtP4J+SRDqatwV3GVIArCH3dGYzVCyA6rFpfqxOcyabL
	 icmlHyB9xXmR6FdJ3Ldydl/0A9etJh+6+NRsC2ikozfUWQhETF8h8w1vS09Cfac1LB4Qt
	 hc7nXZmJ0hMwgyLQkFLISIMQxBlcNB6/09KqJi7bdfbRgFjnb2EWLanp74BiQBx4RxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFDpTw9p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748E0606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748E0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFDpTw9p
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpUjt2211145
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=; b=fiAXSHT7Y1boPPhF
	Qg23XEUKsfDzWY3hMqhcosHPiUf7YXbZeN74E56z+YS+xLj/2bXojzTgxvwkWuuV
	5/WvVrAcqZ8KTIvCjgKg7+bUJ/aIQTT+dD0DGR6MDoNPCiF1qH9z64mIvKedZEC/
	YW2b6Tdx5kpvxZGyWX6d2k4rFpXWn2MKhyqJpltvnEyeEMr+5WZUBSkmE0vzr7rB
	OVqDkQSPbPLUl49EsYKI2AzE2t6nOrWJ5kCDUn8+/OI/0cl4Qh9QbjMz1Tblr3Jb
	bJ+tT4yxHLcsB5QxsX5FItbc0N9n8zZqS8f1P4igEtFEWoJJjqY79J43+57ColUb
	Wov+/A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55uqgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b30ffeb2f5so108511847b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795663; x=1796400463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=EFDpTw9pk2Cz//wz9ym2ZwvH53172SkXV/ox2bdu4kVj3BAl/WSUdG/muqw1gaNrf+
         fxSSIVtwwxgINpUZZ0NicV3gPOf3gdNuECBK6czD0WmiYMGXsO+oCzTURlMbLGhjeEUC
         uuhzYrS/i85anp6jUmqi+FfuBaXWAu/1zpgV7JaJk9LulYAZGp/ZjziTLEM29NtOCJTI
         oi4IyxoPFH3pyhQEAmzUIWIQcTqxB9ixm1kMkDsHGQhxdIyVYRanvz0v7eBH3izYnUE7
         4rLDrnp/4IUU7iP/peNBnxbgr+qUUBmzE60iyO9WuJ74CgEstfOatSXf1QFL2PmS2FNe
         wmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795663; x=1796400463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=jiGTTZuLKiKGlAkF9cv6xmgy0fcKmQsGjUL9N21C0spezBOIaBHv5YGHazkV2skM0k
         6T+O+D2tO36vZavsWAdHqHpYOoa9ULAbywB78hV6r8UW4DPqNPBsxCGmNJfuldL9wxtX
         1bms3ScQvC0Btlawc2nqIkSp80+Fo1uhQ21Ab6QwvIL7lBXC0KOXY1O9/2fJXhGCQbbr
         7uWUvN3y+f+GiXtmdbJ56qdVroyViaS2huGL85LdDPNDGvWF1bvI2ZAnToWeUK0uTkQ3
         qgRDO+GEaF3Kb9ULX3jWBKvKlIdPmZmyny/H7D0ItQGUTQhTsM8MpWLLLPwkdW3wP7Fj
         B5vw==
X-Forwarded-Encrypted: i=1; AL+hErFcCmPfapfbjMqsmNcS1JcsWhlDQkE+WVNu7nqRozIE2BuXvS4BrdjSpMu0snEP2ZNQuFw5T7BJ5C17nQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tBZdR0BxLf6sR9dQmObemogtUZiA7OPxKehdumkW3Uw+9ks4h
	NWqmuEI/nL7VAVsAdGubyfCJ8O+FRTIvBNYUCEaaE++PzIg2pwalpIdWy0FAnyOqEyXK5YHzj+A
	2Z10zDofLrNfxtQwdEDxYFoEFgICAKrl6FBBrhzX5uXkd2paFcVWt+SftiXa+nlJHnpc=
X-Gm-Gg: AZFdTZcrB1hWz+jX8Itw9hZZkMc3i4c2sDyIoZyq/qiHbQRyDm//01KHIk1l1B21mRR
	yFMDa/GgMYf2wcgOlEozwfB+1eD/9IHuEmvHpLXTu4QzIuLNoH4jAKJCF9f7Rw9UdnG8Gy/SjDZ
	GA8shxhYPaZPoKmb/rvqW4b5XkB0YegQgOTV3EXsfFTbbBqpWqDJFel12K6Hkyuy1njZlQXh0Gj
	u8n5C+5/Y7b6iOpIAjJK2yhk9ZDdR/TFyFedd3oGXsIBS6ECYPzS36mxpd8muv5P80/OMmC+ojK
	sB2peC8cPzlq10zo39N3oeK9j8UfJDq0OGeS3jZgu/cWtyQAZesRA3OHFeNdSOapSwaLIO7bLQE
	RTpvHlUl86v9U0FpHLMIk6o4sRy7RbldnIvlEEwtopPjbRn7J/bG8Vr6Iqi6GTP4Q25dVBxYlZu
	Lo9IAjEPdfRNJNC/i3nRLt+Dnkj+KjAusedrvF/JdXn5yL6NRfYQfK6uG6JWGAnJs=
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100633217b3.47.1795795663500;
        Fri, 27 Nov 2026 08:07:43 -0800 (PST)
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100632857b3.47.1795795662990;
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:07:37 +0100
Subject: [PATCH v4 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sa8255p-emac-dts-v4-1-f0c5a95cc6c0@oss.qualcomm.com>
References: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
In-Reply-To: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5XFVjff/QR80SQLKKFqKe3LuP6yj+0SGfsOuiR06Wa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarKvw9wSH3FLno4NflMnR1+eeMpV13hBh0gb
 u6WX/rlxNaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqygAKCRAFnS7L/zaE
 wwryD/4rvgx/F6iajtGvhQ/lg7INvhEWm9d7ZcpEDUtKR4V64LidQ+FH8nRtH/d+BJElALor1JE
 C3yx0ZFQ7ZvDQbQlp4TQsPRzxOCa7TCtbxtsxO447c0utky79Uk2erAlFGY5JbeRb3SEBN+tii+
 zjnCCzWncmrjlGCtd5AkBk1edKUHTkxNeoHGP3J/i8mz848Uzzl45iQF3pEzqedjTsDSPRw/zeC
 09JjAECH9+qNLaNmYFhqO0NxV20oUM9osat+tvXhACZ0XWFGgiVYEM+/HUIt5+83Vd5vVMGWB3Y
 7ORw47S0hxGzBSFzKl1ODV8pNSaIvXcBwR4U3GRwpMUc27UelBUuouyOrqducPyaH3Fc4Et/nJY
 u9vm+b7nAS4U5bmGz9UUA0FEbTVOOi68Ky3jTY6uhoiehiAQJ5q5te7Mq5dtkIK7e+1Q7RSGZaS
 AC/6d4NsgHYtioQ1c/kBQ8WyhuL4XSSt9Q4Nqr78GQZcdwB3goxHYWlnhewdazU3P4fvGo0nL7C
 g+40+bs+Jo3eWd6g2q8uokwshW9bYd8/i8/+w4lPkSLfRPZ5ZXursq3kpLIY1F0PWXRA8X79Xpp
 9Evywv8L6tbmLjtfstTc46H/7+7W3vv5pOXDo3n9KMKU7ZAHP9TYDIXnIQID/1venTFw/EkwO+i
 AmGbi7vUoxKKDMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX0HoSMB7tTXyc
 jZhvoMbpKySMhSv9lGEXViZAVAMFohd1EVsZEa+SzTdgDYqdubnLNxITQUjHthh+F6lQeybxB5a
 u+PQG5jwbKeiRQFBbVjJ0qNLQCB31IA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX9QXUTMSm5Lt3
 lLSTqn576q18sMelgNW0AyBZkjpeX6dcV8LBMv91F0vmsYGVuC4yp3+KhNEoKHc3Q+od1rRZ25U
 js0eON8TgQU7YoWz+lQYuc8BmUHsY7Lw9Fwb7VwmUbJwvoi5NPB4hhA9pMUKwk8L575U7HyHFd6
 mPBTssp/1Mwikh8nvW6/FIwjniE4C3EoZTumnBCkqGdKory68kU4wO+XQB0qtUCC3Pl2LEjXCAu
 1+vtgF8LBF9dcxEb6IhcmjwgxPzsl4IPTKz0Wqv8MvUA4pYavMR5RMXpi+S3xUtJN6Qb5ewSFse
 pFW0+gIf7Pu3PC52BhLI5pYWXTLJ9ccigzJ0xkVvTnjjxDDNjujTMIxMaacP2/QA3xFE25mmzcD
 k1ARDXUWlq9hY+BQJxAb/dffc/iNN+VvB9UUtB65VqmsRExXeo732Y3X8SVhyZ0R40QrtHgsDdF
 HfVoFtxNma8qy5CUYYQ==
X-Proofpoint-ORIG-GUID: l_0vWoJ-u4G_HImFk-e2Kg_aJ-qHbd3d
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09aad0 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: l_0vWoJ-u4G_HImFk-e2Kg_aJ-qHbd3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..4e1755a7f2cdce07c454329760cf9a1a2b6b3977 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4401,7 +4401,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4422,7 +4422,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

