Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145283;
	b=dQS35ztbIISIyDeFVsRUsis8brbepOVXmxsuqbBBwRpZhkr7mWRIGoxXwUt2lQdNO1UW
	 o3QfgaxLRHKuqt+AiZA0YmYjFDWARCCHzIgHvFGeWCGYbcrXhqGoOdeuVDys8yCveUsuu
	 HCWdtg3JK0fiwCUXO0AuCwu9EXWO+k3A2AiumavuoJgLCf9cQGd+5TB93dbneYgQ4/nbp
	 F6fTMhYYVRtBxq11SGAbw+WZyqEw/I7GGxs1xuxPQL+spB6AynDCctYAeWtoHw+wGg8Yy
	 D16ULdIrmKpcAspRK82lbo+JfSASpp6jNChWPzZbxRYjgVm46mNJgvYLa+JWcCq9ZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mYsyOYRlk85VuqsM/X2/oyTJ9s1VpnnPZMk/MWVafTU=;
	b=z43KGzWDtAymop/nwBgzSX7uUUb3SsRWzRrgJNErYuzfskfjXnVLV8AiCth1v5GEp9VW
	 duZByn4/ID8uRue+WRu+dtwP0ZCTZXl9EIHzWLalvPvh79jOlWuAZLcbJxBdm1C/YI5bm
	 hdOAPoKF8iiG4k2dxIPRTaFThteinL9dyiVboezyb7cJnT8kqZVs8iC33G4Q09RnszMbs
	 eMVuJJguGcdbxwq3lRqJp2V4rr1ZA0okXtzbG3VgMcrYTI+aSnm5GLMz8TcVQEd2xApfZ
	 SbSXzGA8D65RoqqodLspHcve5XgEDYrE+gFJ2g3ziv7P0ynpHupvXuFg1rPTGHQZ5dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BR2jJcMe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MigEAKqu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753D2606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753D2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BR2jJcMe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MigEAKqu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GQYf1048553
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYsyOYRlk85VuqsM/X2/oyTJ9s1VpnnPZMk/MWVafTU=; b=BR2jJcMeoKtS3aka
	ij3ea1B10XMetdbyHBH++65RxfR0BaogGxx2/8NNMMnJkgWXWoRDhGYdBEKMWjGZ
	rlku5fWZPSeoG7Q73aoHwBMDAzhys+TN+33dDZunb/rL8fZ5WCBiE20uIxCTqLHL
	j1yJ8ItGwaX1OQsC+265eMH21wdAsFubTZqp9zRnPJdlgBm8ck1KIhuXSvqW4n4k
	DJe4GaV2pGqPcGlFJMHQMiLs7RULLCDZ0ecaTG+ZSljzTFs37BjAPpxeTvrNIwVg
	/JMw8JWYBphsOMK+m9c1OxI5MFOl3Q6aU7LMwhcIqd8c0NLMFzepDSzz7hg3sr/q
	RTxOoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymmaap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so633266a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145282; x=1795750082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYsyOYRlk85VuqsM/X2/oyTJ9s1VpnnPZMk/MWVafTU=;
        b=MigEAKqutmiXoJGNWz8qNQNQwkL98cCR+XfGTB4AcxZTqMFlrJfbKHx0Si8Cix7c1Q
         xNCSfUQUHxGuJEHPWAWX1NlOXJ3dNBia5wVOO2chU4xiL9oxPRYudEfAOrAUsgaWZQLv
         Z0seQ5A5CM0bL2QQyKzRLj4gYOyennqj+rr5rASkXC5odAhts9RoujmKZjgZghSaxdKI
         ZxWi0DmubwawAzp7Op7kEyOx3SXb9cQXZSty0gKVgCyZ88F+WUw3B9mRWDTOfbvkH+8/
         jxMgPTss36XO/x6YKqFrQPgGEm8HjnAE87pSiNvFU3e/URrYi9pE3dm5mWJ1RvA6v9L7
         YcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145282; x=1795750082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYsyOYRlk85VuqsM/X2/oyTJ9s1VpnnPZMk/MWVafTU=;
        b=V0QxV5gqYpE65Qj81pV1+F8MhnDpZmk4/adgnfD89DUwpuxUlqDlpOWTOU1JqltTC+
         Qe9lW7wNpv/RMmSOdn7AB3JLjuBP/SMTyH5+y1wSJZDHKARm77NxyXlCXvgQBh6FvDx+
         cpjQILMFelgbF7kVpl+fRU8muEKtpnaZCFBVJeeDa2OkjGHUXKNBhQ8E4MBbeGHGheGJ
         ZRWbwyAzGOgeHptAw0lBd+MewWnZDBwtw2FN/hCSHuqp0ecOv0/twYG5TcOrGGBgSuR3
         Ik0AHDrwlRVZjgNKNH5JLn1HiLMub1jj34R0jA+eIYyEg1iOVLehSD7431+rFLb14nVQ
         2PXw==
