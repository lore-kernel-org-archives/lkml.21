Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631030;
	b=TWJYPUXPN9KoWhWpXLUstVgPjK+YoToZaMIOCp0WM4T5eTt7aeMxOmq6aypjYvyEns0A
	 wSKEUezFK7vdJJLyRCFd2zZrhOihqfdKAKQQBMiFvqd62jN5AW8tW68tX/1M5FbvZG6o4
	 +hRqEFOi+g7E2bMULjdZKWxZ0gGZr8YL/fNJoHVv1yLQzq8D6Be3zl886VHIA6Mp9UKMg
	 POucgN1aiwTSb1kD85ocbwGN9WCMNH5FQk+PQmuCSYNN8F913wwBZ5uMUr5kmu3ihHaZY
	 qUkYomqcVVIBBlLNgS1lbkCSpOBk2O7MWRlDEyPJyL+xVQHNo3kJB8VBzwfq3NQ3q3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
	b=HNj93XnNqClNTuZ2Ix6EZPce09BCRd9S34tydCHcDTYz0NhkcwSpGkuM9mclsWrt9Pma
	 MGLZLE5agl7zuB7K+d0dTJate4F405ALy12ql6WUNsqEZfyqw4nFVlQ5OYCgk+th3SIWG
	 tkcfNjywjGSd1GCWG3JszsnYF5cMA9feDKT8OcYkgE6J1KAMw+FIXLoEf0mFl+p04G+3I
	 JiP1j43LV51qdjpyej77cZ4eSQWtlKnxtu0yRsMIe9ltivGHeTdOYSfSVRvma2JWhRBhH
	 K9nFKE2PwOFjErbJJ1WjlIvBOuuZlu0SnEPISudQQK2PGLNbOIJuhTUiQOBnEzuD5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZ7nyQuL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RMD6O171;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39073606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39073606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZ7nyQuL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RMD6O171
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ3DF999452
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uxKxeCj5wsq
	ZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=; b=fZ7nyQuLEkQ4O94uQ34n+LlrVzE
	KEKIKNmYCAYcvae10mxvZR7lCXQkEUMd35rF6EavGxbo14LzxS+f+7cCDAFBQM0d
	JwMil78/bmTdt5FuUfIi4ZqkxsNcCq3RYxEymwOCYiUWm6NAXC0xUBaxevSCRKQY
	3FXUGNpLfzpHIQJtApzHp191ZtzujB1cfa3E94a6xQekrfSjvBN0kjypios5QWNP
	j9KTMn2sE8ckRDeaw7PD5BhvQxEfpxXaFnAaTPiIuwnoY7Rzvs3I4xKE2SG6Fd8C
	OOafxrC/UmHWj8BA3JtFdw01oAs0N5klxOzohC185Qrgch2pHjwm3MKuMLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxsg6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:23:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so965798485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631025; x=1796235825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
        b=RMD6O171usDDQAYJEgTBnJ5Lt8nQtiRknXlWuNx0vsJUlibLVvkuYwrAFoF/UW48EA
         wVGyyOjie0UKtr/HEPaE1waSozifl/Pf0yNwhrCGurhmTOS67VIfY0MKBGergCkwJXLv
         UcGz4MLkj6HoI01moan6wUSntW2XYRRvjCVhHLdXMl4KbNprntt50V4+UvM+s8ghzt1U
         VLT+1GVjbk1cr3+gJ2sR1TMygUWgp1D0vOvIrFDAfw1Df5+ya67uq9MPZKoe3MT0CJEB
         /7fKixOnYW5zuDpG4qFKGh57qGIAEvIuV5jh+CsY4mQY9yReymhcGXyX6ZKchJKUh948
         IhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631025; x=1796235825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
        b=0NCfi2kuvCNy2EvhMZV4lltfXfGIrRsfth6VdX8wtMD1FsP7BKYkNTDDvXvY/dZiQG
         3bYXlNAnebbA2J3YdRQd+D8IOaQbtI7P/Pgv5qiZ4TjnM0b5yFN8l8oH/1+zoye6gATW
         jefMspZBGSktIC7Yl5Cfv2TC0uqCNK+GZ2/AfmBxCjutAoVPHBgBs9KeXhbCj56pYg+6
         b7OiZ8zuvRqPaO+0weCGflQgkVIFC2unZEXqQ2U1ZoSW3yHql6BdIgCHB8km7HCXpVKc
         0FMigvJnLUakskPesnvRKD9HgGDnGdC3N/6VzQ/8UE/0Lr8SBKcoKcnC00Bm8XffMjS3
         Rbjg==
