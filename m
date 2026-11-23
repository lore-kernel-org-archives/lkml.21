Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454219;
	b=x9uB6pJo6NjnFGzYdYI3W/iffBJRYKzS9FfOZFRh0VqL0edqAMjl8qKY9yhnw9IpQRYN
	 oNXTUSFaqJyirIW9hbIsK1ejujygDgGv9BwWuiLdH/ahTyx1JkAFHto94zda39saOtp4e
	 PCBWle0bmm0Ecv9Jm8Af0EK9Dlg7QvuF6y+e3uZbMtSMDbTjNify+6lLb3+qH1GSMU8uH
	 Mu977J2bfAowv6Fsm2i24TAoVyYUQB6P2kAHGrOSxMV/A8+M9SrtC3r+nOdDAoawWv/zx
	 E1VLRNQbN6mQqIY6P9h1a9x++DzzNG7B/rhr0WU4AiwXyWOY1S8BvwboJs6g2l0/ByA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
	b=USTGGLnni7SzSn9Q2JxXYFHbHmVU2nuGvu/+4IEd9CDt0lUbkxTvQ5a8TaS2ddEu+Lyx
	 M/RvOVZfVDdaIO8GLPwrkiG5CEbHEz6ngGKUwPQqRropwnt8CYIY5M9jTiYr419prY0qj
	 TiFmGbEcH2Phnr84965EdHDxjBwU8p9vht5PDVSymRVP5SkBuEM4Kh/MUNwFG2COuhXRB
	 0OdhT8BtioBfycnQ/So1eqSEuFZZg+nuTItz8A7Rf4Y3rdDszJh77HnQKsH/GXXZnqaAT
	 q2OoSXRvIWTQ8QnlTe/llT4S7P8WxQv0NFddK3Lx4I55GGKtdNEcWZeXVZfG2LqxjDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G7W/sysy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blDthgvP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0FF60A2600
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0FF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G7W/sysy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blDthgvP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH4IT1093911
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=; b=G7W/sysy5QqXs5Pq
	CaLhW1/Blz687mycCaPbDHVxLSvWM06H80aUr4zkulSPqC/wzlqvSuCDSUmv2bPu
	uTd0Q64+cvOqAO/j9a8HQnsRuRS6R3PA24N0HULf7nGKT9IFpjnkKccRaTU98q+b
	jKJTY7KWflQQMk8WBZ7F7Bk/KvP5+MluOK5nyQxaFjcBS4QPT76DGCVdiXxqnkHC
	a6ln8WZS7Uozj29nRoIJFFG7TTCDio1ADrw3kdI6fCLK/xr5yz5j9FJPdfzktkLg
	TEJhbYYQ2wbLXHs9UvMUFQub+XpfZ2e5uzjX2/mJ6ck/A5/JNgzmKOqkDZbNT9Fe
	G874ng==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0sfxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so649819e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454217; x=1796059017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
        b=blDthgvP9zSQ1nV2JsakV/P1W0kIUqDUIiJxKTsOKfHfX4JOC+NbpgTsv4SdfqtiPT
         6cGkow2XVNwgHOUKD3tymqB7oRMnBNN6ewX1EY4zmF9AVGPOTXIh+eMhdgAaW2Ud3p1A
         oy9XCtDt5ZfTrTpqB09T0bsB2/7EebWAvb+Hb3CgIahCVyQNO5Xt4+w1tWQKBzsKlC4q
         gt9IWyGC6+UP+p3mnaSTrrg3QmQkO1OLbobEamD5RiDNGyxHpIM4DwDISUcsRY4SdL0y
         DN9S6+RRzeBq4fAZfMHUe27MnHRvE5UpHx8XGscytQojJ+2dXHMkc3B+nNWa7ksACsfK
         dlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454217; x=1796059017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
        b=q2QusJAi1yAxV2pQiv7s6P3JWhQ95Yg3Np590pda/YzegPqzB7Lp9bYhHN7gIYiyOA
         qZ7BbxO7A2y6qIW8DliDvy0DV54C5fB1XoemmC+uqXI2F7SdiLzbHlWl0s7YLj0TVTs2
         VPIf6xFhYKWRRt46YVjCFXGYm9I/RtLtn4pGLLSJ7MrDOOrTwMLNnozptBUSJIHgR9OC
         Kgu0UNthpe50Nlo/KwIE0CyeaUnZK1IxUBmq/sXCeIJ/DAKJjH9GN0bqHRmZykD/P2NN
         SiOV9r39ZWdt/m5tZuCinSkJiBORz9Gs0OJ0C8Cn2vCkHZuP6I8RMpbLTpraW7jbfRNu
         e1lg==
