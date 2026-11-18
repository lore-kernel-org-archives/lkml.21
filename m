Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994936;
	b=jtAJt+RSt1xNfGJ4npACEf2MJo2C3qMAfklFsMoamY1dPRfkOd5f8/RcWwtgHSwP/i7v
	 ZcsGAHL8xwaezhYy5YQOqRr8AERH25o8bs0JuUMplZn72mdcny6b3fQeWPu6bgWQ3a1vu
	 2f5/VgDcZeko0iW3CqdWxUZ9moAHDL/b8VZx6uqKWOhAxwhO72dqpwvQVsC9mSUmUyMPN
	 YWiiBTvDV+LfHIe/28io/NBl/c5+y2YLDA3eYbHxoQ8unHBzDc7x1QggKapX/pglHRuYF
	 CQ6ovvETIchDlpDvAXrgv8yvc5DkURctoj6gASsLpTfaPC9XS5NuanPge3KouLpzMxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qbWTeXL3lIjauuXNA80ShKzUeUAajNy0+jGKbO1twf8=;
	b=1y+u3ukByLV2XtsrbjIFec+NGsjZcJcClVKmY9gvffXZ1lEhAen+rNIV7Xe5j0q/rcRc
	 OBHIXnczpXbvca8nvAYHvvg1SOAmiRfYSUyz5xMifYcnEVoDcggJNi4GbFWzcE8hRYbRC
	 +T8ramPyMEv/0Pam1nBac6yOB4jqngxfbgLwpRCe5p7HVpo7oDeBSeyDxekOycPSdCU9m
	 Wdax3raszK4mFSOF8uvcMmeqytMVuC1ENV6CW42iKs/ujfcJN+k5g1eNpshsQIC8yiMtp
	 F94QIwgw/Oa7jXY/u4nbswxaNyTH8RS3zyvf90Bh7JXdoIuGqyCbGPf92OTNnwySPgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgR83k5F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChlD9JBv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7972D606A880
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7972D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgR83k5F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChlD9JBv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8OhbP472516
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbWTeXL3lIjauuXNA80ShKzUeUAajNy0+jGKbO1twf8=; b=KgR83k5Fir9lazp4
	laCnV+0O8QUeLUuZkheOejoWf1jA+kLnsLAzGcQGkYtWdcH7WgZbs1KcO6b9I4/3
	3Bzw9xlEbFsf03Y+eLsJQt8YGin6lN96WcozjMkapxm5laQmt3wwLXEXE6nmh0h2
	Hr2kmevySfdmaF8wAnY7DaHsFZTu1WNsvLWx1RHL6X2uCikAjlE0lSoU+PnKwbzN
	pmifX0o6t6qsC2ORgPB/YToW24U0Xv0VU4+l3+m187C106E8obQVWaM24BCvrh8B
	aDI+R/UnVURJHOkd7M0apodtgX7li04Hpp1pPnJuhfgodLXM7pnJVNoyqEqNSFrF
	MPY5OQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8aas5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed00709df0so7376345ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994933; x=1795599733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbWTeXL3lIjauuXNA80ShKzUeUAajNy0+jGKbO1twf8=;
        b=ChlD9JBvygeR8H7I91S9BoldG25mZuU74K5qk33Zo9CXriNSlOMY0i+KuEQQNikRfz
         P4wStMgp21WGt43YhfkTY/II1Ff2s/25fmBaopbwy8sUmQZDVlmr1pOYNLb49n1vFcCT
         CXimVw0l2JBMiwmOmQ8V0dwE1TSajDuIeJpv6LTi43m2Ve5BgpdKk9lRsV4F+xgFYIat
         +vvy2FQMf0mB1leIQsJEwS8ybHVQKBJSP58N+MgAzjd4hnpxAbyt+M2Q+SEXL6J6VsOd
         ozAnVHKZHRWI5Y0CsPACTj1qDolLvSkAKhPXfiuCsFcnnyZTIcLna2zcHL3pbtyKiawu
         IvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994933; x=1795599733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbWTeXL3lIjauuXNA80ShKzUeUAajNy0+jGKbO1twf8=;
        b=Xz/Pb/uzSkiiGJMkpQCZ7bBnzkore3I9EbZyLgf1QQDglSmUtRUl3gnPeeqAYAtqfo
         bpPMD1nTyZyBhSMFs0rh8JSqg9lnaMvsqfOIJvrLuFXwqB3pdpMF2q5wnDt6mO4RAT1L
         FVPt04Q6VuKJPCTqQl4Zlt27wA5GKJUIUm5cGmP+Ud++sT+BkFbF4yRnNxviCxyOam7/
         Lsrrq8Ay1Wj8nS3nVIRNNL32yjaCLxeNKlFTH/XnoB05dxCh0hih+yYzBtJF3NIrwXIY
         2JbfgA8ncHebqZ5/B8MJ61x1ORbTKG6kyPer+toro/kDFaO6yyqNrznG8ynYJvZGH+0d
         3BeA==
