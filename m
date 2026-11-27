Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769401;
	b=NqimNsjAPUinIa6BxuDzVwYDIIgArokyK3K5UaImv8ykriJfnHrP2jqTkEQTGj2Yuz2S
	 Mvb1kQZQigrMihW60graqLM4gaZpsVZ68JWxy00D643ATiByY0KBSh0vYGfG4ASy5gPo2
	 pYk0f2PkJ3G78G5e/lT+MSOPwo5nwlY/eqgzD+ep1/s3A8+evdazCSOdvOG2EjmLaFnL3
	 fFz/YigI2+vgUextGGXZRlz868XMmOqR4Gd/livSSAVesTbomN9Hjge8icde+vTmb1tgu
	 vbLxXFAQPD6glBNXvVotPh74HZUAKZhSHZzLRQD7i8hk7M6pbwpuAu+f7R4rvP1Fatw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
	b=oYyL3D2gSrqxEdm5ijm4tyzQ9ZNIgmwdJMeOykO/EENUtqw3PLwJsZV1A4gyH7p5hdUV
	 NebQf3Ttd2svtaoHJRiZc90gz3ZebsoE7P9GF8Qt40/FQ2W7EP9ZXHZgT/lVljrsLLpGz
	 VHhbcx/wB34vuRvv1XjmfffulRvQvA5fctBvqT11B/Kk/KmUX9/NACZEKd2Lnq9CCsHFQ
	 UCt2qdFc9O3UPbRmwSniugCyxBgvXPdQkEKxinwrwqinn8Q1PDT0Yp4pkIkRbcq+mfzlc
	 4sDoZxvoJJUXwLc9cTT4lSdz1woh9zERbE1eZdP82g0mGhJ4Is1yr3fgB9AyhiWItGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dFRCaNK/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD144606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD144606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFRCaNK/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gjrh2421574
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=; b=dFRCaNK/4p7+RnyJ
	Y47wepn4POLlkF1UD1qcJga1XDFTk3yAIKtxnEE6BeqraJQOBrLNcIhfid0FyyNV
	r1/7K2DFVuLPxgqhTF1xp9lhmk9CIrmhforMtEgGaVz8yaejnQMdNoEZm7q5ksAB
	n4vCwAJtOgBp0X1kb1OQmO9xmThCEQpKaGXo0vN4xEQDrtCENvGhs7i4eLcNQbof
	lx34LDhTSVahbEKxcDpsDIT7gAuUqlaawndHezehJPEUzUqyfUolDh57t3+DuMqG
	CtNH/JbvJNzKXu1ov2ltLVmrkqPrKzZUbu7gS346l+yt/TaIeUIpX0iOsn1YPTL6
	eFzaQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92nbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdeb1f93b63so117079a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769399; x=1796374199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=W0hJj+vRfLgp8eSspb/yvppLVigfhZfo+1TuSpCEwQ4SeGldcBYS3crDVR/tEfFRrp
         n1m0ZurXcicu6EG/kKysE2k3K8RIRF1jITHqIszAVEzS9xqRte36Lr3TFtukk0ChMuhI
         Atn2vzVMvrOt+9jSSnJEU7Q7T3TMd5qZI5lDftDYdYSOFZGIteP2MXHN3pc8Ow8FuWXq
         3h5zq3tTuHTjzlS42o731yeg6wuGTfA16J3m7g+nJi23fkyCkD/d+D+/IqDYT5dxYCIw
         DhxUMTcRM9CCUZ2d5kXNBw3SAOy5WeyyTxJXibAUuO5DAvNGQV4lrYEWp0Uaw/Xl4hGy
         6jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769399; x=1796374199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=g/h/ILRpxylEr9J0QT6bxOLAELwFwZRDVw15MxJWDheM0Yj51+44LLHfeEMAUJeWVE
         FQFYUIk/7T+xTSBU/SIJoOXag3HsK0g2Es9MeBb2FCH6D5HF/XzNmayjQQqDHVXMBmDF
         o/TO/+lcTKegkUEdzPcfk6DaauiiexgEwTnHhCsEu6VavlvwQSIOIf5lXK1+qRIUYejJ
         fJWyWDvmPTXlT5O9vUr2ofCGcyThIlb3NNPrgJ+2DqK+1oMG44OtCo8W0jTZhE6MX8z0
         bOkRL9SF6T3858wF5CI4E/E/pqR7ryGVZvv1IsRk5BwiiWiVsdbl9njFwh6JwMSvgP+Z
         unHQ==
