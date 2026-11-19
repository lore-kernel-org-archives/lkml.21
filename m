Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065230;
	b=aK7ZG7HG7E3hd5YW+tNgkOfR2NfpO4hH5SkLfYbr8h1kFOGwZOUKg50H6xsO0hN7t2ey
	 rss6pM7pvAo52qpyLyjuPVvRy7XtPGFIifPiLTYxOncm3KMHuBB553WFBhgliFSy2zGnZ
	 +yuHg3WtbdD5DEf5tSwi7/vQtBZQCvYF4oJSH2/o7oIUrojV43RalDyWbKYKVKxVWvtdQ
	 ekFNWwWTt/c1Afa4EJdbjjc8RxC/ARryZlPLHngYwCyKL7VTKI9bW/PiQ91Z3vNj8hGZp
	 qY3rF8pNNSHhSnixefr4ske2XEhk+plyrOrlrBQVm28dQwAwe2U0FNBOH+FCoNk9M9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=;
	b=mx7EFhkpwpeZlGDvX6YpZIqJJSoHqh0/n7lNrW2klWywaQTiIEACAHbMioMNYPVvUNQf
	 RmVAY+hPWOSOfHhZ0aYgNfLiAj1bnb450fL8wF6EzBDtL/HafdSSM0Yep/GmDaAEkinI8
	 flGBGnIivsY+19dwWkMbVRpQITX2lDdTqB/aPtqCNRxWLfQW4eCQbJ2OGd8+loGRBwSy+
	 nOUpbANm56CaKGb+ssr4yjBsv4k6ueAf1biuuPDPN405HsnRlUxeIU5CQORRgyLTuYhoq
	 8Za6K0WyH7KMaiKSbayjruW53EiWSauTNO0AfSkfk+CJiVM0jFKh/anFmtEQUuDyDyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SrTAlKRT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvlPgVXN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2E0606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2E0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SrTAlKRT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvlPgVXN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B5Dk1286267
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=; b=SrTAlKRTmKSSj7A1
	vjJKuJ319ySX8p4sp1M4YfUwUuXMESvJoKzkHF/y7hqYHnZFaQK1F8V1hoKtfC5+
	gNgiNSCHUqVjXfAa/iR5RhQrrfeqgayQcdCNC46Gzy2hgxunQjicPJ89pdFkab8Q
	QjOVGC31xKLNSuEJG7Pl1/6qokjKO6zgANnuhDWaS+AaYQCTw8VlDR6Ru0xTTOXS
	fbeOdcJJkaXDPl0gBpVZtMdNpzT6leFhJF+Y1TKvtzawXu7MA1vCZy8rFNNAaEMW
	Ti5Wn1AHzhVZRVVVprCYMekQMvmiGzN1FwFqnrG+65XPLNk38JLXnP4jJPu9Sm2g
	rkapXg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3ktnp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so1597936a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065228; x=1795670028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=;
        b=fvlPgVXNVeVTAAN4FVbtzB9drKmGGURPE2HqvpSaY9giR2bLp4pwpLknkEm9E/LzVP
         YSWIaxDQSlaR+p6aTdKoAfho2XDIcuYxNjU2vhBUwC1hiIEilDjPVwEp1ON8Tiiqanzl
         VyybggkRAJNzAIIQse8m9ZRoLcnb8+YsVXXsmUTHlSEdCFi73tWPW276aJwIJcdvdjqI
         xPe0ruS6zpNHcZRkTJXMECzyqx4SE+tvXJJR8wVgnNjI+DCNe8wPF8zkU+m3OVRdDeH/
         iVKrv4cmdZFoiAj/0+/PZ26Wg3z6Jew2qrTLXF7sD+aZN3xI0FPDV8cWN8tXaD8Sww2a
         24jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065228; x=1795670028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=;
        b=JSZ9Epe+ztonHiBfTknDPYthGoIG3MO/GDYH+Fx7nlF5VdEgT+0kA09aGWOXnv/WOl
         BT3+1hMR9V5kBu0RTegZXYS5k/h0r5L/BSDMzZHgAFm2be/33YFWBhhhKQSaR9zzh5u8
         89W9tu7jKV7Nt/KKMn1QGCDXgtwvZTjtQUcW14SMPL0nS59cRCqqzCK/acz94z7bkuXv
         JZMn7vuVHaPW382ORRd7avE3cIWluAh94LHDSat+fRm03OvnmloYKPwG03MzGwB6UpSn
         bQJfwEi7ciFLYF01vLztLEFPykyu+4Gy6mLbBhh12It4WGiMqznhNVbE7cMvVEvdPysx
         7aRA==
