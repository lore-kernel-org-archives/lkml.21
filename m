Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511767;
	b=ZEtHnjCqGZFDreqxMKcc7KR+tLKbh/0I4nWyT4RUFB3prorgeBNp+BJw5hQdRYojxTCL
	 RJ1SFxx3gZ8xZGcNP44p1zy00IqV5RAtv4vN6t9KUMsiiIyRmWGtkyNJmUhZMCVPMdpix
	 L5Mu9Dkprznrcm2lG6RCSXZ2JISghhlN6dLLjxcK/9lhpfiF+x1+VlGp/z3QvbwrvC6HE
	 wgjN5fFOEaUz3TtsMP94qwKiUdXBkzsmx0IXRgikE8Keuh5Q3dnqjd+1rXS402LKHp2c5
	 uLD+e/KAxyhr2Dl1PDzGgx1Jff6V2D9hcOO2lXjID9U8ccwX4AxSfz898KfoS47egIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
	b=dpYd0ek4sXdRRFfwvrREN3nOKFz4tABkCugb6NjjGBo81/nZJpE/YvEn6Br3ZPO7mSAv
	 QdFpdiVeYw/vfTS37N9W5olOX7gcLzG1VgxehV4r26qQSXUhKSLX/6zuEEa0fcSOwgTOg
	 7Z+nQo0NMAKEuXtyEkQhaU1BpQWZCHPS29L52Q8XSMMDrL8XglgFGszUXrgVzFJZAb42+
	 p2evhGiCu+ovDZVPA80xtcmQRrMe9oMcvzJytODEZNJa20+ezGUohcsd3VsLSffVA+KX/
	 TUURPAt+tdBOqob1nSb/rmUzS/qNqZzKcur4ien5+IVtp6cClOK/QdDneCVjIu6XsOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avMgDcGh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQTH24cv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745C9606A682
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745C9606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avMgDcGh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQTH24cv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mPLD4136400
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=; b=avMgDcGhJ9DViWB/
	XYqjFQ4iMAdvCvFoLS4XALfaeIuIqZiJVA6htH31cHhOSzQDOM3JWE93AffBazRu
	zPeEC54i/pa2YX8e3F/1cBN1FQDrovs8ajOdcs6TCx7TqFNE8oifIhD9Y2oh9usy
	lD7uYOo+slnHnFT/zVNkHI0+rAQvejqO7UJKtCIPKNoJrCM/GkB2rSnW9d0o+Heq
	aU8SsGNwSxPjIODdZEaA6Bgf/O/sgrJq/gr8dpAUiimtIPXeSE+jn+TALFFPLw3i
	4j5LeHVdvQs2Fz5/XZCsUwf0TU26D3MYMCAdnLCZe+sX6F2exKWzQOFweA75Dy3E
	ivm65A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpguc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:16:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f05c68629cso26649635ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511764; x=1796116564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
        b=cQTH24cvlaQJ42AyKtFdW26cM7+biAu/e9mccS2UT1vFNsURM2/HNI8KqKMNCM5Byf
         OMOTrqrZ2wbM4MDgPZA3jMp2OzcmY1dL01m/50kCxQvySaB1Xk7ljSVKA9MBsMbwmi0M
         +CxNAPlVyKRqLdyD63egyPXSTidfvtxcQiDaXAfDxQNCIL5eLlZyttE5S1WMobJ1zchO
         fEr9naE2Eu1qCmlScmZXkfU6Zf5LdfvP9+e1XjBUHMv2fafQ1bkauKz/HFpHM0EgfWdM
         /obWuiVL4MPoVzsI59qjOzeoHCA5YRWwhPpKnxV3EsegZZreY+CJVypLFB2W2Hw+pJMz
         Q6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511764; x=1796116564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
        b=0bVmPz8kA9uaderpzofeg1pMWnVOP8+yshOxYEwmM/dGWmn/CxC6P4ekt9Kt+74NQ3
         oitmBpjkeiOKjVDxUwG5C8gI9NVCf1cGz6/eyE4h1PIMqMDXBu6UbaJtBQKab0SFhE/C
         wk6kst9gO8FIYhyWdbfdKKQobTxpD97LDSwBe82TV27kc38cDkyixb56+xMxzs/sLOsJ
         v905MdH67j62DEARdQvsgSQnnh3ewrxq3S7hnZhGbdbGiA52oGNXB5mQFpxJAFnkS0b7
         aSIwuYXpBFFI+4XiuOdr8qW1DFWs71vz8LaPlAkcqm4AhGi5lHA17o1mecA5WKKZ52CL
         T/kw==
