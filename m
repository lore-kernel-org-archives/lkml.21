Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594081;
	b=18rvTavCexN7ZdqF9D+vpzsH4wTIjV6xu4z3sQnTj73SwUQq8Yz9zpObLqlqChjfdKCg
	 U50ysbQXoMhY9tq+28PpLGgkiIaR5xYRd+tqi6BlGzSIvUfd3HgsOpSc/EL/KzNQflQPV
	 a+fRUZuyfH2E5IoKFsPEYUH4Yaj/JSPtcmnLsrYpxNG2NGy2C/TJ3iHa5QCEcWTyhvtZ9
	 Ger97Fgg0CDgeTpglvbPBiiB9DrImuj3s9CVwdnXR7e24kK3+qop03FQoWmf38LUqsEXB
	 4/qaAZt151mBgEooB3z/aewmp+Epa1T5sv0emugbteD8qj8TcPERK/o53htb90zM8oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E8makF8FM1RabaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=;
	b=4UIVvLmM5yA/+sa5JFA1r6gGK21DQ2hrmd5JhcR58IBHEH0ixRxTZCpwIZrWF5HhCGBG
	 t4b1FdqTmSefWMh+1Wo0WB5+mq6LIcSOw4j755UYElgsmzSReaEj6SPZv6K8Q3qoQHgjM
	 CoUBH3Z7tuUA2Gr568LpgtAVmw9bM3TJDcnA/TVUXK0LDmGGWn5n4LOEWK5FH6hiRnOPG
	 AQkoZ9zIiHV477hmD+b+O3edCjKfqpLlARI3Cu70VLd7k4/DkPjZByMBETF325J8pz5Wq
	 UYeRH5c5D7SGloQne5uNDoK4T+ZFavCmPkSJh/TvhE4UBMNUb6Gyf8jySVvmZnmgJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MB1nAShb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1C7606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C1C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MB1nAShb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68kbq3143002
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E8makF8FM1R
	abaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=; b=MB1nAShb0YngRFbK/b2GGN+iqoj
	x0NLSeiX2LpC+1Nk+pwZ4eOpeVamc3tCac0ZhZRVI2a+Pyg+O/OnLEqvM2L4OjEV
	j7fF9FpvURfwX1msXv++ubB4evykAeiwQGSvN2pBLRcApmbBVDdtYTTEsBNIfzAG
	O/xhSrGHbXne5IshdA6rAu5FVWwjysdklV9Q+IIvm6ccvms4onJ51YVh3KEuaz2R
	yFfgBKdZqn2KkAodn9KJhnPc3lETh2qzHclqD1OmMufVWu0SZ1hI6aWgKXBxnqHF
	BfFkOQI+1V/PbHPvXoVDy4OlwXAsmrTMN6zSexymVTxVRNcdqQYJst43Ocw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29nda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:07:59 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-702a3e438dbso4725289eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594079; x=1796198879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8makF8FM1RabaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=;
        b=YSRCAWj9VZCFmlNmeWslPVxbWZ6HWNrLM9K+OadnaAi1eaLgiTMs+V3rhnyBlCpGdA
         NMWF4JGxZ0NVbekrGii/wgO6dWWdQJdXsFpZHBkzrg7Fg7RDUhSqK2IR8LvuczknnoSV
         6vY6HHgXrGfn4gZMq188rcv2bKrDN80ti5QLShPeRAScy82eZpYl/Ev+Jh2DiG52lRE/
         pjSFMdSpMtQdGwsEqx7ORVybLdBiJOG7JyoPd98T7/5V6fcqzsts3qIi/q5i/7fP1JBH
         P8q8JRQLdP/E+HlffOk4io20vRtP8n/576+Y9g62zCZhVrn0egvsgvnQFZm4W99ZqtXT
         kDhg==
X-Forwarded-Encrypted: i=1; AL+hErEAzh5j/DZpEgVTHQkNjTWbQqxG4CMBu6QqkZJ1qLwMsUAfDoeGBCRFmCcSTiRPZV3QW+2Zeo6VNdM4c/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z86/wgTD4fXfUXwNc2RfCXgFIHCz4+VQF7D4OAr/jYNdwfAUseD
	INsA/5a6FMUqOTBPYdnAvxZ426cb2SNsh9tipdZFs23wDROS5Uwszfs5K8z0HOGcfrt2jvT+gNd
	GHPNjTxkMrRkQdXJw9nd86hxGHtAKLd4bDgKVbc4wH5jq00x+QkQbrimFmGL6PqdDqDc=
