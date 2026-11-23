Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423084;
	b=1oVflaiPmaudSyfv81ChHtZZvFiZA79Mu9r8VReBmVEqrdwSlQXR/3xZLQAUq30x0cie
	 zcDA+MkZ9HSAfXQi2hEIRTGupn+7xokpU3AR+sSqu0UQWiVbi6RQetzzYbF242iPf+787
	 wihW1Oc8Gy5nZ6iSTOmH6UnUpMSfxRgBmVUrx42GzhovC+BBJUz03fAHy9+b/pFK9u00F
	 9ChBxYF4mkn0pqFhFJqPvukkdL69M8GI/pUxYHvttIwjhXZ4uhoucIxlheizLzeLR7b41
	 N581CBbsWk5w1WnlVWOZvurlcS7ZXjtkqwDqhLoMA8SYOz1OdZT5nMwULsbo08tmc+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X3yZTqVhfhTylOTclFsQo09RDsFxnkQ8A4AY0jGF+zo=;
	b=ANnjPtd+H8398IJt7uP9qFi5H1NnF5PrIv9/m9PgLU1mtyDCyzAz7F3gtFk0tTlBM2BP
	 j5MxIXyxZJU7INkybEyPKBnm6/NGkFuIr7ioqh49UXQ3R+ckTH8A2bVGwSyuoU3oPGkUV
	 4lBeTyu6K3yrpEdQXhHYXwv30TjwkUyPxzoEQuiFAwTfWZ6Kpc+g6WFUe2wEnhej0fjzi
	 8L4mV1ZEcW3+u/zYDncQZWpJ01iz6Lh5di+8T4lnHp0hRXF9PUR9E99nQGn3NKcTNkURp
	 babnNXGDLviAOg0eu7zz3aGwFFsSaO0c8rKH3O7ZUHf6wL/mZfi9QBZbR2YVG78mVVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PtTb7PKR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VMu+/1+j";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0099606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0099606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PtTb7PKR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMu+/1+j
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6PZgV3713062
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X3yZTqVhfhTylOTclFsQo0
	9RDsFxnkQ8A4AY0jGF+zo=; b=PtTb7PKRhn9sVvT4kADANyQeCiAyHA7Vx492PB
	MIRIxGfxcVTOqHzywt6F47WkaRCnlno5XmC8A8iIHGBl/K6R+xrpOyIssNnAyml8
	atyr8OrZWrTe8Vaf0D0hewuGXOCsqmbmBiC5uX5WU/onWH4ekQG52eXadhbIxagr
	gPOaWgkXmUldIv09Js/b/vaY1ARSg0pfXZgCFXTXYL3HDIKuRcdIeID4NYcvGRT6
	7b86BhwcUCYK8Hbu4lJAhaUfwaHsnMuAZJDb1c/XivAuOzogjlAphQ8b1q0fjIba
	yqFfHj7hZ/BQqFp/k9UWrU7Z7MyosY4PDPf3mXrBTYvADNYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g740fue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:38:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d3232fso455809185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795423081; x=1796027881; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X3yZTqVhfhTylOTclFsQo09RDsFxnkQ8A4AY0jGF+zo=;
        b=VMu+/1+jFqPdREbp0FBZ7GwsFBCjplWzCMRXgI6yqNTXffetPIY13r/c4CdqydmrRm
         l6M1KE0rodkbPvpwaTb17L5lp0xdJtP/1fY1tlMNIhWFOoVkqEIwzCIka5OKI9VAfzte
         MDgZZq85oTG8wxaZfvX3XxIA8Vnbl37LgsqYT7vuy93Qu1tpYIWScZY0AjQWiHsCsqfG
         ZIEsB7J40AVIwahsx4hSsnHhmWRE2dsHXUUS6jNQ5wGSYMOz/Hvy+3l32mbE7nFvVazz
         q2u+8m/Noow5Fcz3sqqcQpJa0QktTLJ3UhCY9X74HG2w95BJ+I3sqk0QLKNvGDRTMyrD
         GQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423081; x=1796027881;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X3yZTqVhfhTylOTclFsQo09RDsFxnkQ8A4AY0jGF+zo=;
        b=KB/3emhV/MO/rcWSfFrxpNxv6zDu2dMFL2869vVEpsLaHgDP533hacqfJL9jkMLNpa
         9QFKLKRZITfy4FwQAq4dlTGEy2yBGvoXBOYS1wlGwffMTm1VIgAblEsWQFSB8MwZ262K
         lFjNOBdaGzgelnlX8cqBw+SpXe7WKqSgl0/Ge60hmurpo4A7zmKPrWPJHbUtaLBi19La
         pvBTuAGC3/YGOU3C/ndEaJHTpx7+Zz5hsYSPx9vwKl75J4X3IdB/A5EDme3i3u+9a6eK
         rX1v8Q6B2jGImgbrnX9KZH0KHZAX5yYBiA9772tXbwoBzt8rqnta9/lO+rwmj+L8lXwA
         DkCg==
