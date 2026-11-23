Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415317;
	b=jo435vS+Gai9R1Mu5R7kg4B1KGLTG5STIP9ZDzgkgIEgGkDF2pj1n4ioIs/1pJxj/G0N
	 yxjaYGjb+rDqLgVUyUDjvufC/i6AM+yXzPxaTpcVw/BjIB51gOxbX1WZN5JOiRUhy3qIp
	 hNrG/ClvejkwxazWzjGKHkJx7r9pVeXSi7ya9xJbi+t9n7yveZ0oLr1gfwMjAHFAJkrco
	 bTuB+maXVszxt9ZzVn3VzdUK++QL2zUuFagAsYf7ofzpyWKBoOXTemh7XIh12gvoZ5taQ
	 wR+ILAt10dKCyBQHZ5QMBmhy3MZh3FBQs9P88JNCb3O+1UyABe0VcN/uOjSADP9W41Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=;
	b=e+8Sdd4JV+rolFyih5pkDVoy2/G/aXBlLIZLicqu8meeco/Rv3Habgb2dIO90h6ldZX/
	 bUjrQ852kj7xBTRtBCwC2XcvUN7U8L9tx0Jy0DJy2kIgqbHZ7nsTbVyrvmW1tXLVF63lg
	 FMO5gv0/u1nRpTyt10WDZb2MhtA7OXa3xEDEoxV5JA8Yc+OsHC1p645JEHbmC7aO9xoQi
	 w5iiqSo/lXWa79pWCZc1UDQfvCXKiv9JRlCmYYdPZf9WrPClAU/Yk2qGnqkii066fZPzj
	 tu4eHNEMjESdHOsHeae5RTRGJoY/7E/z0M7Bn3nEwcFY2oThDZHXOO/5TT/VWL/dEjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hm9ZovAq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KGp2X6d5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D185606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D185606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hm9ZovAq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KGp2X6d5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51V362924768
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=; b=Hm9ZovAq/ieEPtL5
	SmzBAIDzw90zsmsdJjDNC7NMZzqg36hQkHgfI0chlmuHzMydev3InfEATmvLJQZP
	4caBimnxm2c2ZjdOahFQ1xc/VK/ygZAVntLiSq756PBE3R72PL5wazFCI5hEmTTM
	W7UXIsvjR9f4nWvxC27KgH/V/S+GP7iN7qWSSKzUeG4ZzBNZEaWEa8m2XBG3pcGr
	wu05SP1M5SnAYgKJ6lgA7bO1xXisxiJT4b3wLOvDx57enc0anMcnsUVQR5HvxGzO
	2rqExpD3YyLMIxmrr0fuxucgSjVwsLuDBpBykwKJEVIscMl2PqRHzzVORUwGulXj
	gg66oA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsg8me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:28:35 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8615cc92488so2495885a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795415315; x=1796020115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=;
        b=KGp2X6d5nHvUlmS0s8+abOhN02YZxjsb+w0UH4pye1OSlcrFimgsBJj2ShBAD5Ra+b
         jhO9wKR2r7KtdJaj+aIoGQISJmGPAvNvj4tVUjrS2GFfUhcHZk0Svzg/xUr3EFhdzwBR
         sib69Ydf5eriPP2Gsmdh9ubLbc9Hx2qfjBjZtfeLqL1JuqbN1BcrR6DByPvFXbP4QKxv
         a4VFw2aTG1FYWkUustnvbMGmzN/lT+TxIcYBs/CwuSGR2UbEFulAWgfuEb09vUXVcEKn
         /s6afaFBq2XlK4jUzM2qChOHbioIIM0nNEQxNaJNvWBJoWhCHJLKO3C+0nIfPuQsdoPz
         9QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415315; x=1796020115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=;
        b=fewNPlEknxubaMdktRBTDbrRT5uClTGRdP9GUG2vOLHwObk5yYXamcQKO+A8UEpH5u
         dWvC7g8hNcrqpYsKYGpR7LZwm7yJ7PkyXDKkXswSkg144M+kNoXOxnR/f09YtCnxaRMP
         ogvrB7v7b0b/9R1w+lU3YNEUU6v/SyC+sS4EmppckFx4S5pd8X5ty5hzH9dDYJ8RJrbt
         IWQHzvsmCt7lVy/fFtiXB3tONIXRXSaTOHfmibyFbAhpavq9xsMbq1tWv0wzA2Dq+Jvw
         q1eAMNvRgH9xosD7jd92HHOlnCjRYCerxvNJav1Yb0C7kvQjS30bK2s54ppJ2ud+9GmY
         sXzA==
