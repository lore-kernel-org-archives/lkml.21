Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956451;
	b=LaAocC6xRrtSJFZCcOENTxGPjhTigQHO2llHmQq5MQFbwK99TnsWZ9j9r2c1Jt30iP5h
	 90Lfh8ZUitmJpku25Eo1113zcV9gaYOKc1sANObFahIzfBjaS7vn47kc308ufPtWZ+nXg
	 5tU7nMxbiT+j2NAhLShBs11HPnRUO/ZgqnpcV2GMWLiGe0m7EguZ75z8G+nnOLfTKH3Ow
	 kV9JuFs4zq5f2vHVaopwDBXy2wZs/ddJ5uQy8RDz7Kw6lD1EiPwPzN4WfAZ4NUtJLPGY4
	 WndEnGdkp6Rkm2vTCxRzy25GGdNPrAMf98AV2BqC6/GUHXRFC/andCCQ2Lba6dLjePg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956451;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
	b=J30V9JFeEIFR68MvDIoMODtMjv8R0wN7wn0M4EKxHemm7RuE4WdsTwzRnTJWA37JQdts
	 CGxIQgGHrezAeyif5sus2I9NqlYasgY3qNWgGWKihi7bPnY/Jfzd4KAI+CRyI7TEQQmUr
	 aOoVFhmiyncwYa+Da5U/EHVafDdGJ4G2M5M+nLcXAaDesFuoQUixihMVzNGPQNilYDY+H
	 3G9cndRW4RKcpBgp/Cvri/2Wso34SVH4Go71xbge6xT2YRtU1n9PmHfluWqPq3qL9XbiG
	 QzsIF9lEF+Zcb0MYgsi6AL9G0j7krHdkPcZ2Vbka94cepFph4swr/NIKLSguyMsMOcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC5gcMs3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRvGUL1O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F62E606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F62E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC5gcMs3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRvGUL1O
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfVEX2628496
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=; b=JC5gcMs35H4A6M9X
	vPNREHXaNcRfAhv/ZpXm8SX8n+IrA/GeDhVuVAsYfTf+cezWboQrBXlojB8JevNX
	L7EFIuqArBAo39W2zYnpD4ZaXw5v2naGfXd/rj3aw4pymw8SqdivAXgF85NRhpfz
	qGd1Lm2yqkcjQbNUJvCYsc4ioLINvvkv4SC/aZ6NBtC29qN26F9yncXPOfZLtTyT
	m15RGf9WPCR8yIz8jOdz8da12+0WbkXPWDbyU5e+r0nWAJ7CT/+xwC5t99bpEShI
	7gs+sFuV96XIks9kgXT6jDwgwNwH8S7GpkSid5Kk8vHrJT0M3Y2baiiefx98rNbm
	TFoP2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9g2fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b63b9665so238999c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956448; x=1795561248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
        b=XRvGUL1OQDeHhmRGj0odEaItjVyp8AkEcumOGCZxntV0PEFZTP9e/tFKAmCd6U9Caa
         47oqNsqsz+pWZl5I2qbSQkcb9VekGC/mCJ3LapDo1Nl6ThYEldJ72chV6Jm6O0bZ/cy2
         u279ftaGgm+gjbDrWY7sT3wnoX7ap37d9/nIBPBH+ydhN/KaXukenLisWu96V8Jm8rey
         0sYosjeEh/+4Bk40/QO5fcvdH5e64czKcRNiwL9TFpxe4KhkIhqgwYRFLLBOBp+1DL+P
         TGPfrNx2piI3wa8DXmMyRRn+d5+wWA4/OzJHT7Bcwx36z4L4oUYuceUeMbhVei2rNUBo
         aZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956448; x=1795561248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
        b=2LZwAXYpcPdTOzDAK1rGdy20R7IKxn7UBRbuzU9Xzm900mKD/uu54dmIQN0BVZXw4T
         XdcL5bBOp/JP8yeLpnpcWwcBhlcnnEoVlyeDgwHa0YK+jiWKBQovmoPCrzX0EeV3Xk7S
         8ap1Q/CMtGO3GbLjsDtwR+OPaysU5KXBqPdt/e315vzlP4X2AS0Qw7ulv2/9q96c5y1I
         vz1JubIoBAg57jIKntI0gdMRrn+ic6qVzfsoe1AKfB/4NPd1JHkZR66oVvoV/9jDvggL
         eNqwNXA5TVBkUIDDrZSa6dBNexUTcCpJBigK6CMqxpDp+CLOvVwteslKbvEd/iFv24yE
         Oa2g==