X-Gm-Gg: AZFdTZdZLSFMcZSpiOvvQvqc26nJ6iDLLHba5xJapOeYA6i8of7bDTJifhT9BVL2jkW
	EjeTB3w2BhXzViAuHErUNsSlaW4L8bEBU/44SsunYQw/oNMT5n3O8yxkqJvsLikC+16YzlVaMUL
	C5pO5O8mZHB22V3q/6mF27ZQyS6hlw5jI5sPNFwUkF1x6rZIsNgRqtRNIzb7c8qtwvGf3IaTiTm
	HIgokDl7DhUHzel7mn4KeVGsaj8Hm1hvSccJMcuMAzPw7MZG8HxfOdp7fetUvfpnxQZLLWoKjBT
	fopew6bS6EDP7WVuzFBAN0qcdFWN0/8pVfbbxXHoVq2MyOz3pVqZlSYv81JwJSUOw2lELFK7DeU
	0lcbbPmEtgj/SFTsPaYfKHFhSEG6VN551
X-Received: by 2002:a05:620a:f04:b0:949:3ba5:15d1 with SMTP id af79cd13be357-949ba8239b2mr2982727185a.4.1795593619844;
        Wed, 25 Nov 2026 00:00:19 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:949:3ba5:15d1 with SMTP id af79cd13be357-949ba8239b2mr2982709285a.4.1795593618711;
        Wed, 25 Nov 2026 00:00:18 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:17 -0800 (PST)
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
Subject: [PATCH v2 07/12] media: qcom: camss: Add streams API support in tpg subdev
Date: Wed, 25 Nov 2026 09:59:56 +0200
Message-Id: <20261125080001.2540101-8-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069760 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=CAsIyaI2BfGF7LVpe1AA:9
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: VZMDAGKbo5ZR-bCfaF5XYGhugkOvwspF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXxhOvu2+xvfui
 WBNbhJ0v7KnkeNG/mzldCWVZ/zg8K7rcrm5nwX8fhGfWl0b/OX8+WSFTlY0ZLBnA3+/ngw5EsTy
 Hhp8h6uZOFb3epSAq8enBIQ+7hSjwIZpTYekD+bOXdh2iGYVo6Xban3VCDtv3VtwYE9EK5AoZpS
 Db8+rVDXEbgQZ8yj9o0V1KcCRtLk1hQ8n8B8pBkdKVPs2yQDt5ZmKWpVqpiIDEUOhP9wCnwCjOV
 CJGGNft9QU3WY0zHibGr6plefMYG+/GZA3Kqknk2KlAQ2/EOdyzRO/szjscxCXg0/aQEZkuDMds
 nUxCRtax1voQvtKqlXbFiQAo09V5RJkWNO7W0VVE1QrMpC2ZzQsve/+N2B1x5FtqawUypQrTi5V
 yiVDDbDpIguJDp1okweiaxmjxNulfuzxPvAPwSa8jbBTZAjNQtqLHt07DZl/DG6t7URVKUMXqqC
 Bu+t4KEIvcvRdxpaI+g==
X-Proofpoint-ORIG-GUID: VZMDAGKbo5ZR-bCfaF5XYGhugkOvwspF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX8/rH4gs1Vc9n
 M09UiE65hZ/nBQ3qOv10Oq3WhzH1ySaLBohPRyea56UFGMgtnhM7/Lqsfmesw3lUh9JeeUif3bn
 icLeFiTwWkJH/rpGzWeadFm4pQJ8rT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250032

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add support for the TPG subdevice to generate multiple concurrent
virtual channels under the streams API. Replace the single fmt field
with a per-stream array sized MSM_TPG_MAX_STREAMS and track the set
of active streams in a new enabled_streams bitmask.

Add tpg_pad_enable_streams()/tpg_pad_disable_streams() pad ops that
update enabled_streams and (re)configure the hardware, a
tpg_get_frame_desc() implementation that reports one CSI-2 frame
descriptor entry per active route with VC equal to the stream index,
and a tpg_init_state() internal op that sets up one default route per
stream.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-tpg-gen1.c      |  63 +++---
 drivers/media/platform/qcom/camss/camss-tpg.c | 179 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-tpg.h |   6 +-
 3 files changed, 205 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..22fdeef8e76f 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -5,6 +5,7 @@
  *
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 
@@ -106,13 +107,16 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
 			   tg->mode - 1 : 0;
 	u8 lane_cnt = tpg->res->lane_cnt;
-	u8 vc, dt, last_vc = 0;
+	u8 vc, last_vc = fls64(tpg->enabled_streams) - 1;
 	u32 val;
 
