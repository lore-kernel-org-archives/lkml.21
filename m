Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454215;
	b=IISC4CrYuzoIWzXHXO2/V+9BlrhzYLb0Q64EjrwOBORV/ozfGHUTeQpnN9raraM6oQXH
	 OB7Oh8uWmCrIkyw0IPItZ4DTUL6WVApQOYZW67GLjWuNA79Bs0EChJJsWOu3g7oVK/EUZ
	 7XA/wmQK+en2h7PkC274M4MTFA5JFcbeymHxN9H5KQbBNWZKZtG+aW29jeVyt5sH1hJ7c
	 MRtfGriP/U8rtrWXAGG5xYdnfvQAWFN/Zb1ccY/tMTXFr0dkkslV9JU32b54yxqcJdyfI
	 NFL42OKmtG6TMFzdN/udbvNBXtxWJHW3SysVkwU3FyVtETuG2ASrcfW6/Do/bsOGt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
	b=as+7y1pHONDyOXzrr99lUY33oAwOEL3DnaaTaqXZPXtKIYoYMyfa8LX88YgJNlWYle/n
	 NlYBfmqff2nQZIlUZYykI7q3PF2tKDpL8oIWw89bU66OA8Eg8PXP8pWEtjER+iTSIzYhr
	 3GwbCci3jCm7mwZJeg2KMYgkXewC9X3BWFX/xFMLbbz373yEKTy44hGQ7wl9Z8hygVNL5
	 6QcXnMDMimcg7Xz9k+/r5nZ/F825SKXpFOTBa3ZM+gGKpdJfbbQrPTcgZZhcxNd44oueC
	 KJt1zoyDTQHnv7hCU+NukOX2k5m+/Keow3O+2VcM4xh5AUM40ZvAr+hEFBIryrDVHCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQiyde2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d/f6FSTg";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E7606A689
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9E7606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQiyde2k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/f6FSTg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1jE3475177
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=; b=NQiyde2kCDEtNgHB
	7+/wVFhO5O/nlMet77e7dUX8xXXcitJ3ZaCrVGoYs/3V0LxbLMY06s6ozdwvmFxf
	ZvNV+4Yo/FjA+COStUU3/Dyy/AIUJdI/B/0W37cyPcqPuOP0P62ur4QCqgw0Z+CM
	q7Gy0CQWEloJjx+Fv1Kt0JcJcd9Qc3NjwVkdfINqH0cm/+tu8t+3+uohSsNJu2YO
	OjFTC79M7BvrwQLHWyuZtmsuLTK37NZdRzabPGg6bNSKqnxBS9aea5lXByyXDR3F
	wXWRYIwvBVKFXPE6VDzFTjJXdJdkcGlOHLVlJLym4QwwEBgILtBHFZ/nTvDAK+5U
	5teSdQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7t6eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso1042493241.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454213; x=1796059013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
        b=d/f6FSTg0Ml8/ZZZW8h0QhqaeqpWcNyWzy3bjTEhrnTHaxSndrikvRYAhLhw+9/LGY
         yh0qMiFAGYEEU+xKER9/YTgHgcQl7A5arY4RQbrYhq+WAdU/N21fCWhfA29z/aSx9Idl
         hjypJEROWoT8Zl3HyGieH3LNK/CRljVSvFpvIk/GbTDXe8gAPyUAYLdYXscwFj5/dzP1
         G5nPZqehGNfUOz1igqQAuXZLrn9PsKiHA76vBxk36+ekOQLnyy2viwEzDSJ7iLaRUL6g
         Uh89nZQNj5VWjkq6ptOwpcSET/0zgfRCC9frhID1bnXhauF+2g07hYKo4z2yg2pPEIdV
         zaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454213; x=1796059013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
        b=TCylQ3ugLXbjXkHxN/+DPqvmKm5qltElUH6fr2MP2HlyjKlpd4pzpIaCVtjbqFiD6z
         qmNgunwNl+QjDfgD7lwAb/i+4HSiP5h6uELTqsBf/fgxPByvSgJXgsEAaQeYdVIo6gWb
         Lt/qlwfROhJMFumJRPWWo2SgCFa0aVHSqoWzlUmBi7MH3G9gAQMfgOogvRcTFZh/k2bC
         eO7l4FDsIvT9mOpzDOzACz2Sgwr+LoEepko6S4lNYpjOWgYOetx/0joXtCjBIVNaBH5I
         Ag+N/suXYDAlznn9bGTeBBM68h15MtnfJVZoR8yGFKZHdwlCBRkvwFTDM0myU2iXZuaB
         XPpg==
