Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081667;
	b=BaEXpuWvVfw9sbkmKu1khIAd+UGyDFhrobMNXaCx+K+8ZAFMv9+qQ2tW7xZOx+Lf0fT+
	 i0WnrU/bv0sdC292MoqGf52L/daHRerF7tY3v8uSJr3d8p8c9y5deu7CJklNCkLACN7EV
	 YuEXXrDXmt4yjhBLJwicyl4chml/W0nyW4MiXg/YOJexAM+R1msatvDY5lmCWpclQe6Vu
	 CkRs15uHWxILmYbj/JTalfP8RLCSe4eINdQ7gI5qcFET6IELCwsfwKVPqkzpvFU0t+juf
	 MTld2nCuxvuJafkKdORRWUyWkC84d6XMS++sKLufNRcjKDgHA3Rb/bsvDHDDGRb5dRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0piZuT8O17sCzBuMxolM1mTBSJ9b8cd8dmW/GEv2Rts=;
	b=Dt+wENfyD7aFW7KF4G/gZDkEqMBzFSmYEFaiRzzag74tcH2728Sf2mZxufIFADbIrbL7
	 PhIQAMfDxVhfJCM4GSoBfqqkmit1sTt7lk4vwXLgK9qBlJE6mGAvduJAHjWndX/5p8eJc
	 3MaFlKVc7KcCu1nDVsnlh/EPYNFgB+lYN2d7V73RY08evjlh9mrMfKgMygvd0GgrIWRWd
	 sVHyoMeCN982s7AgmChDdBVtvYjNj33grALUmwqEMuo0Ho47aBDOLqvD8wgbvHLtgTu1X
	 O/fDystt1UlEyMGMYhdF+4EauI4Yp/a3z+/LtPDP9eRmexyM9yIo+qe2Fi68e9f5Rsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d80D7KrX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HcJ2BbWK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E69F60A2631
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E69F60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d80D7KrX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HcJ2BbWK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWm4330695
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0piZuT8O17s
	CzBuMxolM1mTBSJ9b8cd8dmW/GEv2Rts=; b=d80D7KrXhh1h0R1ZvKPOVnoGHHj
	FcZgp0veL5+qJRCVZA193rw3uOrOThAgZjdsbgWKl4LUBR6jjNddUBnkEYx79ZoL
	EhvKrwSUvZZF2bSIgy3Pm+PvhIgPcDq/Li/Kk1tN+0io1XYhL3cKf7KZr8eIhw9G
	BMwxWh6BxEPrQqhzU3fzeVJUCvNVKtSbnR6rHzvxtBs+RiuxcXsyvMDPTCawjUau
	vKhGhlwNiexPTm4jrptzR0edYSRGX6kLKO7xirT6P5c48RkWCoSn0DkGLOerP3Xr
	CCQiT3Pnv2xF1TH0byfT3ceiKv7k1EZAM8wGxsbSm+Udsl4KupWcpk81ntQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkvgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:47:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so369828985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081665; x=1795686465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0piZuT8O17sCzBuMxolM1mTBSJ9b8cd8dmW/GEv2Rts=;
        b=HcJ2BbWKzetvTYlP/kG7E/Xaojgu5VF7o9S3YNToRFm6FEZ4dta9vvPgJ36JxZEw5R
         caGRtsrFoEZHuVEHc7NhMAt6RkqgJaqx/5uxNcEuaaUhysi1LiPjGx9Hm2iobcXpTTLn
         GO9s/PTspaDqJdfN120Ds6pDtzGoUTCPXp3Xpo2bue4x2EgZ5Orpyk9W8gT+Tb9fpPsz
         //uz8OwweqBi2c5aOFxTuVhYqoeHufLPw7cYH+EoBHE/X+D0DkoKj6YBTtE6kGYragJg
         ou5gSo0xXCYoVFDdpzG/ccEeYqXX3c33BFRDLUEF4akdjRK93Do2d9zXLG9FMHRkC2Mk
         sdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081665; x=1795686465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0piZuT8O17sCzBuMxolM1mTBSJ9b8cd8dmW/GEv2Rts=;
        b=Fz9qby2vaejt+oh99IMnru+Imdt8wldOiFfxw1Vfuxzsu8IdVhQ+4daRwznLtzz9wO
         TaQ2qib540IEtwB8nhFSVLwERvQ9xX6s4MdgD+ANTj9Ocf1D9fxciFRFlP+tR357PH4H
         93cAQqr3fR0rTSerfAPe5tEGt83UMGpjphONMhGV+XilUNoXiG/W/TS21AgxbCKZYKAP
         aZqNJEVKgWzS8UlRiySj0MrrTFd92/BRcwmdIY52FtTfMNYm+Oqq4ehkvezJ4yuuuCDm
         n9YnD7yhhHud2J5p6C6zyMgsoR0z7n2xV7wAB14vU21AsztuFTFdxE4PbRDq7/CiosEV
         nrqg==
