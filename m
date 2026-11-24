Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517598;
	b=ARBhBWh1KaiL41+t+1ovP9IU/nxx6k/rMDRdWDP7aD0h43iA9F9TD2PT7Ir8d+n3Q3ib
	 vnWAgCXdx3Izp4yKG16sVSjSfaXPRprAysmyhx+mqTdni3aFH/BkQDizCAZ5OadFkCTC0
	 G6y1aBTJmFU3uD0DhQXaO2AfxNqUD1EblnRJu8QOfSuN2aYrCjdxx4W9GmLH8tOQwJ7Rf
	 oQ5V2TY16IjrAXHiA9DLvo3NI9b832/oL7UVTjmPjz4pG34H+MGyvEkjciOhqMe4pgoJs
	 c+2YVTvSXsWi0AR7UUGU251YeOpk3sIA+5m8uCXQHNC4bqpEaSiGbJpzvBimkTG1dsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
	b=uznEQt6kB9s9VasA3bOwB4f+EXGEmwG4W/uIph7hFIkgiOMskkgyo+tZ9pMefQarJ/RK
	 gjFeWRFZp90WK6JCBtFz2kQlH/3soTVHQke6G1BKA1Z8fIxyI8nvW01TnbJjjBjoOM2mY
	 F3JlA+gKC1ZMb2vcV1XRm2SsoUb04E047e07VQk/8gkrMesT3MlKOsyWV8XPIo+s4/qkX
	 tb/pmTaUX+hsVCYGpT80QVUH/gEf9UhVxU1LV/C0hNg7VOazi4IxGSUwtAne/3LvOFKp2
	 3MoxT+xPuQDvhRFBlRRRHMB4T2VFJIJJKT2cLHX93mXsLktvXcCv9ZhiI6xc7XKL6bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liMUJPu2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFylF+a7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liMUJPu2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFylF+a7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8coNo902444
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=49YFlJIWuss
	tvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=; b=liMUJPu2ZSLIIUepwMKYSRScRD0
	oPn7tSnhAFYdPAlB21AyOf/zAGvv7ZXKzr11PS/Ez3FwtgngWXOh85YNatsNzA8p
	00Wes3lASwuG4h/I7f4O+e8vy5BqafNeJ28C4kKApiq+SI5z7bqrbrNbXm4uhgUZ
	e9czCriShkb+NQ1cbUC1SJoo/a60pAXrJ3INbJXqKavMzYSrI/YxfqeHaCqWAQFq
	RnpF1w/nD2Oanc92XoP6nefKwlwX9S86zPLWFbFZuTZEL/fFGn5kCVvbnRPoSAUZ
	FtlY0JI6qqSb2jgcCo6KTZgtBbTOnlSs6TwyaPwBiXPVaZu2hGzT8fwbzSQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6stv4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so2326884c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517596; x=1796122396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
        b=WFylF+a74VWEdFxY0y8Mi0XNwOuxHf7+EPxXTwBn9BxA7hL2jex5wXNLy1z3A2tIvT
         9EZ0aw16OU+StYiw84JTeV15wuY1o1mcpxD0GXttj6OIN8Hm1JQkfjSlVqlqDwqJcfpG
         Gc5SQb6NDDoH7gXA/HGJLFNNxr3ojniSDPlRLgvQsf4kcTrC42VAdLZ9OmgTlo1GRh+b
         Rqb5N6267FNkQ/u0CiyPmKIE1t8oeG+lcsrC/djLcwbsu7Uy9yj8FQkFTxa6NgMRf9mt
         naeYqXC8hBhE4TC94BqGY+eZHAezhSJwwohw3wdwF65dA/OmLvckgyQ26DsFBNgyCo6k
         4P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517596; x=1796122396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49YFlJIWusstvMKsZ+oVD0CKvkAa52Gl/xH4xGcrTHY=;
        b=SKpfXYvUxF+s5LiHXMHZNwjmrZMc/hDkJhLzfoFTFskyWFdbIIonH/g9bULIUszLg/
         wTK7tQQPjZ2TA4OgKc/xM/V+h04Pa2W/NTyPETKgZKjIu0kfQZ+lOvnwCAa3StmvozxP
         DOVnljFgrhlvYLnOm611ZFHJx3qX3YuAcb22bXtZID3B8Rw8eox41uemp8fYUTPjGP6i
         eGGMDR3mrMv57XvEdWjUUV6njimw2ZtiUHDY1RFRkptycuBR1OiZ8Gchsg0mOBjwdSuZ
         U+IyvMvKCHEBFtS7ILJG204iaXbuEevQAi9v3vRAxo3JKIKWMiDADIO42FiBD2iBhw3L
         hNvQ==
