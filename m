Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081662;
	b=SajnlechDwmkFMnA8BWa6fUhILeXHIwJy4hsb+aipuMJDvjOLjSs4AAXdteFDyy/psJv
	 90OtLDFKpG1o0p4IPyExBBvXL/TGxrq24hsieySRoUPFJcKXHW0WjgQbjVmffmkcdvLyQ
	 zmZCkV/C69M0Uhp9uOTLtOeqd3Rene+B317SS78D2JqnM2HNpBiB/ClYf3MuC1SSEW30r
	 iJQFYx0lNg35Gr4P0scE2xstssHsOX+zgTv16BhYi64BzFKiH4SIPpsreTnCHpAJHnjhN
	 hD2naos6ycPKKszaQV49/OQsWUiUo7tyxuvN7fsmyK3B8Yb/QWYETbBTPYVWvrC7Wnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fnzwcG7xJkc/sAp2/tfrEnXsUc2BNjd9dZ0Wp7EUvIE=;
	b=zht5hoq0CC5p/OqhjdYGyI0Tv3Np/y2JYJtmWwStXxWbDpTnpnZ/BZoEmKNefLi+Gbuu
	 UyBvFArYDpUE3x9U64/N61GSj74tBgGJgUOyjPZqgQALAyNRP9ePFtUObI6Gsahf+87kA
	 dfEs9e591bqYr4shvBruih2fuO9CoEf6PUXuKWqKoRvypQIKRiSJ+QQ+dJ7wRE8JtBpi2
	 cAfA4UdIW7vHeN9YTM8RMwWXKu8QGY/f5yXxOtOCRxkFXuvYYzRdHBCuYmms8WJLFZZsE
	 UPExnXMFyGxY6+78H4owArMBwIXioxz5J7UMyNcjAmSc2m2ddhJoH0E5aQOqOYQyPXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fGJgZ/n3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWzrH+bL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30BB60A2612
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30BB60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGJgZ/n3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWzrH+bL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vFOo1681193
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fnzwcG7xJkc
	/sAp2/tfrEnXsUc2BNjd9dZ0Wp7EUvIE=; b=fGJgZ/n3VkXQV3sT2qZHx4h7jpN
	hs9YRdijIUjcUP1Qr0NhBDgZLOb0jG881HblMvh7ILdTEjTnbHtbbnNH5VxeCox8
	bp5b6pWHsri2DBoqYEvkB/JwqWO4P0PqtNFpkJMgGoK+sloKNiaSbSVXzyI8ydOW
	vQ+ba/+9bq0PoRif3xpS/4QHGQHJbYai/7tVU6nRnt1vpuQqerQ/WRz+pbhkyq7y
	TBukzKtTLSHAoI928G4W0A/Xg85JlvYwKL3/NxH+YZ+FuHCLCsaJ7pWUJmHq8bI/
	o8HYIoUrusZzigbDHy0x1w/TiePw/spl87HY+HGzkGV7q42NmdpT/hquQOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdct5jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso302373285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081660; x=1795686460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnzwcG7xJkc/sAp2/tfrEnXsUc2BNjd9dZ0Wp7EUvIE=;
        b=YWzrH+bLctG5Bhmbk2mz8dX1Mm4k4QC8zZuUfCBG/T4zusDua8fYX48P5WSpTurufS
         r+M95sSgyiXt/64gGVDNy+6/rVlvZA24UEK2QwYtNlEQufAKnafJjoVVqiFnW6Q2/Uzy
         XE74bSVENbtSHEQlEW6xpEXG/+g2YOAMpseXBZ3C7WtxU59cIRRCOdsNARZ/2FXfbXQ5
         tc0aUvblqclU46PUZw0/5NkV3ifU6b8o9L2W+oWQp+s4znG2HvbddoQuPzbSP0LUVO5a
         nvFew6CcA7PQ07kSqyVLM5IEbUGar7O2qakYUsTZAE/enKmjNJ10cfJyQnD8zQsVxcAm
         /AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081660; x=1795686460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnzwcG7xJkc/sAp2/tfrEnXsUc2BNjd9dZ0Wp7EUvIE=;
        b=SH6chkmGbhgEXtBIMfT75UUfZpeF6cMfCM7tSIU7lXzqouIdH4yI53bMSUDsoESW/q
         DwK28rXRhzpNdpitwJcNRP6H/4v00VholH85pY3hBs7DE/AC/KQUr3++2+PhazQqAgwK
         ceTAK8j9jA4V1jFvHQgROXn3s/PCp+F4fwobNEmbWUf/4jFpLOjIplX6v/8JeM4zKPRB
         Z+lSANZRZ+9sDI4Q91PfX/8b/ysl79YNuDsxzzexQKRSMbGM0p6OhGHN2NFnmWjQMDgA
         9BWvOBf68vvP0rNf4/3LWM+d1qIZKMfOjLC8v9mTgjEty4shx3rOqtqfssgv2CMiZmO1
         1yNw==
