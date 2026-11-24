Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510398;
	b=sgKRnbFZPNsBBdbluiXdmug16Ff60sD410IREot49ctRb33cVy9NZvQuCkTmrWPgqWOC
	 BwAG7xSnOT2IwtHEpeQCDRcX1zXb9EMwnz0VfvUL1dVqF/DplxQqKlxoPYf4jtrL4WTSD
	 0UE8U4BqsMxmS3QB1sFojl3Wk2mqEFDe1ilIAF2sTTnT3W02ZfnJDZwuhxc63DDQHMsIT
	 +B8t06fJxxVv746cZ1ZkhChV2gF+ccuRV5l641qH3jq32cjvPRRsk1fItjDNKBVFm+Xzp
	 PSSU34lY6Ah+4ACuvGDf3MaHASU9cN0iTI+R1Aex0iZhibD8TfBK7JQKY61MBU/nUow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=;
	b=5RzKuSCp3UINBf7MigVJnCobLLnZr+aV2ZjXme0pdgnaBceXsXnBy0iiREn5da8Hbu6+
	 kZBmVs4VH8JhsQKaGySR1Kz8MiwGObYVzszGBtHkLusk0ur+lUGfV0rIs+HFgIz75IfV4
	 1+m+czK4wjvIMl/VDWMFl1duvD5pSAsWa976GBbWR6wZzu2rQZMT7Vc95vCc68i5TtaY/
	 4zgH5e85cpHpXj2y495U99pEdVLRRxRFBAuEynu75L+BmPW45fZzE4po0LJh5PKuBwdBI
	 cCiYJ3fjKJIHl5UNiJ0+eaDKf9N4HCSUsd1c0NITbm61DLnIY6iz0vtQxiPZUKEUvag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XX0BvHHe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQ6Cluw2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F89606A685
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F89606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XX0BvHHe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQ6Cluw2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8f5G32209207
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=; b=XX0BvHHeq8wlMcSb
	CGve3uTO/o0iAKj522oUm4L9g9yf3yQAxxpqHsQlXIUO9TKRKNGZ4ij5z2VmcZFU
	nkwgktBCxaYHYXsxq84+2px7LyRLu0b3Lmgx5g6BHfain63pT6QdG4Zoy/jrbFBR
	gjoQjDvrXtk+gI1lnZJGGtxrrfWpkwwX0VzD0T8dGWvSG5hJQaMf1fh7/U9MJG88
	JX0VvsIgUqvIMQAQdPC+BItOfheNUvGS2Ab0GMO6puQh4NHNZDOmUtUmnFf/TdNx
	Q3UUdxPnJilYDOhywhbNsOAEOLIKp3sBW9lJetmzesYDCL8bR9cdbzzlmpR8IfFj
	zpNnhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy11rw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5312821eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510396; x=1796115196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=;
        b=EQ6Cluw22IKM2/HrC0Yr4/28JVEzqrJHj4gLv+6OfQR+iwHBBv1VKNinoIlpMQ+qsG
         OK0bgCblIwIk8Zp0m7bc8sAoUE0OWP9yNXCnVe7LNjq6lECU8l0KPUx4ZAqdX6KvUwDD
         PVomME/oNd1r3JVP6XXz1RolxGxzKwWQwMLw72LH0xYuOO2LzmDqJiJCnB4ZEt7NGL5a
         VPZ+g1TvzX1y+U5xVi1kaGmNuTJe4a92oXVlWUFV+UJ6/RBS5awpTsvbIFHdrUoxQ0jf
         Z+3wrZte4SQTsdJwluWscA5vwKdvd814a2C14HUYq5cKG4T0R1Dk+aJU0sNgfjxy68wU
         PI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510396; x=1796115196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=;
        b=V2pCkzmQefXUQdTsn44pMZxjnEkjcYU73F3T/Z+wVTWmqpkUTwkCp4A/lDmiYsqH23
         FXR+2vu83/ZZnmTBNEoCcNzUfNOVBqwAngqlKCQjJ1jbMB9+nKWXoCTgZBvSktbae6Zm
         HTyj+6/x3XtfP2BU5H2QdaRiSm1AoLvJjgcckCGn3Ccv6lDagiZ+Uad26CDlTG9eWtDu
         /CR7dKUgpWFSGm4eD/ktjgPsZJIASq+IbMoVJ9GkdF1TEYY12aqKyOvbKHiYN31i/cwR
         Wqw1gPPTWj+Tdh/o/tvassasVzfsA4BpGOFsGJ/sHTr2JORhgfS7446vCet470ghzpn4
         VXrw==
X-Forwarded-Encrypted: i=1; AL+hErHyy7oYecJY6RQE7pQhX2zGS4n1nqDnzA+chXuRm26dGMKA0BtBh0kk+WqF4PxVyc8TkPbKqVM1GXV/E+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l9v9CW3xPJoTJrltmalYKl0j1YgHSWzs1QU6kRn5a/uw9DRfw
	0NNcxjYfV5f6TqA9pSfSbXbE5JVHiMu4aeuin21aP02nJpcodkSk30nHqYVvNZjZaMQCYYKdOd5
	lYuwIoicoc8Gmzvs985F1YvzjkXQdsywTpTkK4Pe1c0vfy6wwE2s/sKoNvjY0neOjBMA=
