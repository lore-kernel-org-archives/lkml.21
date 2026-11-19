Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081666;
	b=IX3+WiUeo85zBxYfV3bu6r29nXG6/e4vW3OsV06njIcXilOFNNpSk+RsxChzu3KUybwY
	 JDcO1Yf04hB/ePrvWkIT5NBLB6fZ3krNgw4terG+c5gJ2E0c5vMV8c2WPr+lgJRmLvK9q
	 p++IbDg6kVX+zwFZJJSkFFnxaPfcoloEb81RPtcXVWVinQ06QImz8LFGal+hjq8/d0qVO
	 tPF8wlxkRbIMmoxbrNTNDIsOZTcRO0YP7I51Lzl01iylE2HoS0ir4kogujoayS/0QFfbP
	 UgkxBtAicQmuDsaanuCMHH9u5NKNbUtLPO1BHWY4J2UoDEFgj8Ak3r4AWrFgYM4Dehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AWH86mgIfYyUJ/LZppzqLw588sA+9HFRWLJBijQCuzA=;
	b=mCO/1aQohlmPq4DQLHJjsn0O/auoeyKiwmziOmMHdJZ3UrlXwUia7nCDzdcg/+r/Mmyn
	 6CxYaBgNTg4DiLBWg9HZZ6IQkHOyOEuBa8AQEIGq/BNAtHat3trxxMc1lm/lmtdQsVLd6
	 2DgNbsX97dwgmJ2HQyUIv84q0SxVMOLJ0ruW4dF1ABPOJw6HDoskAOwYgytuff8NyklOQ
	 2fIa5cBNuQILYkGP85EJpYDa+jzavQT/iSAAOVwnyRwJusvxR4ayltiXLdomhav7xs4JS
	 nRhwZIRGQnUKcBly6+B7HLk1yytNPWOnPqF8NfGLFYATkn3Ifb7FVAEYl6IYrRVMruQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LY1NbtNt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSipafgm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE67860A262A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE67860A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LY1NbtNt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSipafgm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ97GKD352984
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AWH86mgIfYy
	UJ/LZppzqLw588sA+9HFRWLJBijQCuzA=; b=LY1NbtNtIPED2x1S/38Q7+KGRvV
	n+yeu7o4fkcIol+gx5eLK/L4tiYuwAIz/IUna0YW+VncR3hzQNsmQ/4ySIKM0O3l
	lFYfOlWhwzyB9LHJCJlLkRhvFDo1A1dG3b3XQyzF1977nqGdDSo7GrPmh6tzIzkP
	SIUvRu/dccv6a392Y82Px2Pr5g3f0BJN9lWlzYg+NNueNYflrOALXcGIl2JNn1F1
	XULp3cNwUstmHW3UB5F2oD56eN4hxu18KS92b9HT5x58Z86YNpf6V4KlVKY2Xmlu
	kNm2BYMIF3q/rmREsULEKWJOc0V3JVjr51EF9tDIM9bvVYaQZd2tyMJJGKA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x7086ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210bbc04abso36394556d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081664; x=1795686464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWH86mgIfYyUJ/LZppzqLw588sA+9HFRWLJBijQCuzA=;
        b=iSipafgm3qwJEszsXbbA6kBXxfopItQm50zIgs6op2gsTUZmFHvhW+j1jSJ5XDZk7/
         lnNwI1Z27gVF7uZAdcT3uPfN3+V1V2Yam5yIVnzM7RpexNA5hy+gmU/njzFIOHOFjx8h
         7y2hrv6cZdkI2bWFbVi9FA0LaYEWcKJzSfvHswMo5yR7t0PuS71IWqAl018kBqs6rY+/
         3Sdo+kGblbXrQbi2aL/Sb1WDwznSiD7X8VXbdR9kSekncfEsLiJFRC3XxycVJKxwRFDo
         TgYVKr9m7Wy/OvGjVx4cl4M5l2a+7ZM0FGPBMsse48oKZZGD9gMHXj749gmh+BXkXBef
         xveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081664; x=1795686464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWH86mgIfYyUJ/LZppzqLw588sA+9HFRWLJBijQCuzA=;
        b=ZsvQzolK3K/5jXk/5niPAsBT8Le7QKQ309xNpS/zNf7wkOpqDpqjOQxJBDGillq3B/
         QESQgPmxXFKQeN3QWJqpIvsjOFuDTDYjq22h6QrTgSEC6w9KbWSlQl7A/tqxXBXvSdR8
         1cbpvehVUQSu4955bfQUrARVHzS6XFzX4+vh1LA+M9DyjQ7FaNGyxIFOC144lU3WYPLH
         obh+O+PFV+Dsxq5yhDDiyqQuMm4iIMDN0RWeISYvXhMenttDT9LAvubzV+kmV7q43EvP
         VZbjJaYEDNK3cPhxzvRZHP+BWutxLAvCKl/lzLDiZrih8w08Yjkf2LIe22kRjsYqXnCZ
         /crg==
