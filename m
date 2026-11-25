Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596199;
	b=gNyUgemr9f+cy3hCc3ceVS8n+4RBwyFVaT2Mj5Chsh8TwmzXOf1Qx8NIM8whUp9AsDGo
	 1NgywvHpzlys+8Ty++MsrOb91vlV2ajyx//Yzw9H1O4cTmBC98GN0swH18059TuUtjsMc
	 T1ie/o5oiAGpjcA4KZ15NQfiuOteKDtRbLK7BzZ3DdvxRbNvEiZqavLJDpLjlRdZ+TXcw
	 a7QiRm07ikKkY+7m/HCzF5jL3/zU2l3ldxTPXt2RJHU4b60bf8a3eOgGAZl26bUR+8Icw
	 L2qHLZ0TyZYiFozw26tRVLgJ7wqIGEbPbRYjXcl/kZm0Wki2/l20rvRFC1vUPLSONjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
	b=LuGk7hsgnfi+JfM4ehwb5SWZeJbaTySMafcE+/nS1d9Imz+WQSpsfjFrjELrnlOASz05
	 uKJFNxUmhx6HWC4wwpoZSKCUGCoOI83aVSjDHLjXZNM7vyG4ElT4deDB2vN3lw9S60Rgg
	 yfiLzgqtPbCV4d7ZDzWHnh7b4SdkLpoJUOO+24opAayQFK6XKKJ6TEqyp8da17kwaOLk9
	 4csQYYASjtd72LXO4Dx87bltkg5T33Rr5fPte+BrecEzlLz3pI0Hbv5Rjs/TJ8u8lv+pB
	 BVIT4sWktyoT5sgua7mgFqNpjl5+5/JoJh07Drlo+nS+NOz11gZn45phTrby0lTaKzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IvJgwvEW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WW4eQTj/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AA3606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AA3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IvJgwvEW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WW4eQTj/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68kmg3143002
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=; b=IvJgwvEWmDKQb5uE
	y5MSPHvwoHpTH4HHfw/wXeFAwnqvrMoCa3nJSGDO1qYY2hh9I9DFZpp4ptw9ha/o
	TdfGVYSyuUr3OaSmszRQpc7xvXgNYCJLskd4geXkD9nM2PSzIYpDvkgU5383iocG
	mSmfN4ob2KXA9L9K9DtVjaum49yfA5E5rYLaKf48XS1LLElL4f+nhmbv725IDBto
	tt1H5xIcqYzMiEW7yo39aFRVaGsf6g5E3dCnC0VJiAiQUDrEl30u1tjmLh4aYz38
	Hofo5caSr3nY2M7zQsd1g9Pq5NsqRqZ/LOIT11RyZOgT8Q1MYVCUi+TF92QYJ4MG
	KsJZzQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29v8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b587ffea77so373907c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596197; x=1796200997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
        b=WW4eQTj/Zf4JZGnMP4tAcmYseP5YYWrrJoMFpnSwQhdyXf5zU7VnZK3OTUfQV7Ykg3
         RAxL2ug/96vP6X0b88+A8MxN9cw44f69NWsF6Fb7Pl+Tvro9SUCxGFG9DxdSWJsdD4gL
         9fYtc48dSw+7TKAwzlKNESjsx8//6J+Pjl6nU/O9ab+LONQykH/mykKf15ZfqA0D0egS
         WXoXh9Jw6PH4U2TisjosfXthdq7noKbAbFu5qtRRGI+qEEuI/NTDD8IZw4n939w0dIvg
         XqEDyPdYrFe+oWyTGESwLh6yYt/VWDAI7SCdTMta7p2u12PIG2Z0T9T+MxOhJ2EIxOMp
         fX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596197; x=1796200997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
        b=gLhRPRp+fd/FazYwTGZZwTbUYjCVe4YJSWqlseWFtSmkZQpIL7nm4i+5T/A7sJEAwz
         R3ZJGdkBWWSuV/jFKuWT4mrf++6X2qVuNfCt4T/yauUxS3pKutKKfsa+zceYTglOxdf6
         HbMRXL2JI0iHEnhhXgQN+G2cHKTvjZ9UCZssT+7PzWo5a177NqbULviSCc0LdIhp19ji
         bygB2fiwQb9YcF6Q030qsAlaI3c8K0pVenbdd7q8sIknyiTwCqhVWoz9mMj70TlvlBxx
         vnUkxQHLMui2CYrTeYtl8fxiNKoXSYxeudgucAzQQlLZZv2QhwPm8TVxXzvO/RFcMlTb
         Z52Q==
X-Forwarded-Encrypted: i=1; AL+hErHpeZt+qF3Hom57Y+zoSHUZJKMDACn3ifwE5IXRo8drw3dlYJpXE6HZxnwxwL4ZGfSST+wAQ1Z9dtGXJfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yk2MgXyb+l9yzN4/nWxZ+yWDE1P9zY9t7zaXn1wuKqVgeozkt
	CdvxVj5L4YN6XYqFvjripwoKuGf5UhV47figIkvht2LXKqENRHd3NC60arVAbEKAS6g7HMcchlg
	8aN5SWc3OxO+wSfzNS+ewkfzxn9FRHgiQpOlV/LqDZF0xHfNbIxOPjsqD2vkqwA4XgC8=
