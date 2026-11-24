Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562010;
	b=PL1iIKNqSX8xHap34GfJWKUZP3GzSO///9FQDxRGDclMHgVcN+kcpK30wGv9b0xoqTKw
	 KAc9bSw+0KlgOcPLM2VoO93erHVUvmFMqcYhyU4Fi3uabuKR1OtgPfdd8z0JCbDQchDVS
	 Sxw0tD9BdbzjwXRYXL8z192WLwfRTwF13BcbFTtBexn1269jp9y7CMWG9PG7IrBOvgFdq
	 ut91HdzfMjXIGu8yPgdscBfHXQCsgMT4lyQtFh0QMGH+pyjLxXx7qktM1cj9SEFRCSuMz
	 3Ljw6/p3TeNF3QXhDcv9O8aULTDjCvmWhNW2ph9XHzER6vMKeRJYRHeeRB6od02jK3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HqCM6POh24DebYJfAVl/naQ7YT8IqWCIOL1KDFWTSR8=;
	b=pZnwBQ9vWWolG0nGKPeNUP2ELheZg5n+PJkgjPH6PHniaLBta4Ru7iaiPmyBvhrzSEIu
	 R6qRYssOsLhri3os9ph+asyblVDCM+DFdr/h2byGtJgzC2wT45yGnOSVLefR4KCRsI1qK
	 RHLqT4aHC31Gn88DhYKsg0yTxU6nHS560SPQUWotL9FB4kJDtGFqblWT09hOpwIujXnUg
	 T60Bz9Uqxv6hOD2i2glsk3tuyX4sgAYkhSXaJxdkQmSFx9Du4H/KfdIF7JIMaOjvTRFkX
	 pvlq25U/S2MhnCLhb9yhKUlxlUK6zo2gr/DDnSe5kBJBPFGWYccBgjSJeJ4MQ/Wk3Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TXJHGXMT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fyzqfbMF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8089606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8089606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TXJHGXMT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fyzqfbMF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMaxAx2558281
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqCM6POh24DebYJfAVl/naQ7YT8IqWCIOL1KDFWTSR8=; b=TXJHGXMTnfwZqEzN
	nu2QylxvWvjQ5f5Wv4NQVsxMdE1sC3EyF2z537BIQthfz3Xs7rdQBDAYG/Pe8IFg
	zzPC0XPK6zi2DoBBquRLtUmoWNrBkvxKiTFymvXXl8YQRdy3WaVWzXyK/mUHxmYM
	mLG9gNcU5Gp/JuoDuQpA8iMu4GtJttJMseWBnPa2n07x0uk9IFNkLICMvloFQahw
	TeSG24+SS4p+YbRwMFv8ZrkaRHLqf495/X0h17jEbqgQo3yG2QdZTMVQcyMQU0+Z
	bzXfrUlLj2wXfUA/EaXYhZ8Yo7VxX1X0cAMRxwebOmNthxquIYGzlMMUdQrfUdTA
	dQAv0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dnghpyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92109408212so105829056d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562008; x=1796166808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqCM6POh24DebYJfAVl/naQ7YT8IqWCIOL1KDFWTSR8=;
        b=fyzqfbMF/5gELMKOwkW+Q9m2hmnCZzNCOIjgf5LQ1QuQnZfYXy9xDxDOvQeYXf6ULf
         R2CJssEOwtbgSiL3VuWV0Xq5qTZT8/QsKQX2GqTzpN+6pJCz66CffhXCcwXylqBWy354
         TrWSnP+IRev84xPAShz8W+3MAPSz2xQ5tGm+m1zrZ4sECXDch5u0nHcdL1gbDu7JKzWt
         87oU2sjdbDuDo4ojGUpr2vpIsgmJWlEfBg1ZNYOxUXYDmb1ZQQ9tmF+AgcgkIN0Lpp2o
         8RHlYVaRu5SZwicZl+S4drrC4Mlrp/y0J1R3oUVsJ7by8lAhZsivYyH9GZCNF9ZDn169
         kjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562008; x=1796166808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqCM6POh24DebYJfAVl/naQ7YT8IqWCIOL1KDFWTSR8=;
        b=WNhJ7zvvQmLOcFL4jpx6DMr+j7lonW3rRNJLXNH0W1WZpFjATR7NJY6vestX4du5ON
         uafn6ieL2GbkouoKz7KH/YiXGs2axs6SAQbXoJs4WdHKZJNcguqgtURhAn17W91XLSeO
         zSH2HDwNBWy98g1QXwDmJ2EqrAUlW3Xl6MFKTnlaOl4NFJN4MyfJg0fk5hPdX2012Ndu
         4/1MtC48/eEOVlQBt2fNHNJxHnX6mTak4GY1Uf5wrkclTx4bbOz9DzzQGrQ3r8HomLec
         EYtbtCi8thugLuwpkljRPXAOeBCTMvrqSMuqmx9vPY0O9c5W0Y2tixD84ctIB+ig1hzJ
         3ecg==