X-Forwarded-Encrypted: i=1; AL+hErElNBV9clUiH4tsXRqHWl8zqcfBiQER1U7bTvvvg4R7Gxmbx16KRR5m4nNwvZtjV1hdLXLeKag8+33s3Z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l7rV6vF67hT/3VGXfy9CwbezxImNBQtEkrCOFurtkecxOisMH
	uyoj7/Gt4jEHmK3VHkKyOGF2itVw0Z4Kzi7F2ijej/DNkaPro336lvKtnz+s08tHSN4G8ErF9k0
	92b2r/hG4s5bC6v8VEV3oJGEGyTx645pL8Q1uhWJLC0C0EJ2NEcuR9s2OqGBiyJLjOhI=
X-Gm-Gg: AZFdTZe+4TpgOFS1VR413ahRDy8y48zXJUo2Q6EqdYSO0Sivb/N6lJuIrA1e37PlbcA
	WBeiDHjRcNcDVfuOdnhYM7uoZTjtsMg2jiFL9TFQWIWiU+MuiBD+Pxv2evAXI1cYlWIvnpM1Ur1
	xfrjepfbNYRJdXZu8U/JCe7FiRTuxdczD8od7rfGxAVBOEF7QwI7s3S2lOrzDVk3Bd5oykoduif
	BS8J2he7t0SQKX1jMJ2ka0R+4Iz0MGGIfD8CIqk5DaTzFAJqUbkmUDb2nj1hJfUkbBLKxIt/2b8
	L0TjhiD08kCMbNRZGlcrZZorfTOiyaWyhCWQs8LTUUPgb+ergx0/e+ToMfZ+6dlLWGd8ylex/wn
	N6IYP8JXEyG1Rz1B4vKqtoVs0Zq5MEGIKnAualOpOqFvrkG/J4i9nooEMeCvh/T7nk5/fZWceso
	OD6tu2HuTQlLN1S+o972nmC0ZEpfiOtHZ+8zk=
X-Received: by 2002:a17:90b:384d:b0:3ad:50a2:9abf with SMTP id 98e67ed59e1d1-3b41c92f8eamr1492784a91.38.1795145281869;
        Thu, 19 Nov 2026 19:28:01 -0800 (PST)
X-Received: by 2002:a17:90b:384d:b0:3ad:50a2:9abf with SMTP id 98e67ed59e1d1-3b41c92f8eamr1492752a91.38.1795145281299;
        Thu, 19 Nov 2026 19:28:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:00 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:21 +0800
