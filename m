Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166463;
	b=kzRxxAkXJOcBN99EAJu7d59ksHWX3dfM5EHSzJwQL1Dxo7G5SOubuljaj4gwafOXrtHG
	 65IRLT5tL1GEroTKgo0OOdjMLX2A+qL09zhCVC9f1fx7s8gfTxpssJvG4u25Wvd/vW6tM
	 ivZho0nyHDCMnuYd4oKVsXHYphE5HNuQETF5iN+Bu3Gmxpe49y2tYOeJJWOeeHPLJorQp
	 H6F+J+qFpvSR6ZwULJ84ACSJfXuLBKrpc1iB6y8J9uR+LpA0WyCCqqg3MZb+HE8HqCyEa
	 QD0ZFPrPwRxl0cRu5C3qR+gXVO/kMpt1KjkPFBjI1RZucCHgIWR9JA/E1E/VvKiCETw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166463;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=;
	b=pqOh9hvSzQfJqMWkDPcz5BHBocmc8tleOlMDe9gvvRVOB4gAE3Fsg6swh5IERQxSBjRb
	 skV+qyE22h9R0wCvVdX/3NxOuCF9OQj3NsgTDU9BJvG0qC7JAsaQ3+3dqbDyEI+Z1ryJp
	 BIUOtQEwZluQtm1DlOpTa2XOAf7g3ZQkw/psM4knK8obu/0ZmSmJV7QILgV9OPR8jLFfQ
	 l/5scFOdqt5SOQE+Q8oZfx85flXQJI9gmy/HGt+UK47kNapH4aXpkGpEWcH9eTI8Ss1yx
	 54uf5ll7+CquN0rl+SvgkiUQLWwGnz41rKpoenst1efI/fKlyfh344K9cFuM2aUUr+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aE2pDPUX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bt0DwWO2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674CE606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674CE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aE2pDPUX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bt0DwWO2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etSp3575575
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=; b=aE2pDPUXlqO+Oz6x
	yzS/xTSHO0LVFt/yqNt2LrMq44EcBF/ZXaYzPtqnSH0FyWVgBm3xvNJPtDEHCWWW
	1h/W8xuzIEmnPkvOvJancEsjw4RAeNHAvsOlamnEFMMZZwpUvnaA82JL5gyUvt40
	WZBEB9MubdewplZQowkCAVm9GlIYhGSuI3N47vwCSbAHwCQY5qF9XADP+Q6ZfxSN
	kuheeNpATD2Ik/AWNj29erPiY3tksDJwO5NtOnV9AZJh47GIdiyjbb/SwJJmcWzn
	NBmSC0M9PfQvBVSxtUgBcbce6Dsdp995Gf6WMppWK2/RppesCc7pDzB+W/tscO3n
	4xDJmg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80q71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:21:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b7614e9762so658217b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166462; x=1795771262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=;
        b=Bt0DwWO2tGm3A6jqAD77qY/0Z7JsjYPvUkbLNej8EhBmCK+h7eyYjlBbMIbS64j/B2
         w5y0AZMHvi9jTmUSEYAu+9F3by2L4ey6w8b1l7ZbZI1s4wbLk9yXyhu9eKmZXsGzX53W
         xb3RkGsVx3s0fmZ8dPv2uskSxHbLgbHfEIsdSh3ODoMOGMesRTdghCuqgaOmEYpDfAal
         dH5Z6lS9TL+IlkLQaUuHakcARKTknCfNp+9xQdQFPvFe6kkJqRMOY1uZbKZPslTU34bx
         z57PCr28QQ5ijfdf8sZuE5aHbVoIiijOsvpnvNrQrrX/6Um1kFzjCwIkGtMjqS5PhuDG
         ///A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166462; x=1795771262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jmDqQKbdKbuuwlFuxkB7P2vGSDTGNTn40QGhbp90II=;
        b=JL734W3Td28zYYjkBbHOB2M9XjjBtxid9lifrWRSXpWmWWmpM9l3IaqXj+oW8N9BXf
         M/L7Ay8+Ngl9PqxSOxCx7VJf1BZKaMG9RbTyORY7oc5uDfVccF7Ryt+WkdlWIMGAJonK
         rAOX+bnRWCqe+blvrBrhV5RcsmTKUyFryiMU96bTehdEgxRSOE7ibYm8XOLcyISvqznu
         D+HVfaMMAjdon4Vy51j7eG4KKUKCy5F1Vvrmeee4h7Dj/Glqm4O44x7WIzSYe9Gty8q7
         rv2GYfT7BOJqFCjFqFwNy/Zb57MzSyoL/Gh1orSuSAGcy3N7015WN+tI+skqDG8UWyy9
         2Wnw==
X-Forwarded-Encrypted: i=1; AL+hErGfug4pf8gadOSYMwoDfENO22c4XPeH7EdvHZcUX0RWzy7lU6LZqcBdWbBbvxCS9fcWfPEYSEyhUKUVZLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9or+AKfprrObHR+QxsAmnTN3bhrm65p+G6HhgsjoOg9Z+7ymTE
	3U7a9n3ie3Biu/Dpw6JKHyr+oPY9nRkV9pR/1jhc3Jsp80H79lZqz5jgu1E3MVoD/mxiKf0bH0e
	jtMKvHQ+hpVSxvNzErSV7IVvfEstBy4XN9MfL0OF58a8DevDU5y6GW23PU6EXucZrLCI=
