Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414774;
	b=fJb97Qwy5HpXuCT5lv5wBn2n2VkVXnUGTT7Jy7nVdd/YeBEVLDxXX6ZOmGZOatRXRTRZ
	 3wSAyL4fe1Azqr9HsL+3XXoBkxhzxucr5Xlu0mOgP+uAqL7fWfxxmM1B8WwVRGe6f40BW
	 Ewjf5cjtgDlVyPiowvDBFcjjiTP26QNcCxxB3JJSxeJgT3O3+1TcVk9iS5pPYNdSHrM/j
	 TeQ4iq1ZqqZP5v+7vW02yPIAzOGG1ELiTN0OO6lF4WF6lIoaN5AXmbjGGVH3MO9bQg+1L
	 tGhjUgI4dTxak1G4mjUStSeLOuteoWRwf3uXeLm8nsYe9/6QGrZvUy4vXRkSiyvkoMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=;
	b=IL4d+xvtR6KCmH5TI2DQIn1UXCjBkZ0qklMPwYbcMnf+PGzkqNFpx8HhkXRuowOTXIfW
	 J8qKlBGoi4Co5bbEJdfSQ/ANXUexBt48nFa45ZGZUjawawsFb0yVoGUgA2+CcFVCaZhFr
	 4rR8o5lVK62t+41U0GG85mIGtQa4SkpNTn1jFMYNM9ftRFtdxMEesN3zAhjc/1Xdl5Q4O
	 oQdBMjC2Spfy11U7hiVipSDPeV5AqbLATWhjll5v+OZhd3NQ7wC93zItwOOgFM5mjuUyZ
	 IY//KGBvhG47k+Eilwwh09u8X30/n6CddsBpVaX03JUF2ruqK+YaXmJMRy+Rp7F3rgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4gF0HMf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=flLcxO8i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9992606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9992606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4gF0HMf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=flLcxO8i
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51V1c2924768
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=; b=E4gF0HMf6hCUYcB1
	1BkGYv8POexfdkmZXcvSU70oadTvrUsrhCyfIM8EBSGj+6V0EdrIDNR3SuVGdbUS
	jHGOqH7x0SlhJ892o/2Fpf+P5/X3djxcwjwERrqAl/gg6Q2Sce3bZlpqheRJiInx
	K/L/a44+od9w+uIJrEIZsm8PMbbQkG7ype4TOT13twHCYAB1O4KnaCYjVhRxh8s+
	vXm2gyCUgIB6os23vUFfqq1+Qthnoq+eOh9J/SSWMaGV13lQ6G/0R7OxgOdoaS/s
	PQ5QVfjofaF8bzwilxJo760zKixsC324FJbpWc2FKfemIezNY91cxKBwvqCkDauE
	pgQXQw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsg7rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso3465971b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414772; x=1796019572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=;
        b=flLcxO8iumF/ALn/ljoxXp37s+gqavxE/9rQpmK7F0mKym6jBT3i3RD1UbsAXNfi5h
         4p4BCgz9BaaYNPB+s5GFaSVgySAz+uZlwrtOVKx8BF4FJR47sOjYMrIfceNH6FCAvYjT
         UYm5WxfnmIeOwR91gcYxNYwT0v65/glC0RjOGpYtjnWW0y87S76lXNSn261ibj6cVH+P
         VABckmnIcw6nzdiSOPegqzeUHzU/HmqqUba7HPwEcvcKLlwi1/0H8wYayWbJXmBeYp6J
         zB7McJaG6IwAtwN2+t4FFJJLDhOTxEW39h2yLSZT802G8UFcop6srukO+YjLUKyvqgjv
         FOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414772; x=1796019572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaqyWMc9cfnIXtQuLfSdtis1DiK5m/wRgOC4/OvUUxg=;
        b=f7ELCaFwcFDd9KOHatd1nNU8G4cDJBAvW3dEiiv7HG7LCZ4SH8VEKd4BMqPBJQtHyA
         +X4YEZeTYlOCBV2qeRi9fv5H2hsEJ2qQwphdwtlyBsRfMUYhkiFYZKz/xW4HflpigQvj
         aQ5BEKQzyLju0S2dDVlqfvDBf2ZppXa9TWUMc3o9wfvB54HQWWbZaF+ECwD18D+gAAEc
         DhCc3fKEmcI1a+s8/auRqGNz9QsLTX8AZcY/rAtQgp04VMFu2PuOLUHEdonxur2cVocv
         W6j8aDrSF9CJe7G2NQxrfOCM0tE+ebZIWh8gkyT9uTl/Q7d3Bc+coK/+ydDvIhexvOMi
         DEsA==
