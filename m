Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789686;
	b=2JDdWtKyLJn65qYBIQB8gn4pxkaah5XzV2uUuy7du3aebe4iodhh9/YibK3VKoQC1Hbz
	 sRS8iv5PMa+liUcIIYnzxP5QXPxZKjQHed6n0vuogwVab3IMfPOxFw13b8GfPjx80120n
	 ZXW3M5hpwCMqF+gAIxMoxLtffaLQ/ES0tyf/YCusuLL3bdfbRJCOimSZ4I+WyqSLERJbX
	 pGdebl1tPUE4e0TSSWsyzL+esLgSpPthFHhvg3FdIQ2eoi1o446xBGHKrbW/BtDnYgTe2
	 /TorXDx+z8YmLJuU7RqDql7RlCsoqeYGBd3udEZgnVy05OQT/6ytOs8aA0qM0bw47Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789686;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=;
	b=NXukpJzEhjJlQt3n4kxz+eZRAXzbUSPNy5ZKJSn629Otdj7+JnVz6lXJHJtFzDDmtqZ4
	 x6Gw69qA/Jif7sdtSxAMPGal3iruerR6LasdS3M118FNSzyOriaNd5Vr/RCafzFGr76R+
	 fXBZ8GzPODHEPZlSGMt2lqxMbfLokzv5zIArXlec1GrRq2zrg+vue722KyugNGMbQAY//
	 +1HNZj0CHK7ny9TH/QpJhmuOW5Tza8FBYw1UOgzBptXbhdQevhSWDiYnKQlsxttgPudVA
	 iXPCxdcsnxgwKm/nUCA2opGB0/DQM5NMDS2y3e7hqTVGVkYr29H86cmxO968yyWQW8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g141Idba;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V39DZNvi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12873606A6BD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12873606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g141Idba;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V39DZNvi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Ofb2471847
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=; b=g141Idbal/nOlXmq
	fPRFmVNGttuZC/wPSV9DDG/VfBRxXOEgJ/QZsrhGaR+aF7Tg26Tdco3Et6cjzRPl
	BPQXU9SjM4uNy+DFT7Emps34iu+8UEJG5FOx8Mhrl5kQpkWfiY8e8piSLzyKkDBo
	fj7WT0xXEx+IDaD54wnAXtFpfeuiQ8HekC5hRp1F6yURkCKoEy8zBp3+8fbE/MqT
	FPmn3NvCOq+OOFL3Oo2+B1X/U21xTT0Vm6Q7OjKfQjR8z9cO6JvHTMmwedpg8E1M
	uwT1rAaJqkZqEPMGhwIZk3MQBacd9fs6P1ayXO6pFpRV9SxpYA/TXXwJvos718tZ
	fj/Pgg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasuad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efa9aea3c0so106600695ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789684; x=1796394484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=;
        b=V39DZNviMFzYwWksTFCKkUe/sRg45xCdHmSeooiYHDLduOuiNw/nYKcjJfoudthKhC
         EtTKL5AGZBpbOWpXCDnFcfalFz2y6B/IXaOV5AmJZR/8V578bGWOQNwqc4Twzj5sZMYx
         W7kZ29sl1Lt1qdeWiYDmu7Gecm3cvY+1+7vfwYG2HAeawEc3dF9+d+MdHmo0FwAtMaqz
         AdNI1zz3G7EUbjcivdliF5bpJkZPKkeN6Xlyp0a34Aw3nMlIFGHU00YL6ghIeTjbVXfT
         J7yRGnKznSuJHpIcqIafaLv7ubPHbVZD2fQ32VFMSc8AAo8JhLvAi83H5n2wm1gWbSck
         MwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789684; x=1796394484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=;
        b=arWL7k1OM+hau7Gh9Wa67XsHSp0NXiUbipUlciFpYe89ElXdnH6g2gMuQTGGInuoka
         DvZlwGMkXm1Q5OKnu9+BZMQhOZuWMSEk9PyUKh0ZO3lmS1qIzhq7Foh7IHaXp2oYkrQM
         uPNpGqoKaE3yW3MaebKLY2fJbYzmgwdO2HmFchKvcK1G7N60UVngMSaYLMspHDfB6nty
         TN5D0xBUTnx2kJF9ApV799nBG3qj0Doo91tUWZBKOUl+Bg2Jc6y7xkR57qpjGLvfND1x
         ESMkdN/EYwqTxaDg1y9ty030iAfU7ob/LUNJIoD3+TZQOo7j6dDWTEh8R/vF53fj4TXm
         V0qQ==