X-Forwarded-Encrypted: i=1; AL+hErEi7cVJ3ECpPQ0KKbg88wiMpe9PneYORizvXPBVA2y0mopPhqO+mqBKnQkeD70jgx1pORr0EPOsQVpT5ZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8snFDtnfsVwziz1K8/8iyutVA3JfxikWROBx/3+bffggz/kGvG
	SeYyLYQFNmkpunmAAUVif32MSLWIPmtQLOd1YrUNHfYDXcwaTaNnA42PxYrP1nD2qJ1BJBmSNoL
	kiFsagLmxKH12MilEWmnmjIIDdZZ6ujFP3eFbBUvWau4SemLkeZAQedr4cOu25uQ0q/s=
X-Gm-Gg: AZFdTZfYSb7HgUrG3lXiVipuOa/DdcSGyU2tTvOHfQbGdFNH642mGEO1CXjLZAeWV+s
	iJkRgRkbbQ3GzH5U7c8gqsXMMR7oNZS+M2PrT8FIy6E3SUbAsfmgWsIxO0rtCyNwj2qjbz8t6hJ
	K94Ntz4p4HxFDNwSNImfy357KxFXknTMlFpT3IFRrO6iBS4bL6+aAs/GqgY2NwRzmrNLXjjnjRD
	nRBQaVt1dKqEEeKQJchVfGIg8nnnd5T2SRNtvEkdde5CXz9xBxmT3oOG6oT0uGhhQ7i4+Hr1nkz
	GY9ZSGpX35Ms6CxbjPye7unCJUrbQnr6zq6c1NGvG3W/jqmnUU1t+8oHSvR2674bzHHo1eR5SCi
	qDhlykk7KDwH+KjiQcLMHgiUI6lS1++SmgpPVIS13TMrpSLHwStLfF4u7rNX5i03p1AfYUFuIUO
	0hpwLXKSWnWtp8NHNRrGIqv4BTjW8nRP/h9S4Jo+iHOOU31uY=
X-Received: by 2002:a17:90b:3b8a:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b3d07cafb6mr4781594a91.58.1795065227856;
        Wed, 18 Nov 2026 21:13:47 -0800 (PST)
X-Received: by 2002:a17:90b:3b8a:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b3d07cafb6mr4781569a91.58.1795065227320;
        Wed, 18 Nov 2026 21:13:47 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:46 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:26 +0800
Subject: [PATCH v3 3/5] media: iris: add maili platform data
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
Message-Id: <20261119-add_iris_for_maili-v3-3-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=7477;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=d1OhJgAf7Mlr/7pAToICQrDH3kuVVptJvPTxOmBkEoQ=;
 b=/SrcDSnsAFGwHY7XrDS9e36NdhSN14XhcwI7DTwO1QM3lmtfeTYEZHFhuaQHzrCG3Er1q2K5Z
 9SEuCmZ7dVCAOF5oa4IOgF3MPmXYG8Pf9DTTiGObNeeDYLt7aUc/l1v
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX4+P6CG10i1OV
 LAsDl1szroxGcQ1Rds2rnZ+WxyVLcNjgX1soN85VcdQg9onYKidkB68IatKz6AZQrgHNPBLzbw9
 oeuZzkLAJ42VeJuSMxl92daMb1+zxwsYGhmjdKwbCuRFtcvo3YSeMCFZLzdi58UIAFwss2+6XyQ
 mVB8ov95hVkpNRYBYdavwMz6SJjibguvd6pjrdY6YAN46dRZZnUZejqfirj5vS0vAzUE3uVUvJP
 u8ymaPbXTBX/zOrLjb7gLOt7/F40fjQoAHID4lhpEED/2xgFfTlBx72qom/T7p6L86gO4+KYEdk
 f3CoMbpMTgWQrJYCCc3mjZU4INE5W84dcnMTr8TQQZ5z9NLID/BEn9YcQzV8YpQ1LSgpo142xGm
 9wTzFHpXd9PIJ1W0IZVE0KGDrcv6wLpY9l5eqBvKPi5hmmuvoSRlqZ+Todm5BgZS1nGDLnOBBxq
 9OV99lKAagLMKvjwMdg==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afe858c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nOOC7wKebdr8b9UYWzYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX1dG4zIeII1DL
 1Y9ofcEkuSKAsHcceWjIrb7Yv5dSgQuJprGSjaDSAqanqsOrONQq0XzcvmcDyKPPKvbwIDyzw8G
 cu/gMPFpge8O35RjewPRp6YxhwhCamk=