X-Forwarded-Encrypted: i=1; AL+hErGK3dMaK7CnXUql5zYIkiC6fFfvevrv8XVZJ9C/UGqgCdPIm8Qr4K6pStHY6MOTaHAG5n7BgJ+W2B6XyJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JyotlLBjLas+Iv1CZMKAxH9K8s+kLB8gJGsfWc+tUve13Rrjh
	5xGJL+4aFBF2gqRPlPk9CBIVLLipNKUHZCw0YAmumFFmaQDIIWRyY/EbyxLprViYwt0Jc/wSh3e
	B5cXChOvB/YT56V1Kjyf1Vnlgo7DEefuq7vexwcwKMH4vVP473dKoJFI0bJ0bX2c2Ths=
X-Gm-Gg: AZFdTZcaNVufyBllP9HrGbKjFVjTaZsTTTA/ZsKafX/JU8KcdqGAOuK856lZxeD0brq
	pVzN8x9R6pu1AlXPaioPBet5tOMoc3XGaqwcmkaEmZ8rFv2r7rnQVV/q2mOMCJDnS4MSW0cVefC
	5+U/DyReurs7W9bqb0EhqfGscauOJk14rR0uoAaOBexVz69nwsBVwELUAYP6SBbjQvVopbfiLMB
	pQi7muoaAjAjA8YXKvfBRvH12XcPovbEtfj5fvzyK8OtA9zDRytWIHBDTevW3m7YresUh3Nmxmv
	TUCP8D5pGh5TAWbz9tB7jC3KKAkLBSZjfmbU8505yecCNw8NWOaKDAdpGJKG0Y2zZAdNa1DX+S6
	nPv/7GxZUjTqvNaOorZpuEQH2jiIJ2juMyD1qtA1mA02NCQVzjeHVzh88rWhTSL8n5U4yElweWn
	FZxkgYwho+Dw==
X-Received: by 2002:a05:6a00:3d12:b0:89f:d9b2:4a1b with SMTP id d2e1a72fcca58-8c87b4f39e7mr9041850b3a.9.1795414771657;
        Sun, 22 Nov 2026 22:19:31 -0800 (PST)
X-Received: by 2002:a05:6a00:3d12:b0:89f:d9b2:4a1b with SMTP id d2e1a72fcca58-8c87b4f39e7mr9041830b3a.9.1795414771232;
        Sun, 22 Nov 2026 22:19:31 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:30 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:48:58 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1518;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=/BG00vBqRpczxpyRNllb2yRgE6wS8fyaE+fWjwdrH9E=;
 b=zGS/44VxBHlPLaS4jHflPpEbRCr50HwMGwONWstbHM5+xw98heDXoxxUYSpyzhmS7ZeSBIFcy
 iFCGfa102X3AH92r3GSncvSU6xjB7ETDzzmQVu+LqF59O7lQjnbPDzV
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03daf4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ukB5r3Mx2XjEV9IxjioA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Rlg-8WEcnZaph0ejIgjIw7DerV_9iM3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX1jqrXtxM9fDu
 /PBqtg6X7XoT4YVv77cnRpZX68wqizHAhv5n7MzckDmgQvqswlAi3tDgFW6BY2a89Ft3v8Qwic3
 zTAq88C5NT5WSuvYt06OBnmt2HlOfA9nOOhUp7U7eUnA5e0EjRJSnzI/5gEtKcKjZ4nYC5skP5a
 FlkDXFIxldsLo/61X3I9zwtkGoMMrMD41HIp505ia43ZB7eKRsb1bimOE9aOX/twzFgRbbUkKpu
 gzzHDYBAEu1GWkWtr4RCXCHHBvxwgi7tRweOPD0Gorf0mYRiKmksgyPRsLUtRMR2h0sLQdEqAoU
 Wjrq/je7uWmlkQ1pnoBnN83/3X/89FEYyrwNs/cw0zK4LniacfMkG8Yzi4ItyfpK21P9KgxTST6
 XGwtw07uTSFrWtwMqXnAcOAgOEcy75UFM2teRA4WRmeYDrItQwoTO4D0+fRiglu/cXAkxTOQ9Kb
 vPW98P90Vn7CtVtDAMg==
X-Proofpoint-GUID: Rlg-8WEcnZaph0ejIgjIw7DerV_9iM3U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX55MDRjdIGyMC
 4RIVVl7cb7donCltQUnX/AT4gEJ9KhT495zcLF33dSYFLX6VolzvLMWcHMEXrKwNpl0ZactrtRE
 cCeMnjvXLpB7Tg546/5rFfA5vNRvqvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts.

When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
and the write-combined mapping takes effect, so such reads can result
in XPU violations. When Linux runs at EL1 under a hypervisor such as
Gunyah, a Device mapping of the region at stage-2 hides the issue, as
the stricter memory type applies.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 71a22859709398c969bedae3e0b931f664cdac97..fa66a34c0fe284579f728266e826fc22d8cb3438 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -1021,6 +1021,9 @@ tsens1: thermal-sensor@4413000 {
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0 0x045f0000 0 0x7000>;
+
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0x045f0000 0x7000>;

-- 
2.34.1