X-Forwarded-Encrypted: i=1; AL+hErHcdmtyCeib0/5QcoholYbZHNCp8zlCn7Si25rqAHjrcUrZthVroQxofBQ5E4bhUg4OIDYzq+GixcykBKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nGlllwsuKyXKfIN3IM2p9kf7WLwwWSN5lwxuz51lTVNeuZnrd
	v7R9TtyKSfds8JJc7EqJSmLgdnFjSywHUlHeNUFzkgJeY0usdSdXkDJKbivp0Vo0HufzxQgPKqX
	a7wU1hMXX3nrhySx6duJd5KVlPDH4+iuxRggxLn4QHm01Rxem0AvzyhGjZWJBUdYDccL2UcLV8D
	E=
X-Gm-Gg: AZFdTZfs5qckf4cO8BuiXWTc1HVVrUW1XmzUt5B97N5eVbTsYq9rdgv7FNVp18hRzFa
	w6jNgqR96N/9ncIq6J5QcpLAamwKjPRw8f31EyqJepxCi0c+jrn8i4mjtI7Bwy4sO5M03tmk7Pm
	iVcMqqvaRVLz/PaRlkEl40I1ykcXSuq37XZWRNouq4ERIDVTGjtbtuaMN934MG7BauPfHfqPf9U
	foBUoERjbv8/pFy9ehFqwqv6mYswQ4EU/1dGVJcQYma8sSAtGmD5rFvEUI7a8JiTOz4q+/R56ol
	guRShdXoY/3t7Km33qnETTP1AxL+5RxSz9wslaXMljj5BpRqW/u5qqp8OxAuER9ua/it+Q6WdzW
	+JyjZgtXATJ2QgBx+2cOhqItmecH6V+UdLEjZwxkIgUKbk3e2UB4OpCaAi7pph4XXC9Ylh3dNCK
	bl9lRUVpaBNXcjRV8fTq3xz6bHFHOMCJHTb0FAAOKeBy0PZe+tiNi7R3bozVovpSxAb62GqeOL2
	/wnOBREHWHLUPtfL8qKOvBJhFnnSA==
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294785ad.3.1795769399482;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294345ad.3.1795769399034;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:58 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:26 +0530
Subject: [PATCH 4/7] leds: qcom-lpg: Add PM7550 PWM compatible
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
Message-Id: <20261127-eliza_disp_all-v1-4-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=1089;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=tkx+9mrW5AZ+HOy6XzHglysRWK78jQma1MhEIAFTTJo=;
 b=8s59DlyRSZewARMpmXDeN0BjCap++JIQsz8Fj8QZAwu5z52tfIwwDwzARFsRver9MLXktwHAL
 GkoYA3WNzQmBx2LBkykLEnVO14r488O89BTrGA8krDwxPGxcenNWjyk
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: MEQsjptmV0G9rQRc519HjjYRlSeS4tmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXzdqzmyYE9YXj
 THuEAto5/DgfBLXjQMHhSDKMslYS5juRzsRbCS27hyatOa+TWzNDrS9tPlX0BDupFAYJY3mEzdH
 VaMSwEdSrSIR1UOOvgs6bIZ4K+1vrOhiXJu2iZ6LtnWabIBsSBavjVcy655FKCr10Vqa+Saleor
 2DhHoquQ1AcvGEgwMZSgmJ5vuKr+SvUodfWBEisvvmy29hblGwuxpsNbpRK70qu9dl4fE2olKS2
 3Bd6/PcoqjHM0dMCCJYwCeHvUpaCfvz/fZS2iLWVfCnZlvxG3t6cOLGxGyab5yN3v4h0jAiZ4Q3
 LnMHCA1Nf9ZJ6BM82rjnw05QDspcEMlgNJ/wb9YiXAQLIBCKGwBqjga/879JahANhRJOKCQbAoD
 MjfH/NttPAUlqr9CqKu9QWUGkZ8sunxl0/QX6Kk9pSLVNZzdGyAYy2QH8Lk299eLGiswJEcXkxZ
 n+SDZBI5AyweWdYG/6w==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b094438 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8FmHkYH7MGniFFCvUCUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX7NKi0W/F8qzL
 MUG/NM5Tvr4vL1SHFJBMg11pmyatWM35jF1KacZtYnVmhcYbSgTko9FPuH+FZY1JGysOQ4GJdnE
 Zh6mfbsTCmCjYXmgZtPrdL6FPc8sofQ=
X-Proofpoint-GUID: MEQsjptmV0G9rQRc519HjjYRlSeS4tmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

PM7550 provides an LPG block compatible with the PM8350C PWM programming
model.

Add the PM7550 PWM compatible to the LPG OF match table and reuse the
existing PM8350C PWM data.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 98e39e03b9a1..6c9cbc75bbfb 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1827,6 +1827,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
 	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
 	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
+	{ .compatible = "qcom,pm7550-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
 	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },

-- 
2.34.1

