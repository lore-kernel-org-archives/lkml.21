Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988998;
	b=BQz8tLTvJU8GoxGdMN7AXPCwmeQmWC7GcNf2yEhe2gJIDI+zMKyfJM4TtOum2TymVovb
	 MHT7GrcwGIXuGWXBcsNFz1CZIaHb2f0twaC2sbxvvudkacRYKkN5ZbibF10VJKKUVioFM
	 eMGOC8amwO8UdvLSsFe0zxwVoqFt40UQdO5aDpB2XemenOhCOKVgZk5/wZX4KuGcunhnH
	 zFLGpNJrPnCtn6H9Was8pWI39TjtsHf4LiDBrVW5hi7Mv+p5jmg1M1y2fO1ElxkhrOhxS
	 79Mm+fwLXw5c84sAcm0rTFn8npWfYiyyIXqMJQnaPZvk3WAQbOz/5yStsVKSLk30IKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
	b=3yk6ngr7GRFsTxlyd3X6EHfwo8hjbeVSbvI5jZMYN0We7J53cdIoa1iFXNZ2zWXGTafa
	 cRd3ef06Q//xYSFT3QeDXYFlq2udXsvgR0Uq0r05Dwz8105QVDUMFlAs+zcOcuySp83Qi
	 rGkcimWJXOGMim0lTOJNjE8Rto1ONuGmSaqnlZ0r/q/AoQckNbk5D3jcGmNiEOX6F5pG6
	 e57HOMPlNgawdxutn/cWk2aUJh5P0utWfYixlcyDQY3w43QKteoQ/NDrjwR2KnJ36+6+w
	 AgLaWxps1co7ouMUuCsjn1a1IY2XCVYAdAtTSnhxcJDbF6J0yVL4upY28gPxJNcEMHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ7LyWkF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIeXtnCO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909C606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1909C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ7LyWkF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIeXtnCO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI5ZeZY2393559
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=VZ7LyWkFNR/adFAu
	rvraIXRtjke8TzSjKPCW6Mm9i+kqL4gkm3hTDZRuTOi/9KHmL2E5b96bseF3sumr
	QeY4im95/oe7RsHw/vLecTJMC0WbztHhxSc2Fjg8+699sUak3tmoP0cjgkPXcnYF
	R1f2+QWFe5rNDITKCPPVGROa2+keExyRO46hL9I6eSQi+nF6zxRxgcDwma0OFRAP
	pW30sLVvFavP/QOXKjcaEkCJLdVOya7bCct3YXVDQNhloQ/t7aQGg8rWaCwrlV1Z
	zMnZV8UeXGvhQuP0ae+MiCxWO7C3tq3KbMxdHYz0NvkvwEgu2+jqlb0aYzq6tg21
	d9NQRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hxbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so575188a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988996; x=1795593796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=AIeXtnCOcYkAGq/OnFcbSgo91N0GjreNNmMNxuRpB2kshhJGEBdY/hqcLTuIFU8kUi
         c9ZgY5FU7woMfF34vZkKUs4gCtIyvIPrM0+f+DNwGLdT6KtIUFH0F0cR3HtWVlnVuVOP
         zTXfkeJqjmlmnsEyZTXmGcIDRTwyo/R+buJ5ctaKl/MmMCI3+YF3j/PfCbd9doFmDvg4
         cZqF9V0v9LxrbqyWtc3GzmZb6KHSW4Da03WeulqZBFc54NDhwq7YoG6R4BG0cY1FMbAY
         Xl7nIZPwYDiFNoz2LAJhCbpdVZppE2ZzjhbiH2uvl2W6hceOD8ZFiOg3fqTJYUy2QwZD
         HFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988996; x=1795593796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=saIQcvVZwPsT4cjoq+Dc+5b6ex5ejRVIz2RxR3yWw+52+XGbARK/11S7Ugw22xXIz9
         /swDLspStfrN5qnzLUomIyTlKsKiHydIzFIQ1ojOT7hlZ933zB5iSF1QBJ8UzFq6h0PP
         yrdmGvQCbF6/JXj23QUyOLmHhaCJk1sMePaOG9SehVAGhLPLmN64/vTE+ookluJLFnyk
         yhRciGAAZ7s4j2H60DYVABpGdGLcHk4BzQACVwboEL3UYhtRFWZXe1r3nuHmw6IFnnkQ
         j7cqAEBShmGlXNcGgIut3c39Cd6YspOVDcQWFgnkKLNgi0iSMhUfhOVyVqsn8u/OXJr/
         iw3w==