X-Forwarded-Encrypted: i=1; AL+hErEYN3K1BtE4ZFsjBvIwaP4IzkmDCae3vBkmnxigbUmcqrUs1uIUiXna47NTzDlLIKOXXxvhGjSlcwl/FoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g60Ob3xSMpd15U15JV9zGOZOXUS4yW8k9RpmbnY/milYtP3qX
	3+ih1+YsBzbEVJA71oPHDft0sq8Tn4S/TDKrTfZ6QGkP2rg5loBhZHFn1y3qh6yfAUBdpUXDAb2
	xp96RwgJL9q/baDem7LWV2iDzui7Hu1d5hjc8IoBu7SPPB020zLVKaChy0ml2qEDRgNzAcKWpZf
	4=
X-Gm-Gg: AZFdTZf80y5d6IDH7WlzYWeKvQUdHULp/eZm82rgiruV7dbe98W5JcyeKkAXzfj0qF8
	cwSMdtvjxyNwvX2NrHycmbmPYMvOEtddQpkB8dVHcTYUdIc5SaxwiJEK7oQwc47a+bzqvIS+I3G
	rr8nscgVUvztTgt4yyqNtvD7Rguj/ODjLe0iLqTBTfHu0T5MpUkt97RCRzI8GYOxaPsyY/l7fbp
	A4A4Nqomhr3Iwq58xz1YKBbtICAEFMkeqQt0DM3O45OpeJ8PYzmY3gdF+ntqp2fkqsdglWgDay4
	kOtBfn+4bl1TWUqkfs8zOzRGU0V03Yj0hWnwGeH1YRMbboxwxtjldK4DLyiGsMUQaZxGROFaX2k
	1tM+kO+Ny2IcnCClUjxcZUYUjcHr7ZVSxsY3C2yWmOjhbgfVGHUpGApj2UA==
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr1877513585a.72.1795423080999;
        Mon, 23 Nov 2026 00:38:00 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr1877510385a.72.1795423080246;
        Mon, 23 Nov 2026 00:38:00 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm20690616f8f.36.2026.11.23.00.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:37:59 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:37:56 +0200
Subject: [PATCH] MAINTAINERS: Drop David as Qualcomm SPMI PMIC Arbiter
 co-maintainer
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
Message-Id: <20261123-spmi-pmic-arb-drop-david-v1-1-c6be14d9d22d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGP7A2sC/yXMQQqDMBCF4avIrDtgEg3Fq4iLmEx1hGqYaaUg3
 r2xXbzFt3j/AUrCpNBVBwjtrLytBeZWQZzDOhFyKgZbW2+Mdaj5yVgWMciISbaMKeycMETXNnf
 j68Y7KPcs9ODPL90Pf+t7XCi+rh6c5xc59+rafAAAAA==
