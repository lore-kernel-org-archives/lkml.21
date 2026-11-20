Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140659;
	b=3ziWC2dy6SGymjR4wgo19axP9ebpPqqs9j0UBtJV5ybFg38G7Y9Zj/SkBMq6Tu6wuY9F
	 v4nVo6jYC7oDebsqxSAz1yQDzL4+N4QxtBXk5ayW3XAixJo1//CE0OAtzdoJiuXbhO87k
	 4UWmmqV8fpQOGi3ZDVktWU3HHh0my4WPKSex+y6u010CDdUNE9y66wF8Ed8SDkpe9aQOW
	 6y0AFw9lr/EvPOTxdDP/AUDyOKo0459TvNgpL+T0wJpPdauLIrS3WcAgPQHlIpaILwTCm
	 KdE6SXhjCL6bLaWYho1ZLyMtJ4DM8Z1cv7br7UNDgVKIVXAL1vZfgjN4i81WfE/k61w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BMxfy08tBRB54t7CG6GTXuPZbHw83JnbCHGykFB+1VA=;
	b=Ag/MAiQGJM1156BmB4rHlJOIZuqo/DY12axJ6MLgy+R9Xobhk9mbdhR6heC/DfdVLi+9
	 9HxDtGMMft8sa0HIwytvegDDHObQc+0d2OhhEUcR0WGailO0HLnPi3CgDKHGI5+xgB/Dd
	 OZvG/cw3CwfiUoxPAeTa/LT4vLw8kd6GOl3B0XBCUIHIcoUmzVg622u6sIE2hteM7yV74
	 ZRUUsE5AIuMfST3uZoQYLOrXXI/R+XWTWKU564qEeFIOfiwX13IOerSr4CjpWDA2w7h2v
	 a0nXB2bRmx8PBBPllY2SUU6FShI9t4MJEr5g8xMKwB2BrIEDcRXhv54aDqBStnmOWJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reflexrobotics.com;
	spf=pass smtp.mailfrom=reflexrobotics.com;
	dkim=pass header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wu94qisN;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DCB606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DCB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wu94qisN
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4944a0eso378356c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reflexrobotics-com.20260707.gappssmtp.com; s=20260707; t=1795140657; x=1795745457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMxfy08tBRB54t7CG6GTXuPZbHw83JnbCHGykFB+1VA=;
        b=Wu94qisNlhaw02+tYIAnaGuz0WE/tnd05VOlJmPWp851mZWzfubxkusuExlwOOFYLk
         Vwz1EnLY1iKOjrJIHs7cUfQc5Ce4RaBgRCFvQM9J1uNtC/Jumj1YNOg4HU9pHRBJ+Lk0
         8rTp87CmKoYXfXHGebRyZthHKBZkwLWPKDG+zlNiW9GwYWna++HUi9fpYcU+WRgKdRE4
         r+d1V2D9ng1YtB9/EhX0+v+JzORFvQiPLU3OmpaUFK0RLlDkJxB3orObaoHCSuSACe72
         RQKeeaJTlhY/uuTOlXPf6fWWbo9THLtrf6YAbReoQupFFCaF3bMfDXeBZx6/C1PGky2W
         rEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140657; x=1795745457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMxfy08tBRB54t7CG6GTXuPZbHw83JnbCHGykFB+1VA=;
        b=oJI8LyV0JVsF94/oAHzeeCJ/2UkhoWn63yx50Dc0i5BCTlRRAG/Finllfl0guAtoe5
         r3clC2vfKsZzaRx9kZlMFX2o4wkJzbQ+FbfJu5i4nT5k5nhd2/j1n0tCi8k4V2jUE8sd
         t9oLmoq5W9DyuyZA2o9mic9qp3xvP/5n9M0RyGZ9s9NMNlEMnWQFMYOChlUVPaxhSzUB
         vIszHREtsvvteyguDT6PsCKcbT6cpyqELOybs2hyn1YGerzg0mudA6UC1aVoOEDuO4s/
         WJc/BXKGGNVtc3hGCH89IEMvE2VCP8GRaKfGI2hlOBz7S63A54qLJc7/sUka6Wjg804i
         0yCA==
