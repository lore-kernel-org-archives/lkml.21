Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601979;
	b=YOwIo1YxK1Tvca8YX14Yr88pSYZAis2UdYZVxgSbJJTWKyw63Y2v8TCg0cuV0UvF2uLU
	 lXloBJXYGHozashg+LBL+yA3D9yMBSUMNKkWtCQAqTImRgaFz0DdtXOHVEZBQQ8Q3/+pO
	 ZCpPuT4OMT5RW3yLzZur0SWCmWD6FUsDaPEsS8p/gcZJJ4Dm9oXllS/dH5Hu9I0pUQG52
	 a8yqCGqQ3cRlM+Mgk/1eX5nWyVYVNYIt0e/z5htJC5hnM8UTcyQoDf8XqabjhK9jdPW3c
	 ws+DZFZ4D1mSGMkAdq1Gx+YVLswhYRRnwIkBI3TYseUAY0HiKoNeXDAEQ20sPl9vM3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+clS1iwmVGvcRVy19TQZNCqvftNMS6d74xTJYjQg/FM=;
	b=YplgCUFczE3s10AvG3LZhVFxTFyH7noyANf5LDeB0ZdGTZFJceR5fZ+ixtAWjToksUHx
	 szlajgjAMMPGm9DrhkUBHeeIUNIGkBjlrOMe/sp+6iYWy/dsB6TTeBXAWuVJPlmOMPVAA
	 YI/nZ2l2+o+QtuvmKF8UikiYMM8LF/zp3BCmMRJ47Zaj98s9yQj/pZp1WyXwcFCjf2qj6
	 v8lrGixbJ8e+bFq32mt8EctmR0pb0QJif/asDbq1i3OKuxcUWUE4KBqyAU7ArVQcmH8bx
	 8iFI3lk2V0BswwzurJTqsmOrr5Kc+Eg3CO95zXW6cb2qXwWT6a17j4iL7NvuFEZV9ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMdIGVKG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRI2H5LY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB61606A69C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB61606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMdIGVKG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRI2H5LY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCUR4130803
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+clS1iwmVGvcRVy19TQZNCqvftNMS6d74xTJYjQg/FM=; b=UMdIGVKG1A4iRp2o
	C/bThVUYFU/eW12U3ankQZFVBUE3/NwxMoRpIZtsohvT/rYQL1ZSPPlcbXbRJmpL
	xybYVdqnLAGMS99uQWRz/usvgIQ4DMxfsSLDcrvklICbcHN3+A+N+qMIM4+PnPmJ
	wBluzq2zsMdgPpzZgQ//2/xlR3RwxfdEmh8hSBxrTB81xUuveBe9QlcDnfWMwbdb
	MvlOnTQiDRKir89EpdSIC1WCDBhHw5+HPpBQcTuIK8yxWj+yxv+jaUB7Yc3DXiPl
	3xCk/7fCvJH4cQweAMI1E+BWollWy6wwxtacJU3dPpVSlDwO3JZsHe1y0rMcKPS2
	AYr5eQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrb08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949dc497896so405143285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601977; x=1796206777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+clS1iwmVGvcRVy19TQZNCqvftNMS6d74xTJYjQg/FM=;
        b=FRI2H5LYw0DrdjAFwV5w9aQxHDgR9z6te66kza/1qkLCBFwUQBbrxzpo/ktluLWM/W
         86VK9zKGD917kjGuCrYEscidGwIaNQRK2NxvRYNTGErK9FL+i5DnZjqoDEj5tlwubxKN
         i7B1O0ngifuswY2kL9a6r1gXHWrzbDEQSxywTpiPC/sIPeqd2CuegrT0em8qCYMlmw4V
         Pb/Yulb+JXEdpzeWZqV8zr+xn0QAjdG6oR6RLBIGsl4Iy5yF85vH8L6ko9h6K6MDEx7L
         DzGO08VGr8oL94K8M8ATybh+JqoDofLpQpqpyGpw0rIJSMHB5RYTuXvGmjthCQgeyz2j
         A1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601977; x=1796206777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+clS1iwmVGvcRVy19TQZNCqvftNMS6d74xTJYjQg/FM=;
        b=SSHfOqd6HmiUatnM9g5dC0ZoF201WfqeLVf+AeYRKg+bxprYL2Gfgo6oFu1wmF4aZQ
         4wuHi2lrl5wZOP9APrKIU1YNcd9KjsTASFIL2rt6nm6LFw5eCLt7JaubxevOFJRAxmyo
         7uywZdjyz5Dm9ynv7VKdLWRXtnUcARwuVuhkwR/lfDWbprQUlxFlpXSHj+84D7OdWZXv
         QfHlrwjFytJA9/ePt+iRNNkLn46ypkc8zUDAdA2mJWZrWnvNpPTfYGUsSzyL2Iq7icI5
         Q38gdD6D0OO5taXIKSP1IDMamgcE6QWWfyMkXMtiGhAnclLHFDfuMBgRp1g72mgBVQrG
         FSKA==