X-Forwarded-Encrypted: i=1; AL+hErGcT7vmbTB2jnI1aDSBdrLObf9/uQKeVBdJCz84IHaHVNprJ2ZtAF9Q9fxdpNM99UhIfxDEi0dBsj8R7N8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9To53uLQDx5wdosHyp66XqDW2yobSwfCFRKHSkvY5IiKNxYEDw
	mhkTtujKKRw/sE4lWhv1VKyThc5ZZ2KnRZwR0puYGaCpqx38EbzIs48G4tyxBtO9LKALmFZvpBq
	3ODchuQcQaKfYbwU4fenEmj8T/iG5603oxW0J2Ctz+VRAdVqhSqC58Ri21DRvsqyE1rM=
X-Gm-Gg: AZFdTZd+og3BHMr6po5CsNUCN6MoTZ5jszGVLOH/U7EA/PHK/Nz2s27gZmxlC5z+f+K
	JmfBa8ka23AAbCQiUsJbbvY1NWOpTIFoehJMypuTPTssYw2Yjf5rDnwTZwg6sBT710fvZGCqPoD
	SWgB1vRUMIqAN3UfauDAt7Inwldc7o2h5yN8B0ZMduGouIjilK4X6eco1OXpL2AjqnsWa1sR2Mo
	lOMLVINoudGedD9A0lEd6b2/NbZYM6Bt1s7eUg3KDcB/KIBz8KcGMDRXhiibRNTWVnlONdb0090
	sJH1dJgc69Y0u9sBfhghUHi6vpbkik/Utn9yHWc/xazTEfK32xy/4ZC+l1RDTSZEeMecP1mAlIY
	SX6wUs6pgWRjRYCi1ZM5m1cbRXqMpSR1Co66IhVHT8LQuyxb10MCKUUjL/hF18ewvmo3mGYX0uY
	4EXRirzKRg8RFO5rLB2UU6f1BWwnp29cLwef5qvtVJGCm3oCzN
X-Received: by 2002:a17:903:186:b0:2ed:1ef3:9ec with SMTP id d9443c01a7336-2eff752a21emr21260485ad.14.1794994932712;
        Wed, 18 Nov 2026 01:42:12 -0800 (PST)
X-Received: by 2002:a17:903:186:b0:2ed:1ef3:9ec with SMTP id d9443c01a7336-2eff752a21emr21260265ad.14.1794994932182;
        Wed, 18 Nov 2026 01:42:12 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:11 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:45 +0800
