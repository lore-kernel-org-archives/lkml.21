Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677368;
	b=dsGcQs0EKDawiNlnPuVL8lbSboApCesHLj88Se7YCiBcXqVFv8oLh3qqKFRsO6/nbufY
	 7YjKid8IZvfM+G7wTOQlyrll0xP7qBxau6VSTwoOYNFY89A9rtYi69VeULqi3K2K7tsnV
	 NUdUNxjYMkfANQQV4I5iU8gsfRyJiM/s/vfUcAUvuPXVewQT13nw3mGe/YOYe2ULZtiA9
	 CS+9no+Oa6kTJE2eiuTJsSshQolap2KWsDBduFczWOuE3X2btzrVXihP2JrMKx88eATMm
	 vzsriF7ofwS2Yg+xvQMZtqCn7r4GX3yjFwTesjDylQDh9ZfspKcwxQIdWJuKsekPVHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
	b=1ZI2Bj5xsuKijiXMQECaS0I1diTRqiRHA72Nrs/sNMCeprpYFUOYNAkHJyeQvY2NnwfC
	 9b2VfhS8lsoODLrK2IqS2G592gI//JDrHxQi3yN2AQVkiyeXJWFUoZy961KPB4fHMrhf0
	 ABR8dsogNPPAGNN3btlDiTTfbloZtfNSYA2ughO/7NACt1S2Nrp8qQlMuHHCfDPYH8PM7
	 GxylKitB8pH/2j7IyL7hPBsOnyCjVeL04Y6uHDdv0c87lky2mBLbpl9inqszHiMJHekUW
	 dZ75f11n7Bxi12UrKuOI12vQVQFulLPUVT+79hogL/Yp0IfJAOnY2c2rqEZ1udVJc8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0OAzXWR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgC4jWQj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C99C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C99C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0OAzXWR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgC4jWQj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B58F2210867
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=; b=C0OAzXWRnDod0gow
	VRitZOiIHJU/ESyS65l1lV55fu+1B/K7v5I4d7WNEkCNf5fL42a2Zwrm2CrpiOzj
	b+9BoyFQ3JFxduUqsBNpLcxHkDSEb1p+lNM2IbGArcEi/9kSmnuKZqj6mJTuhkKB
	gEV1FNkuAc2vLNVIRBhO5gpfpFH94l0B9X8gltXyyK79pBu4jD+2PKWeoSJbq/pV
	JziPTQJR/Ww4f1KkFGNn450j7nNtlfysBuBDNoFyhW5+Vra21duIlkTE8ESAsy99
	Ss66sYm0t5A//f1SL/vatLgxpOAzY1pUoYS1FbdNbUcu+eaDVGmv2isn0VNjx0kh
	s6dDKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9s16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:16:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so5440366b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677365; x=1796282165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
        b=jgC4jWQji26ojfqkHiuStwL5Bk/mpYpS/MCreCXVFcQGbVCy/l4SFuqUO6qMzz97fp
         d/QOZiQmjIc1npLVCVzITYHaXT3ZgxVNGjZ6v0wQypTRJiiit+5FsG1Wxfq+tKR8aq+4
         tjh6YHI7Q252IxKbiVn8Tv+RG9eQgA8/exuf6CGQqgRzc9aH5n+F5r0GJwqc7Ptd19vN
         srAP/NBLR/oq+Taou1iuPCeXnQobA9TH2WBdxhnO6gAQiNqo6GD5E2UoCE8fKyVTEiAJ
         9UE+Q9LtgkaSDEKzXUcettNQUh39mvhN0+gKv/Aiedtawt8doGjku/sYpXvos7z1sPFt
         lUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677365; x=1796282165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
        b=BX7/3zEmwHlmvR7jyr5IgXHHlmenBpMr7V0tMSJyJFT6O5w4ijsdobM5oNbXERBC8y
         t+785xVZuOwZAKZRg5Stt81MfEo7Gz10x+02PbMEX//nHAoUue8A3zqcb+sRmGpJ/7OF
         Ip5e4ttd67V8gBiC9IvzTH1g++0sJ7FH7jjYyw2LNlc9jB80g+058x5WiCg6BSDTAEW6
         v3issXAqDmPHMGnTUYWopHLQRCgF45NWs/RJil/mejTPVjvSWLRLgDCvnVmXOflOUq+l
         CNFBie/Hki/yHLAv/UtgVsIjFn91gS9f11t3Ve/3XyPFGl7OxSxXmCqRhQu/bCkX1Cri
         gaTg==
