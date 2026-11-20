Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145301;
	b=i+9JADvzz2Y2B4z+9RcO0GYPw3uLd06Taid+EfwsUvT0wf7jh1c8VeQHZ9FLKAwaWXXw
	 /d5WgUuU8iQQYhv70wzMBX/VSxMksNzeM41XA7eWg361c/FC+lFfA6eL2epUQ323h5GGT
	 kaxn6AOXa3qV+O6q9oLAMINuVUBLtHN7iZfukfVqw2/r+VncJHNIsKUg91yBdzcsmeBfu
	 u24hEDjLkMfADyQRMzvm8MQ/DYPEEU/7vDdDRPwSSntr9VvVavZYgOm5qlodWEWonviQ6
	 Mu+foHDXm6ZNcnw/6khjZigwyHMBzOKz5aIcQgezdJiXPucit0V1QfCZ/6NfI3hMdiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
	b=2tRSSA28lYopWUfdvj2nIcGCVkRSexdUyaN8gR6jDorJuS3uW7LjNOO8wzatXU/dzyMw
	 5Fn55iKrkfazusdoMHKrPU/uQtSA2m+xYFZY4DwJgzs7I4q0/XygO/lD7pHUv+rvYe7EY
	 iRflPDqS5RknzzFm4JsfXD6qzjYqFEmwGmeJO5P0JArDepbkg1alibLHyjzCRJIyh/ZAQ
	 0u63USUdZ0kkFtbcDgx9pdM4/Z5+KA0kmtYvqyM2J0QOXbdobGdjUOCxjV1wVgSPPRgJ0
	 tG3cRAoJWjEU0TLNjgHvAIeg+RPDWO44+V21CDXD4IeyMUWDAAmezWpiE+/aARmN6Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGkuzeGO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke7jBJV9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE95606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE95606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGkuzeGO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke7jBJV9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GJ1K080705
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=; b=BGkuzeGOJ3aM3hwZ
	bMax1U/qh4OrNonsZa52DOpUwDiS1t3VpeR8JvoNiWOXhCOQUg0q9nUjsxv/C9Fh
	mTvn8YfTUTN3yoF+CY6vHX2K5+6z38Yde0lz1amsDtDO4EkCVjupsiWeOvZvEcfX
	ISF4KCSn/UtsUAYb0VlMB4eyaUaQZ5AtY69/4tio0KsaJOWpWa48sr3DPYPLNzNi
	ChH5eY1tPn+mw5wfvVZ8jgjTSJAGCj/0n3AKxXBIz2oiWzbsGrS95+ace9st0I2M
	4/soKmdvhGBnm1uAX/LWElGFAZz/wjUzSoUdzRuF6OBzsTR24UPFa3US2YFNRBK/
	YUADDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j255wjgp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41b099809so492513a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145299; x=1795750099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=ke7jBJV9zxnG7tz/V5r+gnekEmRmcXcbmiJCxBJGNzD5HerwfaykvA+voMww6Dn7aT
         McTgDgkEI+YeSxYITvvm1lJbWbKp013gtWHZ8hqfcpN0CwB1PMIFJ2GaS/QqiTqsvFY9
         bAmiBCDbPRHTIDJ1I4rMXbaj9et/7Se9PWtQxi+i5XXJCWBwakSIEkYIUDidj5v9jnxj
         r0HUyj9Wj54j18jzbZSY9NiWrYAVOPGZZ78FipUFUqQUrE5t9++VldFdaIipIzQzuVpq
         MP/Z0B8mZ+vonau8ABNBA2WibONeUNEvaPCwzk4NKgFpABSHix4Xv16IHt3Tpa1IGksY
         jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145299; x=1795750099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=mV3c5Kw7YEORTHMGYbIfXCIpB3IppWx0MQNDQZXG5cYQQDTgIVdhCIhLLp6+9c1vjx
         iHSB25qs5ZNGRSHgUW40kMopKje8WfFgyfgXiEBU4eYeklO/bTKr462XGOcuudyGYnX+
         esL+8bp9hV/IT41BR/kMXZP9/laD36n9w6VoRxeQWzQJK0nwGNG/i9FzSPaN0BSQT7ew
         U0Mf3rckCIL0Qi7ny2CqaFMLAT0FXUnbAxK0KL3uLPsrta19woSB1axMORFuNCkwoC6J
         8j0z7PkModax+7NDIymQASsfQKzVGLjVUjPHBbs29A/tMI88XvY4OODg2acgP+tPhYBJ
         g9yQ==
