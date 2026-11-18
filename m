Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016277;
	b=ZpY/19FkXYHipcMa/IfMsG3pcVOELhGekSA2ChFgkShdnyHp9PY3SU93RR0PiC9ZQ6gg
	 7sQIJM4bHRlzLh1JbbbTxGnF3IONArkvHIhrLIXB+il/5YCMPHXasxzvCweKduHQWahpW
	 F7O9Je+bzQri5Ht09BEesKJsPvCzLUsexY5H1Ic+NDUaW9calOTQebMNgw7yMytljSKQe
	 b9DGFa+KbJc/RHE8qgHk46kvUz6HlIk2pZZ1FiRT3ui4awRICw8bvv7vCptxnrboci1ov
	 vy+8FI7Qyernnbj9inOh9ufJFH3zJ01IQQEjoSyNj920dMdj7mCXhjaQv/5fPfIRZPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
	b=X+QYMMKjj+HdJZqYl1BuHlzgipyqUKHR183SqUftuxAdeSUAGZRO6XTLzdB24iSNnp5c
	 jqpmcmrUiicmN+NggUVhzrMEBPcqy63s+2AjMH+H759TWwG71Wk6Wohpqp9FTJCIuMaRr
	 9Ci1N7kQDjvx9DkzM4PMZ6iLTUcw62fVx0TBJrYjGP3J7pS5X8aBj2LXUvnOr8zadeGR7
	 A9MYgtWLeQrqwh023UKeHmFvMDA5sYy1oaaL6bXgf/wTstp4NJeYZU8HTqzAgW8jcgkUO
	 lj8PU2ivqkXoCVrtSs4059HRbQ/LpOtXgeEPL+qWwFoJLrqke0Un8Sq5MD57jFiA5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTvayKgU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871DC60A3828
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871DC60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTvayKgU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQ1kl3846150
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=; b=nsgyjhGtawXQfqSQ
	uRW3wApuuD+4jPLNC5PmxvPAbkA1HEcQT362Aul+2pAnK+gtANEH+p34LuxvxHL+
	6y2zOGEO2dd8M3itwIUm2mKhyyEBiYz5OkVMpHoY2HseWxNzIckEfgxoO62LOb2V
	Fdra3Ifjwn0J7f2F8F7a6Jbqi8OLb2nDg0D2b7KzWOTlQiesNRRuyJCfOpzz9vH8
	3HPhLIdHGrYuK+YJJ8g8ffCYJOW6TXQc2ZKRuUwxr4llENlzqhK/mY4ZLeHcrCUI
	YAxOho+GDxXwFAoTw63dh5tfctfk/2ui5AUZEc7o79nlVzd9fp8Z693mBcJqSS9F
	onnreQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvaurr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:37:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920ff6971a1so15409216d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016275; x=1795621075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=WTvayKgUBuow+rqaFghVpPx6HpWMHPvkhRjLgPaXieDv3zv2WrWm113bELSEgJP4EU
         kgvfHdQzR6BPmyqAKAm1HtZl58m0kgZNOkhTJpprALmUVo8QaosmJ5GJsfPTcz+8T2KR
         htlTj0hT2PPE+ONf9G3gX4E4kiFox7a+JEtXT+6KvgXflO7vDmYC8I3gPP/xUsIJc/u/
         yFymmuT5l+F5vNd0lcHzEZ0hFEJtoeR6KR5RU5L6ic5lBBBjEwx5h9HVKKgqwK/ZDgqx
         7DdrDrWGEBRzla7BZAoQzSZevA0sRRLl+JaQXJUVDaKAp82/BhARUf4rhdRBTDKTWTVm
         IRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016275; x=1795621075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=z618JacoIjdGBmCeyWf61te6talyPozkhtPk/eJpEy0D6qxj62afKmLtYFsF/fDi7P
         G6d7DlPK8unlcna0TqZ4Uk2kCfUOZI0YnDFReAC2NHgr1TriZJcU7QNWYecNZ5sScMka
         Tv/BGA2fFi8CJ1EYKyNTaco1z7a7dwaRAbvfQgOGxyPc2qxHCLl3AEBv8rNuqj9GbVTe
         +aa/S0nVpQyiHbroAWpgiKg1fCcnoCpXwgYV2Vlg2F1Z+Hp+Y6Z6BUEB8GRcZ3WrNxii
         uIy5rU6vYCG5cadQv4TKVqcp69xeYINFyP4exSZGksFXaHcILdK9K6YYe18jXWaXkDxC
         mtGg==
