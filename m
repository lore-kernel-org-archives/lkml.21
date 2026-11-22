Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372917;
	b=CHBuWbB+gz3MR41Auyy+i3F1dN9W6k2P6iPDGCUy4Unwwip0rO4m5ibyvdYsDbyTnOt0
	 Hli6D7IeEd82n0z+cwEmQuOGhsQOfsVjreOPJXCJwlVKzH1xqoSVBXrja0EskllXwbpBu
	 Va6D/SQiNWMfy/rPWVCXfFSFkaWvlJhoFkuaKuIG6SJ7nTCdbViTouiaetFSRzClD+OQv
	 O0WP1ToPzdC5Zq4Bx0rC31ZhzHPs4dURbBkW6WGCLXqKmDpXixcCiWTs9gIdcuaNW4oZu
	 ZFockyyx/N43T4nz2U5gnJJoB2CFHtCdbHQpOYNYd6MGTW53a+w/qfKQ7gLEkEORYUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
	b=M82nCsIYtJ1+DQv6GL0w9/Ak8EnoHE7CZ07OI5Gpq/3qFjftYOoSpZwRXK7rKUjcGfJs
	 wtLan0cmqJjQCfb7XxjP5Rb2t7kBLgVJpdEusDXBCe3E8Rbykei54dOq2c13C+Jwowl4S
	 Wn97M7o9+w2/2EJP1ZgC/8OvxL+PTYD19LMLZQUh+WDppsaGw24CGh05cFGAl4e7qYtRl
	 AUEojt1PU0dG/DsBxmE/MoppOgAIxG7ZKrUpgzd1kONDs3IQVmZ7Zs725TluJTsjXuNkf
	 FIihTnXgUXEy+twTkbygK78osRfrSaRmvU6t3k3jFiZ81cK4ehAA3X1os0Tbu6zrQVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fl03wzcd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a09W8RZY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76E606A333
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C76E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fl03wzcd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a09W8RZY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUiXn3009237
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=; b=fl03wzcdsKXmSpCo
	y84g8v2TR0/Mh03bwzbnmQzowhDCRbjOWHEwzffPt7gLS99yhZPOZXqbbmnD4U//
	3N6wVbWqaisBQ54diLJ8jHAq9RImZqmAXkIPR1y7GDAkYstA/df4Pda6W6tey93i
	M22K8NooXyFo3eYRu6FXHBbaKlIFzjluNG/ygJzuMSiy8IU711CymN6u6UEFXW+l
	n23ZfI3fZcKWNjkRDlZkE5gY4wIxdiIc/DTydbVlP+mguw9ksd9r31jUkZT3X79g
	qvWvUYwwfjZ1PC0ElP/1J7KN4PlykDZpPUctNK2945ob1mmMIT233X9HrY+CKiO6
	bNd0wg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka3vma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:41:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so3022438eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372916; x=1795977716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
        b=a09W8RZY4OfSdY7KWaeQ1C8kHmXx6dhHhW9TVaHTH7t2L9sruFAPONPlRS4B3SclSb
         uqqHgIVVphiNB76U1M+g255gKaSi9Qpvck9nikHRirtM2Ll/AvMB3any6oQnfyc1S8Fp
         ej54cQCKNIz39aUbHULFjlqWEKGskyUO8j8Xg3X2OM4urTVJ8Phs9OKnzzk9v+aI9TEe
         Hbfz/PyfhIP7364Wz2UwD2VTCFLuQ4ysf1QK53EOGJs365Evs+4G3lG8WhBogJkN72F1
         BDX9VoDXa0zVmGF2wGI4U7mNuIwfxozK6zk9AmZTs72B9g8uMKZsDtN9u6hIxlUAb3Wm
         tX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372916; x=1795977716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
        b=mt3xPNZ5zpSfHOgYM32Qn+Qo1LwlY7kRs1k1EgDqRSM0DUTJdIAo9Ru11PYhHq/KmC
         DlFtysu02gvcztXyoB9d1mXfQ8/lAdvFzsC7/+0XirshoEnSw58e+2Vvu3lzLtZO2UOY
         E5t6wnWkN2rYvbUlGgMtvpusRn9s+XsOnii2bM0wNS6YP7lplZd1XK+HTHvUMQ5PB2vT
         1kSThOMhLNHvSkN+a8zj6SW6XY9VKUdlu87UN2yVBCGU8qvlLKokoqvud+p32Zpygn0S
         PLBB2Z4gr+9WQI8j7B9i/pOnKqEVH2A2KkKGbSaxJCmzFKy0PIDpQQFNEgkcx3o9hqLu
         kRkg==
