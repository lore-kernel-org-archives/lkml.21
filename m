Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008529;
	b=xSmd/wucuZVzrEXnNOk044fhMDcpb77xDUjVwn5JMcssm4/Vwee3Q2MsIL37SzOjiRjd
	 FV6CYcHwY1C8q3ppYEaQ0ExVlQGcpx34cFWfMqJeDsqF22H6XP/AzLuOJS1rSFE94yT9c
	 DM2HuWh+UI2unMq0dMi/E3MchTXGrJ1EyLFXX/oZ4j8VQmPhai9/+bnGbGFJ93to4/Ebc
	 bh9kiz8jqbVXuXe9D7bgPupg0tRxNuLYRToNX65FHG9UnA/HvOzAwcDZIPsgf0acV4sRX
	 Vrm2zZ4QXtAK1xkMh+oiZjpobmJOcSNnUcK5jXfcwPhNt9xotwpl5aPWfZT70rRF6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/bUX1o10AeaLg2EvHKlQx3MEISY3ApyjT1Rh2bWzuqk=;
	b=JrZBKx+muBrw2BJrdZowPAWnR2h5Ij2/a6vg2uDDe3xjywfrJ4w3yv4th7OdC1JMh6R/
	 rqRIJgG4OLNnlucttU108E+mhoDmXTDtEPj8eM6uz5zZ12xyDkR6nZc49KNot+8Bsc8sJ
	 2o32+Rlv7UJQQCNTrsjOKkdEeaKfH4paMGD6ROPEE4SdqQ5P9TvcyDgI2HVmjk1+D7AcG
	 4/SzWesEM0lM8b+Cg3BoRUaIKk12bS2S0Zr7pV2am8LSfLGLLmrVij2XOOJwyMwvjmnLS
	 XkjRx+H0RGtyOKtpBIP/XygdnElKuW4SvyQmIavSuxymSTBH24YhiAZIpCNPGHoeMlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qScRVsHn;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898C606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4898C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qScRVsHn
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so10040905e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795008527; x=1795613327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bUX1o10AeaLg2EvHKlQx3MEISY3ApyjT1Rh2bWzuqk=;
        b=qScRVsHn8cSlX/3DL2rr9yiE2sN5/ZgLpiSyjB6ojZVGViN3m68W4dUYp9qrPLtEAp
         Tmpmkfs205keydruSvyAJWphhGwh45T+tPQzJRsdFgfvjeED5u8e5SmEpmsqOvjI2OTF
         6YbXMAT/9WhAQHpt9fzS3NjGfqiwSQMceXebHzPvliCmNvc9Dc+lG1foOSRz0jSL0Vu0
         l5DbgrFdGkuokXt26LCuajKNpZzm8ssPt4d9M7q0XqLaYLDWHcsa9j1jD1DP2EyPCRlT
         6AgUUia1VRqFQ8NUCPk6rkUUuHsVYuJc3BHL9NXpkqJLfCScTQ/piwJt4MGPgvI5quw7
         /AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008527; x=1795613327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bUX1o10AeaLg2EvHKlQx3MEISY3ApyjT1Rh2bWzuqk=;
        b=klESlSGN2WlG5bGsXwTlEXpNckoWQlTYpLeRV5Rn3BVMbbe+qxZhofPNrd0KrYxlLh
         sFr0/FTpBVz7EIu2CqkvmNdlTKeRP2CK7iUBPu/FDAHHifZU9NzV5wSGedFv6sQezNyY
         jYcqiCrcpbemF6Bje+QjantNh9Fj4ehgGgBqPXqTzCf2mVBpGkvRhA1dVJylya0LaTh2
         lD6PBrdQb6WscqKWDAC3rpOKsf0qXa+QJ3roqnHGmB7HlW4pOfu91fUVDR3AvTPpjlZO
         Un09eid20ZHY72P37Z62+SqxH2nV5E/UfXzMfjNlBNsFn8ai7Dt85z91C8fVdjYSB8Se
         AU/A==
X-Forwarded-Encrypted: i=1; AL+hErH7QujICkCIygS1NsYlbsNNPPkKkeB5zR0nz1o/gErtqPrd/s/vkuYCmx0PnIoLL63GHLjPSL3T12zMifI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sN2c9L8qkTnp/5x0PkpHORT6VzyBFz8O+KR5ixIhMkjEYgZT4
	X4oUKTzLqzSdqKE9pjX/72Vffj64ij2WedtwF4RlUxyUDsHGnAhzNCmaDN7DB7yV1Dc=