X-Change-ID: 20261123-spmi-pmic-arb-drop-david-ac3548160463
To: Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=850;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=y69+DrYJ+CVyZoH1f4H/avPo3X3mEsrz3vm3g0pjzB0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrA/tmWqM1E2MuoSYsD9SIVmMc8/dYUCFf9AWoZ
 1/0DehYYvWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawP7ZgAKCRAbX0TJAJUV
 VkXVD/4oxX9lNWk3tyQe5Ps8fWxkGLVPXePhM1s6iAMJ1Z0UIWxmLZOTaytHzVYbDX9H9UGxD84
 WC7sxvxWebHP/Ca4H2C0Zul5/RCf2J7xmkW0dDExGyVhDHDwKUO8T+5s1STJgGVZrqe4zWminy8
 I4dSsY9Nc9w9kZIyGweI8WaV/OlcB4aERh8sP7DRCt0k1olW5DeGmAdvZLXVq+vKK4nS4u195ka
 XNW/foFg0n3cEGjeIZSWFnHox4xGQq96zGE3hYdlm6v4PNMDD2BPpu5UHLqtknOZvqR6oOvLU1E
 PyR2dnZwLb4O98l4OOwyA33yuuh6blEyRr5AwjHNv8brG5iSg++z2p9J4KWRiIpDdrTLCBe/ylG
 lB5F86IMkRn+xE/dEN049nSeD68VImoj3BI1+m3hXm8j3EBmdBKcQ1CeheHw+dfUQiYijuWUPu0
 8VXN/e4awUW9Rqn2C97tODmlj6TpTpehOJmBA2fd6DD+3V0+wT/rW8tFzOsg+ClycyMOgUKlbrZ
 v0kb3CHqTxxEfwEwqW6yRhbZbKVeQWkQ1S81x18hIzehxraNHrT/X/8s/a1ngtX6G2y5XHe1HGb
 cWrUyz7SqaoHpS3ZV1eZMGXGVs30sVD/HKiHaDWYV5ttUVfcp4NW/tVw88lIpcRzOvvPpZY92u7
 xMtziYus+kjLPqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: VV6FejZzIsPhetYTCWHuvCYRiU4-jRbI
X-Proofpoint-ORIG-GUID: VV6FejZzIsPhetYTCWHuvCYRiU4-jRbI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfX1Jl+FaoSvr4h
 paRelACKC0rL4XlmNBZvT/jyx49gnyU3JT2vFG82C5f9xm3mY4sfIqtZIi7G16ic9pYtz5nXKbt
 QwWnl3udR+znbx/i3Swz4bZRjgCdSCA=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b03fb69 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-jf6-IQOuiCzVN0evu8A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfX15GS+Mo708Lw
 ltZsCS0BvcS1onbiFbRzVfxTMFKx7aEGzcr+L1pON50h9GbiYycw5R8f4PSHMf+/MdCB/zDL7/B
 H/JRq3+d+aSMCnqm05v6nZlThrhUHUPsNoyvN13PX6n560I31DP6vJV7ZH1Hl2/qzX4JdmmaNRG
 oYEMaPdTf+hxni1R+2DUVP7/NsqW/cXKJqfWkDtLtMG2uW6i65mIdDUZWxUhUUdMAPbavkM5wLS
 5W9XIaTZtUcP6UPs/+aM6+HV4U8XedZPlH5LsLKiv58wOHy7WdwJ02qEFpCSWw4fWWTnVjeVa5x
 J/4iDnX2y8KIySg8AfBZyw9Yu498UBGy7O2+9Wy5zn84uOTjZDY/g55F5YpyDb565sMtMl87D16
 j6ErarqychdftumI07Cp2u+3My3n+lXYjBXMnnA8BYsT5ixDz9bXeyF0eyuKstyf5C6ls6i1LvL
 hQIIeVY02tQ+8d6af3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230034

David has expressed his intention of stepping down as co-maintainer of
the Qualcomm SPMI PMIC Arbiter driver.

Remove his email from the entry.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9ac..fcfc0c95e793 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23434,7 +23434,6 @@ F:	include/linux/if_rmnet.h
 
 QUALCOMM SPMI CONTROLLER (PMIC ARBITER) DRIVER
 M:	Abel Vesa <abelvesa@kernel.org>
-M:	David Collins <david.collins@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spmi/qcom,*spmi-pmic-arb*.yaml

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261123-spmi-pmic-arb-drop-david-ac3548160463

Best regards,
--  

Abel

