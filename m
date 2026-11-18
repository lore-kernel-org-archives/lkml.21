Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988988;
	b=O9GAR2cUb+2o98nFNbMiVzEaLsV6Mkrd9NSLZMe7xUvbHpf8CKmT0UwTQCTtc26eDVXh
	 tqrKB2/EKuiQGdW2NjZ9bfbNqxlhW9RiMUGASivIeuc+ZD5HVFlHLXkLazlwxtjTcSTPE
	 0lVY0kXA3RYVX8DcJoQXB3r7LSqlueiXY5uH/5HbB36fstTlti6JcSwIlERdeBzPjmxv2
	 tOftsg1zQizpHX3JF7udgADFQbm/Rod7OQSRwOm1ZyhYpnCaV6KFUk5rkSvWWg7fUc0Kk
	 FTunB4SeUvQi5nRT/7T6bEbTU52dQuMgLxvIE6eo/aAckyC7Mn3hsfuVVIZLjYDpH7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
	b=12LNSe28rhfvwPsBebWca5GEba0rXSB90N1NXA0pmDosBXkh1zw0GzeG34MgdMqBiQFW
	 dSPf7aQ9Ew7seEIOTTwQ0hUfNbu+tHrM6YZDo83JAVQu3FXvM1v+3CeqcGx+At7JkMwFv
	 gRzipjGOhFODqkKaqNDdMatGnw/IbJ9oVB1iPc62qqdqcMMLKtZUugSEZ82aS1196oNn9
	 5jSg9lzKUYlEhsxQJ3/mZiQtX4ABwznHCEFBxZfzRlb/bO6RPnn95Yfb49l1x+UgUAvVV
	 wX2AjC8H56sqUhdA50MHg2/Xi4as/XBuXM1JGg6+i+rse6qoF1b8voDe+gMRoYc81DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SehWkOYm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KyLpHxpS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167A606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6167A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SehWkOYm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KyLpHxpS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3Oo2453769
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=; b=SehWkOYmoajt8tEw
	4veZXGFfEZMpD+ItYPe41I4Fbc4E2QyfIfSZfedALy2uhobckkKevMcFExwRS7iH
	bJ1OxNFkMsNtteu76odrZK7K35E9J4G3OyhSbROpYqwWIwbdTSzgzmRpS2xizOHK
	v7CCIA/CjOWvgVjCEaBMB7JSr/us/l3/1H7RtiHcPbE2vZc1G/TF0noNfM6uPi9u
	sgTGRijbIyMvAVx4J53DIkOsUAGQ1Z562A1eHAmk+vAxRRVbWq0Oe6TbxH/QyIgn
	Ao8Rcaf9PXFlOzZ2WH+kyvfYoJ/9ruDiH7NbGVh3/HXgyr4vAEO2R3rcs8bw/oZo
	5yXx/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99wh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd652c0385bso576700a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988985; x=1795593785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=KyLpHxpSfYmJVbogIGukzWNgYR/S1FnB5zfjNJoIbXE/pGDYl/9MxjOUEA8AvPAtSy
         k1AC+yeaE5TuYJGco3DqAzaDJyd+LZcfonDCPWS60QnYKPKPTbbV/lhst51ib4Yt2iOB
         026JJov7XxgdBGRjoxGzE+xjlP2RJU1jHH1PARp0x3totJ1L2plEYEXAZzj2LyvJvnKE
         1smLtHB0y58EmkfnX5QKkQvhyYG3Nzs/speGjy0sXacedwhEYCeetjQ7XvKBJ2EE5aez
         SvnfbcP3HF0wvlq6uvF8/IMYwWNFZvDIizG5sfAvs6AAfADY7wpKqOMCCDCQj1wvars9
         8+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988985; x=1795593785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=w3gXB+s4zLBc3Cha6Pnm8U+Hk1I+7tRRNGUAbQnd4aPTn4rc4QQhqSExHUoPgm0e3B
         ymWviN8MAAHFlkwj4zhuA9ckDOuHrc9wnGmGJG3bt25fwlZysGGf5L6eREWyRZtW0Wa+
         f5vHzoOnyWoZktdvnDhZH/CPPzKh/IVIfmdi32AQ1X/vQcJ6Bwax2s1+mUefgv7lROyN
         xoW191pOPznrKLcpJNMsR+iS+rMjVM1g1Fq2BF3yFo7HN0BeAKI/ruIi80owOlA19YCz
         XpahpobFTDnYw2yM02rs6GwY4oBDDSpltD9t8rcf1V8nhd1iu3oGsP0lMZY8Zu+DdINw
         LC0Q==
