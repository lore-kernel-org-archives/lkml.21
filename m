Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795929;
	b=lxOV3G5Ql3IPoG6o/wXXmvgIN8gijpJ8BpeQVTmWde+p6XMVzT26EF7zBQk62X7Hgp1d
	 SEjsAAARzVwgtRGUDXA0vHeMMmgH0CDDKwlW9wDWlEvcV6YADbJq+7LpRKjjc1BFlm+oS
	 UQgQfiyAsc0dhWqWMXtk38IE0GAE5U9w39jbKo31dZoBCGVSLU9IahGMDCGxyJQSNU+rr
	 +ugpTiRaUBVGGPeXvxIceQH8hb5/ulvxfQwnCm1RR4JYuCIEIKr3FYzFJYcOnwNuE0zUe
	 jFdINhtj1DD66NGqNNmaMb5qad6yZZrMxWBHtCuyrQZajHZ24p6dpnw2VpTGHVE+Fkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=;
	b=SUgrRiVi/yrMYgSZiA7CtYuKFRU3TuuLm9CXp4l6qURtueWFs1lEAwXmGo7w08WVX4dq
	 pS1LiDgm4y7/ZbQ9pF2Awlsd7+hjT2s68KFmXhV2Yphm0JqRkCO8PyahhilAGfVvaUqJY
	 xarnpnuJFKfc9c54KK+Cf2thnJQmd468KG5ntHykux/Zxmsbvyxxum0oqfAx8nzr+8hyJ
	 ozgKy/Cc+osE3WSHtH2r1LJ+xqoHhGjBoPDH95Bm4wFvIo1YtWveoqfllscvf7nN5/Mu5
	 wHYm6KHWiiKzVwmAsuc/E2sRH845h6ChEYR6gdk0r5lL36Z0qyAmwXW2yZ07ePSkE4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOH4lfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8Cz02fk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5870E606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5870E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOH4lfO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8Cz02fk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFoxIW706020
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=; b=cAOH4lfO9Pj37/be
	RLV58OvuVFEU0v2yR2KCULTDI6mXHM6pqgshtqjzGMSdujdzYv1mzr/oagQX1rvs
	RZWrFCclwLiplJ9pnfu//QoVgKzws58Gmx5CE35ikboey71eLKrlHW+ZbT81gWmr
	HZXeZtPgJdkI4dhvsdWgtYeNsJx/0D0jH1j6fomV5NCGwUD225cLgFPeYvs2U3J8
	I9ysCXbrU22IXcvMqCkKwu0aksxocjg5/6TNqsPACMuqhoTlZsl2wlFDsWO6mCkp
	x8jUt3xEikCkd920dwmoc1c3JFd5fykW+3N49w2pJMzX8Po9aNAv25P2tbJGeW7e
	G7r6ZA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6t6xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:08 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4bb8bf464so116623567b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795928; x=1796400728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=;
        b=T8Cz02fkADisnkQhm8s9gLNVCiyqKB/3OKQZBP8ulilmdS2ORAUEahoLtnNerHGa3Q
         LEKcg40SNqPH89PSyAbmT8/kZIm3ImndfSNM+1bG/tbgZJQbhtWh5Ukm0oWNHGkAEpxA
         zlaHsDn8AXbHvvFFDBbnCqgMMQb3rI7DLmyt7vJjb3EQQ/iodTaQWVmCC8psQmg5OPdV
         z66Wq9SI0y41QuWAy5orxkgacn1+8Aoi1Bxsi/E0FoFyE3KH6jH2dtUUh15iZv6H9hgE
         w9pYhuA16ExMc0OAvLlofZDLBJtm09IVOPG4h8N1GlG/hJM3RTlqicjUExGgnhlRj027
         dzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795928; x=1796400728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnB3Y6cA1jDU2PIsmpLUVpJsaHsSWIAQcrfq9eUTfpo=;
        b=FSGhf3rGXmBjIoOdqQpPJMjHdJYNecD34ti/0JAXv1lUa3COl662E4YmTrWW0iViFP
         s4aY962E/N7C8SOVm1ZmQg5wraje9l0VJotwtaJY+CWbgl523AmfK57QIlHlBoKqV2wX
         OGL4XEOccaXeYGcpNwnemVOVjWh2XXDHI1hN2y3GcxZ3vBiuCBYzkt43hBbQX8GWNmMm
         Wzb13l553mVghZjUkzv3Lz+3sqLjCfbmiR6NWJmCyxLHWXzErngNrCcghxdWDth5QAaS
         DFN2cjNur11iVGtemiDy9zX+apvr/W2FEqyMZXOzVC1gtJc+i16SrAWQM8o2DW+UWUTD
         zBkQ==
