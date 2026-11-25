Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601980;
	b=kTv+GrWmkoqQ6cDs/XQ/k0je1NPajuV3O0sL9SjAMmYpBqQSu37TmC7lTGkVoCYTFdQm
	 kxIRaDre1Pr6bxz+p4SjrL7+0AvgXzRdaipy+U5/8TzO5OHB2AqcvPuS/vnF4r45WnNPU
	 H9t8PmenwUjBdHH4K4HSyrmPMVmmtShVio+CAosmF6E/6CB/kwGbxJSpvhpaoeiyGgjcT
	 Hh7hdMA+mFp+t8lfLD8gbZvczWXBGNHMVDdLu3R5+1muZQXyyg+lkAKE9q0N52sVQtmjE
	 7y7PogKIR9USmN/hxtUkGh5bMmQOTtVtcM/214SyxFPHx4EPH+A/myQD2m3uy4fkp7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
	b=1/XA9NvCOP/v8VXJkWReXa8tk1e9Lzv4wOQTe+3ysAvNWld9h2ofnFjnQnQKvv943WX/
	 NRbgtbB5X3U8l7/d+rI7Tcq/7Uh4h1Rb2BLGxFV6Gpdw+SGKNCTmFgFb1aETsimtsK4Z+
	 tkXcKw3Wo0sn9Uv3iXcFdHDPT2dQHXSLp1+/VfhoD7V3xTXI/jbUohl0aFGm0g9JDgYzC
	 Np1Qr/cp/5ij17pi5QTyTcMzGbsA775SV0NbLroYDMsQR8kE88//CEj16m82Q2yqgwtqY
	 MqGLon7TucLazSWaYkcj9JHnStTZ7J57aMIAtZnQcbKcTwU1UbfdAHihUy62Uf44uxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvZt5M7c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+AzXQRN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52CD606A696
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52CD606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvZt5M7c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+AzXQRN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNCi555513
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=; b=HvZt5M7cvb95m36O
	5ovMIkHPraDyEaoFtG9TsyNAsjv09qTqXYY7qUGCPItKhVqn5/OChqTWibSmlQYH
	knc4NvwW28yDe4mMF/UknJrqIcchbk8cLe192pK96NZUmbcw4P6jmqDfQGHsr/16
	Nae7t4Im/4FZVqNqsR1At4u5sUbMhQhNohzdNOIswVlrw+hC7LWpEQNvSKsWEv+8
	ps7XeHpE6fsZMAb/K480b23Gylzt6CZaN3TzKwIRvkhNOOn/sdll8c4UA33PQkYo
	p5rjVTV7wYnBADrBkPtc4mymx1ewwLmdqUKL/TNv75GWGO2FFJpOOYu4R5teh490
	NxoNRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnra0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1007501885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601978; x=1796206778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
        b=S+AzXQRN1BCwylBsAzwaNALXwFFD1MYalyg92TLVeVA4ZrGZiWJYvxXy/jL7uDZLaF
         dkt9gUTvZIpM3WTVPSygasOJbhKDwB6enRsrd7zFKH4jnePBSD8tIoM+pIWBWA5iPCcL
         iIWufWE9Uju8DZ2rAsj13kqsuwjdRgJ1TmXrwP7zH3ZEFWMW1e2mEpI7rK7jhDwhLsrI
         wvlij9RlpcN5OUthroo2dhbY9kBsK2AEQPnGJDqOAJfcFpBbIU/OtWt3pdZq0AwIStoD
         67IBkeedSyGxdfRn2SYWIMJYPXoUK1FGd++BbUkUBTA42pE6ukPObYDed5iq/VvhitLH
         HM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601978; x=1796206778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
        b=EZQkNnFRyd/3eLj09+xfIYsSISeEaQ+JNCBBxIKy+P5SWuMm49u8sRnqgH9VfPFX5g
         Gh+0CQ3enJt7gX1EJsYhmXtZcbmVzeUjPqrlFZwjzKfdTDQSFn44ZehYYA7CG0nSMBAB
         yu1cHwsuAHBH7wyg5QSzaHvItgH4aFfu0vBhtlUh1jpOrIH8mMhRXNeQ1CtedLmZoptH
         LbUrtCCGwH75/7g4YosEaPW9waqkpjfmXzy3sZy0iCyGP5eJsrOi3S/BNa6KALWvU3Ue
         bdRLsWFqzxq3XHxfLYbS9G1qQuh8D54R66OhClpBhC3sty2SAhKbfmqLQ24PSsfU0eme
         53WQ==
X-Forwarded-Encrypted: i=1; AL+hErFYLjW2sUIwZIgUQB/4gnPt7mvcVfqSFE+Sm3iqWj3RXpR95XgSO4TJxH3LaVlHbn3wXTuKNIA0WkKsMkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6NI5aJr46FTgjtpJl5gFTnIrTDgfINWZ6ZrNX/gz+Jpq0EdSI
	o/P4yxYDbU89nZKm6RjNrugF7Ikevp359j4zYUQXrSxQHuxkSALLYYXHMmrShuopUrwQh/zIg84
	Cqta0RxTGxTdWsq16GBcwDE8YJ6dv+2S3csnI589XkeujE3SmK1qVxaVQjf/XaqRYWWN6wW2cdv
	pwDg==