X-Forwarded-Encrypted: i=1; AL+hErHn3XCFWem2HlRlBizzZsDyxoerSmkKavasQfQUlAeGyBlpk5deD/K1W6fddH2KdGKfWWO6aNkhIqTqwEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZqToNkiZG1FOrp7QtHEhuBMHBTf/94tUV6U9WHwusjXZg/mIb
	nQ3qB2XJXXfhY42dC2OTdWbXUtXmPrkGf1xLOKYp7766gZWUWkqTbalPHPgJPpnrjK8=
X-Gm-Gg: AYBFou3NtlndPCg99e/7nf7HUFX8FSNKeqU1TGQ1aEDwjS5j9++T9+30jsTOPxx6zIQ
	wDsFUZdHOyHH2UXO63AyM/zzPhatM1lJ9e77OUg2KnorjzqNYy4mPLnnZ8hKFieMNufagdO3dfa
	6aANxdFf01WZOESoUbSqJ41wwWaypd6uMLlek57qLVKnfFVMVbCSWlfQDdarsH1tp0DbiW07hKo
	lxo7+v//IMhmxp7uCLSP3d+O/BEFdnqA0iGJR7/LsgzMH0bPI4qTW1+18UuBAD/E4CsQ/SATnaC
	rnOf2QXQMWMLEukW5dj8b58ZDr76pu5VS2OB6VCO1W5F7Z0/uS2G/3fw/tH1cL+sc47pWy5UR3A
	JvK3bqXG303DNzZs0P95U3dYWv7ZHI3QYdLkPzkYmAEXNwOzEOY5rFh+BeL61itcYiIb98j0VuG
	ZIZlLZ+k0HWJncMpLJxTBTaoGOPMoxlTvrRvHN/brmQLDBIqhWyRnUn72/6F4HxHx3tuRVXE37c
	cgCemMW5BLgAL4teqTImFauhHDr3zCK03B9RvhR97eO/Gqbn2XhtM5+IeQXUxQJqjh2oP4/6ir2
	TXG3mGQvPgcgSwYVnB/zraGtdUb6QkUB33te3adxdU1OSxiuJpiabMQBLDkPw81Oh1Gy0sIt2QY
	oHS9TkYP7Oktr3JjvR+hUNuw=
X-Received: by 2002:a05:7022:f516:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b5568ded03mr1243863c88.25.1795140657357;
        Thu, 19 Nov 2026 18:10:57 -0800 (PST)
Received: from localhost ([76.51.7.19])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b556831d45sm3572198c88.11.2026.11.19.18.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:10:56 -0800 (PST)
From: Joe LeVeque <joe.l@reflexrobotics.com>
To: jean-baptiste.maneyrol@tdk.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe LeVeque <joe.l@reflexrobotics.com>
Subject: [PATCH 2/2] iio: imu: inv_icm42600: remove temperature sensor enable/disable
Date: Thu, 19 Nov 2026 18:08:50 -0800
Message-Id: <20261120020850.24318-3-joe.l@reflexrobotics.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120020850.24318-1-joe.l@reflexrobotics.com>
References: <20261120020850.24318-1-joe.l@reflexrobotics.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver turns the temperature sensor off (PWR_MGMT0.TEMP_DIS) whenever
nothing has requested temperature data. With the temperature sensor
disabled, gyro data is not temperature compensated internally. On an
ICM-42688-P this shows up as a large, stable gyro offset at rest: about
-139, 379 and -229 LSB at +-2000 dps (8 to 23 dps), instead of under
0.5 dps once the temperature sensor is enabled by a temperature read or
a buffer with the temperature channel.