X-Forwarded-Encrypted: i=1; AL+hErFcxfmvP7uWSq4DSe84UQa7ekLSTrAS0N00GwK2gESDR/AU/OR9wkZiR1yHM6pTx9bYi4nkBqHeK16O2HM=@vger.kernel.org
X-Gm-Message-State: APuU4Z98tJFHN6tt+rLO0EESjwh+Kzt7WWcmjn0rTnnR4b5uhyCS/EFm
	qUOkDmaScdFNh5YGId0OXdl4sOdcGoZHCDZO500S/xA3Akak6VchTgM1PIieHjiJ0SdFEQ0+35r
	mTQNhvZlemIc+ocU29obR1l/zlGyLlt5AhoGt0gIXCKM9tzNCWPfkkT9rtjYyvk/6wXw=
X-Gm-Gg: AZFdTZfbR4EbKg94QF7koD/AEeR6ZInP2GmJCh+75aWbGIP/gF0IfgrQNEGayuhegLp
	z69IL0N03QpC5oeSaRTU8HKG+NMBHWgEwUyyXanWxsGYf9GPCYeJKx+VTRSvCtaESNBzOFbe98l
	w8j5D8/SEi6NWEbuy/I9yFkrKNjaQLP6NDaQU2ZtSjkEFJidR32agnHwcdzrFtLxM2spz417aLe
	brgN6dsL+3GE04CDDhOddzeHqNZHsH87Ui+w6pYhcYg3uku+nGOP7uFwzbp58ZrqxBXmJxKwA6T
	7wYMeC6X20rhtS5aHOBJ08M88LQF4hBR058V9FmCZYqHRYzmwQBHt6m78dDCfGrbuuOIXlyn4aR
	s60v2MAJGPeA86wP8hNPxyHsaV3+ElN1EhfGgRYgZaLWN8GmQ3oddHdSRiiEiY3bXQODRAh0eGW
	sm7Uj1Tlo3Cw==
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11790873eec.9.1795372915926;
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11790852eec.9.1795372915402;
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:31 +0530
Subject: [PATCH v7 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
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
Message-Id: <20261123-add_shikra_support-v7-1-7bf3aa089fc6@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2759;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=4jOzxtuU5ygIp69d58T7Dv1/GR5OCYEOzG57LLRiCco=;
 b=83a/W9j+Od4snkQzvpFWFW9xErO/qyOciCt8jhSE+fjVoo6fiyNKo4ElyHYvXlPsQ4sXVai8f
 KkQoiBkhN9sAHd8OK9g4mgvZmKi7Yf4f9Pq5tdAYYpZN7cjPYNT+U1W
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXyPoQBA4CSSLk
 74Yog4/L5xY13ejj0GQUulHrlH46Xxmbvy5OCvXmfdIC/wyYhuvv+XspABoqXTtSJTWcoaO+elh
 i2EgBLtpwO4VEXrhTfG2sAdDpey115XFb/h0dho7UEit1pbwQdzD38NJ6cmqGVGqryR+pQR3MR1
 prVGshLKeoPLuD0bNFzIOeNkMsSpjSSFMVr3tdW2huzu0KrdioD38qIil1kSTPOGAviE9QJARaB
 Numgx41V87eJ1jeWd0JWPUMheEpDdvEKZneJKunVi7ablGpfvHlO76CKpbKhRU1u4gqCp/X3upO
 00rdnKly5A8RbX1Lo/jPt3Kwgyr9TGIeOt5EvaUa8nVeNcZtV9OM3XkL4YksWtxzFOQNGHXAhCl
 IPFhqM/ABCL/jo9XrvVF0RfCbX5sCyDmvOUPiRtK8hleCMcrQ8Q4pUlzTYMtbohokS9PVhDAxyC
 19/yGLBsAbnphHSTfjg==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b033774 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: MnP00b9ntYUI_Z1_nRETgxTC2QBdtYAJ
X-Proofpoint-ORIG-GUID: MnP00b9ntYUI_Z1_nRETgxTC2QBdtYAJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX4v1yCHCa229L
 2iV8MOsG37HXvHLF/tNYdbGhkVKGfhPO69I2iP94EAnKYs7il1fzLvrd5hE9aiYI0itwTPSapqZ
 yHVE07EbdMsssOZN3dHSuYl+EV1U5uQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220074

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.0, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..5ecec8d0b9db 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -142,6 +143,21 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index a5466e61b0b1..eeefe2171c57 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -171,6 +172,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