-	for (vc = 0; vc <= MSM_TPG_ACTIVE_VC; vc++) {
-		last_vc = vc;
-
-		input_format = &tpg->fmt;
+	/*
+	 * The hardware generates traffic for VC 0 up to last_vc as a
+	 * contiguous block, so every VC in that range must be configured
+	 * with a valid format, not just the ones actually streaming.
+	 */
+	for (vc = 0; vc <= last_vc; vc++) {
+		input_format = &tpg->fmt[vc];
 		format = tpg_get_fmt_entry(tpg->res->formats->formats,
 					   tpg->res->formats->nformats,
 					   input_format->code);
@@ -120,7 +124,8 @@ static int tpg_stream_on(struct tpg_device *tpg)
 			return -EINVAL;
 
 		/* VC configuration */
-		val = FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, MSM_TPG_ACTIVE_DT) |
+		val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, vc) |
+		      FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, 0) |
 		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
 		writel(val, tpg->base + TPG_VC_n_CFG0(vc));
 
@@ -136,31 +141,29 @@ static int tpg_stream_on(struct tpg_device *tpg)
 		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(vc));
 
 		/* DT configuration */
-		for (dt = 0; dt <= MSM_TPG_ACTIVE_DT; dt++) {
-			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
-					 input_format->height & 0xffff) |
-			      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
-					 input_format->width & 0xffff);
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, dt));
-
-			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, dt));
-
-			if (tpg->hw_version == TPG_HW_VER_2_0_0) {
-				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
-				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
-						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
-				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
-						 format->encode_format);
-			} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
-				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
-				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
-						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
-				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
-						 format->encode_format);
-			}
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, dt));
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
+				 input_format->height & 0xffff) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
+				 input_format->width & 0xffff);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, 0));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, 0));
+
+		if (tpg->hw_version == TPG_HW_VER_2_0_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+			      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+			      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					 format->encode_format);
+		} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+			      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+			      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					 format->encode_format);
 		}
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, 0));
 	}
 
 	/* Global TPG control */
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
index 5764a60fa34c..a7ef6d2bb4e8 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -200,22 +200,78 @@ static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
 				"could not sync v4l2 controls: %d\n", ret);
 			return ret;
 		}
+
+		tpg->enabled_streams = BIT_ULL(0);
+	} else {
+		tpg->enabled_streams = 0;
 	}
 
 	return tpg->res->hw_ops->configure_stream(tpg, enable);
 }
 
+static int tpg_pad_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	bool start = !tpg->enabled_streams;
+	int ret;
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	tpg->enabled_streams |= streams_mask;
+	if (!start)
+		return tpg->res->hw_ops->configure_stream(tpg, 1);
+
+	ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
+	if (ret < 0) {
+		tpg->enabled_streams &= ~streams_mask;
+		return ret;
+	}
+
+	ret = tpg->res->hw_ops->configure_stream(tpg, 1);
+	if (ret)
+		tpg->enabled_streams &= ~streams_mask;
+
+	return ret;
+}
+
+static int tpg_pad_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	tpg->enabled_streams &= ~streams_mask;
+
+	/*
+	 * Growing the active VC range live is safe, but shrinking it while
+	 * the generator is still running for the remaining VCs corrupts its
+	 * state machine. Only touch the hardware when the last VC disables.
+	 */
+	if (tpg->enabled_streams)
+		return 0;
+
+	return tpg->res->hw_ops->configure_stream(tpg, 0);
+}
+
 static struct v4l2_mbus_framefmt *
 __tpg_get_format(struct tpg_device *tpg,
 		 struct v4l2_subdev_state *sd_state,
-		 unsigned int pad,
+		 unsigned int pad, u32 stream,
 		 enum v4l2_subdev_format_whence which)
 {
+	if (pad != MSM_TPG_PAD_SRC || stream >= MSM_TPG_MAX_STREAMS)
+		return NULL;
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state,
-						    pad);
+		return v4l2_subdev_state_get_format(sd_state, pad, stream);
 