X-Forwarded-Encrypted: i=1; AL+hErEDosNre4PL64zxIyzmb09aCKpZOHilvsySrwaBTouHikQmS9A2C6GmE9SjzEu7uZiRKASxVwyHqwGf3H4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jgyyNHaV+h5czocjB196CgWgR38Ltf39kPM5vgT++Ht315o+v
	gvo8ApeGru2Od/yCIwTsEfpHVvqVLGAjT1A03xz+iCO6jBhLFtSwY7W5p12Rb6xRTHXuWxC6dRJ
	050xA5aAO/4TTLd2iv0f9brH1CuPm+m/UC+ZVv0WyVsmonjByYz1Db1XBaRsgs/YbN8k=
X-Gm-Gg: AZFdTZffUQJj6SJVCGTfcV4NLXM1OA4SE1nzOSyurZJqBGqyRvPOI2CRAHPjlJ8oCKp
	wkFbmAjp42PjbQ7oMJXhcRZbSYb8z6RzJxANwc4EH7DK9jZiByjGypSvAbWyzJzqSSoaE6vDXZL
	SL0nwnFqpxwJ5M9k+Nks9JX24VDV7fglAOr/v6MTP+pvXKLMJUxr2cyy/fddYpe23e3JvagXuln
	J1LFjmYm/til+/7uBBmJSGBvM8s1Jo0Yr0b7WZDv5kTRYaBdQgj9r5/74fO0r0QWDjjVzf3wFo9
	KCzNiohjs44uzSNZopKvatDHWmyj3O8UrVkoaade4X2kniFWv+9kCgvG5VIX66SgTbIU92WJ8Tc
	3dCV+BJs4gMviVgz9G8FxHo/3n4IdE4toQsEC4AYMtcXRv9JEftcNxBKxYmrsVkzWjsuXIzlqwR
	ZdRY2kJjTLbu1w2L9B3BL293DTYg==
X-Received: by 2002:a05:6808:4f09:b0:4b9:a8ac:479 with SMTP id 5614622812f47-57a0a517207mr11469715b6e.23.1795415314919;
        Sun, 22 Nov 2026 22:28:34 -0800 (PST)
X-Received: by 2002:a05:6808:4f09:b0:4b9:a8ac:479 with SMTP id 5614622812f47-57a0a517207mr11469693b6e.23.1795415314442;
        Sun, 22 Nov 2026 22:28:34 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8762533b6e.17.2026.11.22.22.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:28:34 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 22:28:07 -0800
Subject: [PATCH v2 1/4] leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-1-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795415310; l=4509;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=qdbu+eG7Y65JRKBsJusLOMxB0Z1QznzOHG3Z+dDHywo=;
 b=qGZNnnmUF82PoseQ1K+NRaghLNnQ6Ot66Eycw9RdO1AUhm6Za3EsVf4ZEIt4i2t/V1sTrevy+
 oP8YUK2hs2BB+60P70UdHk5pqMu9lynzegX1DLViy4tIj8J7lBEnnGX
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03dd13 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MAa_CHwBwOMXYDkmoIMA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: xE9aHjTRK6eMTXTOmUsXugPMVOxjlPH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfXw6qUCL/R/Ggz
 SuqPyukwMqIrbwK7WWGXWtaDd1rXaftWAo04rDbOuMW2wpMrasfAhrbi2lHAae46kvucUveiwql
 evU63ldqUzZOAjYfoSmnVujtkjK0CcAJ7CoNC8F+Gx73CMUY6Tzs29syX3PhaemDglSXY/4auMs
 8TG44eOJiC+J2uQiLCI6KaMUbcRUQLFUqyZoMR47N2VGnFjtYcv8uns0G6uSzDyiBw1SK/KFaMa
 hplzQRuK2fembKKmx6n62LXB0g+m5g2lqVmiEGYXiBjXA/lLCLB6leIFs7MQniMDxBn1kN0QkPa
 am6gA551mg8/zgukWo376Otrsn/JerMZxMHDdQARgDVq23Q+v6NIQCHRh5Q+wogTWv/XIq2CgL8
 A69LtaVWCCcOHf3hbvtq3/hqiQPWO6n46huf/23wd0hbsjo6FggZnigVPaViC1oyeE95azbLuhX
 vLoxQ5T1B3tcku62lHQ==
