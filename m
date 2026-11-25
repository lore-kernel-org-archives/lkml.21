Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631039;
	b=P952foNnlF9Xbv8CYE0Z8TjF/NRcRFCyZzRAxgyrh36I2jifkBpRR+B02d0MKX10930u
	 aYOoM2RMXOKwQNk18dRZ38FeS32KiiY+Uz5tnMZji0CX6eyz/h+HClQZNFYaaYYuFOaw8
	 El0cn+Q/RJk7oCeu50Qbpp1johSJrbyr+mdK6GgtY2EmCwO4xBybST3jB8oCcS382s7d7
	 HuJLFe7NxhmVI2YiZR2fYtDtvxueSGKtt4ua7w1IX080TLU5n0ejGVQjLZW98Cib/VUDW
	 OUjl8XyPJAtY/Ctb7Uc7S+qHpVz82hF5EAqEFx4eDaV0lZQQY61bx//L+cwpddf8cPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
	b=wRbyx0zBEhcuhCtT7B9/GedcEKRfoflZ8vC7a61zUFYUJb4WwI59TX78imtrdMQ5ySGp
	 v4z0ulNxR7uwuS8I7rZ4u3bqPyp/JBv4xY3A3S4TXnrssVl0Pb4riYPGJlgL0bon4uHny
	 9DJXPgPV3h1+F0gx2nup1n5WQROEvut4LaVA2ztuTuKA2MUhoqe3bKfqob0WCEjHQB9QY
	 ncAWNWYcS2RxCnyFPkkvwgOLNoBsnMChSPHJIHLIhc+mwH70ekItbw3iAAmSm7L9pfi9/
	 TAO0R4DPNmIDxLT2o06G/9b2kDtUMkxYrHo9zm9KN5E6W2Dm8LFxXrWWDzJa1ZDU15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8EX9VIE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNsjF4MT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D17606A682
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D17606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8EX9VIE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNsjF4MT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQRZ53008338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iBl3ztGie3s
	cC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=; b=L8EX9VIEamhHga1wDYGfXKO1tDR
	uo9Gm0tAiok0DKT24f/GrPcopVnhZq+vPJGXwuXs1GH9uJj/cXd+9obNKP8g8NCy
	r7uPAbbKjaHexEKDga94X/EzDAmmJgv5jzlDr3dF6tZ1XBUFeNRgeKO6pdgeqvhB
	wN1QBQCuCwgvzX+4tyboQYpX7F6U5LI3ee14c9k6xhc6nNZYS3JHwEhB2nJaS3/d
	xpSZqbU4/8oyhVfBEyfrO5asYNE/ZzbHZap3wS/Wkn+eudxyRZzGK7icKXrKPzr6
	oQLOt80rpZKZ8im12XJpkEE/gewTh17dPET7L7umEmD8AsO12z0N6cxaDdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukt8rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495af07676so955141585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631037; x=1796235837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
        b=GNsjF4MT3qZEQOSkltZGoby/OkYyCgcRcT0B6i2AKXA1zNzB158TWNUos7s2gD245J
         aHsC/creuwsUq3ltqDt5hrFvJyYongrgFqzo39AuZ3rd05oTleHM70TyCywfnFDw0rrY
         5h+tr+088jaa/YqSDyX8hpmJS/Cxv424Ikr0cgOnqgJTeHn1MZpeCn2yVhED5QXIyX7y
         jFxabyVrhGxCxLu7VTuoLHAy8wFe2Vil5r07bXJPMkVPB0oSmIZb/MygbvQ+Bl8wpj4p
         23qlXj2NkeyluxEvRSV/Ssl69mzYQBNNEXG0KHYKg4rIiuw9jj71c9YvysdO7BFIudD2
         uAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631037; x=1796235837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBl3ztGie3scC2+QPz/6CcWsyfMw4xdKCUkFMvo4SHE=;
        b=FKU4/sOoxrUUzMNJXb1pRb+uTsJcPCx7nDmAgR8rPiSQP1m0JzSU3YVX5AncULEomS
         A9eAip9uxcVEdRJWKsmyMxE15pekB7NwheaIXKcEoFq8yZ+4AYjoJnmnMne/86YmtAmu
         aiYQZOske1Dk61UtJhBS705Gg/iqPsnB6UBAYbD4CpK/vRy618OIGRmPf9gDosMb+2rr
         I5NKIErCxHVRqo5IlkiIfuTavQdYLlhr4ZDYRA0SqY1q8/LatiGo/aARTv4xkIdT3Xoy
         GFPzBw1Kqu1NeH00moLGlzw7gSLMoJDMd/Pk28V9aj95MR0iQWt29rI/MA68Nmgg7IXK
         221A==
