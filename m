Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454221;
	b=rusVwRP57nCzEU7tVUGuGKwS+sQctzhqykGIzRAU3OKUwYJYJb4aRyir9B2McqF7D4tm
	 Z4DV0XcLZZOaZb3FDY8UURQy8Durnv7Ag/XtGXX1wtVteDb3lkUWKFI1UJMaT32/GQFqF
	 UesvaBEdfuwfVj/xMJLma1FwgqiDjtYgzPSBQPYJ3PiKteSlPJtRK0UeUdzX4yY1lK9KN
	 m/+5/r8OH7VOBD150d5P9debP2rLxvrABg5hE7UZnxLWVTuronYGaNeUoFrZDb39VARqL
	 Vz3RyXT2XcApsBpGvCfBOwoYXkdmsKwDGVsvKMV/cq2/Zhb9PtyKkoJde8nMGVqhicQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=;
	b=vEvrAtF5aYKiZVYVf438kNdMSCoDrwcnINSs9giFkFSSfekkH0FZMYdU0X5VSZ3ugPcK
	 LEocPi8eFH+0es4a48KmCO9KI8WVxsFEGjaThsl3OvygBvuEzF8AfFz1yq/etiT16BAwc
	 5Ch6PNtQHOC2Naf7c8VBNGhwsGEBop/d6tWECnY1NUHANjYFo42ZdYZjhQ1TSkkA1OVA6
	 q6em/l1atedvyzotqDfLkuQc12RzWpcq1VynWeTkifbXKAqLmQfWWnDNG3TY6p/qOtrT1
	 iONtxuKl+worFi1e4LjEDFbySOwXBipDI/qc4DlptJ8nQTjqDjQdQ7l5BcSiTZG2tqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJfHQwXm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P6yoJDXL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7660A2602
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB7660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJfHQwXm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P6yoJDXL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8Pf2769576
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=; b=XJfHQwXmD0kmVePw
	aeayLVr+799PPXnhzzmsUKp6E02QG3y9Vlct4jDVDZ1TJPSnowNafCdqkoL2IcRL
	fsOTpcvFgbImWuZMEGUK2arMxJtqhps695p5Lr6KMDxmoc7UpygvZ0HKQstnnMh5
	LSm4ZWKrDPlRoapOhrIiVnxa9SVM6+jJxZZ/IinAf0BiWrMWe8GVX+NbrZqcanQb
	F3AAqJmkMBBTuW8szeDeJZ6DvnV0bmcMXPGueE7/SRiz3KLRqK+iBOLHHyWC2ojI
	3BahTcFIpJqCZ5QCFbUtkMz+U77yz1a4Wmd1dnyyrVy0dRHFzkCotnssLqyqMf/6
	YNHgLA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pagxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec3e1921ecso2446759e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454218; x=1796059018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=;
        b=P6yoJDXLNJfinewQysOCv4obHs9+4zUio6Xo30NhfbFk5A097knUdYFAajkUUS9rkN
         ckC6FNbHaT8QP2oBNBEFzDeOfC5VxXBdgUw+XZMZ+gwfvs35REebXuvIOrUvtAGPSYeG
         l7RK8XwIjbZNlq7To7khETRh5FqaoUrbKRpIQE/62FcNW66pqWrosKd5H/2VyLXV3nOZ
         q9RkjwzZZuC157IgYLDH0zO7PxQeux40gGFKYB/fcNtj0AUjTLnkDD2N5oYgFjvdb73y
         3E+f1YOYeR5TW7kNDuGlhwUpw90JvtbQc+R8cVuNVWG3K3Z1bQkjj2ZnlAjlWgq2mPVX
         NPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454218; x=1796059018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=;
        b=Phc5pkE2KBDFyTHfWUCP0ZUUj+lRXlgqYUHj+lqnalB6puMBvTLuS1LWnpSzR839jB
         3xn8KU9XSnDQ3iSs+KoUMBVKD4yi9yWhKIjy/ARQIVlAN8UR6LPvRMRrLutz1KLlHpNs
         /axWAg6yDIoVvb3MlAAmeEwt8XY172AOwMzrTlMICGmV6y7N1YGZ9oRopFfnjSGjK8+y
         /egg+ZN+S43R7OE7Di+1CYyuikWm5xe3rFbmyhVoPxNyNSeSeJJ0WRXLVslmraq0b3T6
         kEiApyfr5hf0bLRJOHRwWSSm16k590eoXw6uUadVetPrKoNRjq5KiKA4WPgJ1KcxmqKG
         9WBA==
X-Forwarded-Encrypted: i=1; AL+hErFYKBnLI8202S0Z0jmGND0X2uPae1mdZG6+K4Otq/1vlNqIMShZBndQNW/hZFYwMGfzWP5s7/7AeQa/kLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/bTWl32mPC0kUSVOttiKI9H8YkfGchQDg+wpYlz+zu2JL3eFX
	NJOdJpKSJ1jP7qBmG+iFjDvYJL36nPB/gH9NTvIjbdlH3aVtB7kZj4i+y9zKePCUYDA86Ox1vUY
	y35b1NJWIhV1N/4yWqgYIfpgV86pWl9yX8nT7BtoyaltYNlDNg1l8SMBI2qG4TQgfMFQ=