X-Forwarded-Encrypted: i=1; AL+hErHhQOLQ2lpJxY3a4ua5uPA4XsKlWzeur5LxkU1mb2Ff2L/3ymemIFw8JfOWMgJ4Yd4PTycYlFbAYjD9w+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+IqbyZ1+wmn02I1HUdzCVrHZaz+o6kBasAxxLIgB49PtkIqMM
	C0ziN7rr9/qRHPstFrCCR35LKWSQ1SxdcS6HnPG1w2Xe6ph+XcMWO/WFFMlQXtumRVL7eXp3aoF
	B/6vAr8WAbwvaXc4YoMqWKFjEsQFdCQS5ehjPosIhrVLtXmYiBg3ajtcpZ3AM1jTAFg8=
X-Gm-Gg: AZFdTZfUNND0ilxuxqxz9ggGzwQlwDs7Qqf9HRWzWX57Gyq1WoxHXWIe/MezhjFmKT4
	BwYiTjXM6ICr0sOIXk1l8ax85xY6ok0yLfLF+uUt0R4P1kQSkgrJrkW7ujjdk2ztAvApe0ZFJ6W
	d20b9mqZOonU5ToHnV9oZCTBF8DFuXYQnJxsK4D7SEZNYL7RVfMHCUXhVWi/Py5tp89pXQ+ZLNu
	oCZz4NanLFCRbHP7Gk4+ff8Wbl6/1yUJfgdOTv0hX6vxgXM9/b5jIRERbGlI87DeAPzE0xvqwIW
	ux4lq6aEJ37Rj2GS21vqca+OefANK0+j+Aaxf0/XSJbm05LXQVzvf50PZfm1+X6UlEf0OGak7pn
	7V65mWHlQYkrbFhR2Fi5tFE8UKA2vqTWkxmaUEGd1/Mmv8R14Uawnk7I7LMttf033JJP8zVAlPb
	VOPN/eshDFY2UOrlM9MOwYW7MNauLX9Idooa/N
X-Received: by 2002:a17:90b:3888:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b3d07e3b43mr1977322a91.61.1794988985087;
        Wed, 18 Nov 2026 00:03:05 -0800 (PST)
X-Received: by 2002:a17:90b:3888:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b3d07e3b43mr1977275a91.61.1794988984413;
        Wed, 18 Nov 2026 00:03:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:24 +0800
Subject: [PATCH v23 3/8] coresight: tmc: add a function to switch the ETR
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=4507;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PnAggtb/hoPMxGkHLkimiPJx33tOJTrsVEFsbWRzHrM=;
 b=kvEbku2KDnvoJLBsObLlNuF1g/Oz7j2QHJyBoax56i1IV6LPPWoPLveh724YxNNEmDFo9Kg+x
 QwGjkAhsSVkCO+wEPUF+4BtDr1nqjHBDAvTRovfhxme0L9Cd/eJgXWV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX+Xrb4sXJacCx
 HcwSHrrFT0ooB7FJGottVDMoTUYVCZ+xDZ4i9qFNhQxhbaGA8xesTEXlRV4RWd4OQc/Dxapf0pU
 natQiZ0hhDmAmzuZ1q+ZYGBBFYLNQaI=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5bba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TPt5YZYWydgKV8fuSqQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX9ZdtAqhZZlar
 meGMD4OcSv+kWCkw5JnvyWsXaAOnv0oO8Ul2AP8GOTd/xql0nkaMG9D7uIxinVl/ZfWnAWB0grp
 RIIHRCymy4TZy9GKEq9yIqa8TJF/UsPfycCKOtL2DAmpj2/Y3z2AZRqF00lqfhzfpYVZKwHpngy
 4PFkZCYZT8avwcQnW8hT/mz8C9jOIgyvPb2u/9nEnLRJuTfQQUDsxVt/oMgTN11FSkXLCypDotp
 OE2g2XlcYzO/UeG/72ufxdq54fwIPckonk7/uoSmuSJp75au0CYc29QSszPoVzY1YUHTgA5Vpco
 Gs4FFfz4jl/kMi0GtpobJJIYztE15tYbXKycN6vKXVBtBDnjAerXex9CdTHOZpty+9TfhyKNC92
 uZF1f2olu8PH8sG2GXBiOKaNu5LDi1n9TB3JFnGU0j9oPChu3ZfYBXZ2UT6lWAFpVIjFuaJH6zM
 gV7JkVY+IqSzHwiptkA==
X-Proofpoint-ORIG-GUID: mTGjHrzM4Kun0wnMwgBDe408Vv7gCXcA
X-Proofpoint-GUID: mTGjHrzM4Kun0wnMwgBDe408Vv7gCXcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

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
index e9213f456834..5032f5598e15 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode or there is no free buffer. The ETR is left untouched in both
+ * cases.
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
+		else if (!picked_node && nd->is_free && !nd->reading)
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
+	curr_node->is_free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->is_free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	tmc_etr_reset_sysfs_buf(drvdata);
+	if (__tmc_etr_enable_hw(drvdata))
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
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
index 7c604b9f92e5..30b15c38b080 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1