There is no benefit in disabling the temperature sensor, so remove the
enable/disable handling and keep it always on: drop temp_en from the
sensor configuration and the suspend state, the temp argument and
TEMP_DIS handling from inv_icm42600_set_pwr_mgmt0(), the temperature
startup delay, and inv_icm42600_set_temp_conf() with its callers. The
temperature sensor now starts with the gyro or accel, whose startup
delays are longer.

Temperature reporting in the FIFO is still enabled and disabled with
the buffer's temperature channel.

Fixes: 31c24c1e93c3 ("iio: imu: inv_icm42600: add core of new inv_icm42600 driver")
Suggested-by: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
Signed-off-by: Joe LeVeque <joe.l@reflexrobotics.com>
---
 drivers/iio/imu/inv_icm42600/inv_icm42600.h   |  6 ---
 .../iio/imu/inv_icm42600/inv_icm42600_accel.c | 16 ++------
 .../imu/inv_icm42600/inv_icm42600_buffer.c    | 14 ++-----
 .../iio/imu/inv_icm42600/inv_icm42600_core.c  | 37 ++++---------------
 .../iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 16 ++------
 .../iio/imu/inv_icm42600/inv_icm42600_temp.c  |  4 --
 6 files changed, 18 insertions(+), 75 deletions(-)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600.h b/drivers/iio/imu/inv_icm42600/inv_icm42600.h
