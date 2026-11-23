Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467315;
	b=4N4kxUd2FqKrTamqXFjYoiRWqZuOrFLWsWRNI3kvU4fPcSTSsSx1mdCwKqjV+2P56KEJ
	 8cR02wH6cAuhiEiAXCSk4aoWvIXnudVOsyD+1S1WvHH66WRJ1igFrKIAHBC3sBrJ4p7TW
	 FQEhYrYHv3RTeThrQAgNCWe7g9nXy48JXcfTXrHfshCRTOqyB+sGj4uWrtfET+sgOum3h
	 GhRPr+dkcfolo1yKmReGE2DpQ3xAWGbLu7nFmCx+RwVIjP862nLbY95Mse2V5u8gzw5UL
	 Y402gjVnFlGe/kuMPF4ZGaRCHnfF8UZGS6uSVSauh2tyhuujw+sQmCpcZPEq+z/ouFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
	b=aii0wyIdRGlkksZuo6bAElzhLXjPsVUyg3Ac4E+MM/Kygv57riBpi5V7Oh4x++SVs4iK
	 aKORO67M2/xgGtWtQLApYt4KqBKE8kbpPAgdClSZcEsbjWQCiIXJmjXifxYLEKvbZj5G0
	 D/ZjPZke8i7nNIlDzCiTPftMBhxj1dyETcPkFBNZoQfXJ3vPQbBgh1KxzwuaCRd76H3/W
	 jVM9ECPfjb5wD+M0QySIq6qbnMuuEbtnu2UbXvbs/YPO1Wp37E5K9BUlYhYoOW1+k43o/
	 SRa/Qj3bzzUEHrlEfEcXXtsp8PdvzJIgdL6U0+EGeLZvD/vqGYOXG2yUmDjkjF9aWBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hr9Of4zj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13FC606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hr9Of4zj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJutTq2862781
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=; b=QXiNt9oMEj0pLkFN
	L0LOpDZDLGuObJIIrJ81O2FypGASQAIhqE81QVk8MT4wMNfn1PxLkL2Ag45cxaww
	tTTA3gNkYE5icDZJELAyeK+pzfjnqVr1E3OoCcv2oj3drHg4vCKGSitTWenLP5qK
	eL+6yUKW5pMwr7kpL5IY7fXPDf8LXw0B2vqnTLi4guQ+XzDncp7kW40xq4lNrm4+
	UwM5Zqji16ndZS7cg1BJqwPZXPHUK64mnz9bpYLaDRGYJBY2mEuCCrCm7fXIW1Ou
	DzH8Qj39TtoWGvEMY1KXz+0BKGKXUtOdybtW+64XoWgVe+etecormu5eYCZoeuVd
	UW9DsA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7utd3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so2354429eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467312; x=1796072112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=Hr9Of4zj6hwzbOyeC3D3Ej4l+Xj419Obf9WP4PMkArdguHwS0i745R7N6SFXmRJwGK
         /dPWxYu3SeYExpTQll0kXqMGMuvS1AJAcGIEDYZhzCi3koq7m6SVPmXNkS0czZk4hBuT
         yDSZ3QGeB//OoxAcUrMoeNLqDSqq9US6ejZ3tlLPGjULSCCXBd614a7sjW02MhkJEzMA
         z44YbEw19aYunlVxuGbraAxYbs/128+CqgHcll4fixzFS5ZTC/8waGEzXWPXkiLEyDEv
         KkxzI/c6cgrmsEK/hLEC3iB8Ou/1ziJnOkpOVq2YtVTv/FtzkV9NUKnhXqI00Ud8mEr+
         Rd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467312; x=1796072112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=u2xMecBKRZBoPLKWZ1aioeaITDqHimMaQf50OZNSXEpVBJhVPhWFGHdbVaoUtQ27v1
         XApqO22K2YLCw9p0DF6ms7MpiYBkyQDoxmo0MSIbWgUE9O88f+hLehJtYjo0Ecr5SjGO
         oD8RXsb5tgZmtwafWWrce8A5su73sed5s+n7Cc5aXWEMlt3iraPAY16yLhppfm0zXOtz
         L8pY9nCFWIQ4rN/Q7Iwq6n7u7jZALMPJOynVC6httWjvhJm2OLhCQHCtMb4pzspGm6B4
         mGGlBP40qBAYGipq4qC9zvehppHMLOlna1tVYXzIfGMyrNGymufPllYX3JNgvVWXg29N
         lHQg==
