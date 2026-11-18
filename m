Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010480;
	b=33qTMgqYyOBlvo/4hL+xpaeQxm3cF7W4q64syiv46jNl+IcIkKZBucVpQFTm4l606Lbm
	 xX+tzePrtBbBWryglUAFw05Knv43VjHqE0HcQ+rG/IGQhAyOV4625+ALi1eU9EmmygyLo
	 tE0CfmwEvMkeXVwG3kYnSRmCD+L0rRhgGeYOBFfntpcvZ+im7LwLd2feIOo8Ybq1jkwZ2
	 CjLa1bBvxD5JapfC80ZJnRuC4O7AaL+BXasD7ntsdiw+pYYQ3+/1XjOnnr3z/PhHTpzzK
	 Ka1a0UijZXVqmZJC8J1MZ2Iv/oEDmOU/bogE85dnXmEUA9apRUdYNZ2+kf68E0M3r4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=SQBL/pm8ssQ4h2Vnf/mf2PH79AlhPBjy2NJAi+slih8=;
	b=XgsXfpihCqDrTvzdGfaZWiQQ0VXeMf99n8+O3n9E5aTEkcfQ2VWwjFrBg9CKomRXZHOT
	 ae4PytU3nnuTmv0a0sP+4ghtpO3/7wBZlwoWkE1Yxi8sv+IEQ1UHWVRLaDXwuIPH2cToq
	 nEhr3ku8362B0280M2dw1i3j4SWq5tDsqw9E7Xch7vpcsfAn1BCQYsGrmMs9EjDeictJV
	 ecwspOTaZUvIy8/XHZu09JcB6cvZ1bLO/mHwE86Tt4IX+qhTIq6MCAae7ONoCpvu2v6pI
	 pkJM1TL7Yv8Ah3AEO/OiIf6uFznIZslMD6AteZhJ+whn/Peo5JExDLPTUdGEhDS0RJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jS4aIIkB;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D5606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52D5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jS4aIIkB
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9357275e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795010478; x=1795615278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQBL/pm8ssQ4h2Vnf/mf2PH79AlhPBjy2NJAi+slih8=;
        b=jS4aIIkBn1GkKpz/AmCsxNZ8+ib0VEwLgKDAaLBW+jQXaz+OFbxh0AwL5jZSuzrnQA
         6aYFUIXGUAbzIvTFy75MfykZeitXKFTE7m9ztElrn85/vV1Erx21+RSswv8q5dcXcynp
         rLk+AZ4z9EUjWwtwyRDJNrU/qSpXgWn06BvctbmrolhMMz1SuhSM+C2QJe0cAAzWv4w3
         gZqIa4dE2FfkcDAORc/hsit1wKMxpTzz+8OEA8oNNJr7dQwdP3PtyDmOtw1mIOshHSy6
         D5scBVdjX7uXxl1+DRW8CkNvToZ4NnaVwTCKUMJE/r/vVpwIAfnK5c6SUj3/aYPdy7BR
         1WUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010478; x=1795615278;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQBL/pm8ssQ4h2Vnf/mf2PH79AlhPBjy2NJAi+slih8=;
        b=haNPpthN3iZk8qw0qJs/qgZsk3g9sqOsUNwqczo+PjXhk8qDKdiFjMjb5lqzGXy3qh
         5VHoBp+7tbXnOZ9q8kNpbWPwurVJGfMFirifJ/N4w0Gt7lEDyHBfGTl98kBB98ceMVa2
         rfSm6W/XhOr32PzNj29SaabWhSnsLvTJdpph9KaVigrENL5graoc65QRwDuW6k/sMT1B
         bov8khyfpLfgyAnhZOlDlsaiB6oMBxu4ZbPtDCVaW1phiqh4mWxvaEouspY2i8LX2BYE
         i8Ible4eBke8izl4OqzaCRm/usiMh49JmsK+vnjv7cUJDU1+PJcOiAXLihy1Ma7d1MeM
         8Azg==