X-Forwarded-Encrypted: i=1; AL+hErEbLbuytZtrrqHqJ/CBh4NWNe8qjxfjgv8Yoz6Eer2+HJbXR38QnAC/oT6W8+hzzQ5pJq8vKQTuQx3nYFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z80w4p3B0P4uGpj1bgCYFQXYARX4obrFGLfV3pOWVoBvCbC1ONp
	V5PKt+OjbSOSqwo7S1C0+UCvb++g657cWB4FHZXkQK2LvN7Es234EZc1KbT0YSyq74MT5CgXlqK
	6Cuv95a7tPwTMS3Ti75ZEUVfTzItC9fC4oeaLCHqb1HDbo2cuuV1YTn73fI/cNYBG8X0=
X-Gm-Gg: AZFdTZeHwb6nxxdSGhgbiTPYq1fcMSc7koHBohBL9q/Pkf5/ZypX/aEC6qG4QQyRD5L
	LR1mRMrhBpPJ+/9KEzFT7DcKC7sK/rGKhJc5gaHMyfv2eiEkc2LqvsrzvyzT3ymQXRWEakSZQ7X
	r95PArwSAGFUrJNfJ6vxAyjP7pQIJbaxqjt/RosDIn3DrGUU3k2XYYs1tOlbV2boMWkpp8sXUpg
	/pS11PpQrWvc391ZRPvksBu8zNKOcaqnflp3NxOuMifqsGhaLmI0gtBqVdpiKwtDW4TsKAEIzn8
	b6fYb06KXX3sWeSWb75fFO/jPv9/3HirJiFIrUgHAR5a9JpYE/Q09BHIF90bG+X32qbpu/Mx4U/
	AN9R9/sYxnuO5g+wVluOLoqO3+tlv3ou0R6INUKJAEQXZ6FI+NtttG1WdcXaOkwlUV8NlPuY8yd
	Z9L94+qLsNmw==
X-Received: by 2002:a17:902:e802:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2f03f0fcd9bmr288955335ad.12.1795789683694;
        Fri, 27 Nov 2026 06:28:03 -0800 (PST)
X-Received: by 2002:a17:902:e802:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2f03f0fcd9bmr288954955ad.12.1795789683224;
        Fri, 27 Nov 2026 06:28:03 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:02 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:58 +0530
Subject: [PATCH v28 05/10] dt-bindings: arm: Document reboot mode magic
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-5-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=3254;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fjrWd62tIrrsaXuNLgObFiqAcnuoh4Dw2HgLoYsQCzs=;
 b=cb74VuhVYBbjR6BWR1df34l5zUvgiu6ifNRzc0PSu+o4HLsQqBUxU8FruxVk698KLEKVzknY7
 GUmuuhKi9MCB2sh5AaQ4GsySw0wjAZ4Hdd69ZQkLoYoUOkqecHBzoBL
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: 3NC9N_BC3QpZJR8jIpMfVRrPxQdzDhlf
X-Proofpoint-GUID: 3NC9N_BC3QpZJR8jIpMfVRrPxQdzDhlf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX1NMPDuJYhBB0
 B25vnqoyFbbcuOESkHRuw96hDCw4SKr/f/ZEf/jEGnDeaVsdN74rp5VKO3w5p0C4EuCB8590B9D
 7oGJ0qbxSwjLVEc97Uw7fBVdxVNRVNP+sxlclEXjWXH+RlNgF4l3iQmwDdCB2UnslEsqU2nCKxI
 Xg+6MU/fMCopi3T/mJr+4Gy4/evmXR/7feqi+Z0r1QeZXhtDOImBg7FXtBxVGaVHTGk/dlyciT7
 3zXN1ueXpJZpwzjFgQZqnb1HyJHvUBth89um4Ze9oFIMCRDEeL7Ktz/rTeB1v/e1JHwTYFaoSfO
 cup424rIAS3pqJqRhyclbhG034ktHoCpVCeJm9FuQhbhmYm11Z8N0ypi/n5yKAOMqSI0XSo+s82
 8Qn+SR0H49MeJjiqPGy3Bb/WpHgqVkm7L19BRwODf88oZpUSNRYipFdnFfndFSQye9RIdYq4ZdI
 toqJ+DGGq1F81pc2y3w==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b099374 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=nNck_ww7Xo9pDmBGQDoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX7Rpvb8NiUfhH
 nDQag2mn6Mw2rPclSvWuSABEErozTFZjsWBByGDAAnmdTJzEkKCFr5v4MS9VPY1cKVvoWLK+ujy
 FLrIEG6k/X+e4ElBsH+mjbQYTGxMAB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81faa..82ae25e7a3386 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +170,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +302,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

