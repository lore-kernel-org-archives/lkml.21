Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081657;
	b=sNYRQyJNl5P4K3ca5no8oNPeEi0kQTDQIvPAwyXvYFQ3tKvdZGIf8I3Tw/D6cebAhWL1
	 gmGgPmzvvSegWVAmpqMc8z1zVIwJyCztacwqhACPS0IqEzm96a3AsgAydcwL/VPkjUjis
	 OLZO9GHa7wwIlwJ7ZExMePckhgm8HyYLDPR/3SxzjOKQo2NWG3AEFhROP3rO4Ney1u/9C
	 PLvqKtT7Y4GHrx9QZ29qHpoVHloO3rM8yHEh1Sui9AZqzGY/HIiqIdt2fp0s1QWWbPx2E
	 rN6uegDY+W2rBfn/09byAeR2xQlBDvj+3x59ATXhjkBMpRBbaSgUX6wvYkegtzGjyyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uSCd7dBC5jEtFPlOY+CVFRj6hYzNdBZ42EnWAER4Ji8=;
	b=ezMz6CjzoMGNFeWLxHlm1e4aScfmwociEQCfr+KEJ1zmwBKTlFjKuxYe59M3ooylRimZ
	 PxpgvzrstBY57B0dt4PTdscIFHZubuWNzWzKITQNpv0kQlsqASXGAxKpFutep27oJmbo4
	 deA1u2hxTFvUDQKtaKqd/lhlaFJryIaT+6riCr9QkujeXzrmINAZxuTx8OLJQ67wbbnvR
	 yG8GwIna6Cte13qwD+9PTzPyv2BCNxyO8Sk0n3vNYvFHrXmER2FSn876LoN69VgiaVuHC
	 k+i0DjSNYJY6afnPEq5GN7HbT1A475fonO23d3OSt1W0IRb6yVcxaK0rd5v+Fgzqx9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nqLuxsi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MlECI4dy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C62606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C62606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nqLuxsi8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MlECI4dy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vECu2935521
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uSCd7dBC5jE
	tFPlOY+CVFRj6hYzNdBZ42EnWAER4Ji8=; b=nqLuxsi8n0DqRruq7YhpA2Q3EGh
	2VY8TiXhckNhOhy/SX5wvoTGUyk6IzWa413OF9TyJHuMTO+AtSBax4a41Uyz57vl
	J/6HV2biiVWmvg3Cs4D1NvY9uJihuEEyS0UG46sU9LimfHgQ8LrKAUMXLHVxMOSt
	SuBAiWzHBXk8LmIx3sNZhG6lOskz0BxnWTbEEcjs9LZSaHIzrlKKelG/40xerJe5
	QZVzF7/Yvw0wyaT7EnveeSUIAlU6N1v8Y6FRPRN/Wo8OqcuzCQdWBPf43lagyCzK
	NLyxAuhWdnPJzxFyfUPxluUw2olylqqBBbOo2InonE7LRSkf4U6GXc6fWDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekrpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso336743585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081655; x=1795686455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSCd7dBC5jEtFPlOY+CVFRj6hYzNdBZ42EnWAER4Ji8=;
        b=MlECI4dy5kaUWImku2CZ2CE4d4iRVtjsp0fMqiCCijoyYuK7st1mLWUOaSjOZewCzS
         T1FyDdnOtdQRLNHrNSie26HhFy76aHO/QF/tJjWGBPVVsHPAUszIgg0N4LKuJjzkaC/A
         +MNYiYYWC5cF7pOyX9jYtu4ToF/UsHVLZjYYzgsbf+ft6C6QHGAPAtS+DO9Dp6ZtqmNP
         ZkSu4SVdRkIlKTCmbqwiJhb5ir1PwNa3lfBgEMWFdee9FzLd9E5ryF5lk31AbZYTL6Tx
         tQBbk5MsAtvSVR0NLKQe1Sb5ZGLmd7F7ExbEDPq143Q3L3OWAClfKO7eMfm+yL0RGY6Y
         wHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081655; x=1795686455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSCd7dBC5jEtFPlOY+CVFRj6hYzNdBZ42EnWAER4Ji8=;
        b=FkzCD2z7eeOGD5WpadFJre5w0KJcTJ4xpLitBQnKAwdCPQ7hkPskFoaQ82K4iLPVpQ
         8qChwETErJbNQntRXWVIuv+cPcbR5UGn7rwywvQK5BYwnSm9tpcZ7SVzAzWpq8E9I1Lh
         8kmpVHV2z3TGKGuS6+DW90WIe66qEqcoCvsU0wFafhj/s3wlgklhTbARdaSPLvqgeKAw
         c8UPk+3zPu0ys6WjmxtdvEyASjvU1ux7ajhhIzp35t6K0liqPneIAKm/+nwW3xzgthh6
         GHa0FkzHvlamMEYraj2ERZ5BRIJm1HCJB+ot3LQK5l2PAeOrx8XpfuIN0kOZTOGK/OUL
         vcXQ==