Subject: [PATCH v3 6/8] media: iris: add hawi platform data
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
Message-Id: <20261118-add_iris_for_hawi-v3-6-51786f6d4057@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=10504;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Yf21q11XoqhCBplAAnj2pX4JN8Sd675lMakfghtHEME=;
 b=Q43Cn78HmRfqff2TinnnnBfCfOce2TCsu1thvWmi5ZTXtIeUV9UEamOlX0BoceKnUi0cOxtNP
 8VOd5RjEijmBM5DNkJgpJhw2FFvkQ+YgFi2NGj3jJqaHtQcNo19vIL7
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: eqHWHmOuWmcf4_zuIIk0iGb1GhJD79OR
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd72f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KbGhqfaxPFNLtlS4IU0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX0mSR85DcvBZ7
 Zur7/fReIG6lXOAKxNuPi9wPLm+1/7EbKZcZqSwP5XaPRfv8Tcpw4LoNXen6ni3cSMpjoMlEH8T
 CVRRIHDw4HyCJQODBm0T53j+pqiB0L18eVcz1ZzLkRvm5WdLTK54esDyQKPTpvVnnKbAfMxKVVf
 vd4vN6v19PIg2p/7nvrgkbqJKrL64oq7p3TsWIJh0KWWbDDkNxWteC0BsORCSvizwQw1HCmhy99
 HsInuBD2ydvIbcHVSyVU3I4cQDqiLbi+Sk+Vj9YY821TPz4fH4Bu2RMKaQ1AMO1OK7jkwT+XTZY
 /R1j9ptivJPmuWfqHPki8CLY+YiHWQr2DOLjP0zd5tF7lwkBKSHN480Y+UJ0DR9IpWjGJ0ugYc+
 PgkDgVODGN92qmQpDKIOAfjOUMrn6pKU8XSjfHWxj6LyQYdBJ+cSS0fKull5WRfYcBOYZq8SC/R
 K17SHm10xp52jP+n8UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX6staIOpdcgyg
 IsRjGLEU6OtZC9PPMzJZbJNDMX5XzMTaa6LMnobbM0ycScfAGu8QjcKIA1c569Mf2iu/Z/lewCF
 1p9UJQa4mUlwIRszpPXOh7mUFbTLxiM=
X-Proofpoint-GUID: eqHWHmOuWmcf4_zuIIk0iGb1GhJD79OR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

The Iris block in the Hawi SoC is a VPU5 capable of decoding H.264,
H.265, VP9 and AV1, and encoding H.264 and H.265. Add the platform
data entry describing the Hawi-specific clock tree, power domains,
firmware image, bandwidth table, DMA address range, and secure memory
regions so the Iris driver can match the qcom,hawi-iris compatible and
initialize the hardware.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 ++
 .../media/platform/qcom/iris/iris_platform_hawi.h  | 102 +++++++++++++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu5.c  |  89 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  34 ++++++-
 5 files changed, 231 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index faaebea4a9afd9620c31fb9daeb8b4b500ecee82..7dbe47496a9f7e7399f9fd0c44fdcd259cdf93c5 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_queue.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu5.o \
              iris_platform_vpu_ar50lt.o \
              iris_power.o \
              iris_probe.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 49a3dcec7546d04114675061ec581b31518d18dc..6561c66f3415d6a5815a53285fd403c283c9ef20 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,6 +43,9 @@ struct iris_inst;
 #define BITRATE_DEFAULT_AR50LT		20000000
 #define MIN_QP_8BIT_AR50LT		0
 
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -62,6 +65,7 @@ extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
 extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
