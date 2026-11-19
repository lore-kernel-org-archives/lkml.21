Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081670;
	b=Q2Q1wPavN3cXIczMAHOdvIX12fNWmTt0kzdQzEo1ZK0drVs5A/fCrZOOnB5bQIDUsYiX
	 2OyKVeJXCaUPUGoLYGDCrY+sxdsJfFAAeY5N8R9XGvDIdKx7eLvPb+tzET8+TogowVNzR
	 mds+dAwd0viFhhCh91KgFlhUC9FPQXZYDvfjbuBU5cLkY/qEwuTv9CJkg90fWjGz/Khn5
	 Zb7cvLEFbaVc5dIcoCpE2COg7V30ogjuj4OZfRnVs6mRaJdNBY3tlKnC+KR7o1Z3I+ymw
	 pi9t9rhcyXakKXWdEJ+0HxUFmCH53jGcy4twXc6R/02zlX1LsD075L3nA4SApHhGnxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I+K/G9rf1j6ujCjlzjLkHsDb7XAOz1QQWRc2U3cC5xc=;
	b=CKHFkpK70AHjYUoT6UN/plkXi2UigcxHPqlSgN4t4vKsL/YV7dgfiEqRGc9nbmEQADVl
	 hlAPV+ia9kAICPxZfbixJwpIPlJWi6XVImzYPzEK2IhCe2darNC9F/SzQPAprDBazujLs
	 Hfd3LqN2oQsw3vU9E0d7cdjzIfTwGYJEacV0JAE6IX7bzQ0ssZLdHxH0OUxFc1qvYa6cp
	 Pen9f7vSrL+m/uR1B5thjJXJlhVNgHy06maQz17zIy3W+9nNQpqKR4EuE+LX8eaeTvr6O
	 FoSmmYH+ZaKptdS+syfxdNQQZoYGR+IWYev98gS5IukrhgzXEQgdoZvLu8EirWK2XpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBSjH5rb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D4pNsd/2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C25460A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C25460A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBSjH5rb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4pNsd/2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vY0S330758
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I+K/G9rf1j6
	ujCjlzjLkHsDb7XAOz1QQWRc2U3cC5xc=; b=NBSjH5rbFq70DxYPxBOboHkZdbA
	ySDKXOywUmpOQ2MIa0yr2eRTw+319j9nNmaxXdcD1WrPZ8f8DxGPW6ihX4rNvfN6
	18p8JoFe7SaysyZwLbw5Bl4pz2j8UxuAcCVkcETuQPWMGkvlYP4TIJPGc3+2AmzC
	jzxHpX9qQJoxwImXoRQYjJab319jQEBpiiHpa4/nnN0h1kZeZr0bkfj152t1vK2g
	xvGayLU/rxRaGI5PumnT2M5uY3P2XI95HEF7T1e6EaXPIvXDm7HkVbvikKwan+df
	t81ahxasfR2bQLhoS+50W0X0QxtXunOHztW16hPlCopsUykOzCxyH3XGsKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkvgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so369835885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081668; x=1795686468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+K/G9rf1j6ujCjlzjLkHsDb7XAOz1QQWRc2U3cC5xc=;
        b=D4pNsd/2+m1yzMTyRxuiD/ouYjE2drHR/dAIdN14yZw1AMxnhXp/Bfcv5o3W1O/zG7
         zShNKTpYAEr5XeerScKy6oXHfKM1sw0yN76QuXc8LbrX1zAT6XaCJ2+h6cFNQFvF0ycS
         44CanBJpwJC4gtJqYm42xn7D4rEWFNNYim/rCSkOnq/bhNCI+B+fc3TD49DNvt1UUrsI
         VWSp7iijuUD2hpyz06YN2wcRYJ0W4ORWtHTEubiyc/nQCSJK2XQoW66ZyYKx6LzGVvMn
         WEKSUI1ZA69p/YKjPBca6V/UBM4G4eXFh4MpODErFVnyDIhbVWHxIoBLgwJ6sMpsVweL
         j/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081668; x=1795686468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+K/G9rf1j6ujCjlzjLkHsDb7XAOz1QQWRc2U3cC5xc=;
        b=et99MHWE2nc/6mpdwwV2bQxhCybUdsJyLOOf8NmNRgZZIVKVFZQMnzkGH3K7QXXj43
         xOngYkzdPGFan0lV/t0KJnsxc1E7sTODKJQR3a95FDwF9WpO2zYjuXxh+wOlwoknx68u
         Zwb1g/aTdi/1VLYglShsM5Vn2o7JOLN0vqqf1mv/JHiedE0raOj1u881S+y2ZGKJmrdj
         0WWr1sp8wLAo8ZDvYuolgkQ3IMvc0eIIQS0Le6+RY3h96RNO3KioswbZSYIFD4liq3BO
         sRpXnXGGFvCZBOIVuFdiKIL1cMDyw1H0IOYB0XrwQaMUGRYBo8f23JvocCfLtfbw4bqw
         2fiw==
