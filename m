Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795927;
	b=R53poNl72JkOySGVf/BxbchAwT28rDtoH+ttzIeGejPR2SbqY1nRexFdWpmeJG9cdMVW
	 mi/mR2IgJe2WuZHUjV6vb4IqfLohT6X6KFXyafTo/hxu6lO0vSxf90JqEt1kLNvMGPgnx
	 CzjJZX8hDM48KO46IV/iIsXC/OMZzOxJKIoejUeizHmrfiorZsUF19WwtWFjc5e4QazoQ
	 PxlqBBZZCNTZxpNtcR+LI4ae4R4ssxd/9t1fb55MvLo88ETu3AAdjwWKisIIhln5Esg/V
	 ERT4CZHk6Xbk8MAwDCjBP/wr5cYp0jPNOBkxDCerg1Ox38QViconuPi+xVvbTKA2oIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=;
	b=GznU+cew7H9zhoTIXhz/wCQ/PfFiQF3XR3CnI8tHaFXUq9g9X7g8Yfie7ywb9lp5ppix
	 Bxk7AF+2hVqir2AnHTidrc2EeeLqVF9+CujF7mbSgoUjhcMTE44m7U1fKU5PXvWDVfEIr
	 CJ5ZVO2+Ehl7+DI2OsCnHY4kctKLaN/ZH2FLGW8vEtvPWUQa/RC7nny6uyZKReAiDzJrZ
	 aUHAL1KjSkBWBBe5IVCFGqOHjC2D62W1Rmtim0FXxnLPgCaXIz/ao/vrJBe/MGYLSyVHh
	 DFd6MbYHTXF+glzMLukuK1xw/o7vnbwhDHRuO3bVdoOcFkHs8dkKSgaoCVTbyni0Wpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EZpptMXU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ly7S8KKV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6252A606A68D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6252A606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EZpptMXU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ly7S8KKV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp3SF706424
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=; b=EZpptMXUQotrjw01
	0VmeZfDb5UgCLjbJmdHW9UfnEaENyekXZRdxI/ZeDccEQtbJ3Li+A23koRe3zeYw
	uvJ+Q8rHPxMXehDZQF7vvYJLcYPdCD3VvMU+d2+ZvaPHHQPD/RYElvTLOOGjJeYR
	NaLeSs92a2kMJugKiuJ6TFNk4Ur5qAqkgJkZM6UffG/3Rdgfn+dy5Tjfn/JrLJxA
	5/fgphf9jO3IT3cmBl6hjZ+hUAjcDDbl8noZipvlDestT68ik46FkWW349omChrM
	5Ue3336kKal1iL0vaMVlVlYM9WApohLSxDmbNCJe0J3DJ/qM5Y1BBx73kOw80tGE
	D1dFDw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6t6x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfbb5b812so2704347e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795926; x=1796400726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=;
        b=Ly7S8KKVdJIK6biMcv7WMngcy1RG73v0T74VMTHKAEf4LSj6QM7mBvlysFBKiXiFLa
         wglccHTK6x1HCGRIUYNsrMbn7qjwc22OgiMwgiAraTwte0bvgMBAGBZUHc22Dmm/TaLW
         80WoJtRjz4gM81EdGVUV5SUDNBVAT2hoHMeNL5jxsTfllLHYYifrABICspvy1Jiejna9
         5+YYlanhJSqOdbDKVmGAznheLch4jhBmKeQHVVZFjaHDI5K14HRpM9cgheR4d30+Bn6J
         yXVaEZLDKWAexccbCxZqNwfwG7uDYt+vps+qna3DKAzlE8ex57jyk3uX3UlLJ2vkZm1a
         qrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795926; x=1796400726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=;
        b=gsIyFUCcnuekTdGC3NpWEGIuB1dhFiXh8uFq6OHHEgE3igXcmd01qTovBXw2yrXRZM
         y2Gmw5sAd+Cx0rzcPNHLiXnhmIqML/cJHG+DXQ/ovQvZCl18N6lPS4EPPWvqPF4A+7HU
         yOtuX5fLxISP81qQTrJfgJmBp88zD6GmPkF8KrI0FHocY3Dy/48yBtnmFXff0vwVkkzL
         08ACGFGrvcdVuLl9CeVfchvekBCRqNUoRx1exwZAwfaiNTNxL06xgDbKnGUOxRpkOygd
         yDIoHRHzLe/nCcdQ4wlTmsU3aQ/b8Kzb6oZeMR5d3DrrIUblMttttozyNQrMrpt+Y63f
         uhFA==
X-Forwarded-Encrypted: i=1; AL+hErFrNXYVZ2wfb/wE+OE3fsAsT+aWhan7eHffGGK6dL/8fSf9SQT+x+yTuYeVDEt3Wr9uPwBXRdGjyzJVt8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z90kV0uL9Cp1b5q8f2KWypzHKmx4OucbO94oIlTn2rLAKXnSJAH
	PhnbxE68yJdNvd9f7UTeDZBJvQeR3KVqrneZ1rQBI/zScXIGlwkK0JwXTPJDR3Ruht4bFEUU35r
	CQ4hX7eAVOrQuCH0prgZpGxglAF3I/n3XdAJMaZ3BTKURAFEINr3JTT+fqUgVI47iFcA=
