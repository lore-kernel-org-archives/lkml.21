Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795919;
	b=JEO3YcRiMwSNKNvDu4KcNOtXFz2KiOuzW5x+ESMRLbpjUtWhr5lhX5oU2ktiA8MZMKjz
	 kgqsbOluvOlJ0o77hFopG4vxtdZg3TSMXvKS3D3KSdR1Y/yiHsAOxaU4qd9MaOOTv7sB3
	 UDb8gJGLIAw/Ers047ZtC/90UaQGDex234GGixV9Jyma15C6osUMkhIDlkYWLc1lDEk6R
	 ZqD/QXekjxyEbUNGZxb0etGEZv6w3CgVjIx6vZ/JYdlBzSneVOBkAgiOpijkDq5X/M+p9
	 1WmrIWE0uoIyXKuHfUDm3wRcpoKBFgLbXZiZ8WLkXDSwBwdj203CsAhxZtjG9O+ue4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=;
	b=eLQ4ABc6K+I6BbvcYa3IRvTfbvRorl7II4eIgeaekYk6ozvh0djH9iLOZMqDDsZ701ke
	 FdR3QmA++EjCjRBJiGd/uSM1xWjrEFOFuODrBTZZpTEwrel5x+3bX9U4dsfTxdwSRzpIK
	 Xbww46ECrgBU6L/GrcgfgaK7p4gpx46oiSghs+bZIEch8CRGKYaBRZIQ5W9Dzk5s/xyDk
	 YQAJpy7VuS31oFcnlcJi9o2GalV2YwbS1Frd6Vmiy+3fWCAGJhao9QwJkl8MBs0Wplptb
	 u39phufY5yZf0gf5sQeTKDZUkUj5NLCv1B6y74IF2Cxfk+otsv2kkx7vwR+R5iCIq6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JIRqjXJU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS06lRa+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B1606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36B1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JIRqjXJU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS06lRa+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpU832211137
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=; b=JIRqjXJU4yV1esiX
	8YqP/dzIhowWvXwstGoqxkdOTrkpHqfL1StjG4UtX6daTpaC30llCw4V4L9AOsqN
	1srNlENNfoT5Eb9DJX9v60mUegKvGyABQUMRLi0IXL8Ae4UVF1D//ILls8/XJcHw
	6D2ZNaJjQXg9Rnu2tYPHuiWfRUuxYK3h6wVvovhRVkt6Yyz/w2L+687Bk/FlwBXG
	6mjsx1gnJY3srJq+o6FSHicsZOWuX4ovP1Yi/DPuJ7bEE3pMVxjCvEvQ8JA29Y4a
	RKVXH46CxxBbGlwDyCLcbjtEBMwzGAQxf3IBbTRv9wTaUBQqa9ggFL+5clDSLGKS
	pTMkGg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55uqya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:11:57 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b30ffeb2f5so108574147b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795917; x=1796400717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=;
        b=aS06lRa+8ZOZ7Rgvgy94gEFQuX+Iez7wCX2l4LibJSMB7qzCxnps5TFRvUnDj6JnQ7
         grFUPG6LOBRxFVoMZToKDlLGGUelU0om7Vwkri0U5ga4bSFLzgp71bdywkmGu63W3KWX
         twnhVBy3tPxjgY89vP/VWi14kqriJRKa7GlBi9kKh7+FX/FQoWOSi6vLJqDOCHy0WFS+
         CcObiQHU8D5LDWU8k8DET+PEjWAhfTjjeEWT9RrHVaDihZXYn6iEwpqRapsIEZjLg8wz
         3cXVx+QI8uqBsEeIxXcxOX14hlYzdwY6LtsTPyDLX3hK5yHVE5bJszevLgauRtY3iCLZ
         ieLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795917; x=1796400717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=;
        b=Am2u3ZvE2h8iHOyHF6cOzJ5SyBOcX/jWfmkUybqrwBiD4WV32c3jUe9K9S369+XmWu
         Tz7MrEO8bv4EzVZT3Z1znYKrgTjoa8ChQcSa7JNm2I2W7Kg8c+zHfZniCGRpcSc4O+F/
         Zjq5nn6zJ0gTyFdwUWxLNMJlAesmBHxyXGFtYu2+pac8TDTichV58MR9895EVS9fSMAd
         f31S1VZivFFCHUzYqKcF45Lpi16xr8H8rQ8mesKt1r6VviPRf2ZKpYxLuYWEoxpH5DAy
         YzDM7rhMByJ9+8CAxcwfunAL+V8Gr3a17eLHRBbDIO4fFxxy3jQJZIQtJ/LlT3w79fGH
         fPlg==
X-Forwarded-Encrypted: i=1; AL+hErF0a+uxEILgYhLmQd3rspbC4vZwEshRPm4aN0hT8LMu/GOiLVL4Tw948B666e3V9/PgOCjf1z1qizylfzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9/U5oNymTGPiSIBiEP+mEmG2XWm6BkuAEiov+YTuyA502GVcb
	y1P9FWdWU3AmZMI1dnwAt2nSKUvdMyybe013i4uvCDbSYw/ZbVllX9GVZNLkzopjGrzum8DQOcX
	+rCTdZN4epSXe8En8Z1TfYaALhhS4yHGBm2t1GPAQfaYLldPuaGA9IiZlP+cLT7uIKw/9IxIVvK
	TPtw==