X-Gm-Gg: AYBFou1g/oWVPbjwnk9W2qOx7qkF7TJoUBNbP3dnusKDzY9IZDs/fxfsoTVLT1eV/q4
	ht16Z319aNYmDkmZWZBXTibhuhB1IHTt4xJyhlrtQLaARY+U8il9tSMJG7P6BDdtDWFmX2wS4nX
	05zbqqvd68h7aAfZqxZmFSBP6S7h3P5BXQLEeGfHvtIwXvpEF71T7smwHuoWCY2RQCE9C7Shr+i
	GMq3Tmcfas289QQZKNOBkIHfJ6hHgzgL84KWr2Enm3tJPxTEkobpDd8lcZmrv1dV1KHfUBugzZJ
	rZTQYtZbDNF/9Yr+tiVVqjNOUa2OUh0yrApOGBBqDWPoriRFj4d9rguUa/617RgTMcExnhFkmZY
	1FYlPhkbpA/VrdKJRWqJl+dNeFmb2gunRHUNg58DvyhbrSB2bcJ2GQxfisrB51yeppexJSBZVHi
	wiGbuFi/rKgcAhsUkzjdm6pLd+n5WrMSBvfdE4O+5pM/1r8rxAqimMeL1jzPsTVPR649OjSEV8J
	CnHdEUpFr9gw9NVYYWCZWTRzqryoS97nFTgEiGWUckpb9WmWD7lD5q8q+UO1U0lcBwF/dQ8AU7q
	f3GeWoLBtG0F/jstksZkjgwjwkaW7+NaqJAlKOJ3AQbMKOVUWLren2vHbzEo
X-Received: by 2002:a05:600c:4e44:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb7da12957mr47322395e9.9.1795008527371;
        Wed, 18 Nov 2026 05:28:47 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7df07ff6sm38205175e9.4.2026.11.18.05.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 05:28:46 -0800 (PST)
Message-ID: <4d51fe5f-d233-44d4-a50e-ef168b6f0402@linaro.org>
Date: Wed, 18 Nov 2026 15:28:45 +0200
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
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: krzk@kernel.org, rafael@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, Juan Yescas <jyescas@google.com>
References: <20261117083442.830549-1-christian.loehle@arm.com>
 <3ea5d94b-6913-4534-816a-3935c689225b@linaro.org>
 <56a7a762-7667-4186-973c-ca0fcb399ecc@arm.com>
 <b2b0ddc6-964f-4d8d-86d4-a0bc24d9022e@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b2b0ddc6-964f-4d8d-86d4-a0bc24d9022e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 2:06 PM, Christian Loehle wrote:
> On 11/17/26 16:41, Christian Loehle wrote:
>> On 11/17/26 15:37, Tudor Ambarus wrote:
>>> Hi, Christian,
>>>
>>> Thanks for the patch!
>>>
>>> On 11/17/26 10:34 AM, Christian Loehle wrote:
>>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command
>>>> writes all eight slots, zero-filling the rest. On GS101, slot 7
>>>> controls autonomous CPU throttling even when its interrupt is masked.
>>>> Programming it to 0 C limits all three CPU clusters to about 200 MHz
>>>> on Pixel 6, while cpufreq continues to report the requested
>>>> frequencies.
>>>
>>> Could you share how you discovered this? I don't have access to the
>>> ACPM firmware sources, and the downstream driver doesn't state it
>>> either.
>>
>> Neither do I, I discovered this randomly through running regression tests
>> on Energy-Aware Scheduling on the Pixel6 and acpm-tmu (7.4-rc1) causes a
>> massive energy regression (+~1000%) for the same workloads.
>> The reason is this DVFS throttling.
>>
>>>
>>> How did you measure the actual CPU frequency, given that cpufreq
>>> keeps reporting the requested one?
>>
>> PMU counters CPU_CYCLES
>>
>>>
>>> Do you know whether slots 2-6 have any side effects as well?
>>
>> I hadn't discovered any.
>>
>>>
>>> Also note that Daniel has already queued a set of acpm-tmu fixes in
>>> thermal/linux-next, so this patch will need to be reworked on top of
>>> them.
>>
>> will rebase then!
>>
>>>
>>>>
>>>> Program slot 7 from the zone's critical trip before enabling the
>>>> sensor and preserve it when updating the low/high interrupt window.
>>>> Cache the three temperatures so a writable critical trip can update
>>>> the hardware without changing that window.
>>>
>>> I think this can be handled with a smaller change: look up the
>>> critical trip in .set_trips() itself. The zone lock is held there, so
>>> for_each_thermal_trip() can be used. That avoids caching
>>> low/high/critical, the .set_trip_temp() callback and the probe changes.
>>
>> Ah yep you're right, will fix and resend.
>> Thanks!
> 
> Okay, maybe I'm missing something but AFAICS we have to do the set_trip_temp
> because thermal core looks only at min/max and may skip set_trips() in case

