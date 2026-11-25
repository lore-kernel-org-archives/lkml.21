Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593613;
	b=UflheXqjiC4+Q0Jqurtmk5SbKuKJxF9VfEi1oe5brdYhB9ynWyu0/el5Ae9hBgCPXya1
	 dWryeAb0c7r+5V+HwhdKgYKKWFTQ0UiYof0ysEnVnd118dFPm47gf7WirS/s1j5oAVgXh
	 IkCCUSfABVTQ5sUtrS5Ju4xkzyYvvLAi+1SkylLos4hIHR+wTfoBKJSqMSEKwB77qtdJ7
	 iCYt2T/8v2c29Qoc/A7rA+CXBlIj4MO0ej+imwCCaIu7Hfm55ML7V9ljT54wVn7V6sv2B
	 R4Pzhr/1q/R/xmy3lsiHnAp/2mC7CGLBGguELenI6m2QqXvqAS48ZJR2yKuuorKqxng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QZqenHJHuvpcFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=;
	b=O3O+QZxbeYja50lVIBWL4vN2TbBFIv121FSQuuOUXpThRBZl1TvMgdBEl6yF174gv7Pf
	 xE2xxXp81yxIRJ4/QYarjk7I5zr75c8bKfJRanGNvIpYzBbun8Z7VGineolm3rxA1lbVJ
	 rtJQRS1AfPt9i8J42mnkRy89sqi8ZzH6aApKysMKhprjr06VyTtxtS6mUIYZpxPxXZCYE
	 RT1uoyoIFhOfGpGAo53QgCEOEtwUdDDEvdUB8Mi2RDPAfrbYfMykrvPlzFKiae520kBA0
	 XLzw8+czOghLDJt+EyWCurS+1kH10f0xPilsbCDLOt9t33JGDVSlxQ2pni2j/xI9yqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCYvtYsx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC379606A69F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC379606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCYvtYsx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Sp43534084
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QZqenHJHuvp
	cFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=; b=bCYvtYsxLXNYdxwoJyQIm/UCcVH
	zW5DnjDxvUPYxBNJD7oo2ivT9ftJOT7BttbJIU1rEjDANjmw3T85K7OA3Lpe2VlT
	MNxq2ACPtnl5Gbvgq9LXl0hFQkdQncOGbJqAIjG25dmaLrQ/0myNcZqbDfslkju/
	/XaJG263TiFeocOecLwI31eEBq8OZg+nyK4inU01GkL51wG6iI/jstZGGgdY1p5d
	N3NiSXg1ZvPjsJ0MkIyjvn1en68sBW4SyxJieYPWxoDIEcnK69DMBkp9Znu1qZv7
	zrRxA8+RFAkJFqIdxEnExaZm8iKdoAww6rYB8c0XTtNtGXLHXRg3Zp+yyXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhhn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so857196685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593611; x=1796198411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZqenHJHuvpcFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=;
        b=1UESVn70ZdmsSlN58q9gW/9MURUb3ZJbstOVtd7jobyIG1oyTv3am6q4r7Bz3ov0E8
         oy3KKyhZrj7K4bBvzHK52NwgcFpEUY4k3NAPAQIFJt6BvoFme3VOHLRCCujsbpX19Nry
         dzbvwMzrYBP3yOfMTX1zv7O9xmxs6XmaW/V6uQSZORGOPwbDI6XyY2ynSZNukdlni1Ua
         r1NQJH3jSP4yK0v64243atxJ2+MLQRriLdWApEXbpZCV8U1hEyrScY/9FIp/ZJA0fUVy
         5KC/YSMjOr/9MCSoratmrOMxJwbQSd3DeZGTt2JEMTYKOARwwDwi5IqOw8DWlEyu8BCb
         g7Mw==
X-Forwarded-Encrypted: i=1; AL+hErFnePL/EYadI0GVItHlWVFgzuzR4RZc7MxgaaFj3IEBOzFetTvVSXpEfmNtum+wZkvmYJGCpd1FXJ8ePTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wV5RqQ4Pd5umY6omyHD1Y6T93wKRhggs2sQE9lRyPh9VKy/dh
	b9omjOlWowmRDYHVRcKc9NT2uwF45mDAFlXMcl55P/KVvwywT8w6U8ulOf82bex7a0QILxpTeYf
	lX4jUPWkDIHVBS1q6jFWB0yIKSfKu59H6XQSEaFLvHpoQcyhxuDr6ytTwQSfTAKw9yoQ=
