Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795930;
	b=fwd1ijj2UKV5jBwMKfWosyDTCsUjHyGVQOULv4ppwP/w8vj6YbrYh8zpBjRblWMBZ3gf
	 4by10hhh9Ve4xr14dEXGM7XD8rL/pASW/r9q/xkjmC6S7X0V41SwNwOB/uPHBckzjV2bP
	 srAEc5CkYsVRRPCdO61Tz4GIlWVON8rX4StY7S81LBojraa2SbJaDrNh3C9H4idgCbd63
	 Xbpa5prcS7Lfl2DfTLo1dR6IfgmOo9+4ryy4uBMz7kycDR1nvOOD+EM77TtnFacPWrf91
	 viTMTNOk2T5K589//ZEnDySEe92lQW0hJrae0j3R3CZyl+aaPON70FdIAKOVhvWxdJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=;
	b=2lfR9+c+4haZPF05CqiiGAlOadvkkfP9PrT01clf301q6fGeI2Cwl0vwoc/ndacaJm/U
	 9EqtN2FmNdTr+MaGV7okh/hMxcRelk0dLcNoZXeZt/mxVCZUytPZZNs//YjMuSnkc/+cB
	 NgJ+Y9jhUnJdjIuu9y/QEa06Aug3+gIHt73aaasEEC47ta/nayuzcSyvVHZyTrwSdGnXQ
	 7B0nQNlLEUleZa11Yi+mSKIG55PczCo/y+qcOFI9zf6ByC64hYchRq4S02bE+GIXobiW+
	 +dm9q3LEju5e8K+ZYDDb+A7Rqlh57dtBa9qphfA+TAtEQ/CaR54Tx09csCOYFnWwcrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLIWdi0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIxcFPHH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34E606A69D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E34E606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLIWdi0G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIxcFPHH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpBCk3328919
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=; b=DLIWdi0GgA5rUN8h
	8/1hpQQpGSq+lwjf0YJLftwcSykkhGC5UReuQ8Vs9yeExP6lK4tnV88mjXlFGlF9
	kWankrG1C8iQtOhIAAMAbUikU4+Nz/MLUlkD7p5fbxHViGstifd1or2zuq8X/L9o
	IX8vMOIhax6hrelaRbIMGdyiHvB+NFxMzgS1eqq+oOMI+dEdaGA6MrZC1X0cUrSu
	F3yHufhFVMf/xfk6k6fIZDPAmoWPzkT+KfzCVCwDeC10yy8jCctNdxUWuSC2Xt6w
	QdiwIBbsQPGyqoPhvY7+KOakWx5xI/kWJL0tWtdHNluL1NrKsM8D7+nghF6zzxq9
	+shRNg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gha4sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:09 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677c2db10b1so11978408d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795929; x=1796400729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=;
        b=jIxcFPHHmGE0kej1GeVF7EGe44tb+xaPfi8U6b028aDwgoUJkfS2ChKT/xmipleLmV
         MBVGVyPNngrrtuh9bvl1jeZnTXTaxvet4F7m6sJb2xFdVl1w5iUX4KrSsvr15DjkozIi
         81VmG0ipzYLzj8r8yLc1sxsjfHGkDItQdS8MkfTU4MUMs4qMLWw7TN5TbLQ2d86mUSpW
         xTZ4Y6uQSUv1HojJb66NHN04oXhfKnqoFvWgPj91EeLEUWqvMHdNowqpsQyu7eefDdGq
         Vf5sAFzg/GFqULiv3WhZPKF6WsZ6om8NZLtmmkzy5HHyVQVnDbOOZUiufsVrIKyMFiCf
         L2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795929; x=1796400729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=;
        b=DsZXM9fqknzidtij46W1PmTgK8/ZH2tteQdY8p+xc7AZI6KvV04dqvF2sg7HtIxc3J
         IzwVL3F4wfZzXQtO1oR1YmPJbshr9mc7E1MAVlH4VzsDw7gKGlqGRdSmmOBErOAXupkR
         fxS6WeKbgJxdLkmvlmAiZCxGKz6awUzhsK2ifeXExU1fE0XZsOGZK2Y/Y/mHSMwjBRpY
         0AgBlSnL2nIqKQVWdwirTokJ6ZRPN8glshO+eV/kEiqsKL9MsjwEybHzOMPZAJxOTbp/
         +xZmhE+IDN/fYJtQ+J1PUTTSkIzYtsltjftqHI5rGw2rV2pB2WccSeu/rAQDnJqLyA85
         nYHw==
X-Forwarded-Encrypted: i=1; AL+hErF9nDxBMFumtVnKVcxJAylsVumyCt+/JM4eXHQPM9dYpnR+UGRJl+MFy3lOp3c5RT9V9AHFzD9vd3xIdMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sBEoyvPX25Y37VsId9Yh88yZweKXvx/UXCeDPPg75bJ/YiKaf
	uf0eIBVIQgTKVLHcKz7mVYCyxve9wybXGowG4/3KcgHuT5vCLrql7XxyHTrq7prnouL9RxuxFHm
	63AhbqYTQAZ/uky+ec81bwsk7bc+bAQzHY0cQJy3IM197jewt9K5qEl0zulWuBBgDL4M=