X-Forwarded-Encrypted: i=1; AL+hErHPYBB7iPdVq3HcLEL+aOJK/PiDvNcJOL3wJiYxLreBgVcqJ3NayjzQA3rTl/spV4XvjcfpheJBKOQeeIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z80e1swJLDg4Gv4tYNZkOShRY04xz2ZNhGq5vFr1f8i2L1Hdqdp
	P4b9TkbCRABqECDt6STtl/rEORfUvjV+1tDj1wngGhq13POQ4+Yre3naDuiLgDK5ZK1MlVSOQzr
	hHLqG3Fq6Z3v1j9AHRYRbXa5HeZ7HKNhUfZrNMx3cDSx83NFNVjl23d5/2JfNwFbuSNw=
X-Gm-Gg: AZFdTZeWcm0bBRGjoMBa20Zamt4u5NLXHYbsMFaH7PQBnBNZyaEgbAWSCFdFnmo1eKQ
	0jEy+ffXYN1qDgAK+9T2NZnB6BY6IIed0yrKIxeVmOiEtAyARsLbQMvs48lyG0Q1AWyHH1RNLOh
	QwS1U3/8l6BOAGSiEp2Y5+aLurnh/VzJUoUedWwGwICGIxaWialxQTDkrgZWcbT3OMRMnNSux4g
	M40X4eCeU02TfULPdnm8yc0D6tojRcoiasOuuprdmo9f65QN0iqKiKAWyQk/5QeWkEyX51rIALN
	q964GCp8benU9VXKtrqlC9mJK7z5is2LLPlA/Vf1TcaPMQv4oaLBf0HnFVb6Ip/D5ZU5ceV6XsG
	WYR8vrnF25UsYf1E9wTHYH+49PzQoJsNkU6QXkjeV3fzYzV3wjeyJlMmfcSLnOt5TRx31j5eMYZ
	I0I9t3
X-Received: by 2002:a05:620a:6603:b0:949:8d0d:6f66 with SMTP id af79cd13be357-949baa15529mr2853757285a.68.1795631037513;
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
X-Received: by 2002:a05:620a:6603:b0:949:8d0d:6f66 with SMTP id af79cd13be357-949baa15529mr2853753585a.68.1795631037101;
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:56 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 09/12] media: qcom: camss: Add streams API support in camss-video
Date: Wed, 25 Nov 2026 20:23:23 +0200
Message-Id: <20261125182326.2767771-10-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b0727be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=KYIyY8g0vu4ecJsuFiIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: 9b3QKiN9thVLkLQKe_5Lmb3Ykq0SKkqn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX7uOs7nFNuv38
 AmZANO3xVkAVu+mlRIipGs4fPKYSIlF/x5GMfLbCOJMIZpRtbaZTZzYkg3nmWTihsDuCpHhCY7l
 SywLB4YlhS6Wm0/zxvXNx8+LmmPTcg4=