X-Forwarded-Encrypted: i=1; AL+hErFduISMsLRI4W0zRNHYlDXiX5d6FL9bj53FV8lPMfYCoAHpQXOnoD3/TxWGJQtF8Xx99WFdoG1aLAcyjPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DHIWOyJwoW5bhQb3zkODgPnXL4vXWmUayYva+zHIM5EfuY0b4
	nim5r/XmaZZ3xPaLhfpniRy7+IJ0EOkBXlXSO+9Zv0rEYR0kox00PZTaA4R6dm/v3Bh/kzI13pC
	hcD8Bode7a2j29dSau1WhiXxdSj2VmBNB6f3r2k+Smq6QIGVIxMLhNx3g88JmO7hu0V0=
X-Gm-Gg: AZFdTZfjYKEE+uCQ4pqTK5J651sEL1qaR0lcbAUaT/0J3PHND+QXx8seA+2FHmYMCua
	e0U8hDnkISz2Bumd5xt8d8fW4vQZr1slXZhLyOqTQtH+u3WVDxaNWQU/B3UTDbzc4DQJB5j5uWV
	ssUewIH3sHNAiN6e50k4dryytRJqzTz8vGrrJA4f/vs8eBzCXcunmqhuuqdMTfX9VBsSkgETeME
	9H7QUsaRFvm4m8lf9GLX/9IRNaPe/PsQ49nXoGaaS2vtfhTfxFtZ47ewM7lg54SKNdZF/s/cotp
	U/4oTk0yYFoodAlNcELamRhIusqbl2CkRCs4oWsfygJkOcZAIISbYqddV5hAfnSV3zUhVX6Kgf4
	xmCAiuyo21hM8gMEJLWtBAIlfrdIIlaIrGnai71mxjzLJ/LmwMxyWze9SQVb0NfnYtPmi440Ug9
	RGuPisxB0muScua+BWNhtlTrfgiszZMaCOvK7dS0R1T0N1Utu+czSW9jckA0jLRw==
X-Received: by 2002:a05:6214:3189:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-92134763915mr302416166d6.0.1795562007785;
        Tue, 24 Nov 2026 15:13:27 -0800 (PST)
X-Received: by 2002:a05:6214:3189:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-92134763915mr302415676d6.0.1795562007336;
        Tue, 24 Nov 2026 15:13:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8056b207sm43708401fa.37.2026.11.24.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:13:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 01:13:16 +0200
