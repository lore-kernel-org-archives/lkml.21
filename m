Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081665;
	b=Sb+UnWJFZJ7Vx2eQIRVRl78o4bHRyhsHhflszXGty+uOl+R0Wpm9ZWrq+S6C8ZqpG0c6
	 FR1NYWc8M/ICAJB0shDOU1Y1xtpOqrZW28HBEb/asn+xLoXC82zpe2q8qf+w+ffN3sWyw
	 LTImhY/hDdUhB52qswPjfI17ukRN04llXq8VRmThCNlw4LtNRwrFxSTbD2EpKJETnZabX
	 bB8h7xBGYNc307q2g1f/dQZYCgRyAkG1tPCzo12Pn49IUjBf+ebIelj+Jq2CYoIYGz69D
	 z77OUUm9505KxJxuMFhKWFeHa44Wak9hdFNH5Z5cSTblHISJLhQ6dzgbSjbfsLOb6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cT2liv4kTmglSbixSH4Uoj37vZy3d2fO7AfDgWz/bo4=;
	b=gchr47icr1mCShNdMc6d4YBYfHuoUxz0XeV0qHmv/udq8BYIZtWrzO5C12nnpLExZmKV
	 8Pxc7Oa+OxU1EUz8OVooqCLjAhnORw63Z+LAL5caVo9mpSlGgH40Q0mVQCcgrshRpWmob
	 Elqs7+/bQf9WixdcUGF27eD6ZUsirWpd3jY1EFIb9lFuqhwZFT0yCrThlIZki0As6PySi
	 yqsEz4YJvWXbVm6N/QYfG60jkwgoUc5XEqiH29K9DlFOYVLsjsIs5jy6K40Tj0UT5uhWi
	 7OvudIH+WKVr/TX4MQDazIWvx60i9QXFOmgq+iap58Cz4UBY9I9wbpjiKRKokb6VEHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dm8rttFZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKzFxJlC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3345F60A2620
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3345F60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dm8rttFZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKzFxJlC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vGN62935595
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cT2liv4kTmg
	lSbixSH4Uoj37vZy3d2fO7AfDgWz/bo4=; b=dm8rttFZGwPkGYTlAQnG8SHGbkf
	BtvrkOihZnRY2T20CIswHL5hc59y+aNpzLrb9r2n4Ts3x8DjdKzSzmSD5KXf/f+w
	l+d/OxUA0ALhYp192I+6CWiFvRI5zZzGSQ9aQJwSsXP1HPZaylx9Aw5E02u45Oos
	NGCOKjR0pFHTF8+qYEzh4yIW3KQmotdyuK0SPSp3Jah0a5Ow0qXQeli4Huoe7vXp
	5J3qIe6BrNtEoVBa2KJ4aUslkfN9grGxCXDL/dxd2qxezcFStC5ePMznEv3I3WDq
	UmTO8VuORDTk9z+P8quov60ZKgjPFuNjhTgzqn7Bta6aQmZ7k0qTwCBkqcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekrqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so344815885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081662; x=1795686462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cT2liv4kTmglSbixSH4Uoj37vZy3d2fO7AfDgWz/bo4=;
        b=FKzFxJlCVHpf2MiXCqMr4dNeY08Zsstd8Sj6auVL0Q8Q0e8r5qgLtMZWaqHssAe+1d
         +M4/KiK01Ko9iFPMA4ZxkC1/65nwOxxfoT6meOSWclIjzRzUzJ7NNdJ9lFyXMN7gm76Z
         FziF/lQ16RSfHiu1nuzS/lAI3mm6K56WvP6QEBGg6PAXXX9M9f7zJjAEYZNvXD6vJZau
         pc+cJ+7bDYu1LUJMSGgQdA2+Np4Ck3BSjKNXHqarsS0TzfdTMepssBlTQ3QeeBqeA+QJ
         LaucUNJs0FiGlA4APe6xeRFQqf035ALtb1XiZn08r4IQKcDnKqhhrGF59cH+7r/Jbzxx
         XF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081662; x=1795686462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cT2liv4kTmglSbixSH4Uoj37vZy3d2fO7AfDgWz/bo4=;
        b=wSEdkx9P5ebx6Gh45ZYzsvHEyzXIWvzq2Uj4Bjudk9GBsElOXERYrlU/GUWAOMToZe
         MiqWDtq4qcKMMVmTmw8X8LPwB1F/sJBN2I25Q3QdPrHVL+yRjs/wS8ejwTnheDE/45h1
         o7D/YicRfL8PR4ct4A/XCPsZXzbhu4XdnE1Br5PjszXg5mn7RNu1faQj9J/iPQPODlK3
         riJVByj0nJLR/6Pd999UuZ1r3PxbFFq4LJyDwRydolYwsCOb3r7sFkhDJTY4AszMEpgG
         vt2Nga//I01H6hJ5PHmsbKjtVJEUYMrlv2LumqsvM4wV6vIDuM9L50bokHaGHjJyX6IW
         sOBw==