X-Forwarded-Encrypted: i=1; AL+hErGszUdjEdQFQI66xw72uRDB6k45fx/o8A7vAAKTVtMDLMKwXAF0kwIyk1lB6NrU2kna4I3GxNQibtjkE7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v0VPxesLctDBwGppdYa9egIWtgo6W/XEYsPt4x+KWBsO6+21a
	q1Tehn8UO+/K1dXsQ7zODBIhhq5h5QsFird5c78EmBrC1xalodUlif+zgW6P3gr8/YIY5BXiykT
	lYi2i3kzqx35147WiR+dEy0bho0wXWkYtYimZ26wpRDNKe+K8uonIGqrIQI5O1tOT6b8=
X-Gm-Gg: AZFdTZfrxnW0lARlUxkO0poBgWgK3262wwS+qguVxqR6R39VWq+zd7n06uCjU8evSUt
	SKfATaRFbpyDvKPRIM6nfoBD8IBvudFctKhr2CV7KIQmKBCuFlCn+YxDEHAQgKic8CvNUzuucLP
	CL48Fx+eH9dFct8zYyys4s+iw4ZJOz6XT5sMEZ/hXwILisdHaKb88AurCygRs8FuyalSoWiuZSX
	n9lZXyOtxLdfk3AgwJsUp4+8maxQceXtpJsz9e6o1L9J0RHHGwu0mOCxj0xVsqCMWJJFbovjkOv
	VGyWXD9u0DBVOmFbCMsWtZEAhRcHnL38NJCa6+2FUFU+QG4vMm8oo4kAZcg4dnyd1MbjC7KCeQB
	4b4mZmqHq0/teSSoiO6qA4FOX4SkHgMxhsWsGfBDboHoO65Gv7skOJ9v+LvCh7sBHS5P3/qgCVy
	EjhXd1P3lWNRqHERn4JirB53nL0HKKny2qeDT2o4U/zTprN7CIf19l6lgp3ZTS
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714976d6.33.1795016274463;
        Wed, 18 Nov 2026 07:37:54 -0800 (PST)
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714526d6.33.1795016273763;
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:45 +0530
Subject: [PATCH v3 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
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
Message-Id: <20261118-oob-support-glymur-v3-4-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=2115;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=h1HpQR5ft0SmfNIj7EEF/Ykdj6Ugo2udF2gXOOZSwLE=;
 b=4LJ4JoCJ5vF0dlcaZOh6pc1mBEyyFDEK3gN1kjiaE9mFiz2etIWuN4fPCr3ld2PwU1GUj7X+j
 Q3BLr42J80CCUnuDE0UQZ4rdnIO4g0RZFFdRUxx+lNDdrgKDFmD1+CA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afdc653 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: CqcVwLouLghMUfVLDIakIQXI8km3zUiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXy+mBMsAacwx3
 QizLJP2xK4ujg+kSrLTfx/h5/eo9hOGf1fYhT9m5sya6looUOE6/MPdJeA/f37QFWTo61NNZMFs
 Ddru0seGt4Q8/ZQh/CfOoafdd0ZmTytpd+2VqVGbf8x4jVkzNWNVGAKGvlvMifq/Q4d6lFfaU2t
 rdFu9GZL/acxvtEA4WNT5RHbnQGzQKyQ7Lj9ntqr39ViMndttJrvg8KcXxz7GPIf3Wy81pkelXT
 bZ1luheqDOc6xvwbRYWCj2WF9TbFOIZtUe2IuCjyVuXl/i7Jzbj898XGJ0uYbHPU3zvcNDx3EHm
 KEYOtcMTnsL9iIQNW0Lm8o3+MfQoIT1zANe3YT0cEiHAMZExWrVM4jJ44deu5JhVkXqdAWEX7qc
 di4DGZfJbOZL46/aq0xLwX8Y404taK8aX7PbfCCnxn55qFEdFwSYR7Ity08dtmgZ4ksFAu6HwFQ
 Sh6EQxIZ2/ucTYaJRDw==
X-Proofpoint-ORIG-GUID: CqcVwLouLghMUfVLDIakIQXI8km3zUiM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX/+xHhoM68qTN
 6gBjTmuYOhKbccNFPJkT4Jr/s/CX1TM5edRoAkiD1GpeBIZJJSpegZPAR8eny/wHZ85t6LwLxdP
 aP9s3iotJ0exABsnOePhUcihzIfO7xA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a167bd6072c9..5cc529e2923c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2182,6 +2182,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
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
@@ -2255,6 +2279,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },

-- 
2.34.1