X-Forwarded-Encrypted: i=1; AL+hErF55gpznihavQL/q4Vi0qNiPlrtVYpaQjXpzLLRXT5PqkSqX/SPeC7IOF1DzlxTClERZdcfsQOrGXNLGxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sJejUPTsb3Tmug9Me4m4VQlgV4b5TIFrmewsnYCV5uWKpeE4l
	I8vqLHC7woTmnMG3zzbpSWr3K68cxM/TvQFI7gTyv92mixD0Q9E5BHAFcb5mcaa4N+xY79L52V2
	CakoHA5GTeVNeEoqHdHJWy/oWo0TiYWbipy2z1BozNg97pQC+NpiFXyQz9OZDSZHev8A=
X-Gm-Gg: AYBFou2cTnhlwrANMc1w5DrTCS80KmIcy2oHXcjtmN7ft0AtBBGQEcgSFGV2Sv17k55
	NvZSj+J4MLpbFPqtX+gK+N4o/KSpC3K7VeGFgRnEHn1yOI/ei9zd+eii88BYJCOJJlLUiqh5DEp
	nYnh79gNCOU+wDNZbU6uJzKKmEXZsr3hu5CbnPanVKuKWLXWeIjEBBI71BoGrVmLWbNBRm+ebE5
	pzrkZG7dygSDxmuDL+sKZVvj8uWQxd2XRVo6hNSodnKypdTzVD5bD15J1tqWSBPQvE2uTbB3dH2
	tSBcfiLIs7sFehTdt09/0WJOu2eVwOu+IXMgZeOrehnBhvnUrDEybCo7N88sRBkGScK7SC9DVbb
	kV5EOBvexJihO3M3OHNHiX7tJexN/vIeAx7w7SGNcGbLXy4YT3f9FBBUHDaB1JgeryRpwwYYMcG
	qe
X-Received: by 2002:a05:620a:2615:b0:93f:3863:268a with SMTP id af79cd13be357-9499972b105mr914523485a.37.1795081667981;
        Thu, 19 Nov 2026 01:47:47 -0800 (PST)
X-Received: by 2002:a05:620a:2615:b0:93f:3863:268a with SMTP id af79cd13be357-9499972b105mr914521685a.37.1795081667496;
        Thu, 19 Nov 2026 01:47:47 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:46 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 10/12] thermal: of: Instantiate aggregates after their source zones
Date: Thu, 19 Nov 2026 10:46:52 +0100
Message-ID: <20261119094706.3439040-11-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: jYE9IQd95RBvLWNwHAbBMZLiKfEmGc-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX0SgmECZMb7pX
 AQR3+FFRH5/UL6qMZ2MRlmWTrUER3jpeGZPr9vHux0cW+MebhAH1vAoz+Srff6YwK96nso8aWR3
 duUXhBaF73xR0Eftx21H9cHPgaNK17B9i7ynZuIw9EJ3JmhfUrL20wT5z22MkXtBeRa6JV/7N8E
 3oKuNxAKw7K1dG0qEbxbfDw8pyxEN5OL3QDWA0CMWIwEK8ZORyQbeWg0HpF2N8ugPAkZS2TWVOC
 HBfwd5pf8vi9izoSkzURCnYYUvEOy7wIKOME8aGW83RncnXd3Wfshaxw80koIWn2gLZ90iPHIpB
 eZX0fIdD0q4ReS9FE2wYGcDM7Pwv5bB6EpKvq0bNzVA1UCFB8kOW1eUvHJcLVFPEt4/KOIaPg1R
 hzEZDvQxlovTEtZJIpLQzEbMNsHY+g0Cm8nX/CpvSYr+yN8LClKacib0qcaEhpVBzfc6x+T3thM
 /WbxLd220SfFhkrdEdw==