X-Forwarded-Encrypted: i=1; AL+hErGaJAGK3slRlqQiiqZ+r6l3YnF3slgRgxLWmfyCmz785TV1SS2yftdlA6zdUL85V9fRzAZeg65Sd3hG4OE=@vger.kernel.org
X-Gm-Message-State: APuU4Z96R9d1mUrpDTtBtY7WTCmmRNOiuzZ3Kv71vaHX2VlFlnbLkKCK
	yI8GvbwRGjLbcmKtZdBsjV6+dBz2SiXyBOe/R8R9K+VMMhfgGc3X96xW3Bb9Ij9cnuq8ite+MVu
	a4T1jc7J1kIY3+IqdgFQWCvwpTJoQTN1nTMrmG1CWZ9PmU6dGOkjAVhlyu1s8b44n0/0=
X-Gm-Gg: AYBFou34c5QoBgNbr+LZGwGW83OH8ACuInsDUufDzuOqmgF4cjoDZBOF1e69sSYSkl7
	pYGhHDXHj4DzRmZwoHuDjYA6q/Bdn8QAxpBzUtnipQubpvs0eCGnVWDhhr3gK5jXuRZot1SFtxQ
	+h90d8pmyh9XIw2hb8bonqckZ0Y/R1dRPUPy05Dez5o+/DW++4ZPbGc6mR9mw8t7W3bYyb8tpFb
	LdrrzJ0Hf2rJ/qqWEoiLKvJbyKXF1qYpVMIoDuVquX8xFEB6wn4JYGlf8Gg4f+hA0/VLEkRLEm3
	ZgDBx04A5/Of8Xg6OYFWQKiwQIkGiddPUoqbsV57pl5+Z3bZjHLPFt4ON3B7dkJ8jp3B4cy/wGk
	S34YbqfdMnl/YheX5UdJA2Hlm745VInqzQDGlUHbRTAg8KFVPLfpcAy8EKoAkOLEsChjoPMD98a
	bF
X-Received: by 2002:a05:620a:8710:20b0:949:99e1:42d7 with SMTP id af79cd13be357-94999e14369mr685328185a.73.1795081665133;
        Thu, 19 Nov 2026 01:47:45 -0800 (PST)
X-Received: by 2002:a05:620a:8710:20b0:949:99e1:42d7 with SMTP id af79cd13be357-94999e14369mr685326785a.73.1795081664652;
        Thu, 19 Nov 2026 01:47:44 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:43 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 08/12] thermal: of: Separate zone parsing from sensor lookup
Date: Thu, 19 Nov 2026 10:46:50 +0100
Message-ID: <20261119094706.3439040-9-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: VzCUrOKzV43lfwuTCm_AI1rRLWu1VgDV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX0XDuFthFvPe4
 0t6+9t/gGy0mRII2wKCaL0mNI5gJ6+Edl4gC1bKt6/9TJjgY3M+/xj/qqdF0C0d3cqJWrgTxCR+
 OBhWJjEEEoS72D2B5MxTrLf1gIGPF8u82+DioEkl4y5lgcmgLyOWltTk8ol0fKmZL79YLoX9U89
 k+63ovxjoKympwB1cIfKyQ1tn6rHq9JS7J2qznOGmNzndfgKKZHiRIyXi8d5FxbdNLM2ts3zTG2
 b1UO1AdzstH+doa7WrOgZ6hpfZaKNt/skpzJLwee25+R3E1FGFMC/B+zNUxxCV/mKzh+iVhxBvi
 WqdtziWiw9nE52K0Yy663w+eTjaEShk0caPCjCpnwYZClgMCz4ntJgv1RTLfNYjJxn1qiGq9woq
 JT0prqkGI/MYYJp6azNqRSpRq6YMV0VCkF6t/Phs69oTZNUvWvCCzE70s70/X7jwfj737tEJvDl
 4SxLnnCE9Z+bok1CVnw==
X-Proofpoint-ORIG-GUID: VzCUrOKzV43lfwuTCm_AI1rRLWu1VgDV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX3JCtMrsC4Vdd
 P3hYdHWJhDQT5AeGVLjhYoBv8rFlLGYJ+iT4kwwuoCq7ij6PAH+3W+0bX3iFU8zcqs27K6xjfGb
 sbUlGKRYHkaOtZTnM0fFmV6NRONE+fk=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afec5c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=p39lXgXYR0dHnsPWrG8A:9
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

