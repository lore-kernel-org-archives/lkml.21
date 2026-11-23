Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454213;
	b=fV1+OoiupPl6h//JHNxrZ8RgcWxH1D7ANYaJ0sew4friHtgYqP27MV9mbLRCr8bckdG2
	 k9PivHsuVguTF/Ap7Ce0BsinkIILwNBdR4FXW9+s99YtagzuE0ghA4Wq1UMQTWL7bzTv+
	 dnBNVEp0rKkzmcYVG1VirxqSqWlts3sNI9Q440SkcECVEbEM1uGEusktjYy2zwvBhhOd1
	 1CjnN3DpWrz8Y2mL4Wdqg+DW7IYhY5iFShMUDW+ie/Ijjiz7o90TJ8qoH0DwyfSFoDB6e
	 kixSsGEyNmuNY6OWmpFtBNpwB0XEUGmYoKGP7JlOU5YpKKqvVJLUiQQL6CfJuGG9pZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
	b=wjKve8/aK9Bqvai3Y1BoqIH8cCwTYQcWwdI/5aaqDLRxAmDzBh5nVRoMNreSse5AyS1Q
	 +tv6G1vASY/aSRN5+B5S8ph37PfExQTMmPgR7J9W/SJ2K3IwIiehNs6wlb6H8P5nhCIJ/
	 Td2u50gRMcsKpjxeUizGqdN0fzmv10qQs2ndmWQlXLcmswFzGqG+12I8NiRcJQrzMlD5N
	 pKg1EXkQA+2YQMBA5nRAV8rtOQlr5BwLL3enD/El97LWHvK6B0gEmrNLc6nB/zb3jDoWj
	 2Hd7wmmLACJMuk3q6UhwH7WvwOeuYV9+ssk7nWUgXbLgNfrZOzHIQ4Ojq8O4fZkw0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DsqH0JRH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSoQiwBo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F283606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F283606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DsqH0JRH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSoQiwBo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8sE2487483
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=; b=DsqH0JRHbvneldlJ
	6Z44mtUI93Jg5JO94t9HvOifCK7SnZDpu4g5gdmOZW5d2wctS8VDGJX2bh7X6Zgr
	uu2pRxU9RD3FAKbZdPn9HmzmWFYmNQ3JQh/HrVcf15HO6H3XkVKdM5vyhQXmBKLE
	2LHAhfyvuk1dODwyd1/ixeQcqem/o679wtQlBIxywSGBT2DNdb9XUN42p7FNXem0
	qH30u0BdIBleU3mBKMegCabC9JORFmpnbBtLMa9Lboc80890vAcEXdCET2WqPuUd
	9aI5Xc4qIwNRCqCmzlkWDc2w+1s8etbRrDH6vTLX20QPP+88kiOWoUVaFjA2bdUC
	W+y3gQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02jgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ed100ed770so310703e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454211; x=1796059011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
        b=bSoQiwBoTGAoEx17ncJEQ9nU2zD4cjiVui8DfTRuUWC4YaAEaAshM4d7PWSROm3I5d
         4SCeE01Hh8nK6K2HpwprojcBEurxGxfTr/UmWN5M21oKv+kOx/BeagXV6pW/KTvcOKMt
         QjPc32whN7PJ78OzhFOzCC0mQ8Jv90So9BZUF6ECbbs1Vv5C8VRt0Ob9VK4ntwIeW8cL
         swoIL0tJkr/B5a48q9EmRUPmk7KF8U6q1r/3rW0Zzs4lGF5i7uzyvWtZWM5U4+7pAJsR
         GNGaesJgG0jmQzPfrTNAZfCal0g+IvmBxLsYyoBeRfR9MQjIBvJQH7mPx0ZUW3gJmeqI
         9ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454211; x=1796059011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
        b=N8jrYYfzcxkxXwQCtp0rSnHTHA5KcKJ7hAjb+kgMiOqhQGtHUPmniu7SJQC9LPh03s
         9XeooNYoqAE6de2zDNQHErh0ml1C1GnWVyvk2SWOGamTGOqQFDXkZJZR8O5AzFB4DC4X
         X3gwqrUsg+DyBCOPUSVqK/dVoAv+t+3vePngSS9eH5LEHKK4XqKMqPrdcsijd2wnFYcx
         mgpSiV7Tgj4aieQOteWXeIhTlZZASfQtYy4t6uJA7kDAWdkBVz5Nh4tIvkly/X+8kEBY
         zXPQAN0MJlNNipiJrB3qUtnd2TqDuRuAe2vANU+eZiK+Owm/QBgiSD8xfGKpXD4C964s
         h7BQ==