X-Forwarded-Encrypted: i=1; AL+hErGCQrFbHlmBedrep1N9pDtDtr/R+QpFwsgmXCH+VaX7ZWyuZkZXQwpmtXntiBdXoZ2iTJT9Guff3kEUd24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mKAGYsu0x0LLgHIz8N7YdI2AKgVP6TLmqTCneG93Ahpy/Y793
	4wwwI3bBZjXd3l/vseCfZRYEvxCMoVjzh53fc9yggDbj810jAUy9rMwrQGXiZJTTu9spCtaGq40
	AxBNBs7pYfZC8DfLg1/SPkSSocpYZ3XmG1+HmH0kAmefjKLz2r1YjdJhbJc655EADpw8=
X-Gm-Gg: AYBFou3bw1NjRQbwsyJvrxxmzB2KweKug8YyD/plw622DTivfSXyEAnuifMB+BD+SQj
	HjiGGGIC41m6iMhW7bP5i/FTnH1HxT7KONVEG0n8HYbEtKrnOFIrmDvh5VS84B7Nvzt5q3GjGTw
	N2HsqdBW2srNWzt1v1VLKCBiaFb30q7GkHvzVGJMvBHpIiCeva0xzWvZ519xjhFG8MPBabwAI1K
	PMmgKkQOIbaFs6KCnd/deAFtbmbr9MujVRo54OcrM91vNrEyFO8VRsYmdRPFQwF1nuoeu0gtlgt
	2+ZemM/cBA6x0joNf6/ARSqwWhHTcR5rTF6OoHZKDeoJoZsZeo5FsX3Ak7TG9nUwmE5LfKsLUD2
	Nnn75XT00/VeSH5t1PTz43LeoYpph1SFThqz99L9eQejf8LbnXDRL5SfLz2jgOtvAR7DiMv0lI5
	ub
X-Received: by 2002:a05:620a:1d0b:b0:949:6e15:e1d7 with SMTP id af79cd13be357-9499957e788mr874228785a.25.1795081659712;
        Thu, 19 Nov 2026 01:47:39 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:949:6e15:e1d7 with SMTP id af79cd13be357-9499957e788mr874226885a.25.1795081658996;
        Thu, 19 Nov 2026 01:47:38 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:38 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 04/12] thermal: core: Initialize thermal zone aggregation coefficients
Date: Thu, 19 Nov 2026 10:46:46 +0100
Message-ID: <20261119094706.3439040-5-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Q25_tDjBbZ5CXaEXsyeXoRNwWjH3o6_g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX6txMT3RjCHJ4
 HdkJtrMiht8oJt5CFtib4TdXJdjKd+OdHQRv0CO5WDEK4FhXhZvBYMS1Piqb+UqyyaDDnxQe+Zu
 giMR7AHGYhtvvmibsqnnyXOXM4VCNnw=
X-Proofpoint-GUID: Q25_tDjBbZ5CXaEXsyeXoRNwWjH3o6_g
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afec5bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=xDQTT8aqjRtnOBEH3IgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX2sRHwEpCs6Ga
 EHabJ5eUz1D+sRCVCycCqGV9DwUp15BL6fw/m2XXLjkbJDYquVX1jlEmST6t4EIzlo9YXHAC2sN
 YHx7VCM+CY0J8MATshBA2OBeaOupbuLGPkUOoTyldBTO8HL4P2YUwsbVMD42CQ0U3WbQIdmE8ky
 Jz8DpbTlzdko6AsvWMKxSVFvlpylmxcmWhemYLer//gNADKNilCRPb+ckQyI56AunnQDX93ye59
 j8Cchl1CfJcpncUDbXsMlmBG5FQtyIFJm1ugaoiPdZR42qDl7aaDFYkKEKcf77E92xmkqkjot3U
 pTPtaq68YCKClsFMBn2JhjjA0BfcSRJQIUTfw0JpAHuDNY8cHHCuaIwN4r9+1p+q9b7LrndYXFt
 5PiWJODUreJE8iWeNGjGnYNgBMZE+svxGA1BcdAUzqwzl7PYqMlozrgPvX/kI+yr3M6u3P3+5my
 HYdM3p2nqWARG7WDJtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Use PERMILLE from linux/units.h for coefficients in thousandths and
add a helper in thermal_aggregation.c to initialize them directly in the
aggregation entries before publication.

Treat zero as an unspecified coefficient before initialization. Preserve
supplied coefficient sets without normalization. Require validation of
the description before initialization; partial specification is rejected
by thermal_zone_aggregate_validate().
When all coefficients are uninitialized, distribute a total of 1000 as
evenly as possible, assigning the remainder in source order to approximate
the arithmetic mean.