ah, you're right!

> these are unchanged, missing a critical update.
> So the minimal I see working is making 'critical' (again, this is my
> interpretation of the value, if you want it named anything else, just shoot)
> non-writable by failing it's set_trip_temp()?
> Or is there another way?

While I like it, the problem is that the trip is writable in sysfs but
always failing.

An alternative is to touch the core and let OF drivers mark trips
read-only but maybe this is not suitable for a quick fix. We need to
involve Daniel.

So I think your v1 approach of caching and updating the hardware from
.set_trip_temp() is the right one after all. I'd just look up the
critical trip in .set_trips() instead of caching it from probe, and
cache the last programmed thresholds and interrupt mask.

Would something along the lines work?

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 7c30401f8fc7..b2e5b1f6641a 100644
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
+	/* Last programmed thresholds, protected by the thermal zone lock */
+	u8 thresholds[ACPM_TMU_NUM_THRESHOLDS];
+	u8 inten;
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
@@ -267,14 +275,56 @@ static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
 	return ret;
 }
 
+static int acpm_tmu_get_crit_temp(struct thermal_trip *trip, void *arg)
+{
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
+				       u8 thresholds[ACPM_TMU_NUM_THRESHOLDS],
+				       u8 inten)
+{
+	struct device *dev = sensor->priv->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = acpm_tmu_update_thresholds(sensor, thresholds, inten);
+	if (!ret) {
+		memcpy(sensor->thresholds, thresholds, sizeof(sensor->thresholds));
+		sensor->inten = inten;
+	}
+
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
 	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
-	struct acpm_tmu_priv *priv = sensor->priv;
-	struct device *dev = priv->dev;
-	u8 thresholds[2] = {};
+	u8 thresholds[ACPM_TMU_NUM_THRESHOLDS] = {};
+	int crit = INT_MAX;
 	u8 inten = 0;
-	int ret;
+
+	/*
+	 * The firmware programs all thresholds at once. Set the hardware trip
+	 * to the lowest critical trip temperature, so that it never fires
+	 * below the point where the thermal core shuts the system down. If
+	 * the zone has no critical trip, crit stays INT_MAX and is clamped to
+	 * the highest threshold value.
+	 */
+	for_each_thermal_trip(tz, acpm_tmu_get_crit_temp, &crit);
+	thresholds[ACPM_TMU_HW_TRIP_THRESHOLD] =
+		clamp_val(crit / MILLIDEGREE_PER_DEGREE, 0, 255);
 
 	/* If a valid lower bound exists, set the threshold and enable its interrupt */
 	if (low > -INT_MAX) {
@@ -288,15 +338,28 @@ static int acpm_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
 		inten |= BIT(1);
 	}
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	return acpm_tmu_program_thresholds(sensor, thresholds, inten);
+}
 
-	ret = acpm_tmu_update_thresholds(sensor, thresholds, inten);
+static int acpm_tmu_set_trip_temp(struct thermal_zone_device *tz,
+				  const struct thermal_trip *trip, int temp)
+{
+	struct acpm_tmu_sensor *sensor = thermal_zone_device_priv(tz);
+	u8 thresholds[ACPM_TMU_NUM_THRESHOLDS];
 
-	pm_runtime_put_autosuspend(dev);
+	if (trip->type != THERMAL_TRIP_CRITICAL)
+		return 0;
 
-	return ret;
+	/*
+	 * The thermal core skips .set_trips() when the low/high window does
+	 * not change, so update the hardware trip threshold here, keeping the
+	 * last programmed window.
+	 */
+	memcpy(thresholds, sensor->thresholds, sizeof(thresholds));
+	thresholds[ACPM_TMU_HW_TRIP_THRESHOLD] =
+		clamp_val(temp / MILLIDEGREE_PER_DEGREE, 0, 255);
+
+	return acpm_tmu_program_thresholds(sensor, thresholds, sensor->inten);
 }
 
 static int acpm_tmu_change_mode(struct thermal_zone_device *tz,
@@ -329,6 +392,7 @@ static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
 	.change_mode = acpm_tmu_change_mode,
 	.get_temp = acpm_tmu_get_temp,
 	.set_trips = acpm_tmu_set_trips,
+	.set_trip_temp = acpm_tmu_set_trip_temp,
 };
 
 static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)