X-Forwarded-Encrypted: i=1; AL+hErHkQO/FQWDxJqzdY7q1whX1q3MaijaJFWkcKtv3cJuTiuM/sZLO8F5b5P8q4nb/c+Cjbl+2dC9LIqffh6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OMWTf6kK3XDpAGMfl/zNrd/FrUeVmhZq8SV+71MADF6Qk2ffD
	hR2RYx7pkeJZ+qhFidcZQiXDGQ31wHJQS4RNif7GoQJBiAJgOEsWdgr2CGJhZngk2HRrefFYKX+
	G9DVwnjLSB973OnSmOfeIY/JcxPqueYTGhzv8iDKzkUns/Ji7XgAs7X+QTRlpdOsMKaI=
X-Gm-Gg: AZFdTZev65tIG96GZwJqJJh+pRE5pipfLyADBTVVhBqwd6nlT+E9R73jiyDptpSnAqp
	KYb2VpSB/fA76s+cs6x2n7RoWIugDZufEv5+RNBYHJbxtdAATAHsPouZi40/unwkyZmePR5OmSl
	F6q0ZhIgYxz6SR75nvG5+VHGQJu1hfcW44HXuteaUDEHNmy5okqyIYud6RjMF5TmJ9UOii1/+tv
	Rfr9cCGee9JJsq4EAmz+79oZzM8bBjQQkIg3/cBbIyTN0FUWrhSFaxEE+HflCVnCfzIv3uhyOYt
	sezSAgp1HU37X8cTDgvb7Ct+P/vIRA/qjFU0gH4qh+qH4ulZfvr9zEhURZZNqMduvynVrUVO9k4
	yjKPF+S8amzvfPdiqmeVzDo1PhjIqCp8ewHsLPK0LS5dB8DQ6MK/pK3t1Tlk2LzVDLzDP8Rjphv
	88ssEcKl4blxKG6cbffkHErp9jlSGWviJMoaFx2ee1CBhJYFpvR6mzenxXq7cfcYjbUGLhtbay0
	Nl5isuj9+Qxbpy0jTYyTtCBAfYv
X-Received: by 2002:a05:6122:8cd:b0:5e9:731b:84f3 with SMTP id 71dfb90a1353d-5ee8af017b1mr5963887e0c.12.1795454211058;
        Mon, 23 Nov 2026 09:16:51 -0800 (PST)
X-Received: by 2002:a05:6122:8cd:b0:5e9:731b:84f3 with SMTP id 71dfb90a1353d-5ee8af017b1mr5963820e0c.12.1795454210523;
        Mon, 23 Nov 2026 09:16:50 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:49 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:47 +0100