X-Gm-Gg: AZFdTZdsNBby+WCjBdWJDf5t5kubdBftfbHDG3NqpW/Hn9Ym9CJlZVSjdYJIJs7dk6F
	v48ziLmh1Vy9KNwHXLhoguIxiUDk8yPAJYtBxijxjQcx+wsqhCMQFI6PYkpl0rbVb3y6yxfUX9K
	jPm3QyC4CrsfoIceBwpoNAD7NHZLiPSCQb8izIOT3RAhq70YdsIGSs3w8em4S10VV7BnSS/hubg
	cZ3efSK84rD7/A8cO7xBxs0gIGqBKJqeRdcapHledyEf6Vp3pD81PA0W8feVinuNkj1XjukXxDt
	S/wt88I9UlrXowB87dDjSpQ9bCrA+WwCm2v4zxghYN04HoRiNo5DQ9libVWTOBkWUt7HyFDFAVN
	S17L7VqyASFeam/yWk1eYkv/NLy5S70iaEu5wMe2qhKphMoIbyc+/RJKZpE/1yLvH4wES0981Qm
	HiOHr1vKsdLt8lVTYPTlDfPoOt0EnopuR2GqqfSyxfoQYisHsABM/QScs/xDOx5DLLqmdUBRENL
	UOTrK8Gc/5W8HvbudCTIdHeA2vn
X-Received: by 2002:a05:6122:3a19:b0:5ec:b6d7:9b46 with SMTP id 71dfb90a1353d-5ee8ade9b3amr11494926e0c.3.1795795925530;
        Fri, 27 Nov 2026 08:12:05 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ec:b6d7:9b46 with SMTP id 71dfb90a1353d-5ee8ade9b3amr11494856e0c.3.1795795924960;
        Fri, 27 Nov 2026 08:12:04 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:04 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:56 +0100
Subject: [PATCH v3 6/8] media: qcom: camss: csid-gen3: Report the hardware
 SOF timestamp
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
Message-Id: <20261127-camss-hw-ts-v3-6-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: tNZJNtrCg9uGYNDZTIysUg5oVYVSZ1sa
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09abd6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=uYcjsKY6Ai37ZVY45MYA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX12CntG4ZHLpU
 Khrpym2BJ2nEALjrbYymxJ46r2q4eejVHlkpvEeHvsj3a5iNB8OO7Z3RNR6IHJngtkhnCZ8HvVg
 JhgAJDbtwKhbiYHZ2KBm6392PsmTcMs=
X-Proofpoint-GUID: tNZJNtrCg9uGYNDZTIysUg5oVYVSZ1sa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX+SD6u1jUPJ8Z
 I+RYEZkV0h009Y9258RY9T48FDsG5AzkQ8GNqXiRzAknDQ0BKVuo+TZr2zDE1JwLbwWtHhJMR2W
 IdjIl7k933jVaE7wr9mrrguEGRvfsY8U9zSGKi+m1RLjjrnDQ9abEgVHGJuNq9RmaFgPvKE11W5
 OZSZ9RwvpHgD2tP4jELq5Hbbh9fsOMGu3dB/9tyn2pwN1DG6QULZlzcLeAJQiBfoU2fK3mWhh/A
 DF52PCpLk5Kww8+2V6gp/n5ASsFMAbCeL7cSguxYE9f6k5ZgL/sqj8qcfHekEOUQ87N2LRfhBWu
 VJ7hte9iwMKPegsbhQzCL3UaUkbmkj1Tu2oJBqjCF1/u3o1QC2bothcQMfdhWuwubIFxxRV6SgA
 YD2QJEEvvmwG/V0w/GIraLXoEMRrNxGCM56ISsk2kP/9pnZuQTd/cfQYdXzOYWWq52G0dH1hhBv
 o6I8XvvpPIcgFWaL+1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The CSID latches the ARM architected counter into TIMESTAMP_CURR0/1_SOF
on every start of frame. Implement the sof_ts operation so that the
value is used for the frame sync event and the buffer timestamp, instead
of the time at which the interrupt happened to be serviced.

The register pair is latched, not free running, so the two halves belong
to the same SOF whatever the read order.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 5dce6f722d05817f43341d22560cbe32def08cf0..5da77dcd3471033525f6fecde547892fff5965a8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -118,6 +118,12 @@
 #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 							(0x34C + 0x100 * (rdi)) :\
 							(0x54C + 0x100 * (rdi)))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x394 + 0x100 * (rdi)) :\
+							(0x594 + 0x100 * (rdi)))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x398 + 0x100 * (rdi)) :\
+							(0x598 + 0x100 * (rdi)))
 #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
 
 static void __csid_configure_rx(struct csid_device *csid,
@@ -391,12 +397,27 @@ static void csid_subdev_init(struct csid_device *csid)
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int rdi)
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
+	return ((u64)hi << 32) | lo;
+}
+
 const struct csid_hw_ops csid_ops_gen3 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 	.reg_update = csid_subdev_reg_update,

-- 
2.34.1