X-Gm-Gg: AZFdTZctqBKgwQBHUy5da1Y0zA1wbbjcZ0YKrIKnu8xU6np6Rg4/GvIf7MzujHmGprL
	ZXVOYulQaNor/r19MnHu92twQ2k182Di/VkQWbC37wuuvx7q3NWivP1vwn+5BS7FQVac1kL/bkd
	QQtPIo++01xUiIgTipOe726wgkRwXo/7/DPm19vQtdV4zQ0Adx2ESiG4zD4LQIwpo20qPc8NSle
	8pJU6u6gsN+HDs6B93uWbzrkllODQMG0pWzF6g85DdWFZzJUIxNSSTSM2PJzOBxP/Dwrpfma0H6
	bHGV9XHwUs+mQJGU65Unof7GIAbRVHn7Oa5N1rto1g03I7VINWL8HWytrdLcXG9nbEEbN9beX7n
	OOnqikOhkoizHzmoT/zQTRSHFOfaOekFIwtn18wOX60jPZ3BOutz5hgtfysAawc3rsC1+alcmkc
	/S5t9Qju2wlJEWKdeQmw06HCNuIOVikDzVRF+y0zDMlw7RoXNWfmXqn5+U6EG9AT5fyV2nvRbHV
	y7Cwkl3DLlVObUk4YQTmXjMuYYF
X-Received: by 2002:a05:690e:4282:20b0:67d:b299:df55 with SMTP id 956f58d0204a3-67df44c44d1mr7379299d50.77.1795795928697;
        Fri, 27 Nov 2026 08:12:08 -0800 (PST)
X-Received: by 2002:a05:690e:4282:20b0:67d:b299:df55 with SMTP id 956f58d0204a3-67df44c44d1mr7379267d50.77.1795795928269;
        Fri, 27 Nov 2026 08:12:08 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:07 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:58 +0100
Subject: [PATCH v3 8/8] media: qcom: camss: Tell userspace we're using
 start-of-frame timestamps
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
Message-Id: <20261127-camss-hw-ts-v3-8-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXzG9yfanU8EBi
 FpPRLbnMzKPjoRv7wecGiYmyIIPr38Fig6RxFDJaokrNcK3DJtlMeHMF6JeZxptSN8lHZsi5fkd
 GQRzvnOH5DRI1hBF2bfQsmEMacbQqw8=
X-Proofpoint-GUID: 7SKOSdJSg2HtRBHEXbR-V1izGsKzSfuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX6PpZCCbmPAYX
 XGOeJMrd0WJQk0ZljbzKBOSU5P5Gh3IjBRkRvcEXbXUNj1sQH1HUs+flSiy/vG/oKnSNIplPhE/
 LIVT2TzcmE+lv7MfZbqpFrAUQJiIaKXVcwb9m8oXF27OX/TSUGIrFqvgWB0hGBtglvfgyQoRKTr
 CbtedGWxVWkFtt3ZAmh+Ga0Ny8jQ1yqeObRGiig4KLmRZWxZbT6E7VSWjasm7iFeb6o3awmuylR
 ODJ/E80vMg3Byr7Y0LBezsesWyBzpLHkCbCYFQ+wV103w2KjjzQ4H64M8kDxPhaK5desklwqEaO
 UMytc480C40pv0eAr0W1fDNUWRKe+gZZkDo3nG12pECfZtOk9jR7DPVU6i2AmmYijmlmkrfWEXA
 DKFpJ2/KLX7DN4AwYY5gANUPo2XRl+cBaNyzsjP9fIa4Bv9sZwlD0R6v/6AWb6UIPLi9/fNFai0
 a1SztpR+UW10mdWtjHg==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09abd9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uxdOUlAlRnt6KrNjghUA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: 7SKOSdJSg2HtRBHEXbR-V1izGsKzSfuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270064

On the SoCs whose CSID can track the start of frame, the buffer
timestamp is taken when the reception of the frame begins, not once it
has been written out to memory. Show this to userspace with the
V4L2_BUF_FLAG_TSTAMP_SRC_SOE buffer flag, the closest the API has to
offer, it is defined as the start of the exposure, which on a rolling
shutter sensor precedes the start of the readout by the exposure time
of the first row.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 2 ++
 drivers/media/platform/qcom/camss/camss.c       | 6 ++++++
 drivers/media/platform/qcom/camss/camss.h       | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ecc76a2863e536fca1c40ae6b2de6dc0c..4ce87527b9b984068f5c9a9cc3bbdca645cff1d3 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -698,6 +698,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	if (camss_has_frame_sync(video->camss))
+		q->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
 	q->buf_struct_size = sizeof(struct camss_buffer);
 	q->dev = video->camss->dev;
 	q->lock = &video->q_lock;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 26e3f2aa3ef2485e0486eaa89f93b804926b6e32..e60aa29051e71cd70bd3564a01655251ba2f37e6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4839,6 +4839,12 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 	return 0;
 }
 
+bool camss_has_frame_sync(struct camss *camss)
+{
+	/* All the CSIDs of a given SoC have the same capability */
+	return camss->res->csid_res[0].csid.frame_sync_en;
+}
+
 int camss_pm_domain_on(struct camss *camss, int id)
 {
 	int ret = 0;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8154fab54f99b12456cb377dc4ddfcadfcf8278e..da1095c436323639bc0fda5ebac8026a09565108 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -177,6 +177,7 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
+bool camss_has_frame_sync(struct camss *camss);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);

-- 
2.34.1