X-Forwarded-Encrypted: i=1; AL+hErHTm7g8Ft3Wla+scH0m+tLH6Nn7FNk1eExPOs/31cfjNvbIp4RAMzZW6UBLaEyzyOMlS65xUjjBDIymRQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z81xOvG8DYKCmn0tNg7unG7Htt0bNpzjvLUXfRRxt4sCQAGZTVd
	lK0j4BKc+xWePcm0TuIgMDeYS3MzRY1IK/NBwD0U7RpfYuPvWefKg3X9i3cTk/NHoN8=
X-Gm-Gg: AYBFou2td5UECSuX7zQqPQoiJlpGhQaudLmMIgB6KzXRiV61u4fqh+k1k0WoB2KHTbZ
	sQRUN9QtR8xflZq6zMjcX6DJLtH36ceXpyJoQOMm3nCML3Bis+jz4q0Te/X8/Gkue7lZgphcnNv
	FUBLNzLqXrQfsg2TU0mdAflA+t/BEBnzdHftTaup8s4D/Ul2/OcOOB8hZVhNEygx/3m20k+e+xV
	cjNdQaljPO9FrYYsT3y4i8HndpGld4gAVQw8Sdc4ILSJP50yNk6iOnQhObJKjrM8gRTxS3979/A
	nvLT0Jducv8uYdAZfV6CbN9PpA1D8UUg/lXyU+jrPyULKZ48tc06gPAyIZYPOTwpZbHhnNITAeP
	FqweqUbiAzaaQuxJFFRAMPq4U14ccLNmYTvtuf9TMIug8b+X5gIeGLUnrvXxvixnwt+xf9hHkZX
	dloXlKXLC/wLL6vPacIu3JbdmhuyNoPMddVBW6CwnTwo+RCQtzwpkxaEp9DDi/m8L2u2DcBIcr4
	v3JQTYJ+n/pvjzsACwtShM3XcBYU+X3WozhugVx1+N8S6pdL8cD2wL6M31gEzZTzWzR15vlCx1+
	pBeeEHhzoQAKn8rzmDJtkm+qdcdOe4dv8DtZlsE=
X-Received: by 2002:a05:600c:6746:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb7da19d44mr49686225e9.13.1795010477916;
        Wed, 18 Nov 2026 06:01:17 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm4649341f8f.38.2026.11.18.06.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:01:17 -0800 (PST)
Message-ID: <2cc6efc8-db35-4b40-ab71-815f08ed9dc9@linaro.org>
Date: Wed, 18 Nov 2026 16:01:16 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: samsung: acpm-tmu: Fix spurious CPU throttling
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: krzk@kernel.org, rafael@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, Juan Yescas <jyescas@google.com>
References: <20261117083442.830549-1-christian.loehle@arm.com>
 <3ea5d94b-6913-4534-816a-3935c689225b@linaro.org>
 <56a7a762-7667-4186-973c-ca0fcb399ecc@arm.com>
 <b2b0ddc6-964f-4d8d-86d4-a0bc24d9022e@arm.com>
 <4d51fe5f-d233-44d4-a50e-ef168b6f0402@linaro.org>
Content-Language: en-US
In-Reply-To: <4d51fe5f-d233-44d4-a50e-ef168b6f0402@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:28 PM, Tudor Ambarus wrote:
> Would something along the lines work?

Thinking more about it, caching the window instead of the raw
thresholds is simpler and closer to your v1, as inten derives from
low/high anyway. Maybe this:

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 7c30401f8fc7..8422a7c970e7 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -39,6 +39,10 @@
 
 #define GS101_REG_INTPEND(i)		((i) * 0x50 + 0xf8)
 
+#define ACPM_TMU_NUM_THRESHOLDS		8
+/* Threshold 7 throttles the CPUs in hardware, regardless of the INTEN mask. */
+#define ACPM_TMU_HW_TRIP_THRESHOLD	7
+
 enum {
 	P0_INTPEND,
 	P1_INTPEND,
@@ -70,6 +74,9 @@ struct acpm_tmu_sensor {
 	struct acpm_tmu_priv *priv;
 	struct mutex lock; /* protects sensor state */
 	enum thermal_device_mode mode;
+	/* Last programmed window, protected by the thermal zone lock */
+	int low;
+	int high;
 	bool enabled;
 };
 
@@ -228,7 +235,8 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 }
 
 static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