X-Proofpoint-ORIG-GUID: jYE9IQd95RBvLWNwHAbBMZLiKfEmGc-T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX/t5pb6dLhRrD
 35Gau8hA8cWQk5RlJLulFiUBP0AMgAY2ZvmMu/sYvnCmQrMr6tgQvS1PIbF5svCUnG9k//2/sqf
 MYm7zd0iSMXW9QFgMiZ49Gxb61tDk+M=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afec5c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Z7QjB-FQypT2Tdk3yCwA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190038

Discover multi-source thermal zones at late init and resolve their
hardware provider and sensor ID references to registered source zones.
Retry pending descriptions synchronously after successful source
publication, without workqueues or changes to sensor driver APIs.

Serialize creation and removal with the OF lifecycle mutex. Acquire
source references while filling aggregation entries, unregister dependent
aggregates before source teardown, and release references and allocations
on failure or removal. Keep descriptions pending for source module reload.

Use the shared node parser with core aggregation operations. Preserve
legacy single-source slope and offset calibration. Missing multi-source
coefficients request averaging defaults; explicit integer multipliers are
converted to thousandths with overflow checks and the offset is unscaled.
Reject partial arrays and explicit zero multipliers, which cannot encode
presence under the current aggregation initialization contract.

Skip multi-source nodes during ordinary hardware zone lookup so they
cannot be bound directly to an individual sensor callback.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 217 ++++++++++++++++++++++++++++++++++-
 1 file changed, 216 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 1fa7e29f5bc8..64ae7769edcb 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -10,8 +10,11 @@
 
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/overflow.h>
+#include <linux/units.h>
 #include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/string.h>
@@ -31,6 +34,14 @@ struct thermal_of_source {
 	struct thermal_zone_device *tz;
 };
 
+struct thermal_of_aggregate {
+	struct list_head node;
+	struct device_node *np;
+	struct thermal_zone_aggregate aggregate;
+	struct thermal_zone_device *tz;
+	bool failed;
+};
+
 /*
  * OF lifecycle operations are serialized outside thermal zone locks. Thermal
  * callbacks must not acquire this mutex. Source removal holds it until all OF
@@ -38,6 +49,11 @@ struct thermal_of_source {
  */
 static DEFINE_MUTEX(thermal_of_lock);
 static LIST_HEAD(thermal_of_sources);
+static LIST_HEAD(thermal_of_aggregates);
+static bool thermal_of_aggregates_ready;
+
+static void thermal_of_aggregate_retry(void);
+static void thermal_of_aggregate_release(struct thermal_of_aggregate *aggregate);
 
 static int thermal_of_source_add(struct device_node *provider, int id,
 				 struct thermal_zone_device *tz)