X-Forwarded-Encrypted: i=1; AL+hErE5VLrcZlwgnLAaX8LQw4yttkSXvHoxHtsCCnCcnQK1RBzO1QpVkryNvj+2OfEL1JC6wTrvJN0aTWJUiYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tGZQF2VAdgH84n7pkmFwQEK0JtoW1WIrXenywbgELTl9nOSue
	HT/TGJFHNitKbxlMXkxnatTbk4t5tpTOsdZkE7vn1nisYr9b3VXmoeVErHeICsrSSAGvtaoKtnL
	pt+MJzmkbGtd6ImW6xP8SrsqK3+0Wgd1iLfKh0HJd0L1fa8ssT/neXDH+fmiWVyl/4kQ=
X-Gm-Gg: AZFdTZfIPEo+iXwDm9K/Ueq3oSnuaqWY/DT37Hf29+opChFOlauZol2XlwPmaCViCtZ
	LG+AtkisPUmGdQApMc9qCHPjP9VzlSJppI9L1OuS5/n0mLt70HXk1z81umFvZ/ONbBkuw/X5dq3
	5bzye1PkWqmEFcNzSHAOgxWJG7Aolf2B/psfLux1frFnDSeYXjskFaOlHF4tUnoqRO00K/1XuWm
	Gv2eRQEmf1GzyrvIh/HHYL2qykgz6aBonS6NFLKWiC26YuTKM0fBf5rDvxrkM5DWhhsWVtnu9a9
	nlxXb1cerwALX4I10avr77OZhpNImylG3GdjiG6AkjuavkD/nSGfCCiokKC0GJfb/hzTzsaBpK4
	BUkuckJKvMoP/EaBf85XoMEMYolamfgy9mpLAWDMH/InItf8aRJIbOXWTlJV6JkGY7LA+Hpv1Yq
	QuVHlXQFJdMRTZujr7PypVpbK+DdTNLLgBbnIAH4zI272YzUQG6A2joHMSVOtXrHTXhzGyESWiF
	9s0MAcwb5w1H/LNOo24V2T2R40h
X-Received: by 2002:a05:620a:838a:b0:949:6f9f:34fe with SMTP id af79cd13be357-949ba9fe0acmr2822535585a.36.1795601976755;
        Wed, 25 Nov 2026 02:19:36 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:949:6f9f:34fe with SMTP id af79cd13be357-949ba9fe0acmr2822532585a.36.1795601976177;
        Wed, 25 Nov 2026 02:19:36 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:35 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:30 +0100
Subject: [PATCH v2 6/7] media: qcom: camss: Timestamp buffers at start of
 frame
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
Message-Id: <20261125-camss-hw-ts-v2-6-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b639 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LoKRl9D5pXW62-gkH_QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _7EqeNFK9YC1pjtd4Ly21pBgNct4vE3V
X-Proofpoint-ORIG-GUID: _7EqeNFK9YC1pjtd4Ly21pBgNct4vE3V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXwOtewyKJkCjY
 PByjbHzR9D4hMuo6oaz9efmC4nJQhga/GkLM0D2mClpcSWbRpXBD0T6qH+Vtv5alQcIS1s43amK
 A5IYum7XDAxSLhLy82Sgif7Zk17Z7ao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX3YHcEKDnxQki
 F9S7Sna6HQ9jBgGDDNQfO+BmyhFF8ZgoFzct1BAFkTOlkeLycknzj9htFKh4UNnzTyzcFyoDoAz
 chxQmvLAZum4NtJ7BgZOwKuikeNA/hIRZ5m1ApXIKsvgKTHQXPf/KQRTY+uhQ5zs+2o3tmcOJPM
 mQhsfdfBo+hEm27+TXDl7ICLeqWCa1juTZYtvY6fUxViGDTefE+R6nTMiBZFYhfS59ab907xt8z
 ssHUqNhTIo94TnmAQfnENJfT9ZE3DuzTvj2QfxYsq316OTj3sMI2ZuwRvGYL4NDQ4eUYCh9BxUJ
 vxAloN2G7h6xwYNGfjyWfD1prtjI8QU8ImkPrs7aXil5xiUtDVK+HeVxrjbnJysMIODsXL8zi9E
 q323bn8zrkV59oRAMW3xZ4QBYa9b5EmoVYWgLcnsE1ES290CO/JHfnvgwiHU2DJDxCdi2EJHkk3
 hzbdtzPONwQsCro3tgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