X-Forwarded-Encrypted: i=1; AL+hErExhhS/Q3dxgMGAr30/9lF6TqPi5nuhRRDfLvHgd+n2L0QmzP3hfdHZtVp4mVoWQI1CjMkB6C7Usy+cLto=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WLcPn8LsxcnUXFSHhR/c/Ze4OpHLHf3+WxeyUkK6kLX02feOa
	FkenNHrwzN8w4Mah1Qd2OeelBtYOwOX6B0nM9GrUyjTplH62u8U8Ks6Y7dhEXprrlAwRG1+D7UJ
	M8dchz6S7iA7APUbzFaI+gyWBJG8cz4xk7e8pdKe/rcbsGgf4h5n2Q3OAMDHbchhqEUg=
X-Gm-Gg: AYBFou2jGm6evMoLvm3/AKsgV3XKLaS9AspZQw41rzlCoMOf7ZdJP3t74s0oD8/IpVY
	pRMOxbfmb3FyvCcdBQgdZDMQb/q3g3JvQWVn660AwxZEcAH6iPqYbJavRlnRmcf+72BO5hj+IrH
	XYkww5d7AQnQOP6mV61Bt6+9lTem8MC+oPmyB2csbBcfYbMgBrJFlcTL9ofdQ0D1n5CZmhlD1kp
	8IyEFZoUlFIdEfpZPALoNMxh1DsMyjK4DDh8TntTCOHe0A3l0GKk1hXV2HmZoBbdQoeEA+bZVWV
	EZHsyv2h0mN36+xZfdpFhyuvYRFC7cwcV9pX0KpH7tYc52s3hEO/qF5oj4+OLj2V/Vy8GtQWSZj
	1KrXpaPDVOrKI3I3EJ32yWLF4SAWe9iBHaa6/ZTZuZFsqi7xnUXPXcGS1UlUgyugvr4wmifTxNB
	R3
X-Received: by 2002:a05:620a:801a:b0:93c:5f3c:f485 with SMTP id af79cd13be357-949995dbe4cmr1014350385a.53.1795081662341;
        Thu, 19 Nov 2026 01:47:42 -0800 (PST)
X-Received: by 2002:a05:620a:801a:b0:93c:5f3c:f485 with SMTP id af79cd13be357-949995dbe4cmr1014347685a.53.1795081661741;
        Thu, 19 Nov 2026 01:47:41 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:41 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 06/12] thermal: core: Calculate aggregated thermal zone temperatures
Date: Thu, 19 Nov 2026 10:46:48 +0100
Message-ID: <20261119094706.3439040-7-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX2rW9mMb3fteO
 Vqn6cm66LjWD2Y6+58Zl8ZPIysVWkMd4T4euc03qCTUQgPCA2PCtYsGBXmIUeUXw4brIw415UOv
 Is7VOyf7cEVule0XVqMqNnLJbOh4aDdYDZAowjexCR5xancBTEkpAeVcb/n4yhsosLFnpwY4giU
 kfsKqVPcEXE53BYcdv+O2e1dfcS2r9oZgfIB9rgcg2pwmS922w7gKQ3DOkATx2yChywLSQSN/CQ
 frXsubIzTDC90+/tGH1koPGKJ6uYVyC2r1J44x9HKdKFrUIJliKRbXuJJN0N0k4opLgyC+Y0Mvh
 K4++HPjF6ADo0Y8b47lpbXc/nDJv4UGQAFzVIKhigAg/eakTN+W7NuhIlIMVaDnBJhKZETUN8xH
 yCG4MuDmCwgXzLnt6C7F991iMc/r1fxZxDMI+ePsW278oFsEJz2L0GYHELTimY4EbOS0y0l22w1
 K51j8C0XzXOF+/zVw1Q==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afec5bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=NYCfaO3OmnaZ00BUEjkA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: egaYM2ORRFl6F1jj1g35RAICwf_Z3KN3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX3r4LoEVxyG5H
 FDPakSuFqylvpk6pHrhdq6nsm/TxtCNQ6wEtp+/V/FWAtZsAwrE2xvTuO796sKJby0fdlaljAuR
 lZSbpfBqfuxJsNLLBG5Nn13hVhtR9+Q=