X-Gm-Gg: AZFdTZf7KoJsMpCxgudowO4GRetqrwfTJ0gYd3ouhejcWjTppDlsFGalJpzEHmdi8eK
	SvdnSw63amtjCL6oNRwSX8VWEQIVrsqoDRV5JcQt2fu/NoWC+UTuljZGBOvuf8Aqtr3RazEH0IQ
	k+UCW8MQeEnun0oDTGqQO1g3OcMKfNi+5rDRJW7vwz2kAxirmEqGATO7oONQTqW36TfdWIVdC02
	FOPkHpLHtJLLV5faWt5gaOXUKZTjAPFQwddoLSSITivY7xBd+C/MJECj4N42zdv2CB5/yJd6DIg
	OjWcBUX+5C7CCcWfDaIXqBXP2OcslFz1Lege6/us8aHhbMxElrhxXte9Y1j+0d03akxeDItvNu7
	ROBn1wIhPLMIAG5RmJQJys5Ccs43BfKsccyRuegjvYpSeAOfDg6RDjJrPVdpbi9yE9ti5
X-Received: by 2002:a05:6a00:9283:b0:8c4:c54c:b022 with SMTP id d2e1a72fcca58-8c87ca5239emr1948825b3a.39.1795166461967;
        Fri, 20 Nov 2026 01:21:01 -0800 (PST)
X-Received: by 2002:a05:6a00:9283:b0:8c4:c54c:b022 with SMTP id d2e1a72fcca58-8c87ca5239emr1948790b3a.39.1795166461477;
        Fri, 20 Nov 2026 01:21:01 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:21:01 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:46 +0530
Subject: [PATCH v2 6/7] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen4 ADC
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
Message-Id: <20261120-pmic5_gen4_adc-v2-6-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=2796;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=yGXT1VgeLdECGLb+xY5wOq99nT1qmtpthGF+gAwNvWM=;
 b=y2a/GgXPHSLNPKtNuv12foWMhp7Ja2oBb2oMoKSlqC/O7BVKQmldgD1CiA/TdQCtW0VkfJylG
 OPubhuTjVniB+GvLQlGuiyWF/opvzKbvFugJ2Ajo+6Yp0dyr3aQzuBb
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX+gUxkxXyFz2h
 Gju47nY0238spEWLmEFC7m2SNWfDwVJcd1ksQc6mRRHkTa/jIbi9QA7bb0HBiJhaN2Uof0nL6Vt
 jFe4hlsBwcwJo80g6iWEzgD/81+7OQNalyMACHzE0DySV57bvPiyIiaLFOpCrhg3ZD8j1+67ihL
 0GFjgdm3cBITV/gaSE1azrmYF00BDdpcPjikPReoB4ut8/WevGCfSXWOInmLgIoFoQI6jH16T8F
 tNWG2TXNyNIzYR2NHOBMKN+3lLfY9cnBx79GcJ/MoQC+meoTGjhkLVAj1osE/pmV1n9t/mGQut1
 u9dnnAu5J09HYKG6NdUQ4+hAC1uolOZoxwKLF/4gJBVFmY5pslTqk7nkW5x/GyKxtl4L3HJf5Gd
 sqrXlR6+32+v9DP67mDSK7A9TDRW7nhfFXeHf59WdOZ57zLB5bYzeqZhk+yI1gCbppyUPK/V4TW
 AJIza60ng97+ROAUwBA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0010fe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r-B89w4kQ6UFD_XIchQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: _txstJpaXeNG0-VqCbJebbygrR2EMU0s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX7e5yxPPVEYXy
 OGasc4rD3015mOloHUrU9hi81D8zDUwfPVmG7oHO8XGogZwC37nMb1neFRSn1THdBYNnisDDmpb
 I0Gjn3sKbdF4KqGrMYhG5EoKXYu4E+M=
X-Proofpoint-GUID: _txstJpaXeNG0-VqCbJebbygrR2EMU0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200037

At present, support is present for Gen4 ADC channels under a master PMIC
with Gen3 ADC. Add a compatible string "qcom,spmi-adc5-gen4" to support a
master PMIC with Gen4 ADC. ADC channels under such a device can be
considered to be of type Gen4 ADC by default.

To support any exceptions (Gen3 ADC channels under a Gen4 master), add the
"qcom,adc5-gen3" ADC channel property, analogous to "qcom,adc5-gen4", to
indicate that a channel is of type Gen3 ADC.

Add constraints to ensure that "qcom,adc5-gen4" and "qcom,adc5-gen3"
channel properties are only valid if the top-level compatible string is
of the opposite type. A channel without either of these properties can be
assumed to be of the same type indicated by the master PMIC's compatible
string.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
index 065b82c41e86..e79ddc2acca0 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
@@ -21,9 +21,14 @@ description: |
   All boards using a particular (SOC + master PMIC) combination will have the
   same number of ADC SDAMs supported on that PMIC.
 
+  PMIC5 Gen4 ADC is similar to Gen3 ADC, with some differences such as
+  improved ratiometric conversion resolution.
+
 properties:
   compatible:
-    const: qcom,spmi-adc5-gen3
+    enum:
+      - qcom,spmi-adc5-gen3
+      - qcom,spmi-adc5-gen4
 
   reg:
     items:
@@ -91,6 +96,38 @@ patternProperties:
           need to be marked as Gen4 to ensure their conversions are handled correctly.
         type: boolean
 
+      qcom,adc5-gen3:
+        description:
+          Indicates channel is of type ADC5 Gen3. This may be needed in cases where the
+          master PMIC has an ADC peripheral of type Gen4, but some of the other PMICs
+          under it have ADC peripherals of type Gen3.
+        type: boolean
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,spmi-adc5-gen4
+
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            qcom,adc5-gen4: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,spmi-adc5-gen3
+
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            qcom,adc5-gen3: false
+
 required:
   - compatible
   - reg

-- 
2.43.0

