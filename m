Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081671;
	b=iFSBXaQUAKTwJjkDN2hnCrBhKTCXBexnaiQUZGD2Sw+yNiumQO6m80HuP4uYKNilS3c1
	 CuldXOP6tYHkrtRlrr5WmILvpS6VB/fcLfNGY9iR5AfWxjoUHPBzzu4AGseHUKYygZQX0
	 mRJFNgzkdnaAxGc9gswfGKVOhwNBGhPSLEzncYSaRGajf3fOU1kO2BaBY+3YFX+rRnZ6e
	 ImcK3JH9vhQgmbr8DbY5nOHVTTdHU24svokSRPGO6ulIvoRsmCe/SQkNMN3XmCvzMT+ii
	 2fe7JZ+KPkG5hAiEqjeRMZyKWBeI9OY9R8T/YmaxY1vSJIUn/jLz9U8spk36WrMGL9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YDKM0GnslWm0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=;
	b=YHt8u5zJaIq2zMq2CJM8tgrkqDZAoy7QtVgloUqzbEk8rCefho0ZH7GNiEQ1CydhwuJl
	 gAwwlxWSKvVkubKYWTzPHByJqXzVuLh6RDG4ly2IOa0QQ4lgCH+hdBleK6LxiRLiBiJs4
	 TN25oNKteQ1561HuqnVR16oAuoy9PcHwIoUMv7LxuGH6GC1dyuNSgr9ANfHN/BZkBqo8q
	 wRbkPaNEXxIkLlsZ9v57m6Dfi2chkXcvNPRdGK3I/sz4pEQ6rcgVQb5HgBoV8jqCOpbfe
	 UkTn3lIyhxgAFHrE6caoV1thn8vrYrhvMdxhVE1BQZYE4UmmFtNiXoGUe+dOH+sNicw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3PmX1VL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzkQW+xt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B160A382F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 573B160A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3PmX1VL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzkQW+xt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vItx2935692
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YDKM0GnslWm
	0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=; b=O3PmX1VLnG968TtC1UlacMdd5Ag
	pC639/lanCDVFCRDPi5IxEe196AXpb5p9LbHGaTd1C7PAFXv7STeKPw2jAL3LMYE
	gxITqjGqC+gzlXc8i/MvTAmCsMcyLJ8HLRriGIk/M/+7dtcVcdjhzjkvyDZWmtJO
	oyMScC0eXhwBGSCm4g8L7pfyzzVbo1KXtWGfvR++ORuRvQtnXwchZHPeI+kFhMBL
	J6n1HvfSzCDIDuDEzkqQ9XRWgf2QFTQuq1f+Ujl3VFHEp86LKspiInDANeFe8jkH
	dOgIqFBjoPNFpnFjA0YrA1mAHj3axF6iyB6aSBeyPN9yYMzmQqNBB89Yscw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekrr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so312396385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081670; x=1795686470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDKM0GnslWm0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=;
        b=GzkQW+xtAOEfGG+0fgBHuXuQAzq+PerVCAKsP3QHgYI10KX10HtzuwDPCMI/SVz3oo
         84eVu226Y4z05G4MZqzN+rTdWd3VIGugCzfLlfTkUSr76m2Z5Zf5SGRS027b+IUZTMeL
         NfS0QdduZt8SRd6m2fwIN3dE2MsGs2+je8Y+AUOZ5DFl9cBs0IMkp4xybAX/ypwoy6ZJ
         +xIW4PvbHZSgzxSMDoCOXc6UESsQCYKXmZPist4Gbz7AuJIyZJf/jR6TVZ2aWNXnj6bT
         GGM/CO29sRUlRKGewcGPA+iZfN0tHW5Z8jwm8GETZVUTJALszIXsbNUxyf5Atg6tacL9
         T/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081670; x=1795686470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDKM0GnslWm0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=;
        b=nPOKubokoruSWnHaJ6T+V1usnedYPcxMABzjPI+Rr3oZlLSUE9iHkinJDRxldyLMBU
         L/L/bcismBofEOTAeAveDIqcM16su1HCXXDqPmfbdD/P4NxYD/241dVRjLxuXkkgTbBY
         YP1Y4R2YGpbwSNhHSb2asOBHaMrofmXWl+zOM8bKTT0YeUnt6tIVaOcntu9ACTZ7wYGX
         cfbc2gGfP0lPXZ98g+k+3kyCnaK8/BP1/L0SYGybFZzhLqwATsoI4/ERATh6RpNiykHQ
         azD1fRJQ0a9PNSrwHGlAC2pXCJnwx+st/cNTaqtR7VRzBIWRTysXSi0+kDb3qx7n0qAV
         fRUQ==