X-Gm-Gg: AZFdTZdqi7EFjZL6GvMQfKEwG2BipPqbmzOvad0GjKr44RXvkqQ3MnrZLUvmUDuajts
	7gh/pe6YfpDGgVHojanQWXnXZlJPNtDCvbDqXMy8v35AwQ77iFOTMunVNlRUni5JD4bXiza0Ywd
	+PPuC5MaO+KPmHrJza9jZCbSeIbweNjvCLCZreMD3hFlSiE8RZCkX5BK0k8McqDGT8rGLLGOOwE
	abUe+n5meEIuvSdi2qW6dayGFNgrOfJ5xqWwjAgxI3s2Juw3korOS3XbAlb88B5qzfqk+l7Uwf6
	pYo/43VFeF89pQDz8u5rQ0l4ilC/nf/uFdFZj8owCgOFy2GrVDgGPrxx8nW3znsGxckP/Ri1lgf
	qTqYa8tvS66B+acBI1yh0T2DP0U++lSnbTW4n+69xXchIpOjXSu1oSetRWNIuQqk2tJo1cft8T9
	TbZLDmwctSSpWude4hhBo/DesDyjLdeyIJW1d4JfbS08pI6OCbMagii4KyRtKRUBW149uxEPQ+6
	+DwTwXsxleZaw==
X-Received: by 2002:ac5:cdb7:0:b0:5ed:fbbd:7ee3 with SMTP id 71dfb90a1353d-5ee823990fbmr3420158e0c.2.1795454218278;
        Mon, 23 Nov 2026 09:16:58 -0800 (PST)
X-Received: by 2002:ac5:cdb7:0:b0:5ed:fbbd:7ee3 with SMTP id 71dfb90a1353d-5ee823990fbmr3420120e0c.2.1795454217707;
        Mon, 23 Nov 2026 09:16:57 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:52 +0100
Subject: [PATCH 6/6] media: qcom: camss: Timestamp buffers at start of
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
Message-Id: <20261123-camss-hw-ts-v1-6-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX11ISE6neGiXW
 2JdVw4Woic1+iOJmIZug01gG7iZzlIymsmCYxIM0+P+AxiepAXCcz3wnqWMl3OuqX+9UXQhqbKx
 BbI2dN4qggDQEpfUQzeK7TbMHhcjb102f3W2knLjiKqcq9ePbJDSDwKO72mCgyi1kCg42hdlnFU
 DFfj56rdRDxb3lgyEWinPfw3BrQm9l+Il48KtwCFA/rN9igslPboBeC6j/69GuJS9Ao1c8OzInA
 j65WP1DzuJ+JFk1XBWqcehBM/YDIVS+gpyrLULoEBNGPk1eMkwhkGrAl3mLuD3fqQqk6yfehyTK
 KuKokCiIdpx4+j3PPf4r4j5RISOZBmVV+pJkBwJR9b+CUFOP5/h6Vzo9yFWariAF5QWkWhURuxL
 WcxYXA7OL7b52raGaiZjYsGkGkGDJxeopstt+HJwZxdhw+upjN+nzPFbNGO+P/CGNfOMIMI1SQY
 hoYaw/HqijV7nFQ19WA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04750b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cvNeV7CIaun-QT9ljzQA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: DGJAgvU-Pz8zCKjcJeUSPfv6er-yOcGm
X-Proofpoint-ORIG-GUID: DGJAgvU-Pz8zCKjcJeUSPfv6er-yOcGm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX5o6tIB8bQTg5
 eCCBXVYXdgYw6WAAmJevZ/N7IBmreQLTirYLklBGreiC57gj4Xzlo1q/wCHbG/E9D6SYwlGke1r
 kQ6R7RNcVMwRvALZ6+SEEhN4G6OMYUw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

Buffers are currently stamped with ktime_get_ns() from the write master
done interrupt, i.e. once the frame has been written out to memory. V4L2
defines vb2_buf.timestamp as the time the first data byte was captured,
so the reported time is late by about a frame period, plus whatever
interrupt latency the system adds.

The CSID already computes the SOF time, from hardware where that is
available, so hand it to the VFE the same way the SOF sequence number is
handed over: the CSID stores it in a per-src-stream atomic64_t, the VFE
picks up a pointer to it when it enables the output and reads it when a
buffer completes. Hardware without SOF tracking keeps using the buf done
time.

The frame to SOF association is best effort, as it is for the sequence
number: buf done reads the most recent SOF, so if write-out of frame N
completes after SOF N+1 has been signalled, the timestamp belongs to
N+1. That is still closer to the capture time than the buf done time is.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 22 ++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h    | 10 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  7 +++++--
 drivers/media/platform/qcom/camss/camss-vfe.c     |  8 ++++++--
 drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
 5 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index c77fafdb9fe450aa3bd245144de353cd0edb44c6..fceb5055bc021bc8ac2ec8de28e1d26f7a337c5d 100644
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
@@ -1435,6 +1451,8 @@ void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts)
 		.timestamp.tv_nsec = sof.tv_nsec,
 	};
 
+	atomic64_set(&csid->sof_ts[id], ts ? ts : ktime_get_ns());
+
 	if (atomic_read(&csid->frame_sync_users))
 		v4l2_event_queue(csid->subdev.devnode, &event);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 4f55c72a44ca3a6cbd29861aa5c90cbab9ed5932..50c4f96a691f2e1b7196427566b1c0cfc87da1ab 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -179,6 +179,7 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users;
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	atomic64_t sof_ts[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -292,4 +293,13 @@ void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts);
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