X-Forwarded-Encrypted: i=1; AL+hErGDNvKSTJ2gHseygjw60T4EtxOQG/UztDnKtj/+ZK91cG57f8TdfNElaCHpUqBonk3rb2FaxkXYpCn8H4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9trXZvKVsj9UxjPR66yCdijRIZY/CrwWp67sGc/+8XjIu2bsTu
	ifns3V/bCdU0PlJHeuZd3hRH+j86EpaZa/PowD4Q5KqL2z9DGS/ydqzg592K7sN7yJOaPv7hLVA
	jedtuQabJZrh15AkEsiXKqjEUMGsxrqlyQXkxThw7pJIVW3MKm158QjkXAYbnDj9wgtg=
X-Gm-Gg: AYBFou3/oJtKESbLOn8vliBLyOYnf36xY4apMjlPKtfZW9hhLlRUypC+Ad/xWqjnnJT
	MG2VE5sj94KhI6cZBwtptDn5EHhjrNXhhqXl5Js7k/+dYgs6dEUZGScFjvshA8t4EbrSLDQWTgO
	DT12G5bxPuN+9ePLCnjhWgeEf8h4XCOO3vHm8289uxCLRKOkg2mWlSw0myuGiCp7YXxRzl8uXgY
	4/oPIb0Ttb3QiPO//dfNNrbMDWU62JTHlzgs4ImsOESdwe8HbZksEWE1epXzepzF3L+Jah0Rk7I
	h2VsYlBt2XO5E42weZc+QooLafrluajaIB8J0X/E7BLrYjZFPZilCZpbZANMwgAqcObUvCuAPaH
	3XXOniZgnqFXtSz15uj1p64/dWm6ZM7OZKKnRPfKzGfGNzTg4hm4DqOnmNVFrKpRO08csBHD6dh
	GX
X-Received: by 2002:a05:620a:4802:b0:949:5e8a:313a with SMTP id af79cd13be357-9499965c3d3mr996315485a.13.1795081654635;
        Thu, 19 Nov 2026 01:47:34 -0800 (PST)
X-Received: by 2002:a05:620a:4802:b0:949:5e8a:313a with SMTP id af79cd13be357-9499965c3d3mr996312385a.13.1795081654110;
        Thu, 19 Nov 2026 01:47:34 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:33 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 01/12] thermal: core: Add thermal zone device reference helpers
Date: Thu, 19 Nov 2026 10:46:43 +0100
Message-ID: <20261119094706.3439040-2-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX++UaznI0PalL
 4qR0vnlslzXMaEJKeIR5NurcglkdqfdPA3TZ7901NfB/U4glgIL0tL9F8nkxU1dU3S5bPV/zso/
 BlCoRbRoVjlbeEfWNFlT54JIwP+eRxKSu5rfzP9qqqR3zch7OJkx4QXvnUthmBsfunONiJ0iGCY
 diJ1rFteFh/cCwBSpMDZb0civ4ot5VwsSDIm1+qV4+rghJ+R5Qu8D4IhR8XEFnNsjplVkiWSv/g
 qjVEUd/Zs5JElX6dSOvbpONVeLYiiwI/3sNjDLSeOjC6JWSC/8QNssblHWPTZ3jHH5unXZSNWEH
 x/9JfoVFc9H2sIe3q0b7//ysuCJWKyUt+baY2sWxPkop8K7Xix2TgRcC8c5ophqyeBWpmXHnbuD
 m4aA0qHuelq+HlFFPL/utuQ9288RPRAmvmEwn+bu0fdRKCXkYvEtGXp8TeSzZ5BuUvO5whUWEGD
 SSdtNhq1GH7pFUhn4XQ==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afec5b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=rLMGhVG854pRqHrHMbsA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aQWV-lObeYsIAe1OGoyrNu-5FhuAwhWi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfXwowFwPteX8Vo
 3g0QojUVVE5KDm35SnTagPUq4EOM3rik+HG/jhm/xBZVM5yNpB+ERqlGqS8mwBuxEEKAJ2l3EL1
 gvVEZflRImbqA0C/YOb9mn9BZqFUhBo=