X-Gm-Gg: AZFdTZdS7Rgze6ZnERq4XB6xT+IX5rojYv2skB6mgQl0mJwDeZ76NRy9155ShDR6A4Z
	L02vgXTyXzA4ekmJkcbqhU0vUZez9q5Js3Lxv1ypHKBnezuC0FMsQlXzhjsfhsZcGWa06VgZV18
	4C+UqqveCjN0u36KDVoM9YBZISV57OS6IvycK6G2h4OhoddYWfb0w5KsglEzHpVgWchd+k65gJW
	xthIwJRrUaTGyadzr31Mu8kwDyYAmQG7jX6gXceT/spqjXt5Lwq9zQQ6hqWKq/pvDym9VBGx4GN
	ypuo94jb7SQMKgB/aRfLyDZngdht84m1/4hJiTHmgakUty5xMNRQtnDKY/RXMly482i2BC+JiPs
	9nrLeCx+7hvMqU4cuCA==
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id af79cd13be357-949bab2a981mr2985233985a.72.1795593610457;
        Wed, 25 Nov 2026 00:00:10 -0800 (PST)
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id af79cd13be357-949bab2a981mr2985229785a.72.1795593609971;
        Wed, 25 Nov 2026 00:00:09 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:09 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 02/12] media: qcom: camss: Add csid pad to port helper
Date: Wed, 25 Nov 2026 09:59:51 +0200
Message-Id: <20261125080001.2540101-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX/KtbaDyjjoNA
 7pcrLa6ScEaLhDBQA881jHT6iIdFaAgziJeVWRhOH5SmGsCAO2dRw7nAMbof7ZtCRe3bcH2Ih4Z
 xrjSYu2S3WeBsMqYDZThDfGvi63wwLk=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06958b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=gL8YbPdMY_OOZm72eTgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX6W9VllOv6C+S
 3Cysk3nCijMUR7E+WNRdEh4a/pOzpOZpuzcxSucjI1U9toKvT5/hSJpUbZ/EgIxjHk1C6Ut4ICD
 V37PU8dyG5SsMLJZsgr4Kcx4/OMNO0Q5Jr2aHTyrQIKcuYegTmiTHNngO0DbKX+NlyIHPzf8A0C
 qKxVzsV6RcZo37r2v28p99az/yBHj9mv8zpWZQxGQcrW3mIY1xKebEH7Q3EScOiVczgtV88ciea
 XepZOXMsCdhhwFVtU7HtsIjudExEQey1cQTypneRb6IL0BAMRO2QdiWzkNsyWIvdg0MoNdyDCu+
 P5ziP2IW32rFubi9KL6sTQ/nQts4BstuB/1xNVqAOd3+d4u62ByHUHe4VhHCaERCyyp9v++ieJm
 b54HvjdqNPY/DXSN/k1Up1xJvlmG4XmZcswTtZ/rnNCGTPbV3USA4nlFHtiDEbgTt7eSsR0dQhI
 RHgnNFm5WH1CpVg8+Lw==
X-Proofpoint-ORIG-GUID: moaVrBp08g86aYtuXcDayihhUfus6zTh
X-Proofpoint-GUID: moaVrBp08g86aYtuXcDayihhUfus6zTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

The function to convert a source pad number to its port
index, and use it in csid_get_sof_seq instead of the inline
subtraction.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec85..0f819c34e760 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1356,6 +1356,17 @@ static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
 }
 
+/*
+ * csid_pad_to_port - Convert a CSID source pad number to its port index
+ * @pad: Source pad number (MSM_CSID_PAD_FIRST_SRC or greater)
+ *
+ * Return the zero-based port index corresponding to @pad
+ */
+static inline unsigned int csid_pad_to_port(u32 pad)
+{
+	return pad - MSM_CSID_PAD_FIRST_SRC;
+}
+
 atomic_t *csid_get_sof_seq(struct media_pad *pad)
 {
 	struct csid_device *csid;
@@ -1367,7 +1378,7 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	if (!csid->res->frame_sync_en)
 		return NULL;
 
-	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
+	return &csid->sof_seq[csid_pad_to_port(pad->index)];
 }
 
 void csid_sof_event(struct csid_device *csid, unsigned int id)
-- 
2.34.1

