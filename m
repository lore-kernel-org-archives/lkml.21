Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699478;
	b=3w7T2NSKdNH4+BN8YOE/0k4cG9iBOjI0X9L2JMmOMm/bHzj+8I5shB5kDx4b4wUj5p2d
	 ltMjU3O7XZ4cEFK9O2v8l1KCSHWBYPF8PabsWjZ8zBI0u4fCBf6DxwgaKYZ3jlLub2N7S
	 ySbnJZn19IcrxEmWouTjQzGvVSH6FxiS4v5KxBt1aJbUcKodNEribDfvMTqBMH8NRs+JX
	 VuUQVo4bHTsQdrg4bgqPaeFa4lxYSyJY/fXzzsvrNRlV69IOZCl9tDo2pxxvUxsKLTnJG
	 OlL8E/xLrHeczBgfTnA37twr3hWdMsg/frieBzxkmgQAJg40VYzcHpZVf/HQQQfwmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
	b=kR6UDhj/xME4HrYy9Np0opL9JiIjrasDi7PFiBHQfq1F9zQSmovDdjqa2b7PPF+M007v
	 jhRvzgczp2BZJCmi+HP3O/Xb1hF5UEGBGMshY8uRfD7wBE9zPCjyYj0Gbx2BzCL1U2BNK
	 e2GoqBAvsQ+0tU3G34gETT9cVruA4eD1wv7piMAOhZEMvgogvep3ZNFYdS5rytQkMC/rJ
	 XbkBKt9ypDPZddHy03BJq3oMkgtI5o50Yc5mmsm9shZWSyz929bY8e4G+mpFqw+v81scC
	 iZA4maXgE6xYVdVE/K20alr6dke5hSxZUs0dDFVaGS+11908dUkJFh5TqePNX9CDRjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfhKrri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP2vHrOa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDDC606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDDC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfhKrri;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP2vHrOa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVWGE1275450
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=; b=iTfhKrriCluy3bWn
	sBZpQkHHl+Hg399tLvEm25/XO7HlO4C+hKRNbyEHa5g2OSMvQBt/k4avk2Qkv/GS
	wEXpMF9Z4LgxyldeGf0n5cTvs/YDaDDYpqDL6V05PRk2kodZKfPdd9bfySK78zTp
	FUD+tmRL5QpbMle++YkPJtrxMxznMVMrYM2FrBXBnB54YuPnKPBoevidVszjAqWa
	ZPOFGeWMMc00U8MwOQ/tchUk6hxQBISiUCI5W4eWPB69fnP/M+RAtBoVO0GwnOxG
	5LNrofiGOPAM6IpsX3JvV/N97UHcc/psA2FPsIhrs3wdC93DGK2RgsV76DoSVb2g
	uykQRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7sdvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:24:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b421417c3cso6126612a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699475; x=1796304275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
        b=NP2vHrOaVqqzZ4j0vxmCrTUUkSUo4Tir5fdILX/NiN667db+3XPT8Dn91zx7BoUYOn
         y2PWiibfc4b3CX9+IEIcGwitIxbC1Xbk/Cg0SsQManf4zSlxhioCTlRZLtqJaIkASroQ
         3LwGSwyV2SfLhXrGIjRVyG0YOe4+3um91XNHG2a6GcMCsCAEhVB1yNi1Kdrt5e9HT0Qh
         iCEdM1Q4gp4N92YCB7yZUd5rnc4cUVCN98/nWE191H8/9JYyKpsUCreb10GPUzifwxlb
         fQCR2T0G4kflisLwI0aMJCyGwT147EBatzMDulJMgrwSwLHHOE/N7BpsgQEjxyfvuu7e
         0Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699475; x=1796304275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
        b=0wEB3ejH19Kervrl9Q73I8QafYk08KZZO8tJgYhBuHMozeHhbFSfy+3UlOxJFTPnxn
         2Hbkx1wwcxMjBkxGoDjHPv1f57UsKFZEYh9kUl8KfgdDEjNHqy2ZQGQ4ntV3kByN4SUJ
         WeETSR6aC5uWtEDXLlDkqPgOGkhjdurrBx2dgHbExi3SgLTtmdLHFpf5uo9RTLy48/wH
         KKZ6PpUtOCy2Lqx0AdVHn6PwQuESVLfQ0PNq3VM51Vattj9J3CX9hwwFBgdqzX9stDwe
         UspGx5Dh/PB+Fj1r9ereh7eUUxdFja1Ra/lx/eAUwFD8MOQsszSfnWcoVxshvpxrsV7S
         IIFw==
