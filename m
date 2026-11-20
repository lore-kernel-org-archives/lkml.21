Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145290;
	b=XgcphEtshEi+zqYdgPdHiObx1av6ujRCZMKC7LFQTf1T6p2bX+8CdQRaMRIDUy95nYo7
	 CVtpefckRK2O90Pzvl+NF1UbXAAzTFfaGF1tNJrwEQu6lZpgk5+mHj7xP4xJLO2zgW/Tb
	 897CQNvYDBk3ZZsWu82fBUDEHCGvCMYODB7Q3Z/Qi15XF7No0cbBOwneL8L7qhxd6Lk5r
	 Gk0XETmNkEOYTTmFIii1FIy8OlaSnwDmanA/8cLnud/vg1v6Hy62F0b4adX0b+4XbgVdO
	 2PUqRHeEA1iJ+0iOJxQ7E4be2dam5YjMLgWvSqe3uQNMds1uVLWb/a9IYTmMtTzOL+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
	b=Fv0jUZTjGF+aE6HXJEnzJoyvMqd1A3jWx75zhs5u5Q0Po9bRG49AXMTgc2X4LxM9G3R3
	 lKB7aE2DpsLKoCu7JtAN+SMSG6ezgtvbQ8fRg+Ik7k5zsQtZwcXlu0zK1JwOuPO/ONkTI
	 6sO+NjPlOW5NkSkMOm/9bQrM/DcC1yvPST993noyQC5RJM94H3yx2hnLpCT42S4i2qSG4
	 XU0D/Xlt43QaIPqzeTF7a0ElD3TQ0ctbKtoOUSjrAsA6zDj9mb/TwSQRan5jY5V7Kw8pr
	 AcHeWj/LaJbNop21a2jvhvLb6U+1x68girMPkogMRtQOg2xQMPUatFbDFPFk7F2xoMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTgvRwpe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMseYYNP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF06F60A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF06F60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTgvRwpe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMseYYNP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GNl23980152
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=; b=cTgvRwpeF3+QIV7d
	Pu5QhM11BUSuihKko6tICmFRo/wZZ2eezWsxzoXxCW/WNwQfrlee+JNhfs5QeH5C
	CpDC/jCzH2kUmggOWzJ0vTC+sruCHog0+7miye77mxJ2oISvwc/ohuApQe7E2Vg3
	/EqPqHkuHRVL/ctluzilUi3rJwIfKOrynxxkVTPxdltXbRUe3DCUezTPKEF9r7ek
	6wUT39I2v86+FB5azyBPGNRXX/IQ8XAbe7PZQWrfgxHP3cGkWvKTBkHbG2MavEZo
	zfJBtzuz5o5CGkZjVPY4K7O30YOgP8+fLLnGTCaQS2K30pziAe+YdbMUiUM7YBWz
	xE520A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5smtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so585346a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145288; x=1795750088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=EMseYYNPTB9f1pQzRA42ANYr8kqYeNHE8q7/PApnLY4HkJbh1bYjGQOVTTy2lTvpq3
         kM9o8XezXTQDTlNcxfZiyocGyGXBF5Q9XvTNU4c5j7PUyQ1+L51chAFEcAdp43SND7Fs
         NRJ/u0NUPKqLAH7clDDj522/ayY2fsiWuTgt0kxZaxFS4MBVR7f9mSLg7ip6PEU74QWx
         T+csFh18atTyriI2Elld8oPuhbchoxDxxFcBWt9qfYDKnspmaHVRG93y3wt/K9N9qXgC
         vGIViEMOVfZ7U6ZVi0NqrFucIyIVBVonkcK2eWycS0jn/xubmpSUKKAeWcKHNvI7AfRv
         9u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145288; x=1795750088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=d/+ESAjhxqAo0y+ZaXGzY3YWgARvLPccmeIkCcz5BOeXKc5gJFTXypcQz0y6xgSJX8
         rsjcKVYjewAITP9ADjghgkFqHKxFCM/b85h5hdIkHLxwL0L4+oqmgc33alUJc0vSUeN5
         lPM2aT6wOmnoAs+P9AlHm7p6YlHJzgNn5SDTMzchMNwHNOUoS9NIfUbMv9/vkxzH/OO6
         FkSprZ9pCQntuyTSX46s78HBQAasRXDPf0ZLtmhS2R4meejjxxE2AUozdNWfLHySGHcA
         bo9p7duzypotW0PExaFhSxJs1ZaiEma+zAzZF+34a0HjBqySJjcTgYE6ooGyxCG/RYdg
         kK+Q==
