Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081663;
	b=KFFLq9KX6V6pJ4TwHzsRy6ctMnC3sWS6Lq/vGnDixt6RtrNj2m0sTsD7DeMLOebQpdBE
	 1eYBUC9z63kr32lIaCEVMub62mfXc+Ln/esFyrhITq4PypQBA2a9TMsZf144oF7Lzc+Q8
	 Uf1Vxuat3Ft5iBGdYSFCcCsnuVqiFdFm+9zbwTtxHMENIteq8vDY992Z9sXHocjeg141v
	 ihPJudQIvM49PKfSftvaqVSHSNbjCO1laOlCbXTq5lN/ILY31g+05JlMZ3gFG3h431hPX
	 uUHr2RxFb+kceWOBoo51THSdtChgU7KtnKry9xtKEYRGWkic3P1thpo90oJbbITtGNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8NZEltlec9d7ZhQdO2+fHcLBekWxvb0kuhP3dKfx698=;
	b=CjYchND1GUE3FvFI8ehnFD9Y4mZ/Xqydm02w2hhGnvxqoC5oHlhdXFch7rsSsRAcWI60
	 WgceJzwHP3JZ7PbV4Ibr8r4DwOV2lNKV62Ids8KXhU6yMAwxYgg1FqMpSzp2bV7GTRAvQ
	 uA3YkTQ97oCUu6Q0PaHPaRjviOf8jNQ2LpBQVuY1DGrr+vtKWPnRybnMQVjU+fWxdaLdu
	 LBGNapC/mXjMjtqnY1slNcXOavL8mVhuW8F5ywVhoJv7E+/9zbGQHDySUh/UXbakiRbC4
	 qHdt6v+KqleUP5/8MZk5zqKrtjH9Zv3i7oCZpKU4WNUPEh8/dKF68XtO5u7qn+QQRJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trkjp49X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkAIrEe+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D42606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D42606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trkjp49X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkAIrEe+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vQhq2671916
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8NZEltlec9d
	7ZhQdO2+fHcLBekWxvb0kuhP3dKfx698=; b=Trkjp49XTMHaiAGrK7DlP6Mqrhq
	q0V76QgySrxHPOsyQmJy09HubyYcr1aP+R9G0TiH6P44ty+2tGYoUhdLy5nXYfGs
	8bEowsZQUP3kGPlRu/WBeBebQ2eblR/iIcK31yGoH/yJLxqWSeUX2+nDTYBYJ/VJ
	GT6HKSak/MPXpY80v1kd5KCGu6RwsR8eBho7gib9fx5E3pnqP8nkOqKrTwAmeAQs
	YROD3oh6VY+Q7I/7aVBLZBHC62OU5Io+bco2vaNrKoVuSwjv+78qc/FunbCMK0jZ
	g4R606S9p5MOx1V46AA3fICJc/IEDsrH9XIi13rwGBYiRiM2PfQIZhSgYhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p3v4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so435219085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081661; x=1795686461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NZEltlec9d7ZhQdO2+fHcLBekWxvb0kuhP3dKfx698=;
        b=XkAIrEe++HOas8pWoKgIDBrLAOerfj57AjEUH0H10qz+22n7IwIXWygpHvi+NmCR3F
         HNdD51z3yQaeR4UOEtcVP6B+KBdkgxbidnzoOZuIMsMniMeDmFsc21XQcAb72qPlxlcn
         6B3C7BKBHLjpItKZ/xx7587Wre3OWRlOH8biwPJkLXUQW7oz4ZopKOzg4gDTMMk3GV9G
         27o/+2Gp1NUzCG+tLESGvUaeNb28GN5okSehB3yiwWdocA4WR/TocZC74RG32COkiuko
         aHZs7dcqb0ClTh69/RuTF+kufbptWq3Bd2nWRTN/GZH/qTPDrpGcQ5hkhNaD7CAfPdby
         fiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081661; x=1795686461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NZEltlec9d7ZhQdO2+fHcLBekWxvb0kuhP3dKfx698=;
        b=iARnpaGZ3jeORXLQUvyBIGA5t7oTiQkvEjMc4SFg6eCoDdz3p4EunAKpx3Ndk2GfNY
         3NIeQlVKbsxXEhpoLUcmgimeYvOa3nQdKhRHzWdyGGPZuth1OYAPr9vZjjuJOWgyF39t
         XW0txZktShwbAKvIzOmhxxSt3kgKLOYtS9z3H6bFe2ZvhCcaRwqkTsCGwKxLDQF9BOgn
         6umetC3UiUSYwek/kkIoLNSq5y02EQTpR2Nezf1R1SIQCVsmSRBUzwRiRlrqgXIhiqOW
         4ZzIA6P6xPzkc1k8Bv4XPD4hQip9zVsrJ/g1zYVb2l+Qh4ivLNl7E5blGeNnlfR8U5Pm
         zfew==