X-Forwarded-Encrypted: i=1; AL+hErHV49NdA2voHqanE/8zCkFvsswEGrRphCUw+zqEFIKrcOGKstv50Q37uwLfHuODaL7zzXBlsGZ32mjU05U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NmIbZ6KFyaLowszOrFABNt35yV6HFdLiqeiQ4BX/fRP5VTy93
	hFVvgDwHLfBgCufh/7JRlrYidnqp1Qs2yeKLZCkNMO2g+IxQSIOXFhRkPuDhs60xOtTTGCKve/L
	demNTZPsM1mbd6UQZe+UoZ7L7QaPOPRtgTJb64uPCC5soehQRPSySW23+i6URaK0WUcg=
X-Gm-Gg: AYBFou0ezdrH+uTxsp6E9bJCVlOWw+eguvpvQjcpnDdxPwGvLTgLxAU7+S5+hU/Nzch
	K2E7McIyJohjJl/mBWireG8GM17wa2gOgqENgw9KOVJ8CbzAFs+3phIS1cT2BEfubRQIZN85Xqw
	laxEGqpNXipmG8BlitGptZHk7LJIfEQbOdS9N8FrBi0arEtQNpSE4AWco/GS43KmaNAINAmW7Of
	90KeoC1HaYmZ01Tsyli0eYIhi0ChLDqTvq3emcSM6/tnVO/sNYqt+xbtK3xaJnD7RghOblkzPog
	95Rbvo5OEfKklRXyJYo9sQJz1lmp2E0MFlU1Y1TrqJh74vZx+9N1lw4LjooyvW4JetnfICAmzcx
	xqgj+M/yZIgFYnsBDUfTd+KwodmdvUHkQ73arxmFfc7bFtxTj8fWAiQH6YvdYGnq5+EjaOhd4OA
	y6
X-Received: by 2002:a05:620a:4506:b0:939:fde0:a71b with SMTP id af79cd13be357-94999351ba0mr981375585a.0.1795081663876;
        Thu, 19 Nov 2026 01:47:43 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:939:fde0:a71b with SMTP id af79cd13be357-94999351ba0mr981372185a.0.1795081663227;
        Thu, 19 Nov 2026 01:47:43 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:42 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 07/12] thermal: core: Initialize aggregation during zone registration
