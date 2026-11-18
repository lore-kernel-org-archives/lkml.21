Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994914;
	b=oAQz8po6k1Hom3zfLyONoL1D4kyTlCm5/iEQFp1vnj1QMLRLRtUIH6rxchczMfdQoLo6
	 2dFdxauwlD5YeJsjNK5a4m5a1NZfHujHxEbYd/bhhlR/0Pd0WbB5hWuzbnlV7zrRWUceK
	 ysu59SvPgrU975NCrV5FqaF8OyOOy2oezsVSvLuaUbIVIMJUTO2tpWwckUDa0AEhN/805
	 25Sa9Xb2MJAUpXcG4iENcWgfmqQJQNHyGjzul/qPI74509kqwei6MMle1qL8Hrcx2uJwP
	 7fe7/Z7c2BngGPWd6EOXELHvnVliqCqJcV3q1KrciSIdWA4bvJPWWFHR0Gxyg/W2SPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=;
	b=YaQNwAlJVi11b6D5V4ZxKOhzWdaWtR/BDdZSHzUMwcVjNn+nH4xR2jAW4nKD36Y8nS+5
	 wtkqbnhGOgu2QUd+/3X+uEdTlTVbh6iyYKMDLrdgnmpXWL4rkHj5IREKMLf0W4y/gFwXP
	 wk6FtX5m43iViEZBaTr7gNNCoeH86rPpa6wX0cGQ4uhxHp7431WzWeWeglSccpC5QkWpE
	 SlBUdYEhHfTSY9JCttSHZ9cNVVS9bi21TInjE/JdqukBm06OYwBLjgKEmohaPS/X+fJ3y
	 20dIPztFDqheI81oUrGtAjELbNPveMyn6a8bo/SAPiINoWlL+RUCeLIB3MjKBLIRLDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aSL1H5/1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WnPq2rVv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1518606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1518606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSL1H5/1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WnPq2rVv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8BRT42602449
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=; b=aSL1H5/13XqAb7cH
	P07xUO7IwvObR2201yHKcFoxrTGHWb6OAxyQeProZ1Fh9rYlVVDOKlcV/djmU/tq
	Qgt6LcUlewD48YuxGxOiS2lGGr7FgKRaH8ka6a34DGJNrSZ2DwaoY23TtlmL9y27
	v40MWA1P8kWATYo5i30irCzOhqO/LQewA8IG61soZyuYH03ZnjqiulwjM+Y+CBYI
	6jAv+RmYsQyj+SJ60YQ4yU+18NcxfGeoOTJqUnB4rqrL2+Mth3p9Laq99tbBEM4O
	ayuKs+MOZnSWL8OCfj7y38ZE0wJomrOitSWFN6k9I37wS8PtCj8CPeLuUnWjNzJl
	MxIWYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv72e0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:41:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb5375cd68so8581385ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994912; x=1795599712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=;
        b=WnPq2rVv3xCFbm+HgOn/MSxskzK21qHRdOVEBTdKaYnMyln8+D/JzuKkp1VKaQabl7
         Ho3uEjIlqHSZPqW3byDauLUSe63OnYfCKXmcDlpXVwuVd4U2qZg863Z7c3YmiO25iAOz
         eWJERbFhHauOtsKWchK1d9hah9TGP4dYSk3MshgaF/ZX8/XaG8MZ3sm30DXZj9pqE0/k
         F/Hl9qh6ZTa3vpwLlc3imvnIfhLMSD5kiaI+nNlHCOEaheNSaq4YhOll9FeYvEiSm2T9
         Aw9C61iLoxKfMBb3RIlRxenZIAos2o5FIG58oLz8SMyBMUkFYZrte27STI+1au+8XPuS
         azKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994912; x=1795599712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=;
        b=BNVtHS0PlmsFUJL58Fwmug7Ido+ooit9bsRTbx1yPnpnu6y+1R/jeWX0/yphnqQeoZ
         yFAqAvyLZCobxeRkycOE6Uy7Kvu/gsB4QiNpXRg48IbHVS3HizoW/HrdGhbSoRElCp6i
         kNKUzp3ah6hInevyXGFyHzWYlaggfqab0TB5bs5pOdlqogA3JtyzWDir2J1iu4ajSAap
         rVfsaXb4YAzwchcR8uhqYB1UKv54aqSFfTrA/mVstMVfNMDZlLqWPWwhTefScAa6xxWe
         6TqY0E3WO3gKZ2ShvlVHYZSP28/mc8BjSfI1eAJ4Aa+E7N/LYTfbF45YN95+XudNKhML
         WggA==