X-Forwarded-Encrypted: i=1; AL+hErGqiC0vRO1Xe6Kdu2bnXNn331oDzK+LJwrsyDGYjQhE1+dvP3osGjn09XEfEsei1i+28dwI/MmzGzkcf90=@vger.kernel.org
X-Gm-Message-State: APuU4Z9quQ+CNla7vni9jK1+9vXCWOsQkzZfhm4SaDKcQiv45FzM0AbQ
	9qYl5l1mjhFgO8oqrDsNMLJ2IHpwXrcUIguRNrAFcBlyhlhQD9Oh37H0j+QwHoyrG8808JDP7xn
	HxGwmLD6qYNFuJynuJfB7+20kywNXE7L7JNOPPQxydXc8UAmBIZsQ57qkjnbYo9KFltI=
X-Gm-Gg: AYBFou0q2C1ldd92Xn4xpdk+xT6gIcdn1YqCGhYiSwZWZ72Vfava7TObJUUGJqMmgAH
	YVBDJ14zsGdT+rG37zpTSOAD7N5eNdfXO7aftCl6NH9gJcjTxrk3XwEnDZqFm/lhf4bpeU6hrd7
	4Rg0LSk6laxKMGL52IosgtojddOzEo4fyc95fMSTUuTGTadpPK6+OEEiDwcarw5tvNUw5WTWq9K
	yVuheE8srxbypKDaTDPpzmdeGNbtJfMK+cCxMvy+UuExZOGjIMvId67NMudKi4DYvkmV2IS2lDH
	B/gTjs4+V/3SPCFq1hRhwtlJileox1ogReYRxobqF3lnzyLMwHvkSYW8zLGFu1QcSBTsq9leuIY
	9xzWBR1Xezrz2puAo400HXlsR/uxtk0CmrQvfXotddQiXOOHqW8xmCYzfufam/zVWzbP/qgvcu5
	zI
X-Received: by 2002:a05:620a:370f:b0:93e:623d:99ec with SMTP id af79cd13be357-9499957ea7fmr1103452285a.13.1795081660833;
        Thu, 19 Nov 2026 01:47:40 -0800 (PST)
X-Received: by 2002:a05:620a:370f:b0:93e:623d:99ec with SMTP id af79cd13be357-9499957ea7fmr1103450185a.13.1795081660419;
        Thu, 19 Nov 2026 01:47:40 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:39 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 05/12] thermal: core: Dispatch aggregate temperature reads
Date: Thu, 19 Nov 2026 10:46:47 +0100
Message-ID: <20261119094706.3439040-6-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 87ZrRLkiGaZlZzz6Q4d1eQ17uhH9-T_7
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afec5bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=L_484BTU7vCjdW36McwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX87p8KupGx0i2
 XW0VYq/L8pJGIMlWFlk/C6vZaJhryR3uPVXJndcHdHI+jaKplYaU8RWscFW0tqwmcVOSnZQQvgZ
 6s5tOscPd4SL/x8LWjGBMEKt8yDVJp2mKjGpcMpsLL7aN/+b3xuZ6Fa6tiOqCQxGO+Q+mzuhBS2
 btlMiQkA5ILVTro3eiwEeikIzLEg90NIH+eIGvDqKfErRg4JymYm8Q19vkoiSi55dp7f+E66hCz
 cLu5Qr+eam8VHtcrlg1h6eygRlVicLJa8NiVdzsNc359EASgyyHfyRn6HIFw1E3EKXriYFzZ6Ck
 I2HRW45EdTlPENoS9HKD1C/Zl1BB/OzYMoc2cDxteOe28VBkHD8meXDlsQD5gLHfTOnR4eUNPTU
 yyeptWwpElKSW4O8Y0vlnE5t5OI76KDg3jyI5a5zdPu1+RPVkdPQgK5pjH1we7zA/9ZMN8qLx93
 Xhq8nq+TVa7Kf1Ry9vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX+MHXFJ+AOUym
 3b1PV1DmjG72vCvF26XCRT+yout52LOR+TCyfOARyjmWpVQQ2TwhBIimRlYoO3DtKcrPyx7Uc3s
 CP/6qWFaKnUmrzF/R3X16Hm67FeN9NM=