X-Forwarded-Encrypted: i=1; AL+hErHPxUE5a+S5GYtvNWgYTiN/LurRoK8r2FC4KvCjTKc7Yto7B8XWQNSEXX3shOUXJQLQpmg3BALoBwvBMCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z//q8UTlng8sWARf7p+TPyu4JUOBn9DR3MvxcRTj9ZVTAotLM3Q
	Zpn4Ab0sIt6Wc5OiXcYM7xQLp1pEP+Kxb22isssK2epcrpdd1RD34IcXTSy/Nwc/00RHVHKKZro
	xtppWDjbHI3lu5qNX3W0hQxqfrDaantMsYuqlOE5XpKWBKnrKZTdpzqUFe0k6msr42Ck=
X-Gm-Gg: AZFdTZekW9ixEBcXxQfpJm6EP6EEvncAug3PGpLIfZVx1wpG9FVQ3ftgZjEdwN2COaM
	0L18XzJ1vYVUG5u+brapMcDwpR36/H3zxbwgNNPXwPmvuUQKYWXtY5ky27kJcn2IUuskXpuQHe/
	sldvyToVSQpyCO5vZ5iZnKlLvjUBjG4QQ13UZjFfB15ib4tS7qUegfqOvdMsawouUs5/RF+55aR
	NCdlW04MEOc0LfiFif1XxBrQEmiW5RWOk0l/iHwAkXN8QUU7CsRC7B7ENiWkLDVbcAlUlQLn5Ig
	gJ9HY/NSlwkEl98dv/3hj5RUCx/UHfXAM5DPlXGBMSNO1LtB7SfY9wjMCDBgEg8DzCpxSWGDJpd
	V/WzXBvtlXwDef2wewUpL6ROljl0uTzhbBDmZ3/RShiqPyvh6EwgBfGoVD0IxbsoriCP8fGILea
	839W7R/bB5XTVi46DVZ7W2lQKLfuj5Pazezw4uVNkBw5VLTxE3Uv4IXBxW
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr11862664c88.10.1795517596179;
        Tue, 24 Nov 2026 02:53:16 -0800 (PST)
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr11862638c88.10.1795517595617;
        Tue, 24 Nov 2026 02:53:15 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:15 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
Date: Tue, 24 Nov 2026 16:23:02 +0530
Message-ID: <7489ef6eb166f6292841030d299e72e5b27231f1.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c7qdHKy35bVLJW2Sh9CPJrd0fM5hhIbK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX1BKDBKml/LnX
 FPYh2oJMHCegTb+869TAH9fY8PBXLmeA0itUG3MM7Gv1WhLxnR/Kpof17tfRqTSkg3brZpN/Y92
 B3CvLlRjr1ZGlSvKewARrELsAFWETNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX6s96RDRVhKHA
 fM/CCQxCqqDBSVFOgJ4g4ohXxCKPfW2X9Vna7OqlzX++eOjClew8244WSNOw1ta7sIqB/MhmDHs
 3lQ6bEZRf9V5/RwGdUaqahLtePBEoWJIiLF1cIhxHSFD9dc8KzvX9WehgudyL1wo36A+nWvECiG
 +LNknVhdZBkjzvbM+GocAzsHvvhyEZgYNxXE/2x9OyaY+zunEurN4J50Mtq+Gsm7zcRxpV5VFU5
 Mr9qjnxXlp/SuYeFuTQx+SGeqcuPzBjU/zYKN5MS3i0BP+kgYZ3G6PyhhbCPZ2YITcIC+fGiL5h
 5HmyyfDkKb9pvpG3IZVQBlk2/2muwKcrHB2FZ2ipHu80nUQ1bqPSaRBztPQ+9g4za9rrbod3heY
 SGWr+OzSprzy7CQVCWHv99gAj86PHL9q7Tig9KnD7bOLp1zRyuHcJjDpR25gq76A2No7fnaaATN
 XWPUKnLGK67QUrlbB1A==