+extern const struct iris_platform_data hawi_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
@@ -310,6 +314,8 @@ struct iris_platform_data {
 	const struct iris_power_domain_data *vcodec_vpp0_data;
 	const struct iris_power_domain_data *vcodec_vpp1_data;
 	const struct iris_power_domain_data *apv_data;
+	const struct iris_power_domain_data *mm_int_data;
+	const struct iris_power_domain_data *cx_int_data;
 	const char * const *opp_pd_tbl;
 	unsigned int opp_pd_tbl_size;
 	const char * const *opp_clk_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_hawi.h b/drivers/media/platform/qcom/iris/iris_platform_hawi.h
new file mode 100644
index 0000000000000000000000000000000000000000..3c890b2c2ccfe7e3db0037e291cd050c678e9553
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_hawi.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __MEDIA_IRIS_PLATFORM_HAWI_H__
+#define __MEDIA_IRIS_PLATFORM_HAWI_H__
+
+static const char * const hawi_clk_reset_table[] = {
+	"bus0",
+	"core",
+};
+
+static const struct iris_power_domain_data hawi_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"ifacec", "core", "core_ctl_freerun", "core_debug",
+	},
+	.clk_cnt = 4,
+};
+
+static const struct iris_power_domain_data hawi_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"iface", "vcodec0_core", "vcodec_bse",
+			"vcodec_vpp0_vpp1_gating",
+		},
+		.clk_cnt = 4,
+	},
+};
+
+static const struct iris_power_domain_data hawi_vcodec_vpp0_data = {
+	.pd_names = (const char *[]) {
+		"vpp0",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"vcodec_vpp0",
+	},
+	.clk_cnt = 1,
+};
+
+static const struct iris_power_domain_data hawi_vcodec_vpp1_data = {
+	.pd_names = (const char *[]) {
+		"vpp1",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"vcodec_vpp1",
+	},
+	.clk_cnt = 1,
+};
+
+static const struct iris_power_domain_data hawi_apv_data = {
+	.pd_names = (const char *[]) {
+		"apv",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"vcodec_apv",
+	},
+	.clk_cnt = 1,
+};
+
+static const struct iris_power_domain_data hawi_mm_int_data = {
+	.pd_names = (const char *[]) {
+		"mm-int",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core_freerun",
+	},
+	.clk_cnt = 1,
+};
+
+static const struct iris_power_domain_data hawi_cx_int_data = {
+	.pd_names = (const char *[]) {
+		"cx-int",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"cx_iface",
+	},
+	.clk_cnt = 1,
+};
+
+static const char *const hawi_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu5.c b/drivers/media/platform/qcom/iris/iris_platform_vpu5.c
new file mode 100644
index 0000000000000000000000000000000000000000..cade592c4ec263b48ec581cd6a2768f0515f026b
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu5.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_hawi.h"
+
+static const struct iris_firmware_desc iris_vpu50_p2_s8_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu5x_buf_size,
+	.fwname = "qcom/vpu/vpu50_p2_s8.mbn",
+};
+
+static const u32 iris_fmts_vpu5_dec[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
+};
+
+static const struct icc_info iris_icc_info_vpu5[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu5[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu5[] = { "mxc", "mmcx" };
+
+static const struct tz_cp_config tz_cp_config_vpu5[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x0d000000,
+		.cp_nonpixel_size = 0x25000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x32000000,
+		.cp_nonpixel_size = 0xcdc00000,
+	},
+};
+
+const struct iris_platform_data hawi_data = {
+	.firmware_desc_gen2 = &iris_vpu50_p2_s8_gen2_desc,
+	.vpu_ops = &iris_vpu5x_ops,
+	.icc_tbl = iris_icc_info_vpu5,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu5),
+	.clk_rst_tbl = hawi_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(hawi_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu5,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu5),
+	.ctrl_data = &hawi_ctrl_data,
+	.vcodec_data = hawi_vcodec_data,
+	.vcodec_vpp0_data = &hawi_vcodec_vpp0_data,
+	.vcodec_vpp1_data = &hawi_vcodec_vpp1_data,
+	.apv_data = &hawi_apv_data,
+	.mm_int_data = &hawi_mm_int_data,
+	.cx_int_data = &hawi_cx_int_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu5,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu5),
+	.opp_clk_tbl = hawi_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu5_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu5_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu5,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu5),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = NUM_MBS_8K * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index f57767582114903fce0088d8b8a9af0089843faf..d54799d02e5409bde68f32fbd25f2ca372681331 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -138,6 +138,26 @@ static int iris_init_power_domains(struct iris_core *core)
 			return ret;
 	}
 
+	if (plat->mm_int_data) {
+		core->mm_int = devm_kzalloc(core->dev, sizeof(*core->mm_int), GFP_KERNEL);
+		if (!core->mm_int)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->mm_int, plat->mm_int_data);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->cx_int_data) {
+		core->cx_int = devm_kzalloc(core->dev, sizeof(*core->cx_int), GFP_KERNEL);
+		if (!core->cx_int)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->cx_int, plat->cx_int_data);
+		if (ret)
+			return ret;
+	}
+
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
 	/* backwards compatibility for incomplete ABI SM8250 */
 	if (ret == -ENODEV &&
@@ -200,7 +220,15 @@ static int iris_init_clocks(struct iris_core *core)
 	if (ret)
 		return ret;
 
-	return iris_init_clocks_per_block(core, core->apv, plat->apv_data);
+	ret = iris_init_clocks_per_block(core, core->apv, plat->apv_data);
+	if (ret)
+		return ret;
+
+	ret = iris_init_clocks_per_block(core, core->mm_int, plat->mm_int_data);
+	if (ret)
+		return ret;
+
+	return iris_init_clocks_per_block(core, core->cx_int, plat->cx_int_data);
 }
 
 static int iris_init_reset_table(struct iris_core *core,
@@ -526,6 +554,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,hawi-iris",
+		.data = &hawi_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