Subject: [PATCH v24 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-2-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=11094;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1oOP0oUmGx5hwy+hFuL+gChkzsrwW6SCsSbaZDeRArA=;
 b=5uHorWfaCPTfRkKAK9Wl2wqzxo5HyNElPIKxwrxUqorvR3hMZX4sZOuEjekLCoWGwF8LE/mCA
 PFXpIWvSmJtA5UzP3/QGXqCoNuVyBiXEIF+mBgUpjEVGXvwttkgHVbu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX0RgUvJfYePCU
 l/d08OXLGyJCGfcvDwp0LdMSYZ4e2ZQOgQoueowx2cJZqK9sS5cMeU9WHGy2cCw/LLWbpkN/f1f
 NPbW22ogL8O95TaB6IjDHxkvol5aYXw=
X-Proofpoint-GUID: lAEWtaQkjHNx0u4yBq9LNHnfytLYIe1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX9bWMrWF8oygf
 JSn0001hRRrAfFmv8xscdnBbonvxsxPW2qUrncPYgURB82YBigMHhoCvTQW3ichqo9Qfexl4S0f
 G9T4t/KUBiaJw5twEbORB69zmNDwM67ShfN9rJtLoMTjyF7jYikNTeMEHIOiMvjvQyMvD/HsvRV
 xKD9dHm3GJx1OOYA4uPuSf6jf1+UCCNKtdjb5DZbbp3tAWc5jn2k+eTzG2STa0qA0/ZwLoZgZbF
 iXCuA/7f9l1wRZ2Fgn9iUXq3tdr8hzX5R56cbwTDx1jB+cLGkD+ChXRBD2L7tlsc7BTSw33U+Zl
 DqX6YD7NEPLlsq8WILcH3Zdg0FNR/2NucpCiha9VpFG8vRvfskVy/aeuuSYKRAgP32zjxArVa+Q
 XnT9VN2FCdF5Jl5fKPOUy4c7EBQcNLc/XeqVtt4ZZFrxGjaleCU2pPBb5aMvJhilaEMv5D/poYm
 uShy1YkSgF+PY4bQF0w==
X-Proofpoint-ORIG-GUID: lAEWtaQkjHNx0u4yBq9LNHnfytLYIe1L
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6affbe42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lVu_a0_mddZ4RBTubjwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after it
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 197 ++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  20 +++
 3 files changed, 216 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..bc7dd676da47 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..03eead4176d2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1268,7 +1268,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	/* The sysfs_buf is owned by the etr_buf_list, don't replace it */
+	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF ||
+	    !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1918,6 +1920,196 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/* Free the buffers owned by the nodes of a list, and the array of the nodes */
+static void tmc_etr_free_buf_nodes(struct list_head *head,
+				   struct etr_buf_node *nodes)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, head, link) {
+		list_del(&nd->link);
+		/* The buffer is NULL if the node doesn't own one, which is ignored */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+	}
+	kfree(nodes);
+}
+
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the sink is enabled in sysfs mode, the
+ * node is removed but the buffer is not freed; ownership stays with
+ * drvdata->sysfs_buf.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and the
+ * removal of the nodes against the ETR sink enable/disable paths and the
+ * generic sysfs read. There must be only one owner of the list at a time.
+ * Must be called from process context: buffers are freed with the lock
+ * released.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next, *nodes;
+	LIST_HEAD(free_list);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+				/*
+				 * The sink is still enabled in sysfs mode. Keep
+				 * the live buffer owned by drvdata->sysfs_buf
+				 * and only drop the list's reference to it.
+				 */
+				nd->sysfs_buf = NULL;
+			else
+				/* Free the buffer below through nd->sysfs_buf */
+				drvdata->sysfs_buf = NULL;
+		}
+		list_move_tail(&nd->link, &free_list);
+	}
+	nodes = drvdata->etr_buf_nodes;
+	drvdata->etr_buf_nodes = NULL;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	/* Free the buffers and the nodes out of the lock */
+	tmc_etr_free_buf_nodes(&free_list, nodes);
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/*
+ * Check whether the live sysfs_buf can be wrapped into the etr_buf_list.
+ * Must be called with @drvdata->spinlock held.
+ */
+static int tmc_etr_check_live_buf(struct tmc_drvdata *drvdata)
+{
+	/*
+	 * The sysfs_buf is in use by a sysfs read session, or the list is owned
+	 * by another session.
+	 */
+	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list))
+		return -EBUSY;
+
+	/*
+	 * The sink enable path reuses or frees the sysfs_buf of a sink which
+	 * isn't enabled, so only wrap it while the sink is enabled in sysfs mode.
+	 * The mode of the buffer may have been changed since the sink was enabled.
+	 */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS ||
+	    !drvdata->sysfs_buf || drvdata->sysfs_buf->mode == ETR_MODE_RESRV)
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * The nodes are allocated at once and the buffers are allocated first, and
+ * added to the list in one critical section once the state of the sink is
+ * checked again, so @drvdata is not touched on failure. The live sysfs_buf of
+ * the sink is wrapped into the first node to preserve the captured trace data,
+ * and the buffers are allocated with the size of it.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and every
+ * update of @drvdata->etr_buf_list against the ETR sink enable/disable paths
+ * and the generic sysfs read. There must be only one owner of the list at a
+ * time. Must be called from process context: buffers and nodes are allocated
+ * with the lock released.
+ *
+ * Return: 0 upon success, else the error number: -EBUSY if a generic sysfs
+ * read is in progress or the list exists, -EINVAL if the sink is not enabled
+ * in sysfs mode, its buffer was replaced or a buffer is of the reserved buffer
+ * mode, or the error of the allocation.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *nodes;
+	struct etr_buf *sysfs_buf;
+	LIST_HEAD(new_list);
+	unsigned long flags;
+	size_t size;
+	int i, ret;
+
+	/* We don't need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/*
+	 * All the etr_buf of the reserved mode are mapped to the same reserved
+	 * region, so they can't be used as separate buffers of the list.
+	 */
+	if (drvdata->etr_mode == ETR_MODE_RESRV)
+		return -EINVAL;
+
+	/* Keep the buffers of the list in the size of the live one */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	ret = tmc_etr_check_live_buf(drvdata);
+	if (!ret)
+		size = drvdata->sysfs_buf->size;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	if (ret)
+		return ret;
+
+	/* We know the number of the nodes, allocate them at once */
+	nodes = kzalloc_objs(*nodes, num_nodes, GFP_KERNEL);
+	if (!nodes)
+		return -ENOMEM;
+
+	for (i = 0; i < num_nodes; i++) {
+		nodes[i].free = true;
+		list_add_tail(&nodes[i].link, &new_list);
+	}
+
+	/* The first node is for the live sysfs_buf */
+	for (i = 1; i < num_nodes; i++) {
+		/* Allocate the buffer with the lock released */
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			ret = PTR_ERR(sysfs_buf);
+			goto err_free;
+		}
+
+		nodes[i].sysfs_buf = sysfs_buf;
+		/* The buffer mode may have been changed to the reserved mode */
+		if (sysfs_buf->mode == ETR_MODE_RESRV) {
+			ret = -EINVAL;
+			goto err_free;
+		}
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	/* The sink may have been disabled or its buffer replaced meanwhile */
+	ret = tmc_etr_check_live_buf(drvdata);
+	if (!ret && drvdata->sysfs_buf->size != size)
+		ret = -EINVAL;
+	if (ret)
+		goto err_unlock;
+
+	nodes[0].sysfs_buf = drvdata->sysfs_buf;
+	nodes[0].free = false;
+	list_splice_tail_init(&new_list, &drvdata->etr_buf_list);
+	drvdata->etr_buf_nodes = nodes;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return 0;
+
+err_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+err_free:
+	tmc_etr_free_buf_nodes(&new_list, nodes);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
@@ -1928,7 +2120,8 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
+	/* The sysfs_buf is owned by the etr_buf_list */
+	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..ff2dbd85415e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,20 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * struct etr_buf_node - node of the etr_buf_list
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +259,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @etr_buf_nodes: Array of the nodes of @etr_buf_list, allocated at once.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +291,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node	*etr_buf_nodes;
 };
 
 struct etr_buf_operations {
@@ -447,5 +465,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1

