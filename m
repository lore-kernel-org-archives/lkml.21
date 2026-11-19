Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081658;
	b=zPm4ttK4/52ltC1WpM3Fop0YyUCRdTYVC9lf7l96dpL0bVHfRrpF3c3mt6IfypqDR8fk
	 L2DpZz5UP6zW0JaEwDCvFEDF3AWo7Fo+IV+NKsit5cm9aUMbwL0kDSavF83tHJ/J8op3H
	 DRsGk5wX9L2q2LqcfTM1kGzXiIUV+SSLyvgQcelLSlVA3NUnJZI/2m6KdZjnh/a151+zm
	 1rWEM6SLSdJMpYnigREumge8cMME5Bta4PbbKbmb/UlZ0yvUsMXq9ejnCg3cTavDdp32m
	 YmVrTk9uGasHTtTpgYY3S+Rnwmm9qe0hLqUAbaU2f+E9CYAtV1tQpjg2aOfkoBCzx5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZqIffnRm5kuqX6NDeua1q1tgycJ7AiE64kY3jMaq2YM=;
	b=k4CNVFvM0Xru8xxnjgTcdwgkmQBa5bR5cVKLA8UkRZESEgRR9BvMIGuis1A2PT0ly37j
	 anGFilKXQ64oH7FihbLg+jyC51woqcJp46ffzPkeR7+MF1/9FyDYzDu79ht/adEW5in7Y
	 siM9KqdOB4ypggxEzbMEzUnMatsXUY0CLsf5riWtUiVY7fA0HkPY3HdNL/G7Pn0VHdGHK
	 QRxAUOCsG50a/RGayYzU1sasUm8f1DNk/j1n1qQ4g0dewoQmhS49h2V2XDvcFIb0xfgA5
	 rcaa4G2k6nhLAGokzJ4ju0yw9tWPcndZ6S4VuAVEJNEC/jbHfHa5ot4p81f50F7cjRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a351Z22h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DNgGeex/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A633606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A633606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a351Z22h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNgGeex/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ8Kdcf1753672
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZqIffnRm5ku
	qX6NDeua1q1tgycJ7AiE64kY3jMaq2YM=; b=a351Z22h4liQGhJgpad+Lv6gKVU
	5Ro/fqTCJmvu/lJwVxJggf/NtnoTLdomiEeQ/c0TlJjsP+OG13gDoQh1po926PQa
	m33zN6my5DdAh34eOemHxIVC+WLlVo/HmaUF+YSIB2OoRup7oUTwQmz2iFk6D1FV
	aY3RlRDnYODiN1LyW9RLz6wLC7Iw+cfC8PRAg6112P3xKZAr6yTi8KmYL4kEU+vY
	IM6UXH5M59ElohUmkuG7z5dpYYFAfuGTw7TjeklJqGPH/8XEZusWD5Q8dCD4KTF+
	OpEid/Fxc0PCY4BdzPmjRgZ90MMJW+B4NFXJlhHYOeOq8mPkNzpATwPHGbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8vnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso402824185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081656; x=1795686456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqIffnRm5kuqX6NDeua1q1tgycJ7AiE64kY3jMaq2YM=;
        b=DNgGeex/0NWrOq42ea4oLXVq+VZQGogUP2uB99xJycsgviNAZZq/sbDSfpDNogZU9Q
         OcTLsjy8x1pTgn1sNZ0q7ySv1OK3tlS4zd1ppAesqfSKsYeT2VngEeGVw6al/lljjAt6
         zympFUjKSbs6J0cl6O/hJHJyKczdsABQFh+janvsOTNmcOF1M7DYwtDnI1xJUPyepGWY
         DMRGWE193ELV3QV3bzFthgykJFhO8HLzqzdXeYL2CHOhiVsse30p13bO81zwrcFv4vXQ
         hFtBRjxRJ/9deGCvbePoXLvSvUo6L+JshQvyw/crsosARMq4AnOhPa3eg/6wCuJg8vKf
         dkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081656; x=1795686456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqIffnRm5kuqX6NDeua1q1tgycJ7AiE64kY3jMaq2YM=;
        b=nW40P+hd8JxjloLoYp/9VBSDs9IT1blcISeoNBkahEYPUra2L2pqLRmesjD2qBbaoq
         4PF2N3jok0agvV02CkXWvkDh+HEfe3MTjXbTgFTAurW3HO1h12EzuqMxeBQbkOA8SNHt
         R8FvK8GXqRcD4vivz0e3lRLViNXo1wDROLcIPa9JcLZ/IQBH9Q2Aq8Wze8UtsKsOdGaO
         s4RTOMufUf/aOgtv+7rrzNTRALxoXqIZrB+Q9c+Ex+aIurMxz/yiqTAi26AOKRYf2vQM
         Ne+B+F1K97lrSn1gyPvUSQMkoSmLqJH4q1GEyN54OTSIVLpeLJQyYh/dnBgEjXFhXEJM
         LcZw==