X-Gm-Gg: AZFdTZfFkQX5g7cVxOuBGW/Il1EQASTi2WgpKkJj7G2658JpkDHgMW/XKuacn3Hng9P
	DyOLZewgZGh4qbsaDtluk9/XJL3+BrgR1cr7qQZCC3Docb7QYRJeHr8bIMD222l/PIv5ikyE5EU
	XhhK+TqZF4wUDx35rRsoXaIyVTyzB9argfJmRiKKpnHwyfQaR4KzA+Ebi80tFZmyko3GfQjfwKF
	JCcV1wb9H0FT2f+tGwWqRy7BbtF/UvSwigkpcgjUQLz3uKiKo4qB+lBgQD0ZWYUk6/fUy415cl1
	IpfQ660dxxkrwTDluHwYiDyAzOy3hhslfnHUvkZBKfB9CFFbsPB8qGhqCGWVjH/+JI6FuOX7lQ7
	/MJOXnAed9Q9FZbSbaCBYfpHk5pPt6RhCxHu8rfOlbd96YogI/wo/IGlylzHpX2ojuhkMspYTh3
	N7nsUct9hk4mNtH59w+VS+wCQIGlt8kQeOTObgRB2HTT+y0p7qdnfUsRVCOmMTgM7txqoYcJ07p
	9iKNFdWncbAGtKTiZXYDCdF9ga/
X-Received: by 2002:a05:620a:6484:b0:939:fde0:a71b with SMTP id af79cd13be357-949ba6c4bf4mr2958871785a.0.1795601978023;
        Wed, 25 Nov 2026 02:19:38 -0800 (PST)
X-Received: by 2002:a05:620a:6484:b0:939:fde0:a71b with SMTP id af79cd13be357-949ba6c4bf4mr2958869585a.0.1795601977545;
        Wed, 25 Nov 2026 02:19:37 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:36 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:31 +0100
Subject: [PATCH v2 7/7] media: qcom: camss: Tell userspace we're using
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
Message-Id: <20261125-camss-hw-ts-v2-7-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX9YQvv2j3IL/T
 Vau6su6tUMMhChNlbW9g39Am9Q+AgK4nvlsCTGNpZc7jfDBvIP6IemldRaonAvpkB3fx600aX5W
 Sk9E5m0ShhvVS4ouAozES8BjDTsM49sOEYtWZ1rEjDx0wkpU53lyokK9FtYHjuDFyNlxQM0Ltpf
 rG59Mq8OJbWahj9+KajJ5AXn6yYLz7O9KO6wG5pcQvejKYhDiQBne9cBcucG9gVoQrDMqVTt9m4
 yXK6q2M48iUubELHM1DRVqH+ytYuIDbC4z5wGb0viVKd7yoaAIofy6oJrKOp+hGDS0IRuBT9tho
 KzcyWUEB9jaQ2fh6A+wFYU/ZrjZK/UuFMvygE+d6mjuK6JCR60uNk26w/q2MQbEqWP7xypuEd1w
 91QSKO28zoRYHlJ+183uUZrGlSYZW/CP6VmF3lLiFcAo4eYPjKI0Ucge4dg33bhd0hKZIXwL7cf
 Vm0sZNMG2Sb+clt4DWQ==
X-Proofpoint-ORIG-GUID: oi-Rq-TaQTWbdxTRPdYuU4t9A4EnpOQl
X-Proofpoint-GUID: oi-Rq-TaQTWbdxTRPdYuU4t9A4EnpOQl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX9hWXKXzcmolv
 OP2ocVJhmgTKOxPxNwsl5JFCvjIcgpsz5qLeIT1rFm+iLmBg8ZXV0lxxdZmDl587uY5ISSomUyS
 kGIILGZvHdB1TI6Xmc6zPHALsQpfL3Y=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b63a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=DYN1bkTOkzx32VtlnxQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On the SoCs whose CSID can track the start of frame, the buffer
timestamp is taken when the reception of the frame begins, not once it
has been written out to memory. Show this to userspace with the
V4L2_BUF_FLAG_TSTAMP_SRC_SOE buffer flag, the closest the API has to
offer, it is defined as the start of the exposure, which on a rolling
shutter sensor precedes the start of the readout by the exposure time
of the first row.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c |  2 ++
 drivers/media/platform/qcom/camss/camss.c       | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h       |  1 +
 3 files changed, 15 insertions(+)

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
index 26e3f2aa3ef2485e0486eaa89f93b804926b6e32..ac99e84b94e73152b82050e6c6727dec238e188b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4839,6 +4839,18 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 	return 0;
 }
 
+/*
+ * camss_has_frame_sync - Check if the CSIDs can report the start of frame
+ * @camss: CAMSS device
+ *
+ * Return whether SOF tracking is available
+ */
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