X-Proofpoint-GUID: 9b3QKiN9thVLkLQKe_5Lmb3Ykq0SKkqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX3Gics8U0OUlJ
 DN3UylSpXjg5/2GSk6nqs2WmIADbNPY7U8y0MPHwxcSsWm2BP/CxYw6SXbi+B9SXzUJlUGMiECb
 xpmCzY7TUwN4KIIuT8WNqx18k4aVj3lo/xpq3ApsU0wc1soVXY/kyZFgFL3MGnzvPUVczzrD1/u
 OV4rNOKFNxw4O9+fBLU6gd0NkarLwwvMOGY7lt5f/EpAhdNPVJmMM2vwPt5yD8PquZpFMNFcAy5
 kXaX2eZSNlYi7BYfIuvS0L+Pop98EX1aHBQ7HWjxiKILEzFaI4seiQJfi80ditX/BYPBHNdR0dg
 Cj8UalcbaFfHCs0LU/GZmr/2crIVPIW3yPrUCbkL3Yx34w9PhxncUbkmdHuoGqryxPZ0DQXxn+B
 2D/UX1YLUf0S/ApHKoJVlm3MeBeuUG57eM31EAni106wnj4ovrc+fbMCz6jL6wJRyOGMZOMiZjt
 FC5qnQXMuvQBHZsAHVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Prefer the streams API when starting/stopping the capture pipeline:
if the subdev directly connected to the video device's pad supports
.enable_streams/.disable_streams, use it instead of walking the whole
subdev chain and calling .s_stream() on each one.

The legacy walk is kept as a fallback (video_start/stop_streaming_legacy())
for subdevs that do not implement the streams API, so platforms that
have not opted in keep working unchanged.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 119 ++++++++++++++----
 1 file changed, 94 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1315..7f7212996c4a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,26 +249,27 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
-static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+/*
+ * video_start_streaming_legacy - Walk the whole subdev chain and enable
+ *                                streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .enable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is started
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_start_streaming_legacy(struct camss_video *video,
+					struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	ret = video_device_pipeline_alloc_start(vdev);
-	if (ret < 0) {
-		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
-		goto flush_buffers;
-	}
-
-	ret = video_check_format(video);
-	if (ret < 0)
-		goto error;
-
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -283,6 +284,42 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int video_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	ret = video_device_pipeline_alloc_start(vdev);
+	if (ret < 0) {
+		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
+		goto flush_buffers;
+	}
+
+	ret = video_check_format(video);
+	if (ret < 0)
+		goto error;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, enable_streams)) {
+		ret = v4l2_subdev_enable_streams(subdev, src_pad->index, BIT_ULL(0));
+		if (ret < 0)
+			goto error;
+	} else {
+		ret = video_start_streaming_legacy(video, sink_pad);
+		if (ret < 0)
 			goto error;
 	}
 
@@ -297,16 +334,27 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
-static void video_stop_streaming(struct vb2_queue *q)
+/*
+ * video_stop_streaming_legacy - Walk the whole subdev chain and disable
+ *                               streaming via .s_stream()
+ * @video: Video device
+ * @sink_pad: Video device's own (single) pad
+ *
+ * Fallback used when the subdev directly connected to @sink_pad has no
+ * .disable_streams op. Mirrors the pre-streams-API pipeline walk: each
+ * subdev's pad 0 is assumed to be its sink pad, and streaming is stopped
+ * one subdev at a time via .s_stream() rather than the streams API.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int video_stop_streaming_legacy(struct camss_video *video,
+				       struct media_pad *sink_pad)
 {
-	struct camss_video *video = vb2_get_drv_priv(q);
-	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
+	struct media_entity *entity = sink_pad->entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	entity = &vdev->entity;
 	while (1) {
 		pad = &entity->pads[0];
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
@@ -320,13 +368,34 @@ static void video_stop_streaming(struct vb2_queue *q)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret)
+			return ret;
 	}
 
+	return 0;
+}
+
+static void video_stop_streaming(struct vb2_queue *q)
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	struct video_device *vdev = &video->vdev;
+	struct media_pad *sink_pad = &vdev->entity.pads[0];
+	struct media_pad *src_pad;
+	struct v4l2_subdev *subdev = NULL;
+	int ret;
+
+	src_pad = media_pad_remote_pad_first(sink_pad);
+	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
+		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
+
+	if (subdev && v4l2_subdev_has_op(subdev, pad, disable_streams))
+		ret = v4l2_subdev_disable_streams(subdev, src_pad->index, BIT_ULL(0));
+	else
+		ret = video_stop_streaming_legacy(video, sink_pad);
+
+	if (ret)
+		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
+
 	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
-- 
2.34.1