X-Forwarded-Encrypted: i=1; AL+hErHtMDgJs9Klxa2+/gfRz753W7hBvTr2mXNas9OXy8Gje5YYYxRw3s20De39e337E2y5fiJxjMeZx6OHxCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Y8eLG51J69X8F5BlpjwPwk4VCm+J1E3IeBs9Xh32ZAyWBSnM
	vIjK1KA0Djgs4GAI38HP96ssMiU11kFZv2O1z1xt2lvGE2YOz2qlrI/d8DYPytidAhGpuF3XYs7
	3jVVkAE+uvUzitGkwnwOJHC/lveRAFRy5xYvFhgpe8g88hYOB/pdZ0VEgTG6JNbSCkRo=
X-Gm-Gg: AYBFou00R8zYKl1+Hqq0XwiDS1eevCMepMD8LFFy1nnEYI9eDBBGkVrhdq37iT6wvNx
	K385qKCYmomWJMdAPuOweEByC97ebp0LJmBhc3PGhHtquhMIbb3rJESfwxAJTeqydTUCs4rdPAo
	FysYuDNCFkl2lDec3GLqhz+wmHA9oSxJsfO8cTbSMre46mwhkf5Qz3RgxOtf8/TmiGvn7OJ5dUO
	YCa6Q6HFHlzHVWdT1nNi3fHUyUWoT1DgLxZrjTx/QpfPVefSmRPCLNzlbTA2LRGQCPFjQ25D1df
	CFLl6GaDGdXBVHw5QNzwD9NgOofiPIdbk+l2uRJX1kubyZcLpb7t8LzoXuTlqUSc120EOLu1lxp
	YJFezeu+an3E1aXu+LtJ++JB+pT70dDH2BABXBtjZjutwX5cT8dE3G8JF9EEEPY0ZgYkqaMr9Ou
	Qg
X-Received: by 2002:a05:620a:6f0a:b0:93b:c58c:d3be with SMTP id af79cd13be357-949995ab389mr889381785a.37.1795081669357;
        Thu, 19 Nov 2026 01:47:49 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:93b:c58c:d3be with SMTP id af79cd13be357-949995ab389mr889379385a.37.1795081668831;
        Thu, 19 Nov 2026 01:47:48 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:48 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 11/12] dt-bindings: thermal: Describe multi-source zone aggregation
Date: Thu, 19 Nov 2026 10:46:53 +0100
Message-ID: <20261119094706.3439040-12-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfXxVtxYHqjxyvQ
 ekzC3pPQaBzN6qgUPZ9vW9Nc386BeqsblPb35OVTyVfXU4kel7VNAlKWmZdTKSPXJYvIaceNuWJ
 x8Yfv7/la9R1Uu6yMLZVsDV7B04czJLDGfYDWkHqplSXCl6Otx6nr/H+1EPAJF9K4dchSlxSyQL
 gu47jmM7LK+uRrTlcNYwqTaayN3jzY4pm+/92zkE7WgIaYKJGd3oi0G5Baj7a103RVSg1CBfxg2
 WYXKTyY8cQul4kpEgwHGTI1A9nM8k98TUkQn+xECdxUJ9uWFlqo1gl7g1yiYQiaidT2APUSO6tB
 5b3BplOGcc8Hd62/x9018lus3/YCy9+llchLLsLJoNNMdK+P8xyLzhxU/yvKi1OQq4HrxpOMAFt
 e82nLWAAcTn2Ml2LQhbyCR6xO/W7zvwMf/bN9fuVVDh9j0Kqc8PzcMdKAK0heQY9/RwQ3ENQYOY
 if4U1EisA5WqNdlaEZA==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afec5c6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=MW378T3nY0SQNsI_83wA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: CKgRLALVfOlSRRkQ1U6Y1C78dhMvAwbv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfXwuX1aoXPhYtD
 3gS8QR9Dl93Tw8y6kxOBo/qKRFZA1ONoex7K7LR/7iO41vKlM6qGKgji022W88K6bQ385dCPXmG
 qmjcQLtwzaxbxwo/HJDh1Ys1122k8MM=
