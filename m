Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769395;
	b=koZaE2ol5CqNKJxRTOxgj5MeaMBGz3JRNlGiuHqOBcK5pMkHS10oLZkhtTX8eXLux2c9
	 v7nuCzL9NNOLZ1K9f6Cxb7I1QX6GzaTDyHRsxhg/pMoeYkcCBnuSlCo1sGzUJZ/cWyCDQ
	 LDyARDiJMjxewh7t3jOz0BO9bJr8Z/wiOaPDpTAO2BIHVcqlX7tSwnK5IAr7bst3JfaIz
	 D3jdAPWICzAsYWnddaYm4yGRYeWpuXdit4+gpkJGGVPp9Tiiu2Mws0E8Y4f9ykKe8jABs
	 od8FERDa30Nm8lAI7DlE0I4dIhKCz4HavVOglc+EKdA0/wowybB4h9sob2uQiOwPL5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
	b=Q+pBLpUO6Ovu5YiH6YUge6M4vrtEOSwdDK3vmmtD/eLvUqZm5LmMwRHafdIHT0xPnjae
	 LZekwjvZup2gGxsN6qzSD6xaLaEkb+m3L09QIt4KT2IjwDVi4dBf5S+600zool1u1EsPI
	 /uygay2ta7oDuMROjl692309mvV0KmnTDRcGrGY/N0o7w6iYGLOxzX6GWwO9Tn2ODgBVr
	 J+nqPKSlaNcjKkIwDkHeXI9UcbtPkePZ4l9pi9vtO/Kpx+00arxtCWgBYDq3T9hUCYdq4
	 BXJM/Tv9cjcnk2WBMK24NRYv41HoBrDfuD8jVZxSbLGRhgOPaNoE18NssVUgL3xs2Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2860A2638
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F2860A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQY51197178
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=; b=E3KkDh8Kv8+fEIH+
	UCG+LFrtxkEQWCdVW1J64XarWIJvApM+yo7SEzI/Bh7VE97IsIu9BZ59bu9t/xlg
	pnw/Tl0b1U/07AR175T1RkPCuPf/6Tx3Ob7lGb9yHQkXrE9/W7UIu5ZhwFJKVDbk
	0jwjdJyvPGz05/GtQnBYItYBHimZjhlnwvP1Z8ZVu2DL14Loef90v+aaeZKLr7Xj
	E6ztXA4KML253nuH3RgcyC0dGgTwWEsxrjaz3h04OoB1Oz536Te0LmTuYoTWJBA8
	l/dxONWQ+7bBXyGAlqNTvhDrRpQ+UUr0vYZ//PqDXEmpCYZKJh2iVHjCs9TvMWxl
	T+UmMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8ccn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f053ce0234so8886655ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769393; x=1796374193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=E2uVrMKBQ6BMDr3jJyGWJdftIBpLANmbXbZvJU3hkRbUSjmQQfu+KOooral3oWIVfN
         sVNg2N0F9x4GLSnxqMAzkJXKC2tq+ALLv56OHo4a6xZ/RTCPtJE8KXIsJcTJ3yuSe3ft
         8iJPAMC9y2KRkPTpawS9Kqf67Fe5/vzUsJAsTM/OZtl5YKmt7CzLSNO6iZgyGzk/HDsf
         9GWe7ujd0Wk9QRXVCoKukolCVdMwc9ktHeKV2oPZjNIT4E+cF+3jl3yExEbRnajtdJGl
         AT4PySH6f5FLhPygD+dWoFrI/c+LDI+n6ERNF6KYfBqovFJJJRbSTlfQeIyH8b7RzAyQ
         yA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769393; x=1796374193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=0hYahaoykTkRWG1z18hXkhsGMk8rDrdonD2ZTDtS/E1OGaWmG4vqbcCcYk9qQZxSgN
         LMaG/M+AP/chguBvYZGKcaM4Z4OBBBFiq7xl8OaEya7ZWsmPCEdDpgBdouXaZxC9/obu
         cxw0Vugg1zJkKKDEBda+9Qn8nm38hitW41kdct8qM+OAp4m79q2yCe4jkLmC+QgcuNZg
         SuEMQIy7uJv5oaxwyCe8fwHGgcBamZ1AxpBORHVIO5/J/XEU3HpLNAV5fcgxaBjf7Pa0
         xbQG2UvZJ1Bewqqu6AOgq+61CeZN3Fql7z8rBmoM2XwtiDndP381v3tinQwUMyl7APeG
         JdRw==