X-Proofpoint-GUID: egaYM2ORRFl6F1jj1g35RAICwf_Z3KN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Replace the aggregate temperature placeholder with a signed fixed-point
affine calculation. Accumulate source temperatures multiplied by their
coefficients using checked 64-bit arithmetic, divide once by the scale
of 1000, and add the existing offset from thermal_zone_params. Reject
arithmetic overflow and results outside the int range without modifying
the output on failure.

Read each source under its zone lock and preserve temperature emulation
and error handling. Use nonblocking lock acquisition to return -EAGAIN
rather than wait for another zone lock while holding the aggregate lock.
Reject exiting sources and invalid temperature readings.

Keep initialization-time checks in the aggregation validator. Require
validated, initialized entries and stable source references
throughout each read. Aggregations of aggregated zones are not supported
yet; source lifetime and detachment synchronization will be integrated
in subsequent changes.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_aggregation.c | 67 ++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_aggregation.c b/drivers/thermal/thermal_aggregation.c
index fa6cfb8669b3..05668e53fed8 100644
--- a/drivers/thermal/thermal_aggregation.c
+++ b/drivers/thermal/thermal_aggregation.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/errno.h>
+#include <linux/math64.h>
+#include <linux/overflow.h>
 #include <linux/units.h>
 
 #include "thermal_core.h"
@@ -155,7 +157,70 @@ thermal_zone_aggregate_validate(struct thermal_zone_aggregate *aggregate,
 	return 0;
 }
 
+/**
+ * thermal_zone_get_temp_aggregate() - read an aggregated zone temperature
+ * @tz: aggregate zone with a previously validated aggregation description
+ * @temp: output temperature in millicelsius, unchanged on failure
+ *
+ * The caller must hold @tz->lock and keep the aggregation description and each
+ * source zone alive and stable throughout the call. Source references must be
+ * acquired under appropriate lifetime protection before publishing the entries;
+ * the aggregate lock alone does not protect source lifetime or detachment.
+ * The description must have passed thermal_zone_aggregate_validate() before
+ * publication. Aggregations of aggregated zones are not supported yet, and
+ * sources must remain non-aggregated. The destination cannot be a source.
+ *
+ * Source readings are acquired sequentially, not as a simultaneous snapshot.
+ * Each source callback runs under its zone lock, including the usual emulation
+ * handling. Source callbacks must not re-enter a held thermal zone lock.
+ *
+ * Return: 0 on success, a source read error, -EAGAIN for a busy source, -ENODEV
+ * for an exiting source, -ENODATA for an invalid source temperature, or -ERANGE
+ * for arithmetic overflow or a result outside the int range.
+ */
 int thermal_zone_get_temp_aggregate(struct thermal_zone_device *tz, int *temp)
 {
-	return -EOPNOTSUPP;
+	struct thermal_zone_aggregate *aggregate = tz->tzp->aggregate;
+	s64 sum = 0, product;
+	unsigned int i;
+	int source_temp, ret;
+
+	lockdep_assert_held(&tz->lock);
+
+	for (i = 0; i < aggregate->num_entries; i++) {
+		const struct thermal_zone_aggregate_entry *entry = &aggregate->entries[i];
+		struct thermal_zone_device *source = entry->tz;
+
+		/*
+		 * The aggregate lock is already held. Do not wait for another
+		 * zone lock: return -EAGAIN so the normal update path can retry.
+		 */
+		if (!mutex_trylock(&source->lock))
+			return -EAGAIN;
+
+		if (source->state & TZ_STATE_FLAG_EXIT)
+			ret = -ENODEV;
+		else
+			ret = __thermal_zone_get_temp(source, &source_temp);
+
+		mutex_unlock(&source->lock);
+		if (ret)
+			return ret;
+		if (source_temp <= THERMAL_TEMP_INVALID)
+			return -ENODATA;
+
+		/* Cast before multiplying and retain fractional terms until summation. */
+		if (check_mul_overflow((s64)entry->coefficient, (s64)source_temp, &product) ||
+		    check_add_overflow(sum, product, &sum))
+			return -ERANGE;
+	}
+
+	/* Divide once, truncating toward zero, then apply the unscaled offset. */
+	sum = div_s64(sum, PERMILLE);
+	if (check_add_overflow(sum, (s64)tz->tzp->offset, &sum) ||
+	    sum < INT_MIN || sum > INT_MAX)
+		return -ERANGE;
+
+	*temp = sum;
+	return 0;
 }
-- 
2.43.0