X-Forwarded-Encrypted: i=1; AL+hErGHt152/RCtd//am9m/O9SpriOj8TeE4qcv8qcM73DJ8i7DpwGQjhggWUNEgCa+wxtskM3Zft28ujJTJDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KcLwQ8s4Jo73rWTdJL2Y+QmecRvD0ibD0d12bAi9jtVRzt7l+
	hefhc3+OyFtJaQ2XtzPBcM4Gs/OBMMIA2TdMn3o6hLqZmqfyZgv3MGvmf3pP94UC4noE5IlzGEZ
	ILaB4wAvwLQtwFos3G1VaLCPMVlF6nWpZPx11yX/CWZDrIE7iPaS+WGymZM/cDqrBSuc=
X-Gm-Gg: AZFdTZesIohIANRp1w4/XHVL3FOHvP0gokD1JOzGC/ayBid/K/vk0ZaDdPnvEOhgCVV
	FcWZljSDleYLBlOScTOFQkAXNy79PE3Ihx8kfRIuSU0nv+7aD+pRTOJv1N9lvh1YOVVhxiRH3yK
	kcQN/nu79CaE+HsQxahVBC+RaNfJWTo8qyGxf+ClTsiie28/UAgHrwfrm0DGIdw6paw5aUN8kRU
	gZ42YFRlpHC9V2pQnk9TttxHPOyKxeTms7eGf256XiNX+nMRX17w2bkx9eAvvfOAP0ZehFrXGpV
	uC7XPIKGxlwYIvBiSjwZk6zrH6noi+YOqtgreFxV4+P+KGg7Y/8xAJiFdi7kSSA7KhjUM1faXqV
	TqmVRarfIJ7QpvzHLQWcW6DtHoVgpSvnj5a3h0sDrkR3QT8G6dUT8rWjmT+asTKu8A5DjNl0BEZ
	lG1EB3
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr20647067a91.23.1795699475318;
        Thu, 26 Nov 2026 05:24:35 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr20647024a91.23.1795699474813;
        Thu, 26 Nov 2026 05:24:34 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:34 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:19 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
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
Message-Id: <20261126-nord-iris-dts-v2-2-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=1022;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3f/TKIuHesYZU9TLZcTkUD4yAPks35/nwbxYhtbY9Ko=;
 b=bLgk9I8gxP9rgBQhX5TLRVkd0Eptf3ULvxcMDiBUL+h917XghBNAMYIV4pPJC9tZgw+ErEFXh
 S3iFXXA+LU5BUnejZei0rbtbSHV4Mymy5eOQLRyF5fbGUrPdRS3x+y7
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX0zB5A3yjNJ5D
 +GEJ3Ltz8jGoH0Z1y24CmZzkrZ0Dg445aXGXxRd+CGYLgpzaZyaZT3wubqK8tsm70gCAVZrfTp5
 s/BSJSgyrWOCf1ik64hzWjcdCzY8ugQ=
X-Proofpoint-GUID: zRWF7sJxBwJIODnKUDRIYdERvd2itndq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX/VU4WdHcZ1ds
 qYgsGh417zeuIRhuLq78/51S2KfA22XFFiXQBqxo857pvCJChTuigPoZ7iCx9T5Kgl2jT4hTYeo
 vwf6mPSBQ9PHwEoXNPUsOmTZYci3asdnCMK5YkZ7enjmobcojFKDISFfapu+TrGtqtJ5BzTZpor
 jqF/T3RJbMo+QCKky9kEwRGlUlPhadw4uV/fg30CaPiWd+Wrl/+l5Qp1/jouoY9V8iB684TqUNo
 r5qKZoz4vgrMnDWKFa8xDZOsCXqC2ksnzSNq+0/MzcuASjgN0SzY8zgFvnp2u977qEm3CKO6FZc
 6JVkFQg3EJDsmF++yDamxC/8RWYD7JyF+xe4GBHnguRHHWu31WRCii/JQVsdvepk8rWygykH4sw
 EqkxgwaDEpYfQGCV/i54bX0BVtxiqAtmikZ8l/70rmf/N3a3djFs+PN/vbWRAH8f0z4MzN0IG4a
 AFVekJjvDANorrFf0qQ==
X-Proofpoint-ORIG-GUID: zRWF7sJxBwJIODnKUDRIYdERvd2itndq
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b083314 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2Kdgl9tpF7yuq2k2qQQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 3f764069bf1b4..b31c30f460b7b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -464,6 +464,12 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &pcie_phy {
 	vdda-phy-a-supply = <&vreg_l6a_1p2>;
 	vdda-phy-b-supply = <&vreg_l4a_1p2>;

-- 
2.34.1