index 3737e79dbcc1..e2b51f76198a 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600.h
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600.h
@@ -128,13 +128,11 @@ struct inv_icm42600_sensor_conf {
 struct inv_icm42600_conf {
 	struct inv_icm42600_sensor_conf gyro;
 	struct inv_icm42600_sensor_conf accel;
-	bool temp_en;
 };
 
 struct inv_icm42600_suspended {
 	enum inv_icm42600_sensor_mode gyro;
 	enum inv_icm42600_sensor_mode accel;
-	bool temp;
 };
 
 struct inv_icm42600_apex {
@@ -441,7 +439,6 @@ struct inv_icm42600_sensor_state {
 #define INV_ICM42600_ACCEL_STARTUP_TIME_MS	20
 #define INV_ICM42600_GYRO_STARTUP_TIME_MS	60
 #define INV_ICM42600_GYRO_STOP_TIME_MS		150
-#define INV_ICM42600_TEMP_STARTUP_TIME_MS	14
 #define INV_ICM42600_SUSPEND_DELAY_MS		2000
 
 typedef int (*inv_icm42600_bus_setup)(struct inv_icm42600_state *);
@@ -464,9 +461,6 @@ int inv_icm42600_set_gyro_conf(struct inv_icm42600_state *st,
 			       struct inv_icm42600_sensor_conf *conf,
 			       unsigned int *sleep_ms);
 
-int inv_icm42600_set_temp_conf(struct inv_icm42600_state *st, bool enable,
-			       unsigned int *sleep_ms);
-
 int inv_icm42600_enable_wom(struct inv_icm42600_state *st);
 int inv_icm42600_disable_wom(struct inv_icm42600_state *st);
 
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
index cc8c074777c9..71ec968ab8fe 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
@@ -229,37 +229,29 @@ static int inv_icm42600_accel_update_scan_mode(struct iio_dev *indio_dev,
 	struct inv_icm42600_sensor_state *accel_st = iio_priv(indio_dev);
 	struct inv_icm42600_sensor_conf conf = INV_ICM42600_SENSOR_CONF_INIT;
 	unsigned int fifo_en = 0;
-	unsigned int sleep_temp = 0;
-	unsigned int sleep_accel = 0;
-	unsigned int sleep;
+	unsigned int sleep = 0;
 	int ret;
 
 	mutex_lock(&st->lock);
 
-	if (*scan_mask & INV_ICM42600_SCAN_MASK_TEMP) {
-		/* enable temp sensor */
-		ret = inv_icm42600_set_temp_conf(st, true, &sleep_temp);
-		if (ret)
-			goto out_unlock;
+	if (*scan_mask & INV_ICM42600_SCAN_MASK_TEMP)
 		fifo_en |= INV_ICM42600_SENSOR_TEMP;
-	}
 
 	if (*scan_mask & INV_ICM42600_SCAN_MASK_ACCEL_3AXIS) {
 		/* enable accel sensor */
 		conf.mode = accel_st->power_mode;
 		conf.filter = accel_st->filter;
-		ret = inv_icm42600_set_accel_conf(st, &conf, &sleep_accel);
+		ret = inv_icm42600_set_accel_conf(st, &conf, &sleep);
 		if (ret)
 			goto out_unlock;
 		fifo_en |= INV_ICM42600_SENSOR_ACCEL;
 	}
 
 	/*
-	 * Sleep maximum stabilization time before enabling data in FIFO.
+	 * Sleep stabilization time before enabling data in FIFO.
 	 * We need to release the driver lock to not block gyro data processing.
 	 * There is no possible race here since we are under IIO mutex locked.
 	 */
-	sleep = max(sleep_accel, sleep_temp);
 	if (sleep) {
 		mutex_unlock(&st->lock);
 		msleep(sleep);
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
index 7ecd7257921c..c946045c762f 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
@@ -366,9 +366,7 @@ static int inv_icm42600_buffer_postdisable(struct iio_dev *indio_dev)
 	unsigned int sensor;
 	unsigned int *watermark;
 	struct inv_icm42600_sensor_conf conf = INV_ICM42600_SENSOR_CONF_INIT;
-	unsigned int sleep_temp = 0;
-	unsigned int sleep_sensor = 0;
-	unsigned int sleep;
+	unsigned int sleep = 0;
 	int ret;
 
 	if (indio_dev == st->indio_gyro) {
@@ -398,21 +396,15 @@ static int inv_icm42600_buffer_postdisable(struct iio_dev *indio_dev)
 
 	conf.mode = INV_ICM42600_SENSOR_MODE_OFF;
 	if (sensor == INV_ICM42600_SENSOR_GYRO)
-		ret = inv_icm42600_set_gyro_conf(st, &conf, &sleep_sensor);
+		ret = inv_icm42600_set_gyro_conf(st, &conf, &sleep);
 	else if (!st->apex.on)
-		ret = inv_icm42600_set_accel_conf(st, &conf, &sleep_sensor);
+		ret = inv_icm42600_set_accel_conf(st, &conf, &sleep);
 	if (ret)
 		goto out_unlock;
 
-	/* if FIFO is off, turn temperature off */
-	if (!st->fifo.on)
-		ret = inv_icm42600_set_temp_conf(st, false, &sleep_temp);
-
 out_unlock:
 	mutex_unlock(&st->lock);
 
-	/* sleep maximum required time */
-	sleep = max(sleep_sensor, sleep_temp);
 	if (sleep)
 		msleep(sleep);
 
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
index ccaf8ec468f9..5fa6bd2bcea6 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
@@ -123,7 +123,6 @@ static const struct inv_icm42600_conf inv_icm42600_default_conf = {
 		.odr = INV_ICM42600_ODR_50HZ,
 		.filter = INV_ICM42600_FILTER_BW_ODR_DIV_2,
 	},
-	.temp_en = false,
 };
 
 static const struct inv_icm42600_conf inv_icm42686_default_conf = {
@@ -139,7 +138,6 @@ static const struct inv_icm42600_conf inv_icm42686_default_conf = {
 		.odr = INV_ICM42600_ODR_50HZ,
 		.filter = INV_ICM42600_FILTER_BW_ODR_DIV_2,
 	},
-	.temp_en = false,
 };
 
 static const struct inv_icm42600_hw inv_icm42600_hw[INV_CHIP_NB] = {
@@ -228,38 +226,29 @@ u32 inv_icm42600_odr_to_period(enum inv_icm42600_odr odr)
 static int inv_icm42600_set_pwr_mgmt0(struct inv_icm42600_state *st,
 				      enum inv_icm42600_sensor_mode gyro,
 				      enum inv_icm42600_sensor_mode accel,
-				      bool temp, unsigned int *sleep_ms)
+				      unsigned int *sleep_ms)
 {
 	enum inv_icm42600_sensor_mode oldgyro = st->conf.gyro.mode;
 	enum inv_icm42600_sensor_mode oldaccel = st->conf.accel.mode;
-	bool oldtemp = st->conf.temp_en;
 	unsigned int sleepval;
 	unsigned int val;
 	int ret;
 
 	/* if nothing changed, exit */
-	if (gyro == oldgyro && accel == oldaccel && temp == oldtemp)
+	if (gyro == oldgyro && accel == oldaccel)
 		return 0;
 
 	val = INV_ICM42600_PWR_MGMT0_GYRO(gyro) |
 	      INV_ICM42600_PWR_MGMT0_ACCEL(accel);
-	if (!temp)
-		val |= INV_ICM42600_PWR_MGMT0_TEMP_DIS;
 	ret = regmap_write(st->map, INV_ICM42600_REG_PWR_MGMT0, val);
 	if (ret)
 		return ret;
 
 	st->conf.gyro.mode = gyro;
 	st->conf.accel.mode = accel;
-	st->conf.temp_en = temp;
 
 	/* compute required wait time for sensors to stabilize */
 	sleepval = 0;
-	/* temperature stabilization time */
-	if (temp && !oldtemp) {
-		if (sleepval < INV_ICM42600_TEMP_STARTUP_TIME_MS)
-			sleepval = INV_ICM42600_TEMP_STARTUP_TIME_MS;
-	}
 	/* accel startup time */
 	if (accel != oldaccel && oldaccel == INV_ICM42600_SENSOR_MODE_OFF) {
 		/* block any register write for at least 200 µs */
@@ -357,7 +346,7 @@ int inv_icm42600_set_accel_conf(struct inv_icm42600_state *st,
 
 	/* set PWR_MGMT0 register (accel sensor mode) */
 	return inv_icm42600_set_pwr_mgmt0(st, st->conf.gyro.mode, conf->mode,
-					  st->conf.temp_en, sleep_ms);
+					  sleep_ms);
 }
 
 int inv_icm42600_set_gyro_conf(struct inv_icm42600_state *st,
@@ -401,19 +390,11 @@ int inv_icm42600_set_gyro_conf(struct inv_icm42600_state *st,
 
 	/* set PWR_MGMT0 register (gyro sensor mode) */
 	return inv_icm42600_set_pwr_mgmt0(st, conf->mode, st->conf.accel.mode,
-					  st->conf.temp_en, sleep_ms);
+					  sleep_ms);
 
 	return 0;
 }
 
-int inv_icm42600_set_temp_conf(struct inv_icm42600_state *st, bool enable,
-			       unsigned int *sleep_ms)
-{
-	return inv_icm42600_set_pwr_mgmt0(st, st->conf.gyro.mode,
-					  st->conf.accel.mode, enable,
-					  sleep_ms);
-}
-
 int inv_icm42600_enable_wom(struct inv_icm42600_state *st)
 {
 	int ret;
@@ -467,8 +448,6 @@ static int inv_icm42600_set_conf(struct inv_icm42600_state *st,
 	/* set PWR_MGMT0 register (gyro & accel sensor mode, temp enabled) */
 	val = INV_ICM42600_PWR_MGMT0_GYRO(conf->gyro.mode) |
 	      INV_ICM42600_PWR_MGMT0_ACCEL(conf->accel.mode);
-	if (!conf->temp_en)
-		val |= INV_ICM42600_PWR_MGMT0_TEMP_DIS;
 	ret = regmap_write(st->map, INV_ICM42600_REG_PWR_MGMT0, val);
 	if (ret)
 		return ret;
@@ -841,7 +820,6 @@ static int inv_icm42600_suspend(struct device *dev)
 
 	st->suspended.gyro = st->conf.gyro.mode;
 	st->suspended.accel = st->conf.accel.mode;
-	st->suspended.temp = st->conf.temp_en;
 	if (pm_runtime_suspended(dev))
 		return 0;
 
@@ -872,7 +850,7 @@ static int inv_icm42600_suspend(struct device *dev)
 	}
 
 	ret = inv_icm42600_set_pwr_mgmt0(st, INV_ICM42600_SENSOR_MODE_OFF,
-					 accel_conf, false, NULL);
+					 accel_conf, NULL);
 	if (ret)
 		return ret;
 
@@ -917,7 +895,7 @@ static int inv_icm42600_resume(struct device *dev)
 	/* restore sensors state */
 	ret = inv_icm42600_set_pwr_mgmt0(st, st->suspended.gyro,
 					 st->suspended.accel,
-					 st->suspended.temp, NULL);
+					 NULL);
 	if (ret)
 		return ret;
 
@@ -949,8 +927,7 @@ static int inv_icm42600_runtime_suspend(struct device *dev)
 
 	/* disable all sensors */
 	ret = inv_icm42600_set_pwr_mgmt0(st, INV_ICM42600_SENSOR_MODE_OFF,
-					 INV_ICM42600_SENSOR_MODE_OFF, false,
-					 NULL);
+					 INV_ICM42600_SENSOR_MODE_OFF, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
index 4e20d61d897b..eaa13013ba4b 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
@@ -102,36 +102,28 @@ static int inv_icm42600_gyro_update_scan_mode(struct iio_dev *indio_dev,
 	struct inv_icm42600_state *st = iio_device_get_drvdata(indio_dev);
 	struct inv_icm42600_sensor_conf conf = INV_ICM42600_SENSOR_CONF_INIT;
 	unsigned int fifo_en = 0;
-	unsigned int sleep_gyro = 0;
-	unsigned int sleep_temp = 0;
-	unsigned int sleep;
+	unsigned int sleep = 0;
 	int ret;
 
 	mutex_lock(&st->lock);
 
-	if (*scan_mask & INV_ICM42600_SCAN_MASK_TEMP) {
-		/* enable temp sensor */
-		ret = inv_icm42600_set_temp_conf(st, true, &sleep_temp);
-		if (ret)
-			goto out_unlock;
+	if (*scan_mask & INV_ICM42600_SCAN_MASK_TEMP)
 		fifo_en |= INV_ICM42600_SENSOR_TEMP;
-	}
 
 	if (*scan_mask & INV_ICM42600_SCAN_MASK_GYRO_3AXIS) {
 		/* enable gyro sensor */
 		conf.mode = INV_ICM42600_SENSOR_MODE_LOW_NOISE;
-		ret = inv_icm42600_set_gyro_conf(st, &conf, &sleep_gyro);
+		ret = inv_icm42600_set_gyro_conf(st, &conf, &sleep);
 		if (ret)
 			goto out_unlock;
 		fifo_en |= INV_ICM42600_SENSOR_GYRO;
 	}
 
 	/*
-	 * Sleep maximum stabilization time before enabling data in FIFO.
+	 * Sleep stabilization time before enabling data in FIFO.
 	 * We need to release the driver lock to not block accel data processing.
 	 * There is no possible race here since we are under IIO mutex locked.
 	 */
-	sleep = max(sleep_gyro, sleep_temp);
 	if (sleep) {
 		mutex_unlock(&st->lock);
 		msleep(sleep);
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c
index b35706bb1c8f..d76459d048d7 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c
@@ -33,10 +33,6 @@ static int inv_icm42600_temp_read(struct inv_icm42600_state *st, s16 *temp)
 		goto exit;
 	}
 
-	ret = inv_icm42600_set_temp_conf(st, true, NULL);
-	if (ret)
-		goto exit;
-
 	raw = (__be16 *)&st->buffer[0];
 	ret = regmap_bulk_read(st->map, INV_ICM42600_REG_TEMP_DATA, raw, sizeof(*raw));
 	if (ret)
-- 
2.34.1