Reject default generation for more sources than the coefficient scale
because it would produce zero coefficients. Leave source pointers and
the offset in thermal_zone_params unchanged.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_aggregation.c | 80 +++++++++++++++++++++++++++
 drivers/thermal/thermal_core.h        |  5 +-
 2 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_aggregation.c b/drivers/thermal/thermal_aggregation.c
index f85f5a487d60..8b503fab25bc 100644
--- a/drivers/thermal/thermal_aggregation.c
+++ b/drivers/thermal/thermal_aggregation.c
@@ -1,9 +1,89 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/errno.h>
+#include <linux/units.h>
 
 #include "thermal_core.h"
 
+/**
+ * thermal_zone_aggregate_init_coefficients() - initialize aggregation multipliers
+ * @aggregate: aggregation description to initialize before publication
+ *
+ * The description must be validated before calling this helper. Before
+ * initialization, zero denotes an unspecified coefficient. If all are zero,
+ * generate approximately equal contributions summing to
+ * PERMILLE, distributing the remainder in source order.
+ * If all coefficients are nonzero, leave them unchanged without normalization.
+ * Partial specification is rejected by thermal_zone_aggregate_validate().
+ *
+ * The zone parameters' offset and source pointers are not modified.
+ *
+ * Return: 0 on success or -EINVAL for invalid arguments. Entries are unchanged
+ * on failure.
+ */
+static int __maybe_unused
+thermal_zone_aggregate_init_coefficients(struct thermal_zone_aggregate *aggregate)
+{
+	unsigned int initialized = 0;
+	unsigned int base, remainder, i;
+
+	if (!aggregate || !aggregate->entries || !aggregate->num_entries)
+		return -EINVAL;
+
+	for (i = 0; i < aggregate->num_entries; i++)
+		initialized += aggregate->entries[i].coefficient != 0;
+
+	/*
+	 * Validation has rejected partial specification. If coefficients are
+	 * supplied, preserve the explicit affine combination without normalization.
+	 */
+	if (initialized)
+		return 0;
+
+	/*
+	 * Current systems are far from aggregating 1000 sources, but enforce
+	 * this limit for unlikely yet possible configurations. More sources
+	 * than the scale would produce zero default coefficients, which denote
+	 * uninitialized entries.
+	 */
+	if (aggregate->num_entries > PERMILLE)
+		return -EINVAL;
+
+	/*
+	 * With no coefficients supplied, approximate the arithmetic mean of
+	 * the source temperatures:
+	 *
+	 *     T = sum(coefficient[i] * temperature[i]) / 1000 + offset
+	 *
+	 * Each source should contribute equally, so its ideal coefficient is
+	 * PERMILLE / num_entries. Integer division rounds this
+	 * down, leaving a remainder that must be distributed to keep the total
+	 * coefficient sum exactly equal to PERMILLE.
+	 *
+	 * Assign one additional unit to each of the first 'remainder' sources.
+	 * This makes the distribution deterministic in source order, with any
+	 * two coefficients differing by at most one. For example:
+	 *
+	 *     2 sources: 500, 500
+	 *     3 sources: 334, 333, 333
+	 *     6 sources: 167, 167, 167, 167, 166, 166
+	 *
+	 * Equal source temperatures therefore retain unity gain. For unequal
+	 * temperatures, the result approximates their arithmetic mean with a
+	 * small bias from coefficient rounding. The signed offset in the zone
+	 * parameters remains independent and is applied after division.
+	 *
+	 * These defaults apply only when every coefficient is uninitialized;
+	 * explicitly supplied coefficients are never normalized.
+	 */
+	base = PERMILLE / aggregate->num_entries;
+	remainder = PERMILLE % aggregate->num_entries;
+	for (i = 0; i < aggregate->num_entries; i++)
+		aggregate->entries[i].coefficient = base + (i < remainder);
+
+	return 0;
+}
+
 /**
  * thermal_zone_aggregate_validate() - check an aggregation before initialization
  * @aggregate: aggregation description to validate before coefficient initialization
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index a5fdf5c24b6c..365704584966 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -66,7 +66,7 @@ struct thermal_governor {
 /**
  * struct thermal_zone_aggregate_entry - source zone and its coefficient
  * @tz: source thermal zone
- * @coefficient: signed multiplier for the source zone temperature
+ * @coefficient: signed multiplier in thousandths, zero when uninitialized
  */
 struct thermal_zone_aggregate_entry {
 	struct thermal_zone_device *tz;
@@ -79,7 +79,8 @@ struct thermal_zone_aggregate_entry {
  * @num_entries: number of entries in the array
  *
  * Represents the sum of each source zone temperature multiplied by its
- * coefficient. The constant offset is stored in struct thermal_zone_params.
+ * coefficient in thousandths, divided by 1000. The constant offset is
+ * stored in struct thermal_zone_params.
  */
 struct thermal_zone_aggregate {
 	struct thermal_zone_aggregate_entry *entries;
-- 
2.43.0