X-Forwarded-Encrypted: i=1; AL+hErEes0iM4s0tAf/Q5eJxShDUYZmUrBXXuCPJRzatPhqmfUiT6vcCZZ74/JSPbmreKAgLdvP2Lt63zLUDUys=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6UDcLaI94vUKe2wkZ1qUfFBjZHPsOr8UVVM8FtV6mTrty5Nbz
	e6xJfOI4QgDIit0HbvBbscGkJmcSbw+z/shsv/uH6mXEir0N4fqg1I6K1OUZUfEyevLRNBLuj7O
	U4dwrDCzY1dmM716XSKgdjWfwt5oWrTBYWW18x5qY7NNjNj9/6B5ubvZ61WXdcIsTsV4=
X-Gm-Gg: AZFdTZfeQWHcjcAFVFNn+H5oEjBnLYGEW06sIcej4vEbxEnvI6ATtk+1uGAzTKaixQK
	2QUnwn4SFs5qeXPjeqc696IzAkWYnpKkt5ZtXhM3KDvny1JWgUwbqWxbh1PJmbVpD37ZBqLTqNC
	0ut1aQr2e704rfZdcEtxBg+FyKccu1SC856myMPiJukFiT+DWBHYKvp8qIzIKX/JxKxe7S2Hjs2
	WO9npLt33eCX7Uu5BjlY0QktjagEaAMIs/2dISKYqiTHJFhQP1qwt5gEqknB6cVqXamMzYCj4Xf
	xCRN7cKwdKKDXaPAOv+QITiCsx+3iGcudbVBCum50RhOXl+jnqwtrw7ksr4YoovNo5bnDcumRBa
	pFqoi1X+9At95+KsUdwlXQvnUkSsnjp8b2MF8npe7CoEEQMqBrim1rSZT2vrQbzhS+KDiVuhp9n
	XgLbYqz7C6
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280346eec.13.1795467312457;
        Mon, 23 Nov 2026 12:55:12 -0800 (PST)
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280297eec.13.1795467311875;
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:41 +0530
Subject: [PATCH v5 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-1-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=4396;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Gu1GpC+38HITi2Er9kUG2koMItBv0WwtKRBZ8DxvpQ4=;
 b=Spbejpz/DzxBNIumdqXhcY1cns0HOwt8l9EmATBgk7HpDuClz1ZxfP6Z0Wp2ogKQtV1Mpm8qu
 bWYnfeY2/GYANhoiYy9eR9GYJ4/X6rJA8hCPhbhF11cKueaKOJapzMA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: _mExb1JTNVCtrjmK5A4dfQKl0paO7kU9
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04a831 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: _mExb1JTNVCtrjmK5A4dfQKl0paO7kU9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXww0A3KAWs0vI
 zW7R+M/gNALHwcslU4OmOJ26rgSxbjK+Z0MpzYWcUolZqRZWA4CDBmNCy5BqqMOv2irGVMtLjRe
 izdzjXbfkmuxJarTX9hKWnyjSEPUclU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXwii03grSgsGY
 O1/evU1Ia2dQIbyLamI+pL7uZYwntpovBbZCrmCrEeg0CAEhehss/jo4cuk5u65YHRIhxXlUckj
 xiXZtxF9ssBC8p3q4cNNQCTqsKbuXE5E/II/eBzGK8L1yMgY6i3dkOocJeUClaRb9MM5lXi396c
 8hmn2wEKMVlYgAzdMABnOLtAjK0IH9sYFj8JRearxvl6KObxrav93IKEmRCGRpvj8gcNO8/SpeB
 QD3oPn6KkSXszoDTlNIDUBwA+lXLad+CfSIKqZerspdxgb+C4VwCK219n57RH6NBdWI9ugEU/9f
 3H1+aimgYbMY43cfjOLDtkDRCcSLZoCAkz/1UtQ8ma53yxvkJf/gZ4oBOu8xd5/J0cd9lVWlEi9
 oqF9w7jiJ4Ov7EkJbtnWKeGpmbtOA0ViHdkuMXYncZWcfQI/CKmNl/IWXlDINwInBpaHRI/mgrG
 59NpTvQTuPHlFlrhOoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 72 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..2bbeb35f207a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,pm7250b-bcl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,pm7250b-bcl
+          - qcom,pm7550ba-bcl
+          - qcom,pm8350c-bcl
+          - qcom,pm8550-bcl
+          - qcom,pmh0101-bcl
+          - qcom,pmih0108-bcl
+          - qcom,smb2360-bcl
+          - qcom,smb2370-bcl
+      - items:
+          - const: qcom,pm7550-bcl
+          - const: qcom,pm8550-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
+      - const: emergency
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@1d00 {
+            compatible = "qcom,pm7250b-bcl";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical",
+                              "emergency";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7a889d888383..2c3b60437982 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -197,6 +197,10 @@ patternProperties:
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
 
+  "^sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/hwmon/qcom,pm7250b-bcl.yaml#
+
   "^temp-alarm@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cd098f0d91f..36a470c859a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23080,6 +23080,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0