X-Forwarded-Encrypted: i=1; AL+hErGUfnv2rw062bAIcAkPa9jgICFzLatZWDfVk8WON9+IPohlJ2FURI69HlPbmcmDJEwsLjZ/3PQZ1YePimE=@vger.kernel.org
X-Gm-Message-State: APuU4Z///EVSddNQ1BWxccFM3LLFW2sGU/pZ5e+2CugmTZvuNJ6O17PW
	Nf9bvBnrJw14Q1VGUEtunQDzGaLthR2FhxqwOSt0bSMTHH1Pp0Gbl0u8bLiIzOgYQZk1FUyIUzh
	1RD00ZBYmy6n9Vee1o4Xdnp87Xa1+EfDkJVPlHzcaV8CMRkmSgjb4d7SXsWKUjCaPhkk=
X-Gm-Gg: AZFdTZeOSvsgldUbzy8nolKOwhab0NXGxlF3AGNjgN3nMyFRdN3QZtdnJdqHAmtlbDm
	iDR613RH/dj7w/0L99cMX7QSjQaa9ZyMQ64eKQ3WCtKRchJIO7UuNQldYxRIhz5w52DGpnE/6LU
	Ayj1mvMr3qJmaanJ+m3701ACJDbKVh3ekjEhxWbJ+KZ/HjyEJCDj+bv1iEi9QWlB8PZrm9kAlCx
	FfSvhH4iQ8SGV5rc5SVSVRAk5lW6APHJFUk8mEKCXRwTSTc3S10n6M11cHjuOHt8QMF9DNGUF8Y
	myecOJHpI5tm4E7p4rXg6cpB/NcD2cmHnZsIe3NVnOy+F1ExGhsH6o3w8cFQnbv793nkpCYOtLL
	ISLlHnb55rNKx+qgFBjpSQUXBl69rNZt2kNBBwHautFT07cMITTSLlwEGBB2VFOhBVZz4iJ1J//
	lPl/8yNePJmJbCMbFnIPIzS6YF4cw3xEo5Z7obmfNj6v5yvC2qqwOiRGddk5jAFIAM4tkhSIduZ
	6zd9NMAzOnKV4R3/O6N4Z+BtvBxBw==
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538485ad.0.1795769393096;
        Fri, 27 Nov 2026 00:49:53 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538175ad.0.1795769392692;
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:25 +0530
Subject: [PATCH 3/7] dt-bindings: leds: qcom-lpg: Add PM7550 PWM compatible
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
Message-Id: <20261127-eliza_disp_all-v1-3-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=968;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=td6QK7QkN9RdMGuNpRMBkvBsbxEVpka2RCJEN8QUWSE=;
 b=nqIn1yBnMRkPS85K1WKxZXXJYyHpSwtecI770QSW4rbu2xlg02bRk6lSpqsyDLejO1ZElnfZp
 PoRcejJxhjVBerkKVpJWrllXzJQlVNSK+T8iWspoPucUjkmijwcm4J7
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX9Yu11U+YBnA5
 DmCD7jcHjXHvspPw6M5jHkp72qzDb3nrtRI+V5bUFD7otFx03BSqhUXzPR9F1l/ZCA1c7kAydDS
 kXXnWFfrkZkrZ/BXkXQux0BAam4qIWM74QIWXjEUIiUXlUHE6XSXGn62tH90pAp52T8O/+Jkkxx
 vHKJyuChF90WPUTZvXYkq+PMj+ASZmwggreY442dnMP4+P340XeF2u3Uu7AdULNffW+2b8vq3KM
 WrVD7J8AtmTgKY2nGzejlATjX44OopNcAefKl6dnxp+ZwEWfpaOCnskS9Ac1E6Hh283mNHmOL7w
 nWzefdJi/t7X28MBsMGsmOYLAdxLOJVPs+aW+7V3u9zsc1iX3x13zIz/konW9bNMwtvL50LGwBc
 7Ns/WfifULjcroUGDCuS3pQ7a/XakQTS+RKtgXgACFacXsjS95942I0d9wbkFNe4vUMSY17GY+8
 1tzhv82MDnR3UZH3d1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXyoUWPO9atSUk
 xrTe32YS2/NWHz3lcw4sikcT2JH80ZaHjv1xSFwe20N+iCYLA/QDIaE+1NkEu1rwQ/Z6Ib8gMMK
 Uf1lAqo1pkceoC2xkRrHchN9GCHQP3g=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b094432 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0GMz1rgL7QW-eojhWosA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kzUg2QRVP3mHaITv8REhq4xLfIzxlE1i
X-Proofpoint-ORIG-GUID: kzUg2QRVP3mHaITv8REhq4xLfIzxlE1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

PM7550 provides an LPG block that can be used as a PWM controller for
display backlight control on Qualcomm Eliza EVK boards.

Add the PM7550 PWM compatible with the PM8350C PWM fallback so board DTs
can describe the controller.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..cf2c78f7f6c5 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -42,6 +42,7 @@ properties:
           - const: qcom,pm8150l-lpg
       - items:
           - enum:
+              - qcom,pm7550-pwm
               - qcom,pm8550-pwm
               - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm

-- 
2.34.1