Extract node-based thermal zone registration so subsequent aggregation
support can reuse trip, monitoring, cooling-map and critical-action
handling. Pass initialized zone parameters into the shared helper and
keep legacy slope and offset parsing in the hardware sensor path.

Keep device node ownership in the lookup wrapper and preserve existing
source registration and enablement behavior.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 70 +++++++++++++++---------------------
 1 file changed, 29 insertions(+), 41 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 9e96fb1b033e..710ff25140e7 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -363,55 +363,27 @@ static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
 	thermal_zone_device_unregister(tz);
 }
 
-/**
- * thermal_of_zone_register - Register a thermal zone with device node
- * sensor
- *
- * The thermal_of_zone_register() parses a device tree given a device
- * node sensor and identifier. It searches for the thermal zone
- * associated to the couple sensor/id and retrieves all the thermal
- * zone properties and registers new thermal zone with those
- * properties.
- *
- * @sensor: A device node pointer corresponding to the sensor in the device tree
- * @id: An integer as sensor identifier
- * @data: A private data to be stored in the thermal zone dedicated private area
- * @ops: A set of thermal sensor ops
- *
- * Return: a valid thermal zone structure pointer on success.
- *	- EINVAL: if the device tree thermal description is malformed
- *	- ENOMEM: if one structure can not be allocated
- *	- Other negative errors are returned by the underlying called functions
- */
-static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
-							    const struct thermal_zone_device_ops *ops)
+static struct thermal_zone_device *
+thermal_of_zone_register_node(struct device_node *np, void *data,
+			      const struct thermal_zone_device_ops *ops,
+			      const struct thermal_zone_params *params)
 {
 	struct thermal_zone_device_ops of_ops = *ops;
 	struct thermal_zone_device *tz;
 	struct thermal_trip *trips;
-	struct thermal_zone_params tzp = {};
-	struct device_node *np;
 	const char *action;
 	int delay, pdelay;
 	int ntrips;
 	int ret;
 
-	np = of_thermal_zone_find(sensor, id);
-	if (IS_ERR(np)) {
-		if (PTR_ERR(np) != -ENODEV)
-			pr_err("Failed to find thermal zone for %pOFP id=%d\n", sensor, id);
-		return ERR_CAST(np);
-	}
-
 	trips = thermal_of_trips_init(np, &ntrips);
 	if (IS_ERR(trips)) {
-		pr_err("Failed to parse trip points for %pOFP id=%d\n", sensor, id);
-		ret = PTR_ERR(trips);
-		goto out_of_node_put;
+		pr_err("Failed to parse trip points for %pOFP\n", np);
+		return ERR_CAST(trips);
 	}
 
 	if (!trips)
-		pr_info("No trip points found for %pOFP id=%d\n", sensor, id);
+		pr_info("No trip points found for %pOFP\n", np);
 
 	ret = thermal_of_monitor_init(np, &delay, &pdelay);
 	if (ret) {
@@ -419,8 +391,6 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 		goto out_kfree_trips;
 	}
 
-	thermal_of_parameters_init(np, &tzp);
-
 	of_ops.should_bind = thermal_of_should_bind;
 
 	ret = of_property_read_string(np, "critical-action", &action);
@@ -432,7 +402,7 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 	}
 
 	tz = thermal_zone_device_register_with_trips(np->name, trips, ntrips,
-						     data, &of_ops, &tzp,
+						     data, &of_ops, params,
 						     pdelay, delay);
 	if (IS_ERR(tz)) {
 		ret = PTR_ERR(tz);
@@ -440,7 +410,6 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 		goto out_kfree_trips;
 	}
 
-	of_node_put(np);
 	kfree(trips);
 
 	ret = thermal_zone_device_enable(tz);
@@ -455,10 +424,29 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 out_kfree_trips:
 	kfree(trips);
-out_of_node_put:
+	return ERR_PTR(ret);
+}
+
+static struct thermal_zone_device *
+thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+			 const struct thermal_zone_device_ops *ops)
+{
+	struct thermal_zone_params tzp = {};
+	struct thermal_zone_device *tz;
+	struct device_node *np;
+
+	np = of_thermal_zone_find(sensor, id);
+	if (IS_ERR(np)) {
+		if (PTR_ERR(np) != -ENODEV)
+			pr_err("Failed to find thermal zone for %pOFP id=%d\n", sensor, id);
+		return ERR_CAST(np);
+	}
+
+	thermal_of_parameters_init(np, &tzp);
+	tz = thermal_of_zone_register_node(np, data, ops, &tzp);
 	of_node_put(np);
 
-	return ERR_PTR(ret);
+	return tz;
 }
 
 static void devm_thermal_of_zone_release(struct device *dev, void *res)
-- 
2.43.0