X-Forwarded-Encrypted: i=1; AL+hErHJq6VWe3Ifh7C7c1GvCdZQvZeheO89Y3TtQqtEO1q6VAW6dtJDEhB2xjOOhxhpKKiRVwr3qFJimOzpolk=@vger.kernel.org
X-Gm-Message-State: APuU4Z878JW1fCRtFO3kb0BO9K1Cbi9fVGb5jQfbuoxMyMiWkDjCnY5c
	0JutxP+e0iryk5p1/nPCNMhO/skSE8xoI8yLYfmitpCrVz1Nhk3v+gFcd7GNvIonAy/NPBPWmGy
	scIozh+yfoeW0qQ/fgbaCw25z83s8XFa22J1lpNQ7i66lY0nKE4qGfKNdxB0Ui+TTbwI=
X-Gm-Gg: AZFdTZcADBlZgt7Tmv6/0c1eqweyCx97ik1tTqph1Iy/R2dNs57el+rccy2+z2SSJy1
	30ayGICZ3kgKKUjuaWs8BqJc9+RQ5wgW3lyD0OqVuLWUCQ1U5F0ySEg3tLv3liHu+PztIXcXo7v
	oXOBXM1/kL3wNtvZCPWxy+zFfIMCQwBE2QCn1EI4UlkC1jMj7dDI4Io4A+g5TuU6Yu34YArZDcQ
	t0cd1nN2/dAKxo8MmOXXiB1K1gNBRTL2WFd7g22TjkYkiE+4TVQbBG+kG+qc2nx6p4R8611Ratj
	vNbgWaiSdYI/xVetIwsbh0WBEXEaQuqk2NqF8Mzagu4Y6Fwv+MrwTWzus5BMvNUbft4wmNVXNPn
	JvOSr2qZqS1dRDzonkOYWxLm/CpHFeOGlnzLXVu1/gRvLICgB3fe0AOfbQUVadvmE7xcw8kB6fa
	E=
X-Received: by 2002:a17:903:2b0f:b0:2ef:d8e2:8274 with SMTP id d9443c01a7336-2f03f1ae083mr138080675ad.32.1795511764017;
        Tue, 24 Nov 2026 01:16:04 -0800 (PST)
X-Received: by 2002:a17:903:2b0f:b0:2ef:d8e2:8274 with SMTP id d9443c01a7336-2f03f1ae083mr138080385ad.32.1795511763547;
        Tue, 24 Nov 2026 01:16:03 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm66371825ad.54.2026.11.24.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:16:03 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:45:44 +0530
Subject: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
In-Reply-To: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795511753; l=4863;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=JWQ+3UkdjGpMYJ0rMN0scOdLIJkar3ei6FpbBL73/vQ=;
 b=YVgsQ2lUUxYOUccMpu9jCB/zFyf2ltdzmB57JUBFeVhSYc8RuVdjR2p+M57sVKEhcZmX0mqnR
 KwvKYb4ljPEBetYIX2lDymafrSvsHTcCJEehq0ythjJqRB1SReWiq5G
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX6xnxac5ETVkP
 JkSqtGEfLYWchchNn08MurRcXKouYebVednuUHPtwXauasR1FpzWEPneOQmsREacJGibXUYcg93
 6Y7lkQ00KkNnXSzbXhtl1o3J2qgofrmwve0Yc1z/vcFNupVdtKD04BBAgYk2tieMPEahTdPN+0Q
 2Dg7Nzl61xWSDQBTedrB09PGNnLCfSud6pLLV2AJ0lNlrs5xPgxU0dqrBC6qsqwynF0qJaVPAz6
 9FgJF670ro3OuPMBy8VcJMvibnSh06I+NvExN5qq44EhBQc8B9dS1b7p1XzbUxMxtZi7webU4Fy
 hZIPtyE4h5CvlmSqZe3Su2HhKcKSRn7g2oLgbac8hN9vRffpVrDCet9n8nLt7whNIKuNPUGBlqV
 MyukAj0yyymk4q78AqVsb724icYmEzGyN6nHx7Li6AQD7nKudVkuneOu3XbPN77axGuvIiuep17
 k9tME3vMf0VlIiG8GmQ==