X-Proofpoint-ORIG-GUID: nD1k0bDa0ZmxS4lKISRI5fbGIZn1C7ZD
X-Proofpoint-GUID: nD1k0bDa0ZmxS4lKISRI5fbGIZn1C7ZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Add platform data for the Maili Iris VPU4 block so the driver can
match the qcom,maili-iris compatible and initialize the hardware.
Describe the Maili-specific clocks, power domains, firmware, resets,
bandwidth data, DMA range, secure memory configuration, and decode
capabilities.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_maili.h | 58 ++++++++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c | 81 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 5 files changed, 148 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index bbd1f724963e66d45d9b52e5158c593f4061fd95..f7c94ffa1e4491b6ded8d51c3a0e23f041d91756 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_queue.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu4x.o \
              iris_platform_vpu_ar50lt.o \
              iris_power.o \
              iris_probe.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 49a3dcec7546d04114675061ec581b31518d18dc..47a23b0add88cf319c2d8ddc4bfa5e1302a43b27 100644
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
 
+extern const struct iris_platform_data maili_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_maili.h b/drivers/media/platform/qcom/iris/iris_platform_maili.h
new file mode 100644
index 0000000000000000000000000000000000000000..fe1b0db0a5ac62a28d7a1abbf42065949f1a5477
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_maili.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_MAILI_H__
+#define __IRIS_PLATFORM_MAILI_H__
+
+static const char *const maili_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+static const struct iris_power_domain_data maili_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface1", "core", "core_freerun",
+	},
+	.clk_cnt = 3,
+};
+
+static const struct iris_power_domain_data maili_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"iface", "vcodec0_core", "vcodec0_core_freerun", "vcodec_bse",
+		},
+		.clk_cnt = 4,
+	},
+};
+
+static const struct iris_power_domain_data maili_vpp0_data = {
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
+static const char *const maili_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+#endif /* __IRIS_PLATFORM_MAILI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
new file mode 100644
index 0000000000000000000000000000000000000000..528f5ef2537f504aff465fc1f578d65da936232c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "iris_hfi_gen2.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_maili.h"
+
+static const struct iris_firmware_desc iris_vpu40_p1_s8_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.fwname = "qcom/vpu/vpu40_p1_s8.mbn",
+};
+
+static const u32 iris_fmts_vpu4x_dec[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
+};
+
+static const struct icc_info iris_icc_info_vpu4x[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu4x[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu4x[] = { "mxc", "mmcx" };
+
+static const struct tz_cp_config tz_cp_config_vpu4x[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
+
+const struct iris_platform_data maili_data = {
+	.firmware_desc_gen2 = &iris_vpu40_p1_s8_gen2_desc,
+	.vpu_ops = &iris_vpu4x_ops,
+	.icc_tbl = iris_icc_info_vpu4x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu4x),
+	.clk_rst_tbl = maili_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(maili_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu4x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu4x),
+	.ctrl_data = &maili_ctrl_data,
+	.vcodec_data = maili_vcodec_data,
+	.vcodec_vpp0_data = &maili_vpp0_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu4x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu4x),
+	.opp_clk_tbl = maili_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu4x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu4x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu4x,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu4x),
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = NUM_MBS_8K * 30,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index f57767582114903fce0088d8b8a9af0089843faf..a402fbc64e7290301446432ca8f436cc364d7538 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -526,6 +526,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,maili-iris",
+		.data = &maili_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