@@ -59,18 +75,29 @@ static int thermal_of_source_add(struct device_node *provider, int id,
 	source->id = id;
 	source->tz = tz;
 	list_add_tail(&source->node, &thermal_of_sources);
+	thermal_of_aggregate_retry();
 	return 0;
 }
 
 static void thermal_of_source_remove(struct thermal_zone_device *tz)
 {
 	struct thermal_of_source *source;
+	struct thermal_of_aggregate *aggregate;
+	unsigned int i;
 
 	guard(mutex)(&thermal_of_lock);
 	list_for_each_entry(source, &thermal_of_sources, node) {
 		if (source->tz != tz)
 			continue;
 		list_del(&source->node);
+		list_for_each_entry(aggregate, &thermal_of_aggregates, node) {
+			for (i = 0; i < aggregate->aggregate.num_entries; i++) {
+				if (aggregate->aggregate.entries[i].tz == tz) {
+					thermal_of_aggregate_release(aggregate);
+					break;
+				}
+			}
+		}
 		of_node_put(source->provider);
 		kfree(source);
 		break;
@@ -217,6 +244,9 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 			pr_err("%pOFP: missing thermal sensor\n", child);
 			return ERR_PTR(-EINVAL);
 		}
+		/* Multi-source nodes are instantiated by the OF aggregate manager. */
+		if (count > 1)
+			continue;
 
 		for (i = 0; i < count; i++) {
 
@@ -486,7 +516,8 @@ thermal_of_zone_register_node(struct device_node *np, void *data,
 	if (ret) {
 		pr_err("Failed to enable thermal zone '%s', id=%d: %d\n",
 		       tz->type, tz->id, ret);
-		thermal_of_zone_unregister(tz);
+		thermal_zone_device_disable(tz);
+		thermal_zone_device_unregister(tz);
 		return ERR_PTR(ret);
 	}
 
@@ -528,6 +559,190 @@ thermal_of_zone_register(struct device_node *sensor, int id, void *data,
 	return tz;
 }
 
+#ifdef CONFIG_THERMAL_AGGREGATION
+/* All aggregate construction and destruction runs under thermal_of_lock. */
+static void thermal_of_aggregate_release(struct thermal_of_aggregate *aggregate)
+{
+	unsigned int i;
+
+	lockdep_assert_held(&thermal_of_lock);
+	if (aggregate->tz) {
+		/* Do not recurse into OF source removal while holding the OF mutex. */
+		thermal_zone_device_disable(aggregate->tz);
+		thermal_zone_device_unregister(aggregate->tz);
+		aggregate->tz = NULL;
+	}
+	for (i = 0; i < aggregate->aggregate.num_entries; i++)
+		thermal_zone_device_put(aggregate->aggregate.entries[i].tz);
+	kfree(aggregate->aggregate.entries);
+	aggregate->aggregate.entries = NULL;
+	aggregate->aggregate.num_entries = 0;
+}
+
+static struct thermal_zone_device *
+thermal_of_source_get(const struct of_phandle_args *spec)
+{
+	struct thermal_of_source *source;
+	int id = spec->args_count ? spec->args[0] : 0;
+
+	lockdep_assert_held(&thermal_of_lock);
+	/* The existing OF source registration API identifies sensors by one ID. */
+	if (spec->args_count > 1)
+		return ERR_PTR(-EINVAL);
+
+	list_for_each_entry(source, &thermal_of_sources, node)
+		if (source->provider == spec->np && source->id == id)
+			return thermal_zone_device_get(source->tz);
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+
+static int thermal_of_aggregate_create(struct thermal_of_aggregate *aggregate)
+{
+	struct thermal_zone_device_ops ops = {};
+	struct thermal_zone_params tzp = { .no_hwmon = true };
+	struct device_node *np = aggregate->np;
+	struct thermal_zone_aggregate *desc = &aggregate->aggregate;
+	int count, ncoef, ret, i;
+
+	lockdep_assert_held(&thermal_of_lock);
+	count = of_count_phandle_with_args(np, "thermal-sensors", "#thermal-sensor-cells");
+	if (count < 2)
+		return -EINVAL;
+
+	desc->entries = kcalloc(count, sizeof(*desc->entries), GFP_KERNEL);
+	if (!desc->entries)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		struct of_phandle_args spec;
+		struct thermal_zone_device *source;
+
+		ret = of_parse_phandle_with_args(np, "thermal-sensors", "#thermal-sensor-cells",
+						 i, &spec);
+		if (ret)
+			goto release;
+		source = thermal_of_source_get(&spec);
+		of_node_put(spec.np);
+		if (IS_ERR(source)) {
+			ret = PTR_ERR(source);
+			goto release;
+		}
+		desc->entries[i].tz = source;
+		desc->num_entries++;
+	}
+
+	/*
+	 * Missing multipliers request the core's averaging defaults. Explicit DT
+	 * multipliers retain their unscaled integer meaning: convert to internal
+	 * thousandths, checking overflow, and leave the final offset unscaled.
+	 * Legacy single-source calibration never passes through this path.
+	 */
+	if (of_find_property(np, "coefficients", NULL)) {
+		ncoef = of_property_count_u32_elems(np, "coefficients");
+		if (ncoef != count && ncoef != count + 1) {
+			ret = -EINVAL;
+			goto release;
+		}
+		for (i = 0; i < count; i++) {
+			u32 raw;
+
+			ret = of_property_read_u32_index(np, "coefficients", i, &raw);
+			if (ret)
+				goto release;
+			if (check_mul_overflow((s32)raw, (s32)PERMILLE,
+					       &desc->entries[i].coefficient)) {
+				ret = -ERANGE;
+				goto release;
+			}
+			/* Zero cannot encode presence in the core initializer. */
+			if (!desc->entries[i].coefficient) {
+				ret = -EINVAL;
+				goto release;
+			}
+		}
+		if (ncoef == count + 1) {
+			u32 raw;
+
+			ret = of_property_read_u32_index(np, "coefficients", count, &raw);
+			if (ret)
+				goto release;
+			tzp.offset = (s32)raw;
+		}
+	}
+	of_property_read_u32(np, "sustainable-power", &tzp.sustainable_power);
+	tzp.aggregate = desc;
+	aggregate->tz = thermal_of_zone_register_node(np, NULL, &ops, &tzp);
+	if (IS_ERR(aggregate->tz)) {
+		ret = PTR_ERR(aggregate->tz);
+		aggregate->tz = NULL;
+		goto release;
+	}
+	return 0;
+
+release:
+	thermal_of_aggregate_release(aggregate);
+	return ret;
+}
+
+static void thermal_of_aggregate_retry(void)
+{
+	struct thermal_of_aggregate *aggregate;
+
+	lockdep_assert_held(&thermal_of_lock);
+	if (!thermal_of_aggregates_ready)
+		return;
+
+	list_for_each_entry(aggregate, &thermal_of_aggregates, node) {
+		int ret;
+
+		if (aggregate->tz || aggregate->failed)
+			continue;
+		ret = thermal_of_aggregate_create(aggregate);
+		if (ret && ret != -EPROBE_DEFER && ret != -ENOMEM) {
+			pr_err("%pOF: failed to create aggregate: %d\n", aggregate->np, ret);
+			aggregate->failed = true;
+		}
+	}
+}
+
+static int __init thermal_of_aggregate_init(void)
+{
+	struct device_node *np __free(device_node) = of_find_node_by_name(NULL, "thermal-zones");
+
+	if (!np)
+		return 0;
+
+	guard(mutex)(&thermal_of_lock);
+	for_each_available_child_of_node_scoped(np, child) {
+		struct thermal_of_aggregate *aggregate;
+		int count;
+
+		count = of_count_phandle_with_args(child, "thermal-sensors",
+						   "#thermal-sensor-cells");
+		if (count <= 1)
+			continue;
+		aggregate = kzalloc_obj(*aggregate);
+		if (!aggregate) {
+			struct thermal_of_aggregate *pos, *next;
+
+			list_for_each_entry_safe(pos, next, &thermal_of_aggregates, node) {
+				list_del(&pos->node);
+				of_node_put(pos->np);
+				kfree(pos);
+			}
+			return -ENOMEM;
+		}
+		aggregate->np = of_node_get(child);
+		list_add_tail(&aggregate->node, &thermal_of_aggregates);
+	}
+	thermal_of_aggregates_ready = true;
+	thermal_of_aggregate_retry();
+	return 0;
+}
+late_initcall(thermal_of_aggregate_init);
+#endif /* CONFIG_THERMAL_AGGREGATION */
+
 static void devm_thermal_of_zone_release(struct device *dev, void *res)
 {
 	thermal_of_zone_unregister(*(struct thermal_zone_device **)res);
-- 
2.43.0