Buffers are stamped from the write master done interrupt, once the frame
has been written out to memory, while V4L2 defines vb2_buf.timestamp as
the time the first data byte was captured. Use the SOF time the CSID
already computes instead, handed to the VFE the same way as the SOF
sequence number. Hardware without SOF tracking keeps using the buf done
time.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 22 ++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h    | 10 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  7 +++++--
 drivers/media/platform/qcom/camss/camss-vfe.c     |  8 ++++++--
 drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
 5 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 0d9b4f7dd768aeaed65d01da58b4dd8a3a425cbc..4ac2aa588bfb47332c13baf4a16c7f613177b9ff 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -792,9 +792,11 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
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
@@ -1383,6 +1385,20 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
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
 static u64 csid_timestamp_to_ns(u64 ticks)
 {
 	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
@@ -1450,6 +1466,8 @@ void csid_sof_event(struct csid_device *csid, unsigned int id)
 		.timestamp.tv_nsec = sof.tv_nsec,
 	};
 
+	atomic64_set(&csid->sof_ts[id], ts ? ts : ktime_get_ns());
+
 	if (atomic_read(&csid->frame_sync_users))
 		v4l2_event_queue(csid->subdev.devnode, &event);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 17cc3b42c8d83180d6abfcc3efe22178dcc2f2e7..f7c0935ea25cee5ac87cca470803a7391c12f9f0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -188,6 +188,7 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users;
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	atomic64_t sof_ts[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -288,4 +289,13 @@ void csid_sof_event(struct csid_device *csid, unsigned int id);
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
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 4972d3ab65078387735ef2e853bf1c9c3d82baee..6b8df1f6e2a731ccd0e739edaa82221c18203f74 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -472,7 +472,6 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	struct vfe_output *output;
 	unsigned long flags;
 	u32 index;
-	u64 ts = ktime_get_ns();
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -490,7 +489,11 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 		goto out_unlock;
 	}
 
-	ready_buf->vb.vb2_buf.timestamp = ts;
+	if (line->sof_ts)
+		ready_buf->vb.vb2_buf.timestamp = atomic64_read(line->sof_ts);
+	else
+		ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+
 	if (line->sof_seq)
 		ready_buf->vb.sequence = atomic_read(line->sof_seq);
 	else
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..ab4edb14ed7486724f12fbd024e0600d70f8355d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -456,7 +456,6 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	struct vfe_output *output;
 	unsigned long flags;
 	u32 index;
-	u64 ts = ktime_get_ns();
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -474,7 +473,11 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		goto out_unlock;
 	}
 
-	ready_buf->vb.vb2_buf.timestamp = ts;
+	if (line->sof_ts)
+		ready_buf->vb.vb2_buf.timestamp = atomic64_read(line->sof_ts);
+	else
+		ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+
 	if (line->sof_seq)
 		ready_buf->vb.sequence = atomic_read(line->sof_seq);
 	else
@@ -532,6 +535,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	csid_pad = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
 	line->sof_seq = csid_get_sof_seq(csid_pad);
+	line->sof_ts = csid_get_sof_ts(csid_pad);
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index c37526caf9a6fc052c3f4ab4215e635167f6da95..8eda4592257169d04027a9a3c45233ac937eecae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -95,6 +95,7 @@ struct vfe_line {
 	const struct camss_format_info *formats;
 	unsigned int nformats;
 	atomic_t *sof_seq;
+	atomic64_t *sof_ts;
 };
 
 struct vfe_device;

-- 
2.34.1