-				      u8 thresholds[2], u8 inten)
+				      u8 thresholds[ACPM_TMU_NUM_THRESHOLDS],
+				      u8 inten)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
 	struct acpm_handle *handle = priv->handle;
@@ -249,7 +257,7 @@ static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
 	}
 
 	ret = ops->set_threshold(handle, mbox_chan_id, acpm_sensor_id,
-				 thresholds, 2);
+				 thresholds, ACPM_TMU_NUM_THRESHOLDS);
 	if (!ret) {
 		ret = ops->set_interrupt_enable(handle, mbox_chan_id,
 						acpm_sensor_id, inten);
@@ -267,12 +275,22 @@ static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
 	return ret;
 }
 
-static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
+static int acpm_tmu_get_crit_temp(struct thermal_trip *trip, void *arg)
 {
-	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
-	struct acpm_tmu_priv *priv = sensor->priv;
-	struct device *dev = priv->dev;
-	u8 thresholds[2] = {};
+	int *temp = arg;
+
+	if (trip->type == THERMAL_TRIP_CRITICAL &&
+	    trip->temperature != THERMAL_TEMP_INVALID)
+		*temp = min(*temp, trip->temperature);
+
+	return 0;
+}
+
+static int acpm_tmu_program_thresholds(struct acpm_tmu_sensor *sensor,
+				       int low, int high, int crit)
+{
+	struct device *dev = sensor->priv->dev;
+	u8 thresholds[ACPM_TMU_NUM_THRESHOLDS] = {};
 	u8 inten = 0;
 	int ret;
 
@@ -288,17 +306,61 @@ static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 		inten |= BIT(1);
 	}
 
+	/*
+	 * The firmware programs all thresholds at once. Set the hardware trip
+	 * to the critical trip temperature, so that it never fires below the
+	 * point where the thermal core shuts the system down.
+	 */
+	thresholds[ACPM_TMU_HW_TRIP_THRESHOLD] =
+		clamp_val(crit / MILLIDEGREE_PER_DEGREE, 0, 255);
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
 	ret = acpm_tmu_update_thresholds(sensor, thresholds, inten);
+	if (!ret) {
+		sensor->low = low;
+		sensor->high = high;
+	}
 
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
 
+static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+	int crit = INT_MAX;
+
+	/*
+	 * Use the lowest critical trip temperature. If the zone has no
+	 * critical trip, crit stays INT_MAX and is clamped to the highest
+	 * threshold value.
+	 */
+	for_each_thermal_trip(tz, acpm_tmu_get_crit_temp, &crit);
+
+	return acpm_tmu_program_thresholds(sensor, low, high, crit);
+}
+
+static int acpm_tmu_set_trip_temp(struct thermal_zone_device *tz,
+				  const struct thermal_trip *trip, int temp)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+
+	if (trip->type != THERMAL_TRIP_CRITICAL)
+		return 0;
+
+	/*
+	 * The thermal core skips .set_trips() when the low/high window does
+	 * not change, so update the hardware trip threshold here, keeping the
+	 * last programmed window.
+	 */
+	return acpm_tmu_program_thresholds(sensor, sensor->low, sensor->high,
+					   temp);
+}
+
 static int acpm_tmu_change_mode(struct thermal_zone_device *tz,
 				enum thermal_device_mode mode)
 {
@@ -329,6 +391,7 @@ static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
 	.change_mode = acpm_tmu_change_mode,
 	.get_temp = acpm_tmu_get_temp,
 	.set_trips = acpm_tmu_set_trips,
+	.set_trip_temp = acpm_tmu_set_trip_temp,
 };
 
 static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)
@@ -479,6 +542,8 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 		mutex_init(&sensor->lock);
 		sensor->group = &data->sensor_groups[i];
 		sensor->priv = priv;
+		sensor->low = -INT_MAX;
+		sensor->high = INT_MAX;
 
 		tzd = devm_thermal_of_zone_register(dev, i, sensor,
 						    &acpm_tmu_sensor_ops);