X-Proofpoint-GUID: aQWV-lObeYsIAe1OGoyrNu-5FhuAwhWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Add private thermal_zone_device_get() and thermal_zone_device_put()
helpers around the embedded device reference count. Document that callers
must protect the zone pointer when acquiring a reference and that a
reference protects lifetime, not operational availability.

Use the helpers in thermal_zone_get_by_id() and its scoped cleanup class
to keep reference acquisition and release within the thermal core
abstraction. Preserve the existing reference ownership and teardown
behavior.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 35 ++++++++++++++++++++++++++++++----
 drivers/thermal/thermal_core.h |  5 ++++-
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index e8d4da0aeac3..02c2c08077bf 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -698,6 +698,35 @@ int for_each_thermal_zone(int (*cb)(struct thermal_zone_device *, void *),
 	return 0;
 }
 
+/**
+ * thermal_zone_device_get() - acquire a thermal zone device reference
+ * @tz: thermal zone device, or NULL
+ *
+ * The caller must protect @tz against concurrent destruction, for example
+ * by holding an existing reference or thermal_list_lock. The reference
+ * protects the zone's lifetime, not its operational availability.
+ *
+ * Return: @tz, or NULL if @tz is NULL.
+ */
+struct thermal_zone_device *
+thermal_zone_device_get(struct thermal_zone_device *tz)
+{
+	if (tz)
+		get_device(&tz->device);
+
+	return tz;
+}
+
+/**
+ * thermal_zone_device_put() - release a thermal zone device reference
+ * @tz: thermal zone device, or NULL
+ */
+void thermal_zone_device_put(struct thermal_zone_device *tz)
+{
+	if (tz)
+		put_device(&tz->device);
+}
+
 struct thermal_zone_device *thermal_zone_get_by_id(int id)
 {
 	struct thermal_zone_device *tz;
@@ -705,10 +734,8 @@ struct thermal_zone_device *thermal_zone_get_by_id(int id)
 	guard(mutex)(&thermal_list_lock);
 
 	list_for_each_entry(tz, &thermal_tz_list, node) {
-		if (tz->id == id) {
-			get_device(&tz->device);
-			return tz;
-		}
+		if (tz->id == id)
+			return thermal_zone_device_get(tz);
 	}
 
 	return NULL;
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 7ef7c6cab437..7b91717d9d74 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -211,10 +211,13 @@ int for_each_thermal_cooling_device(int (*cb)(struct thermal_cooling_device *,
 int for_each_thermal_governor(int (*cb)(struct thermal_governor *, void *),
 			      void *thermal_governor);
 
+struct thermal_zone_device *thermal_zone_device_get(struct thermal_zone_device *tz);
+void thermal_zone_device_put(struct thermal_zone_device *tz);
+
 struct thermal_zone_device *thermal_zone_get_by_id(int id);
 
 DEFINE_CLASS(thermal_zone_get_by_id, struct thermal_zone_device *,
-	     if (_T) put_device(&_T->device), thermal_zone_get_by_id(id), int id)
+	     thermal_zone_device_put(_T), thermal_zone_get_by_id(id), int id)
 
 static inline bool cdev_is_power_actor(struct thermal_cooling_device *cdev)
 {

base-commit: 0dd55073c872df387d28480d1197c013423d1705
-- 
2.43.0