X-Forwarded-Encrypted: i=1; AL+hErEk2iGDUNu0p20Nzjvy30dwFrKpG2xheRfDLBWH6s3xs/fAd0J2Fq7O6LtU6QgfTnaJm4hpwnBJjpLYhpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zp19ur7v+1EdA65JQIeqjiFdi+l25xYkIBO2W6xpAV5k7W3ta
	bXIBGyWk+56qtouao+kj4Xr04YqdnZp9KqE8NFNIQ7eNUQmCpEWbRbeYDGG9oKLZY6sLxSQeJ8f
	2famb4IDOMegWFvnAYhw36uT1fh5TZqAxz7lII9ehX/KaLpOl2wrhDEOnW70x9KOKAJ0=
X-Gm-Gg: AZFdTZdweE0KQa/Ihi4hbQXRDJDZfripmWaY4eB+4HF6y1eeMaMIafjpL39QeV2rAEF
	w+rrhrOdfttwNCwtMsdvn01EDEKj/QmAb1h/fceR0hFmzBsKareSeV82EuDTRKQWDPNSrzmBIqg
	cxghMvExYW7o7d9dmLnMvV4p95qyGw8oYKedrIzefwnI3zu4w9X/KhkVxXY/KlOxma2AoujMepj
	v5aCHDNFMbpNC/55uscvVug5GvFpHsS6Dw2qxohG0EVgbN7lRhnc79TJcrCY5SU8V5HVYntryV0
	Ra5INQVetm8ov9wOHDqmMvs+L3A+SOYpqru0AmzC+yn2/9/E3q2due1QD3eN1gMWMaR7UU5qe4d
	9GV5vOXOFyHPIn6bxHxAJI5t7kXvuKObIjy49SAxDIrh6/0h71CW2nmXQBGVCWWVjKBRD5CPSQM
	NSsy77G8Q70SjxAhkyrwiRsN1qV9sHJoV7AovnbTu4oC+3wJCM
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr19509885ad.63.1794994912323;
        Wed, 18 Nov 2026 01:41:52 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr19509525ad.63.1794994911831;
        Wed, 18 Nov 2026 01:41:51 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:41:51 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:40 +0800
Subject: [PATCH v3 1/8] media: iris: add AV1 decode buffer size support for
 vpu4x
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
Message-Id: <20261118-add_iris_for_hawi-v3-1-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=5133;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=eyuhm7FCBJ1UyL2VDJkCTIlCbf4hEj3HIpXeoc6A3bA=;
 b=a5lTvwFg9C+VDweYDA24XOf+yfXQCWSpTwF5kNAwv+7ssKsc/HW3pEvs5+V3ZDQLp9MkFOkHX
 d85LMysu7J/AGLFnnR7YC7PiNeDGxwsCSISpukFbplvRUGNUiG7I4VX
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: SBa6FuN5HH5VqtGG3RHfwbBLjKk3dm0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX+YY/9ndoaGML
 1nIT6ZAmpXyceCYZOVUvEs1zqgPOFMID4W1dxCcwOvmsGRcVDL0YbdT69k6u/oVjMr7cEXYWqdt
 4hBI/MUlysGLKm6zciqNyO2u2LPm7lKqVrv5dwRjX6zNc+bcdt3PfToy6j9IoXbGiIxAwDO0mni
 pRMil7ZNVfoCjqpXO6WiU1CvuctW6iJ/KCfwHPvBD9dzSlor7SO/k9z+MynRuDPuBucmSle3dLj
 CZ8De4DbHDG+fjdM5k0MqGoz9r3cVkqLmKVSYwv8seoVNCE/rTPVwH9UE3f2GSJEEBAobmFfhEE
 hwi9e8r3G/ktSDZ2gw+K1HxUS8kk5cv8aJ7SOq9mACjHWAQCu4mjdS6IEketJMxrv1D0SckgMLP
 SfsCon45/OUT+4lEp2fjDeNN3fXOqVLKo0S8yi9NsrrkTGnHfdkgrMcaXkBD7usU2U2s3Qx+a36
 IXq6zyJkRb75U8nhBmA==