X-Gm-Gg: AZFdTZdOvmMeaflxHolPCIrpJLI8IrK2ibBSJPYiS/LSi0vBBV+NBPnubemWrMsTAvN
	1qWoHJ4hVnO1lwE5rfrnMwW4Bchc/2Q6dX0uhQNTj3rlK7YltRAHbMA/WW5Wtzj0C9CS+eBjnbX
	6+GLTvPAPR7MMj4pynnXCw2YPhCcYot3FDi0k5mLi7p3SMivbZ8wU2+eVxNqe71QhzLhuF5yYeM
	5MJllnC+N2cZSgv/DXVBR1UFJVrLb46w1wUklRC4ZpI29qzoiygMoPu3nfirg6BdCfJAB/BwtWF
	brnOkrMvPmlV3aV33xPZfEXQEfXMlCOgDYCUDSazpbK0ln8obIWRKOuYXYDxChlaFLPyhJaWKpz
	tHaeUB85TH48daANLR5hZwschOxs4u2vG8sW4XMclVAaHw8i/aXQ7eKXQcjCn+BUd7KB2dm5i9z
	GTjg==
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr13844763c88.15.1795510395902;
        Tue, 24 Nov 2026 00:53:15 -0800 (PST)
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr13844739c88.15.1795510395382;
        Tue, 24 Nov 2026 00:53:15 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:15 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:05 +0530
Subject: [PATCH v3 1/4] dt-bindings: usb: cypress,cypd4226: Add
 cypd6129/cypd6229 support
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-1-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: b1Vh9VwnUYA_YH81otyGJlaBCRSaqjMA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXy4BOU0Y7+8U9
 ZG+gAfRiwYN5wXnKzKJJ0EPID0Jzun1gonLbo+QuSmiXwP0gmkG8gUWexkeErHX3nXGnwNkkueZ
 8fNvRWnxvyzCw6rBJmtc0202H/vwPGE=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05507d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=Ikd4Dj_1AAAA:8
 a=XHc7JM4WsavI0pzJt2IA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX9Wh9HjmBHYoS
 89az6L5Yg6DeYO2dkKve7YRIEdelAwL6Slwt5c0GEoLKZAfW9NJ7ipZgsJNYwBLkMJEYHtYXElm
 kliZJtM60yrXMtTd7psvm5hYc4D5ig/MjWxyntL08aiVBZkmjRK0omW5aGUJBRllIPe9SW+KZN0
 hpjOKz4tt7VwAUEPwYj/QpSd2AU3EQ5hJks21banaaQ3Ni+wVa+/jlD4yxRebJQ+m5/Z8t+EoA7
 kDdnWgmxjouC32sGz7Vu7C0354PEoLwDbDQbAG1wJJ1nsZb/QWGR+kueNZx4hBVUk8N1NCYEPWA
 kuEKuwMUMelmHE7hr9aN4krJlFgK9Gfm4X60WMsdXM/swBmsr3iCewrSg6GPk+hkwBWDuCfGOEP
 95juxeVPyE62G1Qd0QQauqx4mbG4KXSCW81sAEi4X383Uj+rxhD5Jm7rGySnuQp3X4YqIp+O7Hx
 obgK37888vi0R6YqKHg==
X-Proofpoint-GUID: b1Vh9VwnUYA_YH81otyGJlaBCRSaqjMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

From: Akash Kumar <akakum@qti.qualcomm.com>

Extend the binding to cover the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers, which share the same I2C-controlled interface
as the cypd4226. Also add pinctrl and wakeup-source properties, and
relax reg/interrupts constraints that only applied to cypd4226.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 90 ++++++++++++++++++++--
 1 file changed, 83 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index 0620d82508c1..d923ef82ecfa 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -4,18 +4,25 @@
 $id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Cypress cypd4226 Type-C Controller
+title: Cypress cypd4226/cypd6129/cypd6229 Type-C Controller
 
 maintainers:
   - Wayne Chang <waynec@nvidia.com>
+  - Akash Kumar <akash.kumar@oss.qualcomm.com>
 
 description:
-  The Cypress cypd4226 is a dual Type-C controller that is controlled
-  via an I2C interface.
+  The Cypress cypd4226 is a dual Type-C controller, and the cypd6129 and
+  cypd6229 are dual Type-C PD controllers. All are controlled via an I2C
+  interface.
 
 properties:
   compatible:
-    const: cypress,cypd4226
+    oneOf:
+      - const: cypress,cypd4226
+      - const: cypress,cypd6129
+      - items:
+          - const: cypress,cypd6229
+          - const: cypress,cypd6129
 
   '#address-cells':
     const: 1
@@ -24,11 +31,10 @@ properties:
     const: 0
 
   reg:
-    const: 0x08
+    maxItems: 1
 
   interrupts:
-    items:
-      - description: cypd4226 host interrupt
+    maxItems: 1
 
   firmware-name:
     enum:
@@ -40,6 +46,19 @@ properties:
       - "nvidia,gpu" for the NVIDIA RTX product series
       - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
 
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+  wakeup-source:
+    description: enable IRQ remote wakeup, see power/wakeup-source.txt
+    type: boolean
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -57,6 +76,24 @@ anyOf:
   - required:
       - connector@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cypress,cypd4226
+    then:
+      properties:
+        reg:
+          const: 0x08
+        pinctrl-0: false
+        pinctrl-1: false
+        pinctrl-names: false
+        wakeup-source: false
+    else:
+      properties:
+        firmware-name: false
+
 additionalProperties: false
 
 examples:
@@ -91,3 +128,42 @@ examples:
         };
       };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@40 {
+            compatible = "cypress,cypd6129";
+            reg = <0x40>;
+            interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-0 = <&usb0_intr_state>;
+            pinctrl-names = "default";
+            wakeup-source;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C";
+                data-role = "dual";
+                power-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_role_switch0>;
+                        };
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