X-Forwarded-Encrypted: i=1; AL+hErEhWr/PdtcB4VThwvOXMK74P1eQGjUALWZijYzjAeYp7PiI4SrsQi8Ma2ygHTQbokVgPBCKTCoLoaW01bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fewF24FAY55682dy2/zyHGlsFb3FGdzQ2lmq98Ir7CyfOOYAi
	3+1ypXTrNtOnY9wS26yL5wQtcIVyOlFSfYLsmV5PH28x+VvCJ2s1MqUc1ajQWhIMgwRxIFX0mDP
	gTkbKv5CG+GE4pPAf+O8CGVzo5pLsA82R86aVf3EAUoGSdUXMAMlKM2dj9Z5EPI/+IXM=
X-Gm-Gg: AZFdTZeMTjPlUgZdj756HR+ckE8BStoId11lROe2tEuUdoepOpxxJKOvkTIxQHZfm/R
	e/M2KVjv5r4VVyajNGgl36yS5FTtkUVS6GSpenqr0HsH1OwUSN4//4VtG8aTb1ysoY+payxXA/B
	Dq+3Nobie/CKg6tFT/skezADqZmn4kIuaNUzG1DrApSKE3OczCWpYGK5UYc+a+HGD+n7h9JGLKt
	WgR0wD4stTo4tX9od4+yrbPqr/Gjt38zhWD25yw/FP0eC/rLOok5mRHFyw9aEJn9stViv9BzK+P
	AsmQd9NFSv39LmSdJtlC/+RmaK+cvMqQGQrS6XgkFkSirWVCPwdx8U1gqwbZRyHXc2Bezu+fP03
	Cx4VXQUu25iLzqhClXrtMCfh6toHq7L7iEfkguKVjotCKki/pKWxslHLUlSFqOV2OdrOZ+/j3pK
	xNjCYZUllPCHiBx8rFys8AB6YD4mniS7KPwLAcDA2Eahyhu2SZQBuEbLjh2DybFsaBj3BDGMb0W
	1ogtEtEU3mZhoyR+McfZIOUovZI
X-Received: by 2002:a05:6122:130a:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ee8af25ffdmr5612718e0c.14.1795454216941;
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
X-Received: by 2002:a05:6122:130a:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ee8af25ffdmr5612646e0c.14.1795454216357;
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:51 +0100
Subject: [PATCH 5/6] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261123-camss-hw-ts-v1-5-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: f7-W4jqbLGhVaWclKSl79lvwy-Smn4m5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX4s8AIwxDIi86
 3eshe5UYtM6xhay/Elq4lTmG1MQ3ncxOWSFO2eTHwTvD870IRJFnGWHGHLLwIgIvgyyS3BTQQkz
 v+MetlD1Q8ih5C5YhKq89OD/u5TQj7Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX53rR+0mE+49i
 dfwA+Zl2KOSVN/fFfujFkss4tXejsGwSSap4qV1UQLqVQYvfYIwoiN1LvAbH4EzPq9fK5LMJQOB
 +rkP2jm/6lpHMGGfhf/NNBxPZyes/wU0XVDHhEW7qIJF4MnpJ1aG8PEpwxFpbQyoF1IwwhkpvUw
 belviz+PEEi7UB24TWJMoecBot4kfn9bd255Ys4pUJ6ppfZ9j+GJt8r8FKaG0ZCM+tzFG6cSnbj
 2vXH/5bWMLYqm0dMkl3bEXIc+ZxA+KeW2uXnqggoRGmhkGTo5tRKwwZxJ51345xev2Hz5+HPQgh
 +o7Z1W5qmRR3hyLgK/6ohTMlMbIBom4ifq6gedZfWtfc+sIX4ES4dK5aLUUQwOni0r49RoFivxf
 D4SLYo+yNJNy9G07j32f1syIRS0s1pS85QNcYPn2JIlqlp0GEXAuGXPHUSqCePt7FCKSjLyhzJl
 cNhAb/BOqVkdemY59vg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04750a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: f7-W4jqbLGhVaWclKSl79lvwy-Smn4m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Read the CURRENT_SOF pair instead and hand it to
csid_timestamp_to_monotonic(), which puts it on the CLOCK_MONOTONIC
timebase the event carries. CURRENT_EOF and the PREVIOUS_* pairs are
left alone, following the reference Qualcomm Camx code which only
interacts with CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index ac085ede704653a532aa1ab77b2845471d1e6900..a2da70d5533314816fdacfb8b07248860d243b58 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 __csid_sof_timestamp(struct csid_device *csid, u8 rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -403,7 +417,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
-				csid_sof_event(csid, i, 0);
+				csid_sof_event(csid, i, __csid_sof_timestamp(csid, i));
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.34.1