X-Forwarded-Encrypted: i=1; AL+hErHredPoTccwv4Not3bj2is8SMfX6eutI9F1kmZtdNc4oDs1fepn1eu9Ll54P+beXs55f1z2pJZaYpWUf+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z80gpz9SJv5+jM/Llvkz7zloWYdQmNazqBrj+Ucx5XjLiQ8AtFG
	hro9x+LAq/RHhHUVrkNUJ9Y0ngASmjasU1ktDGZ8KRdl/ylivhVwIZIB/DC9DsQSYp15s6JZoZu
	Q1hqV2rjnlClGLUtar2lLAnemMT9JSmjfFVqvLwn2lXs2LWXz+5kRI33sY1GyjkSisVzsb5hfZP
	t3JQ==
X-Gm-Gg: AZFdTZd6oiDRFa4a6X4E2zUh4q3s9uY8X7rk+bQ85PkSOmv03xZpY3KSRc49O73I1WW
	/sTkdEeo4KqbV9gkD0wxq+6ODVADF38h6Q6h4prZZJQL7Ktc3oRl7dP9jIHbT3bnqqdnS+lYmjc
	8dt7MxnHueQQd/kxC8++pTrp6iwlXk62SYsp2yu4mGo4DZgrmHzz3AZnu+y4chyVCJ5Jd8G4Mr4
	n5+VsYQurKemleCOhz+WlbLloiOLg3JXFAlRdfFb26SMIaVuiJHMjcBp3SutiERuz78LvRqN25Y
	3R2W0pbrP1i++T8Osw0VcUCwgmvrz68cxQmaCd9JTvjQNob/gGM7d5MZ7J1MnU4SUZFoSXR53az
	NOCQXIu6k43IuIfXrgsxTkp2BV5h2FT3Fivlh/Z+qdyRlkRjpTf+9qM6NyevtEdYPSfSxJ1KX1L
	QUuUvv8Po7dJH5unmhtf5XvJS6O8mMngOY4y1Uvl4YwXH0UjodNvjbKUXMiNyHiznYyN/jDnNF9
	dnHiJJTShNg+kbtxBZHwYR1yACK
X-Received: by 2002:a05:6122:1350:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ee8adf6a05mr5575957e0c.3.1795454212462;
        Mon, 23 Nov 2026 09:16:52 -0800 (PST)
X-Received: by 2002:a05:6122:1350:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ee8adf6a05mr5575892e0c.3.1795454211924;
        Mon, 23 Nov 2026 09:16:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:51 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:48 +0100
Subject: [PATCH 2/6] media: qcom: camss: csid: Pass the SOF time to
 csid_sof_event()
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
Message-Id: <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b047505 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=doqduI5V5cNHhblwjzwA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX9ulcjQMbVAEG
 NGHF3l77ZpIb4lbNWzAb+rLtGGm/f9CWjr83UDQugr0PYeU28HzN8Jj6xMi6FHPNNBfuYWV7+IS
 7A3fykr/xl/Cm4PqXY6F6u2AHD7ZqbMaZ+M/vkF5ZBk7KWCV4o/mGb+AQ7jmKZoEI1XYqx/UTaI
 aiX+1sU9xvXD+MnOQgJ32SJSDdTLxJlj3/ecq15dRYP4weWEO6q0IEgkQCjlQjyO1WOMO6a8IVD
 p5LCF5BXwTFchjpfsNdhSyaWNQGNRv+2qx9fuJoNeaUFuFXEyDcwqRxuE0rgc/y1DcEbuME35AV
 2PgmtJfwfVIX2NO2uj16Nk7Q+twD9mNkgUhGl+cQ5aygkwHYlB3tMCmwLYF5ADFZa7M7eSmIte3
 40HIkBj6qAJ92s6hdaW1HdMwVzxKrSw5QrSwn+OrL+swIMUAl6r7KLS/sSxLoc9kaZncrWhOehy
 cxR3xnF34unxHSvLuyQ==