X-Forwarded-Encrypted: i=1; AL+hErFOHX7CZSWp/5ysZAcWkTlgSxa5Ygb4mIyVWP04xtMMc5zidS9Y6KFHpjfoeVfrOKGAZMcytlxV+ap6okI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hsBg+3uE8woGMpZfcAtRKC5Wl4NpUrTQFmtKT7RtR9m0Epe7I
	X3HTq7lFicTnQ+oIa1fwrs3RwFKy7gIVPUg4qsHVTIsVBd9EF2bZ0+PVeua3lFYW+seN/PMbm9D
	gYue53GZAE5QuCY+2E8dVmKr4Q6KMmNDGhSQskzC9w4pbM1tJ+waPRuezjJ4mzgRtOcM=
X-Gm-Gg: AZFdTZcvidfRfuLWSApuySIbIZCH4CBz0wU1vYfkNbR6vJZoL38UvX1PlUaAkMqAYm2
	c0R3J2706rBVX7uZBzKzhqp+o/voFN6EhhIXQE9MEbmaJ8uD3gWYkuvW/MkOZvG5BPSgZ+pdrYD
	pUbYevjDTifSNDP69HfwP0gkmBtaOcbDvnrWsCzBCPcX9XGH7k+y7VmU8geqjrWDxPx6F1jpnn7
	UtYkVLFK5xQXvTIBONAdu1GmXZk8Fz0orhYz1rD4kWkh2MSTtXxsm39EdUYr+6nJJkIhgN9BdhG
	eAqzCh1lcw67KTid9SbcZow5GEHVJKft7FSWQyyjWfM2SuoXDkXInTEouNRPCHo7Tt6Kb4MPKoO
	0n6MEMDJBTvQHTi+jBrTNGV5rzybHGxt8FzUmlyaSb4Ts0f9CacYSe8oCBrpjpEw5LhDOVyuHGX
	pV8C8U9VOOYQI3+De8QrzuMcMSQPMhiuLP48E=
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309298a91.12.1795145287522;
        Thu, 19 Nov 2026 19:28:07 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309278a91.12.1795145286997;
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:22 +0800
Subject: [PATCH v24 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-3-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=4632;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/q3hbenfKTr48S8hdFy6BvVzZpTiff3UFj41MW4quZo=;
 b=2snsCrbr5ig562qt2nrm4F1CzkE9z8o+PNcmagxqr39xyOfSXGpqg1f2NCVaTJLHlq/eAWlUL
 tL1paZ1DM7CCpeXMEveFSPZpT8TiCLqVVInmWYXsf/8TP0oZMfTR8LF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXw/2t67AB0myU
 M9f0hY6CaW++Mg05xMLOX1+eQmE2hkbaowNZ+NCog/6oAYdEQBzQVsx2aokJTc+6T8z68QeJzvN
 TgMKAe7cBrc2an2iX6KHeEP9TSstMHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX8NlG+uuxDxu6
 iDvlcvUhLk3nBP4tfZDClGr65RB8xKpv8af3eEOdqMJ4t/MnO6zJdJY94AQsIpc/8x4HBJj7qkp
 y684/LnpiQla4uhaNQWZN9jByuAP4ULwtwAWqx/hzfYRKc+tuus3U5CJPsd/iA3coK8sPEyD8pb
 5Rc/IrG7uF9XSm5xuqXURqWS3846IdapWPcVb5LoaFtiISNuxf1vmK5nrmn39rU2+RTBSYsVDj6
 DG/ghT0NmpcFawOOcxeRt16yamRmVFrLWrXfpvnyPoFnVk1OS6Sqq2nIMtqh/1VF4og7uhu/vKT
 K6s8PUbB0v2XPrDEzoMebipRE6Fpk5ZJy/lCiVIiFpCx6Tg2w63TfvI/7Yf4pRJz9xQutRORGmY
 Z0jKJ6IAX97BJIDmukpHDp10L9V9M3OSsJvW8TTpQytlRYoXfyXOIf6XpIRq0A5d/JXA3T4i0i1
 hMLUkMi7DXG/ivCHzMQ==
X-Proofpoint-GUID: AMeyIRrMYmGlLrFgdKPVJDx0QOWHRb_E
X-Proofpoint-ORIG-GUID: AMeyIRrMYmGlLrFgdKPVJDx0QOWHRb_E
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6affbe48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=z-iXM9TJyjA7tvrExkUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 03eead4176d2..ba6a686828d7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode, there is no free buffer, or the ETR fails to restart. The ETR is
+ * left untouched in the first two cases. If the ETR fails to restart, the
+ * switched out buffer is kept as the current one.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->free && !nd->reading)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	if (__tmc_etr_enable_hw(drvdata)) {
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+		/*
+		 * The ETR is not programmed with the picked buffer, and it may
+		 * retain the pointers of the switched out one. Keep using the
+		 * switched out buffer, so a later sync matches the hardware.
+		 */
+		picked_node->free = true;
+		curr_node->free = false;
+		curr_node->reading = false;
+		drvdata->sysfs_buf = curr_node->sysfs_buf;
+		drvdata->etr_buf = curr_node->sysfs_buf;
+		curr_node = NULL;
+	}
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index ff2dbd85415e..917f88ccc00c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -467,5 +470,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1

