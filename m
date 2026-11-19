Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065225;
	b=zZi9XkiStLoN9Q2Ecai0R7qXJAsZbPcy9G18A0espA8iHRkOoHwZMlUZz1Cr21vMEbIp
	 NfqqYZFzK5VNHtEaK8nwGkFzr++4h2NliNgJI0XPp69sdo3zaCrVpFK1zQn0D+l0ha5rH
	 YCbYJr6vXPm3Gov6uTzJw9STU6pMFpcpHHbKKLRBIBIUcsMjXYr0pOpbRcWd6AtSoMHYr
	 PTrFoZs7v3n0PC9Jek26ziV+4raAXNOconPyOf1B2NY1TiVrr7gJLKEEL053bdh0LXgSr
	 W8Z4fCqeJBWwOUtnkW3jU42WMj2UFI1NgO20+6YXXiQRFpNb7ITNySijzXMrFwPslFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065225;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=;
	b=d/bklKsWabGGPehSjiUPrAv0I3e6bwn2MbjkbIzi8Qf/Uvuf3yp1MV9L4RgxB9A4g8Pv
	 JoTITsVQw34dCy/OHCWve0Ocv+SCNAl0ezrQuMcV4vC6WWPij9mbNZuyGVV78ktQ06oBu
	 7ZMPfVkI3fDCBjWtGfv7On3CcWM6MKDozh3Fm3m0gYXxXxrdt/O50YOi8GIGO5cIhiiTS
	 DRCIzDZZNGjz5KgkEjc/U+B42UOGtxuEzJkCPVfQPoCcLZ2fqeofG0X7KoQt2MH7o4VP6
	 Kd/lbGMl5T5p7BcieCNvWfEs/Tuyg7GnQeXnBJ2rIqvqiUeFagz2DjLrWYoxZ7/EWbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KO2CRNL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5Jv6dDA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9D606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C9D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KO2CRNL/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5Jv6dDA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1At3m3780129
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=; b=KO2CRNL/ZEAC09zA
	+h0ZcssSpSquwSNJtWSAZHIaWrWIAhGPRNgZu8ezne24ZDLCwFOS5+onEzjS+15b
	mA02FjRiDQTv500hT8M08B/xnEt0HK6rVH3Nht+AqW6wc0gAg8v6pGBYWWdKbVgQ
	WLbcNH9ofzIIUS9EGHzhwfxYZxpFbFQ2baWlDPWakM3ZPoJ7ypqo4u2elq+mC39b
	OBrZHWCxoMJYzjFFP7DS++pTJOjL/CTiNdEI943XmksdG6DdDAg2iOqBZ411zd5U
	7xAuX6dv2m/J8xYJQ3Pc+Fls968fATT610nSqFFHhqdPa+bN+5SXKjzN3vVq/2cQ
	QAggjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnjq5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f002ee475cso13209075ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065223; x=1795670023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=;
        b=C5Jv6dDA/kP2fbk6hu6RRxHKv5llz2qiLQT72/UxCvUBkP53VMOlvruNy/N648tA6U
         bsVZrkBvdyFRlvbn3oMnlZTf6E5mJUdmqtatW7lNtsM2VFZp06af7Qr8S0SgBA3BG18F
         F3komDZOmaH3L3PnWbXajkgWxeWjITpyvGEDj+2Q6474WOgMi6zPe1hSxwiBK+kAsYq8
         voju4uIAmKNozm9+Itce5hH9robRVywiSmDuhAAUqbVp6W55Hv2PtZ1kNcAADrL2zakU
         rjR5ZwILvQATJOU/ZvoFbGc/b5f3tBA0rXuoPnmr87wUo0O8nzrnNtLJKjirdNiOhwDa
         z8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065223; x=1795670023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KI+XWwTFpoEqXlwpDF4oZXhjW5wEs3VtU+uBQf2O/3g=;
        b=ZJ3sJLHVz3JLu3LqO0w7itZf2YDx03J9oSsR7rh4k2DCqASk4wa+FUEI8PI4kOSEwY
         be95eGKZXZgQOB8OVdaYZX+LhcZ46/ltsOU9pUOGBiqYdtLuFngHqJQDYuu6/lGnMavm
         mveMNbxXeOkTE4l1qtu2/LbrN4oa5kvS77Ryk6q45u3gDqS4CW381w1be/EQKWCkifhO
         nQJTyEkDGAfHN0bc66HDqJ8K/vz33Qni+Qu73sLVLHQhBWwhMuqli/lWq9yynVHhOPuR
         s9u1Mr8D257Es+uGeiaU6SIE0sr/0nyOtKg52jICCPRwZPPviNA1FvqRyBvw6zO234kk
         4Ztw==
X-Forwarded-Encrypted: i=1; AL+hErFLGGtksrPuzfwH8xBRlR/Dd1MrV6ht9m8aImhYMuCAVaASN5tG2aeJ2T4cKo5QJIAfN2+vAH6FXavD2As=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6a7XaeEgpsXiysjSWDGDPClijGXaCqJY4hRvYfyHRKLElTe0g
	aOtNNG+Zq1lXDZDCVonH9W9zTMfTXPE7tyyHvS0h/yGSWoXAr1oEvmwdZ2LLEeybbU/xh43OK2y
	FERoXtXQq5YGdW4nh/8sMoCWCdlKX4vx4tQCEYer+qouwrx+GaxDS8qGjp75ZXgKSflM=