Subject: [PATCH 2/2] drm/bridge: lt9611uxc: report a failed firmware update
 as a failure
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
Message-Id: <20261125-b4-lt9611uxc-fw-verify-v1-2-7aed8dec8018@oss.qualcomm.com>
References: <20261125-b4-lt9611uxc-fw-verify-v1-0-7aed8dec8018@oss.qualcomm.com>
In-Reply-To: <20261125-b4-lt9611uxc-fw-verify-v1-0-7aed8dec8018@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jMRBbYL6cdhmXY4Meo0eIrw8TiKLiu9TSeLGpMZfndI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrBhoS2Vsep9ofIp8In2D1C1ZspGR9wpw2dSf+N
 lIxdS0dpj6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawYaEgAKCRCLPIo+Aiko
 1YjUB/wMKKjoY7T6WM9ZUnnxPiFMUvgDQZBHz0CtMRkEtt6QhqtewOOBQmCiJRjazOC1UHcWnDT
 zVzXMF8R1dkLCjq8aTGGBcyNGwxB9loIb0hhomL5X1nEXLphjiynZdPT7+klzUsxeB5fL3RQpYq
 fI1/hUJJ1crJ7EoG8O/JkknAZqy//r4h2OrAB/WZsQRhsY3cIbW+c5XuZfKf/NLIGx8adiErBea
 mr431cB+GIriGpH87LQWpT7s1NkgjmC5j8FlbIBH7PBYjHYuXgMpCp7UriRNOmgY5Ctdv0ae51R
 EIGjp/Kf2EiuBe9qmZ+x7oXFExXNwbLb+6Mm+8JkVNUJ1SOK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfXyS3524Fue8yi
 +eGLsq51iS58e3yL+EZtVLzvygrGFXw6NhORI+5TG+Z4tJtDojKotQGEkhzMTcNsqYapaR92IxM
 bWkjXTveqF2YG/52x05DykkIbU3TtDA=
X-Proofpoint-ORIG-GUID: HWcC_MxnK3mHoWFk4HBEPMimWDt6qaoz
X-Proofpoint-GUID: HWcC_MxnK3mHoWFk4HBEPMimWDt6qaoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX98bNs1fI/rqu
 IVKtbtkHycCv45dJZvzYuvuR/nDbFR00V4c9dfWYxkusJ5IqC4oPx0sh5ke9xxEL5qmo9k35uXM
 xGThGdJSBaTHY3j6VndFLKPZjfvYHpQbMRh7YDMe8T6ty9GeIxlAXwJmdfah1TCr+VqV0GnFqcW
 nc+AwwBKrn82DxGKkq4Zstvo5sAk4I6eNoxY/PEGKjC0XToi6Daipa/vvEiWf2OlBIG/zaqljUm
 ikeqA+zBsti38dczXWSs1NNp0xh4y0PYxHjftItCjgR7h2u6d3iJBjuzJGVeB39INpurf2rZu4M
 RTJvksaSrNz2hnrleOVXMSgYt6jyWWxTV1c8KmARccNaMaogA9umOykIxSTkmP5Q/KJiuuk3ajc
 LyisgW/7yidvhfEAYSUcJuieZEmGcGJuXDAhrsa2No4xLYyg1qexomo/Plt9jWVnoqDCpQrTeda
 wFurq+Iw5NqMl14RzcA==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b061a18 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oFi8kr63Ec_tsN6m-mAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240091

The check after flashing is inverted: memcmp() returns 0 when the read
back matches the image, so a good update is reported as "Firmware
update failed", with a hex dump and -EINVAL to the sysfs writer (and a
failed probe-time update for a blank chip), while a mismatch is
reported as success.

Treat a mismatch as the failure.

Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 6a7d479e86f6..8992222c6a5a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -691,7 +691,7 @@ static int lt9611uxc_firmware_update(struct lt9611uxc *lt9611uxc)
 		goto out;
 	}
 
-	if (!memcmp(readbuf, fw->data, fw->size)) {
+	if (memcmp(readbuf, fw->data, fw->size)) {
 		dev_err(lt9611uxc->dev, "Firmware update failed\n");
 		print_hex_dump(KERN_ERR, "fw: ", DUMP_PREFIX_OFFSET, 16, 1, readbuf, fw->size, false);
 		ret = -EINVAL;

-- 
2.47.3