X-Proofpoint-GUID: xE9aHjTRK6eMTXTOmUsXugPMVOxjlPH4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX/A2jFcj69UCz
 vW5PETxvL+2PuqZjElQQJr7bCPPtbs7SHg3P5oJxxuinYSXE04QB9XxuPXj1d6Gt1Af3DDi0yL3
 G9IoXi9DnOSt2QrzR4kAsNhP5JtH5+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230025

The LUT resource cleanup path currently treats identical high and
low indices as an unallocated range and skips clearing the bitmap
allocation. However, with a 2-step palindrome pattern, the high
and low indices are identical, which can leak the LUT resource
because the bitmap allocation remains uncleared.

Resolve this by tracking whether each channel uses a LUT separately
from the index range. Mark every channel using the shared allocation,
release the bitmap allocation once through the first channel, and clear
the LUT state for all channels during cleanup.

Fixes: 24e2d05d1b689 ("leds: Add driver for Qualcomm LPG")
Closes: https://lore.kernel.org/linux-leds/7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com/
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..5d0d015d67e7 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -111,6 +111,7 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @has_lut: channel uses the associated LUT allocation
  */
 struct lpg_channel {
 	struct lpg *lpg;
@@ -147,6 +148,7 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+	bool has_lut;
 };
 
 /**
@@ -393,15 +395,19 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
 	return 0;
 }
 
-static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
+static void lpg_lut_free(struct lpg_channel *chan)
 {
+	struct lpg *lpg = chan->lpg;
 	int len;
 
-	len = hi_idx - lo_idx + 1;
-	if (len == 1)
-		return;
+	if (chan->has_lut) {
+		len = chan->pattern_hi_idx - chan->pattern_lo_idx + 1;
+		bitmap_clear(lpg->lut_bitmap, chan->pattern_lo_idx, len);
+	}
 
-	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
+	chan->pattern_lo_idx = 0;
+	chan->pattern_hi_idx = 0;
+	chan->has_lut = false;
 }
 
 static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
@@ -624,7 +630,7 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
 	unsigned int hi_pause, lo_pause;
 	struct lpg *lpg = chan->lpg;
 
-	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
+	if (!chan->ramp_enabled || !chan->has_lut)
 		return;
 
 	hi_pause = DIV_ROUND_UP(chan->ramp_hi_pause_ms, chan->ramp_tick_ms);
@@ -668,7 +674,7 @@ static void lpg_apply_lut_control(struct lpg_channel *chan)
 	unsigned int hi_idx = chan->pattern_hi_idx;
 	u16 step = chan->ramp_tick_ms;
 
-	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
+	if (!chan->ramp_enabled || !chan->has_lut)
 		return;
 
 	hi_pause = DIV_ROUND_UP(chan->ramp_hi_pause_ms, step);
@@ -709,7 +715,7 @@ static void lpg_apply_control(struct lpg_channel *chan)
 	if (chan->enabled)
 		ctrl |= LPG_ENABLE_CONTROL_OUTPUT;
 
-	if (chan->pattern_lo_idx != chan->pattern_hi_idx)
+	if (chan->has_lut)
 		ctrl |= LPG_ENABLE_CONTROL_RAMP_GEN;
 	else
 		ctrl |= LPG_ENABLE_CONTROL_SRC_PWM;
@@ -818,7 +824,7 @@ static void lpg_brightness_set(struct lpg_led *led, struct led_classdev *cdev,
 		if (brightness == LED_OFF) {
 			chan->enabled = false;
 			chan->ramp_enabled = false;
-		} else if (chan->pattern_lo_idx != chan->pattern_hi_idx) {
+		} else if (chan->has_lut) {
 			lpg_calc_freq(chan, NSEC_PER_MSEC);
 			lpg_sdam_configure_triggers(chan, 1);
 
@@ -1118,6 +1124,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
+		chan->has_lut = true;
 	}
 
 out_unlock:
@@ -1176,7 +1183,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 	mutex_lock(&lpg->lock);
 
 	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+	lpg_lut_free(chan);
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
@@ -1184,6 +1191,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;
 		chan->pattern_hi_idx = 0;
+		chan->has_lut = false;
 	}
 
 	mutex_unlock(&lpg->lock);

-- 
2.43.0