X-Forwarded-Encrypted: i=1; AL+hErHXo8CElZ9bCsW6rT0VmwDWz6/c7ACVT+R8iK2JgE8GdhrMBYgNwnKwM3ZJwU2oEL1f/9rVt0Bcjo2JUYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C0WsJMl4S+pjz9s5/JyzJYcr+Jgc6Hc8qW+WyMmcuCLe6wois
	S6w30jQN5ZfaKNC5RtkVqvsbEmHUu3VhBRHhh57wd3jHsE87u/J0rlOT/5Rzk17IhLl1BbRvU6X
	zxXzamYBTv8i3qsvurwi7A4sYl8cYKmi4KnMENRYaqM/VGBYsEt4Xe9bI/EUdj2bt6Y8=
X-Gm-Gg: AZFdTZcPL8MY7eO1Z5unP+8c2DLfCjMdBYJQeHSAOdVNb9dQBRO30cW+vWDlHFnWTJi
	CZJAdk4FLDJ0XUw0y0awPDZ46/Gb0HIwiDRgAe8S1LX5rumsj8kHPiYOKnUJk6zGFRmoBI4vMkI
	TujeVAvcdeUrlXXpRueXAqxhOSum+fbIpU0H0NLf5FdVOYQOtNG40unZlxFttFcO1Lp4Y5OPfxP
	cUeVHcq3pAANQxeYaNgMgDJykAWcCigIvxZmVx884GPyBDUiV3Nd75VwgOzY2RAAy3gCBjOXk5d
	9iMenicNWbskfqYg0rtnK4tpRwWau7TVB2WqtMiQOVjZyy1lRfyB9Q0DPMajOyrwryLflCUS+Dg
	3W+pHg89iR+vzyD+VJfwNuo3/RavKLVq/j1yVDeat8+j2qDOYr800QJlRohR/NrWuWz8huBTBdy
	NAH+UXp7TywLiZjKqj7i9Vkzkh4BTgB7bNw8Q=
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222872a91.29.1795145299291;
        Thu, 19 Nov 2026 19:28:19 -0800 (PST)
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222859a91.29.1795145298821;
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:24 +0800
Subject: [PATCH v24 5/8] coresight: etr: add a new function to retrieve the
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-5-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uwbtQr5CO9y4m2VKIS5xp7McWK7MGYHbpK99F1KNat4=;
 b=SLkUvEcl7lYrBTAQnWJAgtuq8pF0GvPrnlMCcAOC5CGloPzizcu9FlAXBO83peJqAz5ZVR2RT
 RpydEuqrPC1D/0d4Dg8ktxut2A2fNeKKBSaptBEH3qUiFHJZBUew0P/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX/FC+SRSi7fLi
 3kmVZGC768vprS+Rmn6Zix2AFPZ2S5HeQAc3OL2Y9fgghjpgPJql3ou5HebzPAyqiKlXDoiHfi1
 HuPsbcODTMxEze0wypyDhE/1GM3o0e8=
X-Proofpoint-GUID: _EUsnzZJCD6jVYsexqIllhpbeTy_f931
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX9MpAyWAShmE8
 deH49Ii7lDs2wSX63ifj7HzxT5PAwoXbjNU7Bw/uKT1vfji28leUccy4Z//XpwhRMXISFEM+s3m
 0ysUkbcRiHXL/1BWMV0Hfpq9dnoP1lAJd7DJ1lY8AWAFmVh5qh2moZ4Pei1p+Y+OlnSh4enk6Gm
 tB/KKzy/iPHrc8c/xyj4zR6cn5DsXs85TXfE60gGhaUbY6WQWLew3wv9usxQdiAWj3+vOBZI1Kb
 Xjfq7cKkbsD4UqF1fuHglw5PjfP79M4K4b+rHGQjm39zY0aH2AEMRKflseLboA/pmYCe3YDPlSR
 iY3dHxuZMJ8e8rHP83KfcpGsjs4SNS1I5SHQYVBYN92Bwg846GNAqK6PS8cguxUY/5SjRcV3Vj9
 SA4IjnKB1mHl1nzWTd1i4ggLnbGMDIuDYEpXKVJagseoZkB5dudrq6lUQ7NLGPgcA/EmENd3F3u
 Hdca2a7L9cc5W1cIqCg==
X-Authority-Analysis: v=2.4 cv=da0VTnXe c=1 sm=1 tr=0 ts=6affbe54 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _EUsnzZJCD6jVYsexqIllhpbeTy_f931
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ba6a686828d7..308762194e5d 100644
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
index e94bd74e7c08..6fc0b136bc05 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -476,6 +476,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