X-Gm-Gg: AZFdTZeUiIFyldNXQQkkyLGcyswYnExSYGqEVfyC2Y1ZKG6Ao4d6e+4UuOXVwceSq1+
	wbaOAe08pkdFxqECvqJ9uLxDBxJ6nPqC/dbwe+KqPIREgCvUSi68WnPwvq1Ik1xEwDTIdHz9qq9
	CEj5oqKkF0gQeqQFJtyqg8B15tnl+pWAi4PYVK45kMU9Prfm8KJnMnljNtqzlRQuMwobkm6QMUu
	tu59ncCcfTsUDA03Day4enUAqt/X9hmA20vT9mw2BqykWdooWKME9Je9ZYYof22duhpUmW214K2
	lPNEjZMyE/jOxhkdi6xxu3PK5qAsCqUYztq0m4nyjHMIx0osUK/MbT3lwzI3bk/qdpnxSK0UwAf
	IowNQ9ki9fNEePseKG/6hoSvCLW+DhgBuep91wnGelWhJD5OGsYI/m4lGC44ApiDN5wVBXvS7SP
	E54IKvyGfZuNuJxAYK3w+MwFIdMxX0r40MObwQeNsWGTRhhxw=
X-Received: by 2002:a17:903:94b:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2eff720e32cmr43296325ad.1.1795065222814;
        Wed, 18 Nov 2026 21:13:42 -0800 (PST)
X-Received: by 2002:a17:903:94b:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2eff720e32cmr43296145ad.1.1795065222319;
        Wed, 18 Nov 2026 21:13:42 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:41 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:25 +0800
Subject: [PATCH v3 2/5] dt-bindings: media: qcom,maili-iris: Add Maili
 video codec
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
Message-Id: <20261119-add_iris_for_maili-v3-2-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=7742;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=+T5vulQEyMVm6P9sXfAjnNyXQcGFVgyBTnNOo30l8nE=;
 b=x2qJQZK+IRDZP4JERbHKpvPwUTxM1691rrtFO59C/jEI7KIp6pjTyEGdBXGd3JhNGElURWGzA
 ekoLKiuP7tCAaz3rdgXFO1Ybytt2glwPY+F0gI8VAFnxhHfpTOLyLV5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: FfaYZS5yuoxNWc9Jef4XYKHiFQJs3YMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfXxidG3NvCsreu
 bTT/e+cL+4h1drJ4YfwSS9Su6OC68FvGxXMMaX8SgDjBbjdsqFhG+OkF0jaaRoN1rzxk87GIo9G
 oOKFCkp1Hj8NjPhNhvrTpzLxV8mSGlPdT0FtLPh8AW32JV9ddiNpYO+8z/h22WZf+X90Po4NNfc
 2Ri7lJ9L+8UZo4LFUl5FsG27Gir1R30F5cV4RQ3u0/cTOaXdbxC8Ns3x2bHhwYD2JPqqiabyaA0
 BFmVPVg4TXV4cQVynbSKuaohFj3np9pRKP/RPwDDiwjd3+ypppplRHqu/fJV/FbyANrZZGF11bt
 VUbBdKlv8aLx6BmvJxLgzbXV6eF6gaWHcposd2pg9vNaMYYRaHLiRRkrOfapieSqi1CoYa2nrbr
 a5yKnZPuZu61B0FaSjXCJXnoQ/vzHEzKAkaZbvGOoHd4oETh0BUj5iTUWoQlVoQqesBaiILtsbo
 z1ujrdAkw8EJYsZwTyw==
X-Proofpoint-ORIG-GUID: FfaYZS5yuoxNWc9Jef4XYKHiFQJs3YMJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX3WT2cwsgEFFO
 bjOfmIGq2zrokhPTaflcKZqv/7IAJBXATupne1/wEPtTmEJ4uDROHwV3XazdlAZmKoU7Zd7HY6Z
 BpH5DXfn3vHgMcISGdvcniFK5QqoK1I=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afe8587 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MWoX49SKP4xWF05JRPIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190020

Add a devicetree binding for the Iris4 video encoder and decoder block
found on the Qualcomm Maili SoC.

Compared to the Iris3 generation, this block has
- separate clocks for BSE (Bitstream Engine) and VPP (Video Processing
  Pipeline).
- power domain for VPP (Video Processing Pipeline).
- different reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,maili-iris.yaml | 229 +++++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4ddc4df8481b52661b314821a9fac68870d8ca6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
@@ -0,0 +1,229 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,maili-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Maili SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Maili SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,maili-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+  iommus:
+    maxItems: 4
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,maili-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,maili-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,maili-iris";
+        reg = <0x02000000 0xf0000>;
+
+        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0_CLK>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0B_CLK>,
+                  <&videocc VIDEO_CC_MVS0_VPP0_CLK>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                              "video-mem";
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>;
+        power-domain-names = "venus",
+                              "vcodec0",
+                              "mxc",
+                              "mmcx",
+                              "vpp0";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1540 0x0000>,
+                      <&apps_smmu 0x1620 0x0000>,
+                      <&apps_smmu 0x1544 0x0000>;
+            iommu-ranges = <0x25800000 0xda400000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1543 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d2>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 800000000 1260000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l3>;
+            };
+        };
+    };

-- 
2.43.0