Date: Thu, 19 Nov 2026 10:46:49 +0100
Message-ID: <20261119094706.3439040-8-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NePgT2pbS7Oj_B7Iur0fOxJwKBvELkW2
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6afec5c0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ifwe0BNvPRB3sLK44yEA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX/YXBfzAcSRoN
 7AvhdsEvy2sHokKaoL7NaHF/GJgo7OC3/WTOZdGwwoI83qzcpjO3e2AfOAxup9MJ2s3pFOiNjTJ
 udHzJdpPXtHaoXCkepJ54ymxbu8JAz8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX0eh0KjO11gZm
 Kvl7UM+Ylh1AoEaFXVP7Z+xXyarsuG/V0bhi3pClxXsp52uMWA+JDJxCitjXFW8KJMv7gKtx0rM
 TkTeyfWCqd2GmuVwo/7hj4Vg55h+UVy5b7qYgq0ucmYdFKji2I8H+mpx51Jwzw9UZEhSj4jqydp
 1s/mrjS5zPe/wMjDuAaVwSFiHVyBKzsVNUMBciRXRpXt15OMiKy0m63SIz4D3jcOJPzL6QIo1b9
 g6steW0gJhJyRvmu5ONZvVdKw1TiXsH/lp7MChq1kmglStJw08+8ob+yQQoOCfvWAwwk7AOJiYg
 yX248DTnYAqYiCHTSnuzyQpsae10nxV6GBNisknv7ajDX1cL6YMj8mqNL1oleNK8GAYwzuKKVRN
 973RkGMLLm1ihdcN27AW3L3HI3qACf1SwZ8vMp3+s39Gt7+fmyjK6R0fuDIcroBSlpNvStwi2Zc
 rTD0gbpxuOehQbwvipA==
X-Proofpoint-GUID: NePgT2pbS7Oj_B7Iur0fOxJwKBvELkW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190038

Recognize aggregation descriptions in thermal_zone_device_register_with_trips()
and call a private thermal_zone_aggregate_register() helper before
publishing the zone. Encapsulate validation followed by coefficient
initialization in thermal_aggregation.c and propagate failures to
the caller.

Allow aggregated zones to omit the driver get_temp callback in registration
and thermal_zone_get_temp(), since their temperature is calculated by the
thermal core. Preserve the callback requirement for non-aggregated zones.

Document that callers must keep the aggregation description and source
zones alive and stable throughout the registered zone lifetime. Hardware
set_trips operations remain rejected by aggregation validation.

Provide a private stub returning -EOPNOTSUPP when thermal aggregation
is disabled, preserving the ordinary thermal zone path.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_aggregation.c | 32 ++++++++++++++++++++++-----
 drivers/thermal/thermal_core.c        | 14 +++++++++++-
 drivers/thermal/thermal_core.h        | 11 +++++++++
 drivers/thermal/thermal_helpers.c     |  2 +-
 4 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal_aggregation.c b/drivers/thermal/thermal_aggregation.c
index 05668e53fed8..1a7e17757025 100644
--- a/drivers/thermal/thermal_aggregation.c
+++ b/drivers/thermal/thermal_aggregation.c
@@ -23,8 +23,7 @@
  * Return: 0 on success or -EINVAL for invalid arguments. Entries are unchanged
  * on failure.
  */