X-Proofpoint-GUID: FZmR_WfKUeWEk8F_ToBTR3Czr1Q5dCoK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXzYw3tGbaECrt
 +/SWPNf66yF4mMvmPF+olVExqLh4CoumXd+XMG/qwuihej+/f2v5uZfPf1RrJfc3pDXqNlrMWQ8
 44ma1XwE1da7HVoxsZb1n72Hh8Uq2TA=
X-Proofpoint-ORIG-GUID: FZmR_WfKUeWEk8F_ToBTR3Czr1Q5dCoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

csid_sof_event() queues the frame sync event with no notion of when the
start-of-frame it reports actually happened, leaving the V4L2 core to
timestamp it at the moment the event is queued. Some CSID revisions latch
that time in hardware and can do considerably better, so take it as a
parameter and let it reach the event.

Every caller passes 0 for now, which keeps the existing behaviour of
timestamping at queue time.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c  | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c  | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid.c      | 5 ++++-
 drivers/media/platform/qcom/camss/camss-csid.h      | 4 +++-
 6 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410d33f21930ee56d714f41911cc077..5eef5f8846fbfec5afa1152f73a098fecd717fdf 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -207,7 +207,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		iface_val |= status;
 
 		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
-			csid_sof_event(csid, i);
+			csid_sof_event(csid, i, 0);
 	}
 
 	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5f5e2271945d97764c62b630da6c..8ac83d469dc39d45a37c9be815d41bbab12909b0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -411,7 +411,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
 		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
-			csid_sof_event(csid, i);
+			csid_sof_event(csid, i, 0);
 
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..72f329c2bb1ddeec96f33c21198104157c14a73c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -387,7 +387,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
-				csid_sof_event(csid, i);
+				csid_sof_event(csid, i, 0);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78be5cf64691c351149b0a8fa68c3d..fa9af117f3e68237f1dd27a48bfc339152c63f94 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -304,7 +304,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
 			if (val & INFO_INPUT_SOF_IRQ)
-				csid_sof_event(csid, i);
+				csid_sof_event(csid, i, 0);
 
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..bb89fe26ec2342487c3ba6357d37b6f188476d1e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1370,12 +1370,15 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
-void csid_sof_event(struct csid_device *csid, unsigned int id)
+void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts)
 {
+	struct timespec64 sof = ns_to_timespec64(ts);
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 		.u.frame_sync.frame_sequence =
 			atomic_inc_return(&csid->sof_seq[id]),
+		.timestamp.tv_sec = sof.tv_sec,
+		.timestamp.tv_nsec = sof.tv_nsec,
 	};
 
 	if (atomic_read(&csid->frame_sync_users))
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..1fde67d16867a24be2a4f8940ed2d2a60f523ee6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -265,10 +265,12 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
  * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
  * @csid: CSID device
  * @id: CSID src-stream ID
+ * @ts: CLOCK_MONOTONIC time of the SOF in nanoseconds, 0 if unknown, in which
+ *	case the time the event is queued is used instead
  *
  *  Called from the CSID interrupt handler on SOF of the path driving the event.
  */
-void csid_sof_event(struct csid_device *csid, unsigned int id);
+void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts);
 
 /*
  * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.

-- 
2.34.1