Subject: [PATCH 1/6] media: v4l2-event: Allow drivers to provide the event
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
Message-Id: <20261123-camss-hw-ts-v1-1-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX+no7iz+NvUGj
 BEDPovQFoqE0PoXxICnJwNgiBo2b6GqggjSOsUqghG2sm6wTrfQn5ZISclSEChIwRIJ4ad2LSFj
 IkIQeUMvmz+8BzMw3EOoyEVHmbibmflzAE3zPw3NHAk/+R5GlePCLufJ3PUQaMe3KeGX6NO1iHe
 KvrFuR2B+TDtrMN6dskpzXnWzCYiZYId3VD4k/syRnHaM6+kE3A5XXHl3BQUu5oKZ9ii8aQIY6X
 dvpnxLPP7dc2AGTAUJtFc0xwriYeMv3HY82tWYt1TsgZtYjVV2Oo1ZqlfHq5gcr5AWd/xpzF/kv
 j3cn8DQgMa9jDzUUI1E30/3Xify0Pv2eNmRoTTZecF2RP6YHb9P3HZD0Y47DXUZfLqGZ2LWmP8h
 JZwGBMqNFYDLgBz7So7a0vgYiktkklhW0vVwfNhll/v0N1N+q3F3gHTtSOAA9UZiG30l/LnU/XJ
 lYcZhBdJ2oEfoknuZbg==
X-Proofpoint-ORIG-GUID: sK3DGs2fUF05g38li4jWjXx5uNOf1yv8
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b047503 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TtxWlH5-b3U2hsFWeNEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: sK3DGs2fUF05g38li4jWjXx5uNOf1yv8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX0206A8y/7dtW
 kKhvQcadveFOYlza+mQO1te6vhBmGJuNYkZzw3XJp2GGxIqqvgx3us71p2t/SG8GAh8ShZGd2zq
 UH5oTcm0Twx9j9dBVg9K62VLJzsZ0NU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

The timestamp reported to userspace for a V4L2 event is taken when the
event is queued, which for an event signalling a hardware occurrence is
only as good as the latency between the two. A CSI decoder able to latch
the start-of-frame against the system counter knows that time to within a
few microseconds, whereas the interrupt handler that gets to queue the
event can be hundreds of microseconds late and is not consistent about
it.

Take the timestamp from the event when the driver filled it in, falling
back to the current time when the field is cleared. Drivers have had no
reason to set it so far, and every in-tree caller either uses a
designated initialiser or memsets the event, so the field reads as zero
everywhere today.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
 include/media/v4l2-event.h           |  9 ++++++++-
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 	wake_up_all(&fh->wait);
 }
 
+/*
+ * Hardware able to timestamp the event itself reports that time in the event,
+ * which is more accurate than the moment the driver gets to queue it. Fall
+ * back to the current time for the drivers that leave the field cleared.
+ */
+static u64 v4l2_event_ts(const struct v4l2_event *ev)
+{
+	struct timespec64 ts = {
+		.tv_sec = ev->timestamp.tv_sec,
+		.tv_nsec = ev->timestamp.tv_nsec,
+	};
+	u64 ns = timespec64_to_ns(&ts);
+
+	return ns ? ns : ktime_get_ns();
+}
+
 void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
 {
 	struct v4l2_fh *fh;
@@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
 	if (vdev == NULL)
 		return;
 
-	ts = ktime_get_ns();
+	ts = v4l2_event_ts(ev);
 
 	spin_lock_irqsave(&vdev->fh_lock, flags);
 
@@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
 void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
 {
 	unsigned long flags;
-	u64 ts = ktime_get_ns();
+	u64 ts = v4l2_event_ts(ev);
 
 	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
 	__v4l2_event_queue_fh(fh, ev, ts);
diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
--- a/include/media/v4l2-event.h
+++ b/include/media/v4l2-event.h
@@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
  *    fields. The other fields will be filled in by V4L2.
+ *
+ *    Drivers whose hardware timestamps the event more accurately than the
+ *    moment the driver gets to handle it may also fill in the timestamp
+ *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
+ *    drivers must zero-initialize the whole &struct v4l2_event.
  */
 void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
 
@@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
  *
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
- *    fields. The other fields will be filled in by V4L2.
+ *    fields. The other fields will be filled in by V4L2. As for
+ *    v4l2_event_queue(), a non-zero timestamp field is taken as the
+ *    CLOCK_MONOTONIC time of the event.
  */
 void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
 

-- 
2.34.1