X-Forwarded-Encrypted: i=1; AL+hErGkCexhZUROtcaB2FFkFvcqG9NCH8jzxWImIT6HIqF6xcNMN3ZGSCro36QC0gF36zZ2CPqE6QTJ2InS4BE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OeJ2PJBPh48K7kRmScZ1XXxZGcMdS/GRx7ldp5z5TThUAGNKy
	hkqmEaqB6fUgyfiM89YmZ5SspAB1x05OyAHYU8+xFHO92b9cEOEkPEfcbU7aONJZxnBm5LwAl1r
	UUVXsacOj/B91q/mxnTYaSah4uN0FeaPTLVYXpvTmDG9KaQc/W2/B7vy7ydJIw5Wlc7FiT3IqmN
	o=
X-Gm-Gg: AZFdTZfovzrX90lEw0ForUpY3qRxM5SpfG/eZgcgwTM3ih8gl8J058S133bIHvcfTP2
	/DdhTWm9NwZArVABQU8iXuo/exnGwzOINv+IFThHehkLC7wDrqt+uKw5EKWPRXC7gfGygEEVjQU
	69ubvyHc8aTbY0BWzmRZ2Ya6SVtIzh1dr+NAXE99HjkHYGeKE6mRgp3IV5k1inmSBoshRY2hsfg
	jZom4gXcFvIpefSjs8EVohcYVeVdXWVhu/08KMPlVdYi5SHqJQxEc4hcLQQ6/Z7+PkjyEo0nRNk
	OqNfbrbJcv10akqB/bJfPrTPZS+dy4L5+1WXdeUNR8i0vodudB4cMm6eSQAceuz1GuvW0xCOPfr
	eY8fk+6j3VTakHbIh7nDfJTOYpIv4pWCMHgK8Nfy4PhnlXiIe0xXj8ZUBfMJ2I/v/pOKvWoTa3q
	PvmAuxlMw/63jGfyz4LFBCCmeAYLRH19XrIaqkAOoi9SyiS20MZVmAYKvnPPfO
X-Received: by 2002:a05:6a00:14cc:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8c87c09e5c9mr17652894b3a.23.1795677365011;
        Wed, 25 Nov 2026 23:16:05 -0800 (PST)
X-Received: by 2002:a05:6a00:14cc:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8c87c09e5c9mr17652873b3a.23.1795677364557;
        Wed, 25 Nov 2026 23:16:04 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:16:04 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:57 +0530
Subject: [PATCH v4 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
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
Message-Id: <20261126-oob-support-glymur-v4-4-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
In-Reply-To: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=2115;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=l2ZRGdD/hkxUWu9DS2Den2yezAc1vs2xMObet20VF6Q=;
 b=2yP8ClsGLqAuDX096d0TXlew5Ny/bhOObqHCSoBjBK3tfVMzSLR9bNgM2Fy536jirSGnlxDwL
 rE0Si5ShcSKB2DCU35xgtMJ+AHyHeIvY14NMChAoMAf6AiUV+273AvV
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: WmrYLjUST01_QHPkaBPbbATPOJtF91IB
X-Proofpoint-GUID: WmrYLjUST01_QHPkaBPbbATPOJtF91IB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX4BYjyxH70E1c
 +lGScAo1rlBVwfuSGTzl38NqytJZFgnUd55AIoQwCeuCuDjNxsKm8tD/65y1gs/2SIQml82gtln
 XMcJEI5a8UhlW/zCkodxyLsS3gd+BsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX8mLvhq0pvzXG
 j0CT5IBUcV8UtBIchS0i9iXc0kdWGJSgdRXxqCnGP8ZxZVSz8NY+k8K46818F+OeclBlMbXIyiG
 Nq4dVDSRKEEl5/U7H9bFZUY3Jc06kKmlKsAtpidU57loyKb+J4Z49USTkUrtzwC6im5gEsv/xMA
 mGQod02xEHemqTTi6VGFkR922x9iWIqhCQrLOdeongGZANzecCOG31g9WTlLPMV69Q8XWKOy0fz
 YQKZjC2mQ4+lexZH2MZLKd+n8kPz2Z8T0lG3XkDdK8eMg0binFTg5JabuJL16PTWUfCMORK8iP+
 waq6ApHL2Vyk9hPoqjToD49VdAkQX0678YhgDo/5CsEFDq4VY6uHB/FUD6tYn+5md0UMAJUPXSC
 NUuZrptmb8laRWInZhlXIiKwJckFXjCfBvFZAIeq56LU5kjfwZi56P5M/G3F8YAhGzKCCkuhvnU
 7Iiz+TRoOccy5eVrouA==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07dcb6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1e55b00357c8..a0807615b0e7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2194,6 +2194,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data glymur_soccp_resource = {
 	.crash_reason_smem = 656,
 	.firmware_name = "soccp.mbn",
@@ -2267,6 +2291,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },

-- 
2.34.1