X-Gm-Gg: AZFdTZfaDLAKr6Da2Hrwl6NQqnO6AqlEQD/CDhnjRdDtD9xmq7Bd9P+VKBShIBq34P8
	O40ZiFyGXnx7OSFFExMTCLYZCqT+DvpbEKe/I4/Is87jrwvva3rAg6Amb9SMJAhrrhaiqRxKyam
	eAhU4io2i88GZZ0pF64h4zNwD97mXcDUMgEXGIfBpZ6Hbn/N+/Om0BRO1FRLLU4YjgINV9hX4w9
	OLRyTzyagj3Fc0Eg8jCI59+QSFw4zdP0j8oXFN0SZB9OkFwxZxEczKR4szPyRtV1VZmrFhNmpw9
	Hnflb3I37aTLf3kv+MKwDlj2HNnmTbk1/DCNPXP6PFh7kMe0g8e7RqavnT9Bq5eMfWv/9vgO7D+
	QP6s1LBTFMSO/kCNRonNMliyeKlny3Uol1tTY2RkDvDThC4HMFgF8g2Nm4mEuNnFoMRCIBFLt3P
	PrKwGt7Gpa/ZSIrs+qwcz/kCzU31dYrrU4rS6Ck+VyavYavSIIt5P7aV47PZST4bJQltn24kmHy
	lauPahqwUQpDVUVZjFZ0XWFvIut
X-Received: by 2002:a05:690e:43d6:b0:67d:ad6e:f90b with SMTP id 956f58d0204a3-67df43d0911mr6289377d50.31.1795795917075;
        Fri, 27 Nov 2026 08:11:57 -0800 (PST)
X-Received: by 2002:a05:690e:43d6:b0:67d:ad6e:f90b with SMTP id 956f58d0204a3-67df43d0911mr6289363d50.31.1795795916435;
        Fri, 27 Nov 2026 08:11:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:51 +0100
Subject: [PATCH v3 1/8] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
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
Message-Id: <20261127-camss-hw-ts-v3-1-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX2ek3NJZR2XfO
 Cl8SJzn0pQcjGks7ANCBq4Iot8J74NAPnT5hKQIyO5AyqkjH2k2rSpjUR6E6lFSzy4K0OhlCJnU
 isWwGM5KkftWLRziUdf4+F1J/bgQFBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX9v2DgTaDF2R9
 ee82MT5PA/f8XH5I/KXFabPWjOc/QvXFIGa+j8+G2O4NsGbUHxZdCBogZOQ336RvpeUUDkjIMVI
 siEZ6cAsVWgpJs7ea9Yy3Gjz87mvAAI+pLCoUlDIs6rcU8/sjBXszBc+3oBSHz4pZn20i8cVNVe
 aTQ2d5+8obib9B0QQ51tLkaDgXQ/FHRcFd15+i6uBjvEPS5cVwotjkjk5q3fXEm0c57JkvEBrRy
 G73KXOJhA+7nPEhtp8zgLOc4UwwJLizIGdjrJ4TEHs2a8RYWv3N4bKmjf40FpTRmZiMZEY5s2pF
 +5y/8P/m3VR6m/OhJnouSTtTRv7JofNTzad2+pjwV1xK0Lr78MOhaWDequ/FL+lXREs++HJp2Q1
 SH/in4MxbejEslq6gCL4as80Pfc40ajPnng+aUmV1/r+6o94fD1k9T8uByfyKO3x2MEA4viE0/N
 nTzlIVEHC96ZcCIOQvA==
X-Proofpoint-ORIG-GUID: EPBzLQwDOAme8K9ogJmeSJftca8W18OQ
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09abcd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=n8IlR8rfZ27013JM:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aSPAdgkBS_4Hla2pHDQA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EPBzLQwDOAme8K9ogJmeSJftca8W18OQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

Modern CSID revisions latch the global timestamp counter at SOF. That
counter is the ARM architected counter, so correlating it with
CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched value
into the time the frame actually started, rather than the time the
interrupt handler ran.

Add a hardware operation returning that counter value and do the
correlation in one place, leaving a CSID revision with nothing to do but
read its own registers. Keep the result for the frame being captured so
a consumer can pick it up the same way it already picks up the SOF
sequence number. Revisions not implementing the operation keep reporting
the time the SOF interrupt was handled.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 112 ++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h |  19 +++++
 2 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..436478fe1f65642ff11ae3707df726d619801a8d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -8,14 +8,17 @@
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
 #include <linux/clk.h>
+#include <linux/clocksource_ids.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/timekeeping.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -37,6 +40,16 @@
 
 #define LANE_CFG_BITWIDTH 4
 