X-Forwarded-Encrypted: i=1; AL+hErFi/eg/fcafim2PuBmWS5+LxO+OH4xI0CdVa4GK6z5Vgf85mG6hPTOMnSDmT/w2tdURgYWxE3MfVmR3pFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vzlmKwMP/HDsr/oRsCOdwJgxzNQfpdIxSE7KX/fT2nb0Z6NsJ
	EYUoAQdcwYyBTPD0/k7jlcLa+f4suGh7D+A8atZ0V2jeiY0ydCbX7rQjODjRnojicOrQyPD7sdJ
	pO9CaV2Sj1xSyU8H0lK2aEt8YK6cTE3xobLUUEjzI1iN/+Kgm1htRuTgxWSedamPZTC0=
X-Gm-Gg: AZFdTZd+7ha/45Uf8Wp8oz9Qpj7GWH80LTXWUk2e/LEaIaP6IeQC0mbMN5kpq7zAZBi
	Xd7UcSmEBFdXGfxCTPB7uTPjAfKyRLjOVqe/gYRDUzAl5isrGEIEQ/G/53ET6aH65f14mnDyY4L
	lcSvZ+Wcfw/Bv2lWIWuQhjYd3atAiE648owpjEkgl+mHu37f8UL7gewnt7eAt62ebMAY80CO3ac
	6ndAxvS2T8fm4dL5NXgKZGAupxGFE1wIoVRre0LNVqnDS/D4sksgNRBPptvzo72veG+63TSq3bt
	R9RIjLr4VH1s40Joz80Znh9lkUJCiFQHz4IGUGhcUkv0wVMzCN8eQ28MSB13m0JQnEZegcMPNzV
	WovvQkCYPHxqqzkQDPze+uOQ4rO3cfI+DomPsB/Aq/NYd8Ug9Gk+mn0HVHeWDH8aw6fQy/8UDUW
	ep0/K3
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr3248908385a.68.1795631025572;
        Wed, 25 Nov 2026 10:23:45 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr3248903385a.68.1795631025018;
        Wed, 25 Nov 2026 10:23:45 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:44 -0800 (PST)
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
Subject: [PATCH RESEND v2 02/12] media: qcom: camss: Add csid pad to port helper
Date: Wed, 25 Nov 2026 20:23:16 +0200
Message-Id: <20261125182326.2767771-3-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4MHxCd4LHTs-rlw-wlefyr-XqeNMb8Qg
X-Proofpoint-ORIG-GUID: 4MHxCd4LHTs-rlw-wlefyr-XqeNMb8Qg
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b0727b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gL8YbPdMY_OOZm72eTgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX72gzDmy0R+Yz
 IrGXNV33D/lBIbhrchctXgfZGQ1hZNkY1r240pfS6QUBDViyrzLhAWeLRPqA3QZNvyGLESpQREk
 bhA/NxieHhRCeT6TNPAb6uCIccRYy7to3opXIb7d4vx4sZ8Pd9ArQJGQUQKc9XO3Vm/+CWEOPbn
 WluUlITW0TBdsf70HXNA96LAo9PnmD+aahasSDHtPbzCU8qROrp2cPmr1LUXsVTFU+dazXwrCAl
 mqAgTwQPuk00VHFQ+sYgfLVqhraUBLTlTWeAzlDdmKqoFj7KufZQx4o/D1enKQfqwdhLUsgNk6J
 EEfrfslKVvIbTNliMB32YU/lDxcYO0mxrgsxlqQwWzeZ8qscBgTBHMCDbMgY/tYifv3kqRLxuPa
 x7mwUaExDmP9a4DdD+fCl8E82H/+1P3qnHZ78fQcL05xgKl6TSajW+gOnAUgea1W2uMxyc33FQN
 0mpZn/nP5J//HBtDIfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXxuzufcIiwmu1
 1PuafDGPKwNTlMVh/zX9BlKRdTGyKWFildDBVllJYHAtE5lo3FUA+lYL4TTSFFcSa62/7BhbIWr
 /tuy7Fh1OL3CgGS8GG19gycJN6lPoa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

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