X-Gm-Gg: AZFdTZegWtH7yisZUjKM+LmKG85iB1b3SDLkvNA8ELKRNzsPMMIaL6EL2mHE6CEH515
	nMvQc+Ug/Vk45yvt7a+5NR/79WqnShJ9veQfRfbaHijm0WvedxGu9c6RKSHikWvYNQ3bFUifyDG
	xq9Cq1cCJ+z8VxNaGruMOiMlSaC/6p8MJ0Mm+ndl0GHBHUQMGt207jYkVm+aCi8/upQyhqP71rr
	Nwg0DfEC8s0IfFA3NLGatQqRUVIXiA4gpHW5N37QQzDBhBujL+6Qe09uY0XZry5MduO7tUmgkqZ
	nXWI+MDY99ZMRabSlIyxyeYRibrAY6IXWaLjcuPMvYmtNMrfckX02uRgk5WVnW25ePLdlsTA/91
	o39izj//Rg4AUXOnLAMGn/umGEsyh8qOkEwJZHUcSh3hHp73y1gaABFVer6nkNs2W3K/12llB6S
	q7M4Sy
X-Received: by 2002:a05:7022:c8d:b0:1b3:b3de:9228 with SMTP id a92af1059eb24-1b5568a4f37mr16029412c88.8.1795596196943;
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
X-Received: by 2002:a05:7022:c8d:b0:1b3:b3de:9228 with SMTP id a92af1059eb24-1b5568a4f37mr16029391c88.8.1795596196431;
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:13:00 +0530
Subject: [PATCH v5 1/3] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
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
Message-Id: <20261125-hawi-camss-v5-1-d48c4feb1c2e@oss.qualcomm.com>
References: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=11612;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=UMXZdSAtzUtWtGtRt6fPvenn0fAcrgy7s5Zjj+fIsBk=;
 b=3YLKGF4u/ernvP8zDM5rBqf9wVbs/XsJaHQyOy1uj/z1kB9olOa9bJ3etC0Us5W8ccIqZOP5O
 dDhHkUKJfe/DjNlmy0kH8e1c3uW+tVq9SX3/nQ6AEIrpcJIBRRsvI4N
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069fa6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CXfGsmi0X-KHezRtte0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: I7xlXCX-OqKfQh9AClYE8TaFgwdKtW7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX7C2HDuV3Q8o2
 Fjr9Bd9k1HvMhJRR6vTpzJz7c4zy7JsrJ9s8QLfFwujqZvyeC+GKEZO4vW0XNk6TZzEctU5sWNG
 AUgdQ9nYw8xoel+J+SuNXN+/kCH2dK9V6Biqb8b6ef7gdSFkOcni1f9id6g5Rortpljkvy6Lf+N
 nJuyQNy3VY4FgNOBAYSMO3l3az0RkOIh8wZlWB5cED2HxVsvDwQy/CWL2hXV5JCmIq0v6u2DICZ
 8jyN71kzmr1H2sXX1HuTj2hEVuENXX6AN5C5VMMTv2utVlC5OrO+D9je5kRdeoh0KqnCDXfxZu2
 ihpf0AticR5DM7cBC0Z//7vcmxVhMkV3iMDUw3wtpHwfjFKrqfRiLGG+NRB7ALTySHXyBG2IYnd
 xgXgdXcLNcngdNRDM8iDhw+fspCKs8vQeEmJTOX0PaDNUlpM+QfzbcdlVDRaNFyxnnVBJM0gf0y
 iLDwC3wONMc/uJnW3YA==
X-Proofpoint-ORIG-GUID: I7xlXCX-OqKfQh9AClYE8TaFgwdKtW7E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX5qv78eL0kUcj
 6mBaeFI7R7CkRk3pSUPwfUdypM8FtJbD9zdoe/sFhagIKNevCbuddhcPua3ihYm/Ijt9rSQNqQO
 NgYXZB6UVaDLvGlLSb0mk4Ash9f9lew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250034

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.

The Hawi platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 317 +++++++++++++++++++++
 1 file changed, 317 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..22629064ed7132cd19b7b0521ebd7c33d79a1417
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
@@ -0,0 +1,317 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,hawi-camss
+      - items:
+          - const: qcom,maili-camss
+          - const: qcom,hawi-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 26
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_dcd_xo
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_mnoc_hf
+      - const: cpas_mnoc_sf
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan GDSC - Global Distributed Switch Controller for the entire camss.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input ports for receiving CSI data on CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,hawi-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@900b000 {
+            compatible = "qcom,hawi-camss";
+
+            reg = <0x0 0x0900b000 0x0 0x1000>,
+                  <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x6800>,
+                  <0x0 0x092f0000 0x0 0x6800>;
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_DCD_XO_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_HF_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_SF_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "camnoc_dcd_xo",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_mnoc_hf",
+                          "cpas_mnoc_sf",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1800 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