X-Forwarded-Encrypted: i=1; AL+hErEYWpUFy2o2g3hTt1JyJsJjQGwPwjJGeoRQ0nHyiCtRARa47Z5zB1zzZt0FUeslhcdXnw4EXg2P9FiyI2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wPLoF2kojAZeYd0zvFT8gYeLJ2WUGUm3/3TIXnk1UXa4O64ci
	Ilve+hQHLs/U5xHPSkhyLx1tX3+B3yoC/FOntb7e1IZecLz9BL6qCA8v3bYCmc0r2f6XbiPPsd4
	UkqdnUcEh/DMk4nJUEYKAoEZHOwM+wjeSpRn7Nf13FkWAU7DIzrwlul8NTRpJ0O4FFhw=
X-Gm-Gg: AYBFou0iALQZjH2EpP77zK0zQhl2jG4o/5rERID1CA/O40/VvpzEL1OCUAgIA4v3p6X
	+xY0lm6njq3UKwcRBF8KY6qGS9uaVL2B2Prg+qHpaftAwM89T3WSnw+CBP9TP5lKRI0Vq2nqbP1
	EgJU1H87bypAkQyR+2wyPbZg+tRU97tqEnyI2qjNQ9E/HVMC5m/pWMBWmfy0bpaEcoyjy4jbjUK
	2dJK09NR+qNppfeUf4Xj17FdyYsVvcLg5aCqyKKbmGSpf9lmVOi66FQwVNOGwe137kwkocK8ElF
	OP5Bz7RKFs7Ey5tMZ+l28nuiTyl5p21AP+V41su/j//gBHCgM63y7uNwSUouhwxngJ+hsBg3q9q
	eH8JYUedbm7WFXUDE12u3QBKSYXan6zJm3y62L9qB4NiHoFJtAeSgdDEPms1dK4RGYrgmOTkp1T
	ua
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949995b3038mr919834885a.33.1795081656322;
        Thu, 19 Nov 2026 01:47:36 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949995b3038mr919831885a.33.1795081655661;
        Thu, 19 Nov 2026 01:47:35 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:34 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 02/12] thermal: core: Introduce private thermal zone aggregation structures
