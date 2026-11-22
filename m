Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372945;
	b=Zt2swH5EznAWALO5TvZ0EpzajqAbVj/weHfZp6OB4Sg5oJStISPsCMKVK3OC86hLTsxW
	 BwO/hfUmPnqr8EWMQHvr04BTevYhG+4EzGaHEUb3OCQwdXaN1d6tG8LvWzAec1CyiJ+d+
	 vbh7yFASgh+6TFX+TM9z+/J2I0q66xg+4cZOG4Fo6x/N0PB4aO43vwKbe4BM9LbhzP2ZN
	 hkMQ43Cfs+X8IlwOf6izGybChfAjnIGLln+EIQgMd6hmK1kBXiJffAYmp2GGanvyQR4xO
	 8qvVRUSTTsHCD/99OHZS6t9XRFdEkDw+Zi/0Rf3nJ4RXSnd5w7cErfy+2ZcBYRX7Q3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=;
	b=1maTKqzWt42BGx2LH/S6xgZ8I9/fxAHK8SMlmNXUf5CQ0havkAtwlCKtVpwAnEoJozZ9
	 BhjPzhE3NEukXsYAdjyBjkRT2/9eS1C+TqCbH3eCIA4zNq6PP98r0G0h4/BxF9mutryVl
	 NwmBV7aJXRTQrhHV6GwpLfAf3TDgK5/v2hIiXvaSP6A+3njGnMh2tCPoJkzpIqFOCg1rw
	 2xN3bCi3YE09YkgYLs+6FaM9mtIQELYTFpG33FFKvnavrUEHH7v6e6Y8YrWbYtwi2wUPS
	 nmBmEXXUAzPZF7wB9rEzvpZWg1odxUm0/p6oinf7Ih5IraWng4SeUaooCDWHxJ6wd0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiuLAfZt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfvDzwWG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A9606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632A9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiuLAfZt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfvDzwWG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGWRQk3631187
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=; b=KiuLAfZtrrRhAVau
	C6yQsRv6noDbddOxm3Ck8FqGJYEKS/kVKOHmI3ofk7GO8+rfS9vucUxaxi9hnQfy
	n0KqOpN/a0slNdVeQbbZXfYByhuiQWg9VIlrlH/tJ2MOfVhUu0n2cseAgOOZGfug
	WoJvBlEnKJb7k5dsHQA9zkMj9pd2Ty4l3+5FIFrwn8whfp2Eor1Su+rVLH+Zv7pX
	WtEG8rFzIr6WOydI/V59s5nOQNtZ7ckV/ljh5zyiTRh8+A0noG8/JAYbFBMvqpiv
	QLhRCMqYluyryyjkYMVETSAl6zEAmHra8fHTloIztwErGvKqyH4Vo5a7JJrjavPX
	RR6xEQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgc3gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:42:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so6990242eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372943; x=1795977743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=;
        b=NfvDzwWGWKQhSUXbySado8KfoQraE6gSPR7GKbjV5yx2Mf8qYRe46EoEzSIhpeDnJm
         bdvvZJQEcePerqHRxMc1ViXcvl9VgfF6CJffHbh9mag/R6VbYP9rqWftpZ26ikCewSGk
         lzN8jf4sGdG18j+UVMro5Rdp6eCrJQvOEGMJ78TjgtLmzLcebahF3x9C0tkeqefo4pJZ
         y69FmEwCMDrl+yfpDrwPx5HqSl3t4upP49bJje6CXx9SSsvThk7QjQp0kxCsfguUSeI5
         EWt3A9Sp7H/pob4f9O2rVE/n1b+WLqYkhWhzWf9Hs9ykliy6g0maXlQLg/r+puaB2UxR
         62rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372943; x=1795977743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=;
        b=kMOcPWIxyEPFiuC88PV/GFGQ2Mn9kYB2oJ2GewqVos04RwVELK/74SBQCC7aA6d2ik
         n8le1TH8YYOLnm0KLHHuRDnhYKkfdnS/DQOWiCInsHUF37PErD4vmTlutXPXl+u6GgM1
         v8bggOisWE9LAufxwBFGAYbDm8zRwxUZPd/HrL/mkxPIID9jJmLtbNe1qsU8TvIEweJ9
         lQ/+9yfJfariqzmLr/p5NDDK9OjDu2q0jh6/arGs0Y2FNdM26PC3inXFNWHHtYJBbOee
         lqbpd2gw2rhGAsTqvdJedpLLXdOI/hCDoVUBvxJbqPff00nZZUaEM2hImlsqyk0V1/Uy
         y49Q==
X-Forwarded-Encrypted: i=1; AL+hErEyYuDZhWJH4a1Enux4SizWMfM01CQevTc9lzzYv0Kxs17WKJfUoWZ01AdrY7BnLdgf7zxzgBFr5DsG5n8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N7ijgqzaayUJNlhFvOaAcYbPbaIdG26nmu32oaLY52HH+0NMS
	Ny4pRVtmTOJn1F6L2RGy81cQMLPT39v1SuOTuztr7CB8SKJHkrtkwuh2oeq8DjX3znroM0GM2eR
	7aFzrxFnWNMZYdw2i5xxWslDMkHH6LwMESV+2sPveOvGjrtKnSlPbS1H6Je0U9CgoAbk=