+/*
+ * The CSID latches the global timestamp counter on SOF. That counter is
+ * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
+ */
+#define CSID_TIMESTAMP_WIDTH	56
+#define CSID_TIMESTAMP_MASK	GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
+#define CSID_TIMESTAMP_NS_MUL	10000	/* NSEC_PER_SEC / 19.2 MHz, reduced */
+#define CSID_TIMESTAMP_NS_DIV	192
+#define CSID_TIMESTAMP_MAX_AGE_NS	(2 * NSEC_PER_MSEC)
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -779,9 +792,11 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (csid->phy.need_vc_update) {
-		/* Set to -1 as we want to do atomic_inc_return to read */
-		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+			/* Set to -1 as we want to do atomic_inc_return to read */
 			atomic_set(&csid->sof_seq[i], -1);
+			atomic64_set(&csid->sof_ts[i], 0);
+		}
 
 		csid->res->hw_ops->configure_stream(csid, enable);
 		csid->phy.need_vc_update = false;
@@ -1370,14 +1385,107 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
+atomic64_t *csid_get_sof_ts(struct media_pad *pad)
+{
+	struct csid_device *csid;
+
+	if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
+		return NULL;
+
+	csid = v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->entity));
+	if (!csid->res->frame_sync_en)
+		return NULL;
+
+	return &csid->sof_ts[pad->index - MSM_CSID_PAD_FIRST_SRC];
+}
+
+static u64 csid_timestamp_to_ns(u64 ticks)
+{
+	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
+}
+
+static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
+{
+	struct system_time_snapshot snap;
+	u64 delta, delta_ns, now;
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
+
+	if (!snap.valid) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: Can't use hardware timestamp, no clock snapshot\n",
+			      csid->id);
+		return ktime_get_ns();
+	}
+
+	now = ktime_to_ns(snap.systime);
+
+	/*
+	 * Translating requires reading the counter the CSID latched from.
+	 * If timekeeping is driven by something else there is nothing to
+	 * correlate against, so report the time this event was handled.
+	 * Below CSID means clock-source ID.
+	 */
+	if (snap.cs_id != CSID_ARM_ARCH_COUNTER) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: Can't use hardware timestamp, invalid clock source (%d)\n",
+			      csid->id, snap.cs_id);
+		return now;
+	}
+
+	/* How long ago, in counter ticks, the timestamp was latched */
+	delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
+	delta_ns = csid_timestamp_to_ns(delta);
+
+	/* Fall back rather than reporting a nonsensical timestamp */
+	if (delta_ns > now) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
+			      csid->id);
+		return now;
+	}
+
+	if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
+		dev_warn_ratelimited(csid->camss->dev,
+				     "CSID%u: Too slow! SOF timestamp is %llu us old\n",
+				     csid->id, delta_ns / NSEC_PER_USEC);
+
+	return now - delta_ns;
+}
+
+static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
+{
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
+	u64 ticks;
+
+	if (!hw_ops->sof_ts)
+		return ktime_get_ns();
+
+	ticks = hw_ops->sof_ts(csid, id);
+
+	/*
+	 * For double-buffered CSID registers, the CSID configuration is
+	 * only latched on the first SOF, so no timestamp is captured for
+	 * that first SOF.
+	 */
+	if (!ticks && atomic_read(&csid->sof_seq[id]) == -1)
+		return ktime_get_ns();
+
+	return csid_timestamp_to_monotonic(csid, ticks);
+}
+
 void csid_sof_event(struct csid_device *csid, unsigned int id)
 {
+	/* Read before the sequence number below, which arms the first SOF */
+	u64 ts = csid_hw_sof_ts(csid, id);
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 		.u.frame_sync.frame_sequence =
 			atomic_inc_return(&csid->sof_seq[id]),
 	};
 
+	atomic64_set(&csid->sof_ts[id], ts);
+
 	if (atomic_read(&csid->frame_sync_users))
 		v4l2_event_queue(csid->subdev.devnode, &event);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..f7c0935ea25cee5ac87cca470803a7391c12f9f0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -111,6 +111,15 @@ struct csid_hw_ops {
 	 */
 	int (*reset)(struct csid_device *csid);
 
+	/*
+	 * sof_ts - Read the counter value the hardware latched at SOF
+	 * @csid: CSID device
+	 * @id: CSID src-stream ID
+	 *
+	 * Return the raw counter value of the most recent SOF
+	 */
+	u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
+
 	/*
 	 * src_pad_code - Pick an output/src format based on the input/sink format
 	 * @csid: CSID device
@@ -179,6 +188,7 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users;
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	atomic64_t sof_ts[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -279,4 +289,13 @@ void csid_sof_event(struct csid_device *csid, unsigned int id);
  */
 atomic_t *csid_get_sof_seq(struct media_pad *pad);
 
+/*
+ * csid_get_sof_ts - Get a pointer to the SOF timestamp variable.
+ * @pad: Remote pad of a consumer's sink pad
+ *
+ * Return the timestamp or NULL if @pad isn't a CSID or the CSID doesn't support
+ * SOF tracking. It reads as 0 until the first SOF of the stream.
+ */
+atomic64_t *csid_get_sof_ts(struct media_pad *pad);
+
 #endif /* QC_MSM_CAMSS_CSID_H */

-- 
2.34.1