X-Forwarded-Encrypted: i=1; AL+hErEfT5xuuyCg1eZnQXZscW8gVgnSsN6ZhcAW54iv0Klt2HeW2hfjlEMfzOxpeeGh+Z+Yu7RQ8i9zyqWjD/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K81NymYkXilujQLakhxiRXB4Fu9o8Xaviihr/HbbAscpMRhkW
	cakrpX3Yvho27EP2aj6/owO8ajNSt/XHyV+PamCZnUBrdnT1qKELAvBG3Sow6Qp2mOeZcYwPO+t
	LKJ/9pzrYO/MDjQT4bqOvg1i51mJXScbLaGLM8uHxBlZENHDKCv28dSyn6c/1QPA2SH4=
X-Gm-Gg: AZFdTZeisoVPiTu6eMRkoRPuuECtr8tdT00D+Jzb5g3CjzeBnQma3BM2OAFdw7YPmlP
	Kcjz2ba3Dv0VB8JcMu2SJL7N0ipBbOHug/GZ7OXQhJ8yQNvUxPcsfCbZ2gonyu3Spa2BZiVT4XK
	KhkTXwsizIInTlDuKsdGo8SP4N69qDnqmUddW+lislSfaetpGE15sdPttaPgWs/2txPaygBKqWY
	OcF/ovZApEvSY/IKLcF0v8peW4qYfz2sDqPwsdcmgHTr3aV7xYvVvSKZJGYOpggIuzTt5hcDXpe
	9/stDXIwkaV0iiabgXaWSR4C7F0IfdWt5KiQfSd6QA5ygOmx5+vxhHxDF1qaUtQUbI9dY/Y6r0q
	YTh3DGrdPe4PZl/lJGXEh4qPMr4ooCP4oSVhRn6lJUbAXJLp6fIRufZgVjw1tCc4ZdYPv8Hgfe0
	fEXqtZ3+HQwYk45kZHszXBKARf81oBNb6lAJ+IymjIPSrSyZ/RdvZA7Xl+3Uij79xB33rqwublk
	xFMvlqWwdR21cyE4thy3+UIH+34
X-Received: by 2002:a05:690e:1446:b0:67e:653b:319d with SMTP id 956f58d0204a3-67e653b3b4dmr2153827d50.133.1795795927463;
        Fri, 27 Nov 2026 08:12:07 -0800 (PST)
X-Received: by 2002:a05:690e:1446:b0:67e:653b:319d with SMTP id 956f58d0204a3-67e653b3b4dmr2153777d50.133.1795795926806;
        Fri, 27 Nov 2026 08:12:06 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:06 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:57 +0100
Subject: [PATCH v3 7/8] media: qcom: camss: Timestamp buffers at start of
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
Message-Id: <20261127-camss-hw-ts-v3-7-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: jhXiuNjTWQXjB5lgJbEnAMfIFmuNfuZE
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09abd8 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=heOmCKqh6NOOIyo905oA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX3KbD+B5w99ZG
 AeTN+Uyp0OxHg4slBwFHux4riO8AXOfTC8WGe3xDAiVpe0F36ZkMx9OPPadAmdjxV/SFSTqMsLO
 UIsd4W8nB77nzoxir0lDUCs43jdlRtY=
X-Proofpoint-GUID: jhXiuNjTWQXjB5lgJbEnAMfIFmuNfuZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX7EkOn/Rs0exF
 ml+k1nwwkL0Evi9xox/JVn6Fe3f/nQilMREl+oCGKDQZi3PsnI4XDyvBbPH+GKWG+tyhk8wEVUG
 zYilGRmfmlz1KnqWuwLpafip/SN02SZ6cmu3ZdI2mcqe8LyUuqpC/qoEQzRJFADmDARSHBcRJkG
 GwieSs1ew3/XHnn+k0MbkVjZtpolftcVJ/Jgc9JM4xcwOo7AFbYpQ2Op1bhe0TqRfVIO76hEj6D
 NkPq2Ez2v8wm+sfacvJa1tBlEth5oo7wIfxEv1o23GaDgxRT2slwLHyQUgm9qJyFxDxMZWQ8rGb
 6jbM86u51LMhuvoNZXZrIy3fpcyz+xIkE6pPXFYOCcWvAmAjxpfOAqu4pSbehekAWzOQtLBeabo
 PS45zxc9OKuw5NsdCQPR63Lt1/D5Y/18WTrAXq6nXQOCGPLeIssa9+Ap7HB5D9TixcYAIuvhFJW
 vj1RDzu8SYFjFOuWtSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

Buffers are stamped from the write master done interrupt, once the frame
has been written out to memory, while V4L2 defines vb2_buf.timestamp as
the time the first data byte was captured. Use the SOF time the CSID
already computes instead, handed to the VFE the same way as the SOF
sequence number. Hardware without SOF tracking keeps using the buf done
time.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 7 +++++--
 drivers/media/platform/qcom/camss/camss-vfe.c     | 8 ++++++--
 drivers/media/platform/qcom/camss/camss-vfe.h     | 1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

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