X-Gm-Gg: AZFdTZcQA8jwpNI9tIaxMj3UkKAUnYx6GmXuQ+aIjFTFnQcBQnmD/7eLIvdNdEUYiHA
	qyx0oV/gFfDMlz2mu/PBPr/q8tJzk3ouNw+9fI/NN0h5DfExxNcLm31KyhcK0EGmbEYcnuhs16U
	YwPiW/KUHmJXw+q8qLlW2OYTW8ClgbXCEFuCzkW+kEyoOGrQINHT2dZOV+/a/BGZf13ovpcO+GC
	biLtAx+R8N1syJk8Bnvb+Xi06V2CfNWHTx8bBFamatFBcNAvbacZt90eVQjjoSqOMMRt4NZu0L5
	sZhdH+lx/cO58i1lhIGhM0qcXNPlFoPWlNSb+/DQmhBQ3RD75at/NXodCLLbfxmLeCYr8VkHigl
	7jnIyJB6ViiozQVolGoUYE3O+cY+bEppLACj/ZkmraLL+VMOTqBkNFBDs7rQruiroJxInLTlDWh
	/g9m+zKhFIIQ==
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr10804941eec.6.1795372943246;
        Sun, 22 Nov 2026 10:42:23 -0800 (PST)
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr10804895eec.6.1795372942668;
        Sun, 22 Nov 2026 10:42:22 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:22 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:36 +0530
Subject: [PATCH v7 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
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
Message-Id: <20261123-add_shikra_support-v7-6-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=4456;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=5FBPDpaD3OrMAmmupNm3eZ3W1yGgtsy+cEqVcyNVSmk=;
 b=j9Jrq4s1XPTzNlEKY81+i3CeObEyRz/c4Ubb1RU19kKoW56BH8QnBqphMzqcpIni8vtfAQp8T
 MB7u7yOXWivBq0OqDTD7SMI5FwOLgag8YesZ+bAHTM6MOZTk4tx3nGX
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX9NT3W6JqKv5e
 z3hGuLGaJHjlXMcMFJor8pwh0A/zLXIs/50dhOVTn/YdLSAhRFYsHr8VVbsKx/59BUcxQbKLR1P
 q4qzjJrSCVVXt8vP/WiVWPtdqNJm+qtRXq7wZv5Ic/xCdaPzvQv3NdZhooit03gLtEEvqlc/qMM
 ZREOa1cgzXAZ3Tb/fTEDF4pWzHuq+Q0vZKkT5s2UbP8BmT6I+jrK2VHoHg5W7esrA+j6qA0r1ur
 J6ntAY73V5Uq+rmTsCmkX5RaVDClE7RKPO9ONs4+9QbdubmBoxN6+1Scg8xyl/BFJU68oWpZLxC
 WR7m1foYjOPxLKkQJYBSSiRIdJ9gJdTCrNhei7wEYAgyoQydseRXPwRUtQmNsCtBUqERhKBEAl0
 oU3FqhalLY4Su9d2YxHvfH1ES+KHdccYnsPrPy3SIFh0XW9PkLXvMQqHcyw2OPhF2gDBzc1x3EA
 tmSnFkbY1wY7+JF3PIg==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b033790 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QKLxUzbeBypczxc0BNYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXwhKOH8DxupeN
 v/jUoJHlJL4Afyehdp4wY6p0m8b7EZGcXzCF+YLA7judO4/0qyuEpjRj1+SziLibGZ+J/CfvaK3
 VR94vFw100aEqV8wdvZParIesz7zkfM=
X-Proofpoint-GUID: R_A_7QUO5DVyKq0MWsEfKCwNVKf_HMGa
X-Proofpoint-ORIG-GUID: R_A_7QUO5DVyKq0MWsEfKCwNVKf_HMGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Document the RX, TX and VA macro codecs on the Qualcomm Hawi SoC as
standalone compatibles rather than using the SM8550 fallback, as their
clock inputs differ.

On Hawi, all three macros use an "lpr" vote instead of SM8550's
"macro" vote. "lpr" is the consumer-side vote name for the
LPASS_HW_LPR_VOTE and is distinct from the LPASS_HW_MACRO_VOTE used
by SM8550. The LPR vote is shared by all LPASS macros on Hawi and
Maili. LPR is the vote to put the LPASS block into sleep-disable
before accessing the LPAIF registers

The VA macro takes an additional "heartbeatpulse" clock sourced
from the LPASS VA CSR rate generator.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml           | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 5ecec8d0b9db..0ceff31a26a1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-rx-macro
           - qcom,sc7280-lpass-rx-macro
           - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
@@ -158,6 +159,24 @@ allOf:
             - const: npl
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index f9702a11ef82..77cde8a4c9a9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-tx-macro
           - qcom,sc7280-lpass-tx-macro
           - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
@@ -146,6 +147,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index eeefe2171c57..c8392bf7c31f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-va-macro
           - qcom,sc7280-lpass-va-macro
           - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
@@ -188,6 +189,24 @@ allOf:
             - const: mclk
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