Date: Thu, 19 Nov 2026 10:46:44 +0100
Message-ID: <20261119094706.3439040-3-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: SbvNPyXDrOcnLvLxiywPe-tW51lxMSPh
X-Proofpoint-GUID: SbvNPyXDrOcnLvLxiywPe-tW51lxMSPh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX1hd1/ZgudxcT
 hOsZdjdt4t4CO4uSeUMFimGoQdaD3eUAcaNAEbbtEWkoY1gEB7hxM2LvxQY+re24Lt78PtBJiT4
 h4FEYv3Swxn7t2hfp/j60iqhLA8X11M=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afec5b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=YehjXlzMaFdFp2m1gDIA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX1CyeRAXcaLeX
 uFgAmwuTuJO+R8MEgGcJfkscTpvYLEJOHqE3jOPNDW3D5de+iaLOMttsuxJZCBBC7R7kuIVi1Dy
 Lp7VBDwL0q4uqwtHZoZXiKyk7ObVIc1/9M+tVpEKVjStuegfAgbzKxUo976+T/e4QL/ZHLgX/Dn
 FREXw/GJJHJDeQCpO+UQcvZrKcGpUhC3QgJ8Yi6PxT+ao9ajNFB6WRicOTFjwdwvLAhe/xacqET
 suv/CFhQoNOC8LBmx02GtoWImOGaOyy6YsoRisSKDOoqZvKW7kKxJXIOMuDHlT+gDIvxAhibMk7
 h0d75gPFuIRXoo+yMR9q7Co785tM0ldbAk0puBOl0RGM7xL4Lg78GmibSmyPGo2PlMshgBBsxUE
 oNzaQfpMbvMVDya7g7bNwIj+vEUPWWrkHmhPceqKxjeFQgmHYL465KvBOPVk6uwoF8Z27SHw/ny
 u6NxHO2wKyB3uCcGpsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Represent a linear combination of thermal zone temperatures with an
array of source zone pointers and signed coefficients. Reuse the existing
offset in thermal_zone_params for the signed constant adjustment instead
of duplicating it in the aggregation description.

Keep each coefficient in the aggregation entry because it describes
the contribution of a source zone to a particular aggregate, rather
than a property of the source zone itself. The same source zone can
contribute to several aggregates with different coefficients. A single
coefficient in thermal_zone_device could not represent these independent
relationships.

Define the aggregation structures in thermal_core.h and associate the
description with a zone through an optional pointer in thermal_zone_params.
Keep the definitions private to the thermal core, with only an opaque
forward declaration and pointer in the public thermal header. A NULL
pointer denotes a non-aggregated zone.

This establishes the firmware-independent representation for subsequent
aggregation support without changing registration, callbacks, or
temperature handling.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.h | 23 +++++++++++++++++++++++
 include/linux/thermal.h        |  4 ++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 7b91717d9d74..a5fdf5c24b6c 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -63,6 +63,29 @@ struct thermal_governor {
 	struct list_head	governor_list;
 };
 
+/**
+ * struct thermal_zone_aggregate_entry - source zone and its coefficient
+ * @tz: source thermal zone
+ * @coefficient: signed multiplier for the source zone temperature
+ */
+struct thermal_zone_aggregate_entry {
+	struct thermal_zone_device *tz;
+	s32 coefficient;
+};
+
+/**
+ * struct thermal_zone_aggregate - linear combination of source zone temperatures
+ * @entries: array of source thermal zones and their coefficients
+ * @num_entries: number of entries in the array
+ *
+ * Represents the sum of each source zone temperature multiplied by its
+ * coefficient. The constant offset is stored in struct thermal_zone_params.
+ */
+struct thermal_zone_aggregate {
+	struct thermal_zone_aggregate_entry *entries;
+	unsigned int num_entries;
+};
+
 #define	TZ_STATE_FLAG_SUSPENDED	BIT(0)
 #define	TZ_STATE_FLAG_RESUMING	BIT(1)
 #define	TZ_STATE_FLAG_INIT	BIT(2)
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 306ad17aed89..8be61b0c2684 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -30,6 +30,7 @@
 #define THERMAL_TEMP_INVALID	-274000
 
 struct thermal_zone_device;
+struct thermal_zone_aggregate;
 struct thermal_cooling_device;
 struct thermal_instance;
 struct thermal_debugfs;
@@ -192,6 +193,9 @@ struct thermal_zone_params {
 	 * 		Used by thermal zone drivers (default 0).
 	 */
 	int offset;
+
+	/* Core-private aggregation data, or NULL for a non-aggregated zone. */
+	struct thermal_zone_aggregate *aggregate;
 };
 
 /* Function declarations */
-- 
2.43.0