X-Proofpoint-ORIG-GUID: SBa6FuN5HH5VqtGG3RHfwbBLjKk3dm0l
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd72e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KAqM0-_hLyDR7Zr9OkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXw+LY0QunS/FF
 3gjFTz+Mx6R81c7rHFd+KH6CxJEIzaj6K0hJ2k0DXZsXxrw242rnZ7L98cUS/d2IAhTzTQ5vwPD
 SVF/qc4aUmzgG5Anby+dRAC7Jjcqpoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Add necessary buffer size calculation to support AV1 decode for vpu4x

- wire AV1 into iris_vpu4x_dec_line_size() via hfi_buffer_line_av1d()
- add hfi_vpu4x_buffer_persist_av1d() for the vpu4x's persist buffer
  size calculation
- add BUF_PARTIAL to the vpu4x decoder dispatch table, which AV1D
  requires

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 67 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e600a3897b87ae55b5f413666185f5..f322dee4ec56c89d163deab068df98c1125724e4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2134,6 +2134,39 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yu
 	return lb_size + dpb_obp_size;
 }
 
+/* iris4/5 AV1 line buffer uses hardware-specific LUT values indexed by resolution bucket */
+static u32 hfi_vpu4x_buffer_line_av1(u32 width, u32 height, bool is_opb, u32 num_vpp_pipes)
+{
+	static const u32 lut_left[4] = { 905472, 1356800, 2890752, 5778432 };
+	static const u32 lut_top[4][2] = {
+		{ 307200,  450048  },	/* HD  */
+		{ 499200,  713472  },	/* FHD */
+		{ 1343488, 1800192 },	/* 4K  */
+		{ 3735552, 4648960 },	/* 8K  */
+	};
+	u32 h_idx, w_idx;
+
+	if (height <= 1280)
+		h_idx = 0;
+	else if (height <= 1920)
+		h_idx = 1;
+	else if (height <= 4096)
+		h_idx = 2;
+	else
+		h_idx = 3;
+
+	if (width <= 1280)
+		w_idx = 0;
+	else if (width <= 1920)
+		w_idx = 1;
+	else if (width <= 4096)
+		w_idx = 2;
+	else
+		w_idx = 3;
+
+	return lut_left[h_idx] * num_vpp_pipes + lut_top[w_idx][is_opb];
+}
+
 static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -2153,6 +2186,8 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
 						  num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_vpu4x_buffer_line_av1(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -2176,14 +2211,39 @@ static u32 hfi_vpu4x_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_vpu4x_buffer_persist_av1d(u32 max_width, u32 max_height,
+					 u32 total_ref_count, u32 rpu_enabled)
+{
+	u32 comv_size = hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	u32 seq_hdr = SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA;
+	u32 per_pic = AV1D_NUM_HW_PIC_BUF *
+		      (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP + SIZE_AV1D_METADATA);
+	u32 frame_hdr = AV1D_NUM_FRAME_HEADERS *
+			(SIZE_AV1D_FRAME_HEADER + 2 * SIZE_AV1D_PROB_TABLE);
+	u32 extradata = HDR10_HIST_EXTRADATA_SIZE +
+			rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(seq_hdr + per_pic + frame_hdr + comv_size + extradata, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 {
-	if (inst->codec == V4L2_PIX_FMT_H264)
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
 		return hfi_buffer_persist_h264d();
-	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
 		return hfi_vpu4x_buffer_persist_h265d(0);
-	else if (inst->codec == V4L2_PIX_FMT_VP9)
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
 		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu4x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16, 0);
+		else
+			return hfi_vpu4x_buffer_persist_av1d(0, 0, 0, 0);
+	}
 
 	return 0;
 }
@@ -2483,6 +2543,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
 		{BUF_DPB,         iris_vpu_dec_dpb_size         },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 2085e316a6bd862f0cb8c474ebea6b53947fcb27..9a1011a91cb6da0e8e7c53425b88f7e7069c4c3b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -127,6 +127,7 @@ struct iris_inst;
 #define SIZE_AV1D_TILE_OFFSET     65536
 #define SIZE_AV1D_QM              3328
 #define SIZE_AV1D_PROB_TABLE      22784
+#define SIZE_AV1D_ARP             9728
 
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)

-- 
2.43.0