-static int __maybe_unused
-thermal_zone_aggregate_init_coefficients(struct thermal_zone_aggregate *aggregate)
+static int thermal_zone_aggregate_init_coefficients(struct thermal_zone_aggregate *aggregate)
 {
 	unsigned int initialized = 0;
 	unsigned int base, remainder, i;
@@ -110,9 +109,8 @@ thermal_zone_aggregate_init_coefficients(struct thermal_zone_aggregate *aggregat
  * specification, aggregated sources or destination set_trips,
  * or -ENODEV for missing or exiting sources.
  */
-static int __maybe_unused
-thermal_zone_aggregate_validate(struct thermal_zone_aggregate *aggregate,
-				const struct thermal_zone_device_ops *ops)
+static int thermal_zone_aggregate_validate(struct thermal_zone_aggregate *aggregate,
+					   const struct thermal_zone_device_ops *ops)
 {
 	unsigned int initialized = 0;
 	unsigned int i;
@@ -157,6 +155,30 @@ thermal_zone_aggregate_validate(struct thermal_zone_aggregate *aggregate,
 	return 0;
 }
 
+/**
+ * thermal_zone_aggregate_register() - prepare an aggregation for zone registration
+ * @aggregate: caller-owned aggregation description
+ * @ops: operations of the destination thermal zone
+ *
+ * Validate the description before initializing default coefficients. Call before
+ * publishing the destination zone, without holding thermal zone locks. The
+ * caller retains ownership of the description and source references and must
+ * keep them alive and stable until the destination zone is unregistered.
+ *
+ * Return: 0 on success or an error from validation or coefficient initialization.
+ */
+int thermal_zone_aggregate_register(struct thermal_zone_aggregate *aggregate,
+				    const struct thermal_zone_device_ops *ops)
+{
+	int ret;
+
+	ret = thermal_zone_aggregate_validate(aggregate, ops);
+	if (ret)
+		return ret;
+
+	return thermal_zone_aggregate_init_coefficients(aggregate);
+}
+
 /**
  * thermal_zone_get_temp_aggregate() - read an aggregated zone temperature
  * @tz: aggregate zone with a previously validated aggregation description
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 02c2c08077bf..cab2bc1d0ac3 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1431,6 +1431,12 @@ static void thermal_zone_device_release(struct device *dev)
  * thermal_zone_device_unregister() must be called when the device is no
  * longer needed. The passive cooling depends on the .get_trend() return value.
  *
+ * If @tzp contains an aggregation description, validate it and initialize its
+ * coefficients before publication. The caller must keep the description and
+ * referenced source zones alive and stable for the registered zone's lifetime.
+ * Aggregated zones do not require a get_temp callback and cannot use set_trips
+ * to program hardware temperature boundaries.
+ *
  * Return: a pointer to the created struct thermal_zone_device or an
  * in case of error, an ERR_PTR. Caller must check return value with
  * IS_ERR*() helpers.
@@ -1470,7 +1476,7 @@ thermal_zone_device_register_with_trips(const char *type,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (!ops || !ops->get_temp) {
+	if (!ops || (!ops->get_temp && !(tzp && tzp->aggregate))) {
 		pr_err("Thermal zone device ops not defined or invalid\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -1484,6 +1490,12 @@ thermal_zone_device_register_with_trips(const char *type,
 	if (thermal_class_unavailable)
 		return ERR_PTR(-ENODEV);
 
+	if (tzp && tzp->aggregate) {
+		result = thermal_zone_aggregate_register(tzp->aggregate, ops);
+		if (result)
+			return ERR_PTR(result);
+	}
+
 	tz = kzalloc_flex(*tz, trips, num_trips);
 	if (!tz)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 34903cfeec33..0c1cd3c16cb9 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -321,6 +321,17 @@ static inline int thermal_zone_get_temp_aggregate(struct thermal_zone_device *tz
 	return -EOPNOTSUPP;
 }
 #endif
+#ifdef CONFIG_THERMAL_AGGREGATION
+int thermal_zone_aggregate_register(struct thermal_zone_aggregate *aggregate,
+				    const struct thermal_zone_device_ops *ops);
+#else
+static inline int
+thermal_zone_aggregate_register(struct thermal_zone_aggregate *aggregate,
+				const struct thermal_zone_device_ops *ops)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 void thermal_zone_set_trip_hyst(struct thermal_zone_device *tz,
 				struct thermal_trip *trip, int hyst);
 
diff --git a/drivers/thermal/thermal_helpers.c b/drivers/thermal/thermal_helpers.c
index cf84d4c1ef65..bf5ff50ecfde 100644
--- a/drivers/thermal/thermal_helpers.c
+++ b/drivers/thermal/thermal_helpers.c
@@ -136,7 +136,7 @@ int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	guard(thermal_zone)(tz);
 
-	if (!tz->ops.get_temp)
+	if (!tz->ops.get_temp && !(tz->tzp && tz->tzp->aggregate))
 		return -EINVAL;
 
 	ret = __thermal_zone_get_temp(tz, temp);
-- 
2.43.0