X-Forwarded-Encrypted: i=1; AL+hErEI6LaqmIQlIMnw1lWe022pU5DJjTMIhFcuxa7wwvbv0W4LfYcAE2YmtcHYeaZEmBvj86XJr1nKPOjKVKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z992E+s9FRD107EUpRMM7tKJ86dGwEJJzItMbSo3S0LG83VIY8U
	zk6YTJEk15mnZYBxvMm8CpDpeyVLBx+KXpMq41Zf39ze+G2CiNms4L0lB4TEKZrAhS3eAKgeFCZ
	sDoIc3Rr6dF1ByG7kIwDUWSSPwqFggNNWhn8rEaVit5Wv5XghoVoGsyyamaQe1ONlYrA=
X-Gm-Gg: AZFdTZf/5LX+SQn3kjVLDkeTQkVh/g7ztJ4PUWvQAbeKFICcO3gFy81m71TmHLWIcm+
	z46bN6Y0YuI8b9+BLYHYK9T5MFqwE5RsESkTeuhTIaFxAGFCQ6tjJyACUpGvOKwC0NL3pxIF65s
	fp71SM1aSP9ucsTIaYal5DeMCuPTzxJpYbsnMhDucSWYvavPX2tuNCA1ulDY1PlzPiLSui70yil
	8y8kDQg9c24tppG4l+MbL3vNZ101O3b5Ndhtqp1eZzpzckLE4kAgd6tZAXoLOoVD8Y5yEUHndQE
	yWAD0gSow70+9ZE/P2+UwMyS99Yp6cZ/TUfI2MBbtj2fhbHtABq799rcDrS4iGiBm0Xm43sox3/
	iUull6MKFVMHTM10lldOP3dn8/3um/rLsKtFY4quSF+EjatrgXn9Bjy+zQX9BBzjkxQacoMcnNn
	Z3ZPolfBPSvV3lih+ge0Wkwv6r24RhBBbWuayT
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025369a91.2.1794988995932;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
X-Received: by 2002:a17:90b:4b86:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b3d06a254dmr2025342a91.2.1794988995479;
        Wed, 18 Nov 2026 00:03:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:14 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:26 +0800
Subject: [PATCH v23 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-5-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=v/Mog1KV7xh6PV68yXz5es3jTQaT/IlBXzKBN79xPwXQMDsGepiTTjA4syW53LI1F4XU7A2FD
 rIV2BRtqNLZDKZJI76FHVufgwKArL6AhegcEcgtHm0dIas07ZAuy2Qf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: QgrZKA_piNJRDYZl8iyGCDKK8uOK4Xw_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX/8yxQAN6TrvZ
 qdThP9MiNVhm2TVn0xxmiU0IZeT4JU8L8sdsRllZ9V29d0K/WgErr5d6LBai7vPAhI4rfJJp1Ok
 xd49Ueb1qVNFFI0ro8vu5WVzksL0WpQ=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd5bc4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX5njhsmeourxj
 obYokJw7Qt4Ck8bUceDq7wX0QbgZrELwmbmpqk1j9aLPoUg6O4dL0tUkoHEweS7ak5pEYtSILHp
 Omc+WRkibMIxiJ9LdoGkqCtXlKfcknRjGhiElkv2GnCCxc37zT3o0bx8PupQCWF99ujwIculSdI
 U0gkjQ2fkHJUilCTEGagvBkF2KB+sx3xTaFs+sp9mXArJhUM1Od48Ye/TSCMm4y7r90MkyBWQ2Z
 8sHr1OoH1/adtLBzmq+MbUesKPK1e2Eat9jjWKdLK9T2tlC76nixXLAS8adQ+6m8ijP0Wutonyw
 mH0iLDVd3nphRxVxCHO2HY6BcIpx14BxBtrUZV6yPFdhDmMF27bWIoKEilpe+bwyp52kNXsNwZl
 OrzYZO9YCxjuNSvAR4MSUX8gcUA5aK2iG64nFarAzziEtf32ag76axIStlbcS9qvt+su0nd+V4l
 X2XKKdw9olGm9ph1Z7Q==
X-Proofpoint-ORIG-GUID: QgrZKA_piNJRDYZl8iyGCDKK8uOK4Xw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5032f5598e15..cc341cdf8d8e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