X-Proofpoint-ORIG-GUID: c7qdHKy35bVLJW2Sh9CPJrd0fM5hhIbK
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b056c9c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=RS--hHaVoNrYE_hnkMsA:9 a=vr4QvYf-bLy2KjpDp97w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240042

Add device tree bindings for TLMM pin controller found in Qualcomm
Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,seca-tlmm.yaml      | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
new file mode 100644
index 000000000000..be683e31332b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,seca-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Seca TLMM block
+
+maintainers:
+  - Yadu M G <yadu.mg@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Seca SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,seca-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 181
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-seca-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-seca-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-seca-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180)$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ gpio, aoss_cti, atest_char, atest_usb20, atest_usb21,
+                aud_intfc0_clk, aud_intfc0_data, aud_intfc0_ws, aud_intfc10_clk,
+                aud_intfc10_data, aud_intfc10_ws, aud_intfc1_clk,
+                aud_intfc1_data, aud_intfc1_ws, aud_intfc2_clk, aud_intfc2_data,
+                aud_intfc2_ws, aud_intfc3_clk, aud_intfc3_data, aud_intfc3_ws,
+                aud_intfc4_clk, aud_intfc4_data, aud_intfc4_ws, aud_intfc5_clk,
+                aud_intfc5_data, aud_intfc5_ws, aud_intfc6_clk, aud_intfc6_data,
+                aud_intfc6_ws, aud_intfc7_clk, aud_intfc7_data, aud_intfc7_ws,
+                aud_intfc8_clk, aud_intfc8_data, aud_intfc8_ws, aud_intfc9_clk,
+                aud_intfc9_data, aud_intfc9_ws, aud_mclk0_mira, aud_mclk0_mirb,
+                aud_mclk1_mira, aud_mclk1_mirb, aud_mclk2_mira, aud_mclk2_mirb,
+                aud_refclk0, aud_refclk1, bist_done, ccu_async_in, ccu_i2c_scl,
+                ccu_i2c_sda, ccu_timer, dbg_out, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi, dp_rx0,
+                dp_rx00, dp_rx01, dp_rx0_mute, edp0_hot, edp0_lcd, edp1_hot,
+                edp1_lcd, edp2_hot, edp2_lcd, emac0_mcg, emac0_mdc, emac0_mdio,
+                emac0_ptp, emac1_mcg, emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                mbist_pass, mdp0_vsync_out, mdp1_vsync_out, mdp_vsync_e,
+                mdp_vsync_p, mdp_vsync_s, pcie0_clk_req_n, pcie1_clk_req_n,
+                pcie2_clk_req_n, pcie3_clk_req_n, phase_flag, pll_bist_sync,
+                pll_clk_aux, prng_rosc0, prng_rosc1, pwrbrk_i_n, qdss, qdss_cti,
+                qspi, qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
+                qup0_se5, qup1_se0, qup1_se1, qup1_se2_01, qup1_se2_23,
+                qup1_se3_01, qup1_se3_23, qup1_se4, qup1_se5, qup1_se6,
+                qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4, qup2_se5,
+                qup2_se6, qup3_se0_mira, qup3_se0_mirb, sailss_ospi, sdc4,
+                sdc4_clk, sdc4_cmd, smb_alert, smb_alert_n, smb_clk, smb_dat,
+                tb_trig_sdc4, tmess_prng0, tmess_prng1, tsc_timer, tsense_clm,
+                tsense_pwm, usb0_hs, usb0_phy_ps, usb1_hs, usb1_phy_ps, usb2_hs,
+                usxgmii0_phy, usxgmii1_phy, vsense_trigger_mirnat, wcn_sw,
+                wcn_sw_ctrl ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,seca-tlmm";
+        reg = <0x0f100000 0xc0000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 181>;
+        wakeup-parent = <&pdc>;
+
+        qup_uart15_default: qup-uart15-default-state {
+            pins = "gpio147", "gpio148";
+            function = "qup2_se2";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...
-- 
2.43.0