X-Proofpoint-GUID: CKgRLALVfOlSRRkQ1U6Y1C78dhMvAwbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Allow multiple hardware thermal sensor references and associate supplied
coefficients positionally with those references. Use signed cells to
represent existing negative calibration values and aggregate offsets.

Document approximate averaging when multi-source coefficients are absent,
with unity gain for one source. Explicit multi-source multipliers retain
the unscaled affine interpretation and are not normalized. Require
nonzero explicit multipliers to distinguish supplied values from the
core initializer default request.

Preserve existing single-source sensor-specific slope and offset
interpretations, including zero values and driver-specific scaling.
Add examples of averaging and explicit signed multi-source combinations.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/thermal/thermal-zones.yaml       | 46 ++++++++++++++++---
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 72e419124f98..10cf1fb8cb9a 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -95,10 +95,13 @@ patternProperties:
 
       thermal-sensors:
         $ref: /schemas/types.yaml#/definitions/phandle-array
-        maxItems: 1
-        description:
-          The thermal sensor phandle and sensor specifier used to monitor this
-          thermal zone.
+        description: |
+          A list of hardware thermal sensor provider phandles and sensor
+          specifiers used to monitor this thermal zone. Each entry uses the
+          number of specifier cells defined by its provider's
+          #thermal-sensor-cells. Multiple entries describe an aggregation of
+          the corresponding source zone temperatures. Thermal zone nodes are
+          not referenced by this property.
 
       coefficients:
         $ref: /schemas/types.yaml#/definitions/int32-array
@@ -110,9 +113,23 @@ patternProperties:
             z = c0 * x0 + c1 * x1 + ... + c(n-1) * x(n-1) + cn
           where c0, c1, .., cn are the coefficients.
 
-          Coefficients default to 1 in case this property is not specified. The
-          coefficients are ordered and are matched with sensors by means of the
-          sensor ID. Additional coefficients are interpreted as constant offset.
+          For multiple sources, the first n coefficients correspond to entries
+          in thermal-sensors in list order, not to provider-specific sensor IDs.
+          Supply all n multipliers, optionally followed by the constant offset
+          in millicelsius. Multipliers are signed nonzero unscaled integers;
+          there is no implicit divisor or normalization for supplied values.
+          An omitted offset is zero.
+
+          When coefficients are absent for a multi-source zone, the temperature
+          is the approximate arithmetic mean of the source zone temperatures.
+          Contributions are distributed as evenly as possible in source order
+          with a total gain of one. A single source consequently has a default
+          multiplier of one.
+
+          Existing single-source hardware zones retain their sensor-specific
+          slope and offset calibration interpretation, including signed or zero
+          values and any sensor-specific scaling. Their default slope is one
+          and default offset is zero.
 
       sustainable-power:
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -339,6 +356,21 @@ examples:
 
             /* ... */
 
+            // With no coefficients, use approximately equal contributions.
+            skin-thermal {
+                    polling-delay-passive = <250>;
+                    polling-delay = <1000>;
+                    thermal-sensors = <&tsens0 1>, <&tsens0 5>;
+            };
+
+            // Explicit multipliers are not normalized: board = 2*T0 - T1 - 1000.
+            board-thermal {
+                    polling-delay-passive = <250>;
+                    polling-delay = <1000>;
+                    thermal-sensors = <&tsens0 1>, <&tsens0 5>;
+                    coefficients = <2 (-1) (-1000)>;
+            };
+
             gpu-top-thermal {
                     polling-delay-passive = <250>;
                     polling-delay = <1000>;
-- 
2.43.0