-	return &tpg->fmt;
+	return &tpg->fmt[stream];
 }
 
 static void tpg_try_format(struct tpg_device *tpg,
@@ -282,7 +338,7 @@ static int tpg_get_format(struct v4l2_subdev *sd,
 	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->stream, fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -299,10 +355,13 @@ static int tpg_set_format(struct v4l2_subdev *sd,
 	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->stream, fmt->which);
 	if (!format)
 		return -EINVAL;
 
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && tpg->enabled_streams)
+		return -EBUSY;
+
 	tpg_try_format(tpg, &fmt->format);
 	*format = fmt->format;
 
@@ -326,6 +385,69 @@ static int tpg_init_formats(struct v4l2_subdev *sd,
 	return tpg_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
+static int tpg_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			      struct v4l2_mbus_frame_desc *fd)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	unsigned int i = 0;
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	for_each_active_route(&state->routing, route) {
+		const struct tpg_format_info *format;
+
+		format = tpg_get_fmt_entry(tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   tpg->fmt[route->source_stream].code);
+		if (IS_ERR(format))
+			continue;
+
+		fd->entry[i].stream = route->source_stream;
+		fd->entry[i].flags = 0;
+		fd->entry[i].bus.csi2.vc = route->source_stream;
+		fd->entry[i].bus.csi2.dt = format->data_type;
+		i++;
+	}
+
+	fd->num_entries = i;
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
+static int tpg_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_route routes[MSM_TPG_MAX_STREAMS];
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	struct v4l2_mbus_framefmt fmt = {
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.width = 1920,
+		.height = 1080,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(routes); i++) {
+		routes[i].sink_pad = MSM_TPG_PAD_SRC;
+		routes[i].sink_stream = i;
+		routes[i].source_pad = MSM_TPG_PAD_SRC;
+		routes[i].source_stream = i;
+		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+		tpg->fmt[i] = fmt;
+	}
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &fmt);
+}
+
 static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct tpg_device *tpg = container_of(ctrl->handler,
@@ -433,16 +555,36 @@ static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
 	.set_fmt = tpg_set_format,
 };
 
+static const struct v4l2_subdev_pad_ops tpg_streams_pad_ops = {
+	.enum_mbus_code = tpg_enum_mbus_code,
+	.enum_frame_size = tpg_enum_frame_size,
+	.get_fmt = tpg_get_format,
+	.set_fmt = tpg_set_format,
+	.get_frame_desc = tpg_get_frame_desc,
+	.enable_streams = tpg_pad_enable_streams,
+	.disable_streams = tpg_pad_disable_streams,
+};
+
 static const struct v4l2_subdev_ops tpg_v4l2_ops = {
 	.core = &tpg_core_ops,
 	.video = &tpg_video_ops,
 	.pad = &tpg_pad_ops,
 };
 
+static const struct v4l2_subdev_ops tpg_streams_v4l2_ops = {
+	.core = &tpg_core_ops,
+	.video = &tpg_video_ops,
+	.pad = &tpg_streams_pad_ops,
+};
+
 static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
 	.open = tpg_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops tpg_streams_internal_ops = {
+	.init_state = tpg_init_state,
+};
+
 static const struct media_entity_operations tpg_media_ops = {
 	.link_setup = tpg_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -453,12 +595,15 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 {
 	struct v4l2_subdev *sd = &tpg->subdev;
 	struct device *dev = tpg->camss->dev;
+	bool streams_api = tpg->camss->res->streams_enable;
 	int ret;
 
-	v4l2_subdev_init(sd, &tpg_v4l2_ops);
-	sd->internal_ops = &tpg_v4l2_internal_ops;
+	v4l2_subdev_init(sd, streams_api ? &tpg_streams_v4l2_ops : &tpg_v4l2_ops);
+	sd->internal_ops = streams_api ? &tpg_streams_internal_ops : &tpg_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 "msm_tpg", tpg->id);
 	sd->grp_id = TPG_GRP_ID;
@@ -497,15 +642,27 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 		goto free_ctrl;
 	}
 
+	if (streams_api) {
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto media_cleanup;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		media_entity_cleanup(&sd->entity);
-		goto free_ctrl;
+		goto subdev_cleanup;
 	}
 
 	return 0;
 
+subdev_cleanup:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
+media_cleanup:
+	media_entity_cleanup(&sd->entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&tpg->ctrls);
 
@@ -515,6 +672,8 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 void msm_tpg_unregister_entity(struct tpg_device *tpg)
 {
 	v4l2_device_unregister_subdev(&tpg->subdev);
+	if (tpg->camss->res->streams_enable)
+		v4l2_subdev_cleanup(&tpg->subdev);
 	media_entity_cleanup(&tpg->subdev.entity);
 	v4l2_ctrl_handler_free(&tpg->ctrls);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
index 7fb35a97dd06..5a6e9e726716 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.h
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -26,8 +26,7 @@
 #define ENCODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
 
 #define MSM_TPG_PAD_SRC		0
-#define MSM_TPG_ACTIVE_VC		0
-#define MSM_TPG_ACTIVE_DT		0
+#define MSM_TPG_MAX_STREAMS		4
 
 #define TPG_MIN_WIDTH   1
 #define TPG_MIN_HEIGHT  1
@@ -89,11 +88,12 @@ struct tpg_device {
 	struct camss_clock *clock;
 	int nclocks;
 	struct tpg_testgen_config testgen;
-	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_mbus_framefmt fmt[MSM_TPG_MAX_STREAMS];
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
 	const struct tpg_subdev_resources *res;
 	u32 hw_version;
+	u64 enabled_streams;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