X-Forwarded-Encrypted: i=1; AL+hErFJepjUbgrUqagN9E/KN4ZNHwua/kYXc/aaMLEg6XTxIx3XYOEPSbZoZc2DK85OQ/NvT5HPfS7dqm9hsh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M5RAzqbW7Qc4keDkb6R/fvN8bsdXWeQkNIpS5qPnTBnaRjh6A
	qFiUHVG2uiQFWhgojmmg5KMNS9+Ak6EVwS4QrAq0Ynn7zmSBKg1UMhFMf6bqGi/EUj56q3oBeEA
	sfU6wHv8XTytSQ2CLoBk3OUll8lxi3yRvoGfS/QHak6jCRqhHWTF6ghp8zv6GSGWauVc=
X-Gm-Gg: AYBFou1FDAPh3ljRCBdxg+19jWH/ryO2YWWGTvb/DM79EH6IFVQhDEXSenHvj1OOuDQ
	e/Ve45hN3LQno3jF6sjIT5dzX7DhytCgKiOrrcIxtfQ92KglHlHo64k8/MvyjCbbBqI+v1880Or
	JOUJZdOBxP2IrUtFVezN7s0sbwI06bEK4uJrAc7pDVe8igg9IziDgJPJ1hLCGY1XEq+ENH89SZb
	QFvxhULQqwqS2AvQ9jEPjrJrWePqfm+Zy2/zfeXHx69sLQGXWEIHP6tqmTBtScixjqTKoi9Se5J
	kEBcycHJWPEMhj5XP8hVIl+F7d0P2yhm6M/+hF/cJCDseHqjOne96Lg3BKRxMwKA/JpmX/qgINV
	OaHcIiiTp5mHGKJKN3YCnNufL9s+ccbJRREL/Tg6KfFz7yIuWz+5ph6IbEV1ApQIreu3DkRST7w
	==
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr706527c88.2.1794956448024;
        Tue, 17 Nov 2026 15:00:48 -0800 (PST)
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr706458c88.2.1794956445963;
        Tue, 17 Nov 2026 15:00:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:05 +0530
Subject: [PATCH v2 2/5] dt-bindings: display/msm: Document Adreno 753
 GPU/GMU
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
Message-Id: <20261118-nord-gpu1-v2-2-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=2675;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=McFLm0aMyTcV9N1kaYPA3PSC/gCV7LbW48SyQaf8meQ=;
 b=mrAHKWNH7J+q5CRxiq8eKAVDmZjI1fHu/90H1/VVy8UsyW/VM9VHzqWcWFwRPTSp3hv9SkAGA
 CnvdoZiKeeoCy9DHZ6FhciBRU61FloMlBPZfX9ZqnAuR+4QIz7qrMei
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: WudmAqCWlcJr-txms_8Ip-xOLHpiljs1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX1cR1Ntp1csDI
 XbkmyHGKacTIp3GaeGbNDzPzPVkfQuC7g1tGrqwHoCaHcCgDdVsxGiAyvJA3ivYoueg3w87oMwp
 PHnUyS+BMWxFZ719lVpwp+KL9oVPl30=
X-Proofpoint-ORIG-GUID: WudmAqCWlcJr-txms_8Ip-xOLHpiljs1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX6fsVZt/sIr/y
 JOlVkIQO1N+x2LdG0Zz8S+2eFDQzihoNWH/f9sq0k85cierKwYdZQauPvqhyXD5m+gSYMPemeVb
 MUUw3mpdwS9G8i877ny3KR2qYeUNvVbeFtwKZw8E2Uw35LwZqDR+khjKT3GRP05jMjzLx2+bhNc
 SfO8Eo8T6TCSlIuW+Nu4M5Vipn32loZcmgdhi0nEIcO0CY3xoAEza7ycxhhHRlf10jnXIW51+cp
 +xgEJD5OG7+dtHtWceKv5NV9Dxzm6p9Yx07m1sGFJzZg4ryxwN5FKxWE4RB204tT/cePX5rwTtW
 2zwyGYVdQqlDqk/4TL5wRJPaahvixzR3DyCS4k10iLwQe8LbGQzKkPmNYrWOFXvanHLOs4IFeo4
 zFc61+MflgCw9nBXEt/dNcuq3Yil5W26CrJSBT888o1ECcU6TtGSQWuK41wmC8fwb3sGE95oc+U
 +68tP9I44kbZm9PlOCQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afcdca1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tfb5_1Jyd-QlxhXfLoAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to the
A7xx Gen3 family. It is very similar to A750 and has the same register
layout.

Document the qcom,adreno-43051701 GPU compatible and add a separate
constraint block for the qcom,adreno-gmu-753.1 GMU describing its
registers and clocks.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 33 ++++++++++++++++++++++
 .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 07f0e547b43c..6b28694624cf 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -301,6 +301,39 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-753.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index c30de7feb447..3c90a09febe7 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -451,6 +451,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-43051701
               - qcom,adreno-44010000
               - qcom,adreno-44050001
               - qcom,adreno-44050a01

-- 
2.55.0