X-Proofpoint-GUID: C83XLj-SIADrHvRmvMLlXYvsQeEgI_aw
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b0555d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=B20DgfED3MDX--t0QlkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX6kdbHFfnCvfz
 cmeK16IDL+0zYv99Y3fm4oR/YB1eOyGnjt46pIRhFT2rv3zUH3OTTyH5c09ugz1DzN+ootvqjL9
 E65XRj2qLUEHUijtSEBJ0RZsXXodeHo=
X-Proofpoint-ORIG-GUID: C83XLj-SIADrHvRmvMLlXYvsQeEgI_aw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240035

Add YAML devicetree binding for the Qualcomm SMBLite switch-mode
battery charger found on the PM4125 PMIC.

SMBLite is a reduced-feature charger IP sharing a common SPMI
interface with the SMB2 family (PMI8998, PM660) but using separate
SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks.

The binding covers:

  - compatible string: qcom,pm4125-charger
  - reg property for the CHGR peripheral base address
  - Four interrupts: usb-plugin, bat-ov, wdog-bark and
    usbin-icl-change
  - Two IIO channels: usbin_v (USB input voltage via ADC5_USB_IN_V_16)
    and usbin_i (USB input current via ADC5_USB_IN_I)
  - Optional JEITA soft and hard threshold configuration as raw
    16-bit ADC comparator values written to BATIF ADC comparator
    registers
  - Optional monitored-battery phandle for battery parameters such
    as float voltage and charge termination current

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../bindings/power/supply/qcom,pm4125-charger.yaml | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
new file mode 100644
index 000000000000..5651b428b0a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pm4125-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 SMBLite Switch-Mode Battery Charger
+
+maintainers:
+  - Raj Aryan <raj.aryan@oss.qualcomm.com>
+  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
+
+description: |
+  The Qualcomm SMBLite is a switch-mode battery charger IP found on
+  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
+  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
+  supports USB input current limiting, JEITA temperature protection,
+  battery overvoltage detection and a hardware watchdog.
+
+properties:
+  compatible:
+    const: qcom,pm4125-charger
+
+  reg:
+    maxItems: 1
+    description: Base address of the CHGR SPMI peripheral (e.g. 0x1000).
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    minItems: 1
+    maxItems: 2
+    description: |
+      IIO ADC channels used by the charger. usbin_v is the USB input
+      voltage channel (ADC5_USB_IN_V_16). usbin_i is the USB input
+      current channel (ADC5_USB_IN_I).
+
+  io-channel-names:
+    minItems: 1
+    items:
+      - const: usbin_v
+      - const: usbin_i
+
+  monitored-battery: true
+
+  qcom,jeita-soft-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: |
+      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
+
+  qcom,jeita-hard-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: |
+      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: power-supply.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+    pm4125_charger: charger@1000 {
+        compatible = "qcom,pm4125-charger";
+        reg = <0x1000>;
+
+        interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+                     <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+                     <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+                     <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-plugin",
+                          "bat-ov",
+                          "wdog-bark",
+                          "usbin-icl-change";
+
+        io-channels = <&pm4125_vadc ADC5_USB_IN_V_16>,
+                      <&pm4125_vadc ADC5_USB_IN_I>;
+        io-channel-names = "usbin_v", "usbin_i";
+
+        qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+        qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT  */
+    };

-- 
2.34.1