X-Proofpoint-GUID: 87ZrRLkiGaZlZzz6Q4d1eQ17uhH9-T_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Select a private aggregate temperature helper in __thermal_zone_get_temp()
when the zone parameters contain an aggregation description. Retain the
existing driver callback for non-aggregated zones and the common emulation
and error handling for both paths.

Add the aggregate temperature helper in thermal_aggregation.c and declare
it in the private thermal core header. Keep temperature dispatch in
thermal_helpers.c.

Leave the aggregate helper as a placeholder returning -EOPNOTSUPP until
the calculation is implemented, avoiding a successful return with an
uninitialized temperature.

Provide a private stub returning -EOPNOTSUPP when thermal aggregation
is disabled, preserving the ordinary thermal zone path.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_aggregation.c | 5 +++++
 drivers/thermal/thermal_core.h        | 8 ++++++++
 drivers/thermal/thermal_helpers.c     | 7 +++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_aggregation.c b/drivers/thermal/thermal_aggregation.c
index 8b503fab25bc..fa6cfb8669b3 100644
--- a/drivers/thermal/thermal_aggregation.c
+++ b/drivers/thermal/thermal_aggregation.c
@@ -154,3 +154,8 @@ thermal_zone_aggregate_validate(struct thermal_zone_aggregate *aggregate,
 
 	return 0;
 }
+
+int thermal_zone_get_temp_aggregate(struct thermal_zone_device *tz, int *temp)
+{
+	return -EOPNOTSUPP;
+}
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 365704584966..34903cfeec33 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -313,6 +313,14 @@ void thermal_zone_set_trips(struct thermal_zone_device *tz, int low, int high);
 int thermal_zone_trip_id(const struct thermal_zone_device *tz,
 			 const struct thermal_trip *trip);
 int __thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);
+#ifdef CONFIG_THERMAL_AGGREGATION
+int thermal_zone_get_temp_aggregate(struct thermal_zone_device *tz, int *temp);
+#else
+static inline int thermal_zone_get_temp_aggregate(struct thermal_zone_device *tz, int *temp)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 void thermal_zone_set_trip_hyst(struct thermal_zone_device *tz,
 				struct thermal_trip *trip, int hyst);
 
diff --git a/drivers/thermal/thermal_helpers.c b/drivers/thermal/thermal_helpers.c
index b1152ad7acc9..cf84d4c1ef65 100644
--- a/drivers/thermal/thermal_helpers.c
+++ b/drivers/thermal/thermal_helpers.c
@@ -74,7 +74,7 @@ EXPORT_SYMBOL_GPL(thermal_trip_is_bound_to_cdev);
  * temperature and fill @temp.
  *
  * Both tz and tz->ops must be valid pointers when calling this function,
- * and the tz->ops.get_temp callback must be provided.
+ * and the tz->ops.get_temp callback must be provided for non-aggregated zones.
  * The function must be called under tz->lock.
  *
  * Return: On success returns 0, an error code otherwise
@@ -87,7 +87,10 @@ int __thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	lockdep_assert_held(&tz->lock);
 
-	ret = tz->ops.get_temp(tz, temp);
+	if (tz->tzp && tz->tzp->aggregate)
+		ret = thermal_zone_get_temp_aggregate(tz, temp);
+	else
+		ret = tz->ops.get_temp(tz, temp);
 
 	if (IS_ENABLED(CONFIG_THERMAL_EMULATION) && tz->emul_temperature) {
 		for_each_trip_desc(tz, td) {
-- 
2.43.0

