Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866951;
	b=iAgW5KDsiLSrwj8sgdAqlgVk1dtuIrlN9VcGq0025TLXNA/WVKho/PqaHFmy8p1NDZ+L
	 yo0mtUAWGCFC5GCHuKWLGpvO7EPsUlEi2QHDVefh6FouSmBVSLpU6pYBU/KyQJvLCMoal
	 h662wEhPBNwxsPT29s31r/9zMyFxyaO5XK9o9feeszUcTay8FLiOYnoOeai++9G2PIznC
	 ujodl6bfhY+NWmWH1p+vJTgzpuUt6De3luUin7/4PAW4Zm0V7KxZCaxyXs76rAdHswqjp
	 w1S2NGZxenmmR79FkLUsVRubrPvskUSbqVJBkkH2JddZi1zL+gBUg6PkoAwDIcWWuUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
	b=jXDBj/O7/dH/SGsIo5llZ52T+F59CkEEVafJ+qDTgz5ZfUN/kmcRcK/LHig2AQZd/DAh
	 vxt0VCBb3QtjKsThLm/cEMe6/ZdYmifJmPsKJI5zosIQuDxdtbv5E7T+QcKVjtI7eKfFZ
	 fHC17tNEG3LVRX/OHrBrEPdY4bWWmwMjOW96dGHJVZapwfC5L1//WY1dMb/nHAULckFCQ
	 DAHUH8muFZ8jmdzvVJbKNQWzii1naPIKfvd/NV9a7w8CaVw6z9kday9c0l5wmMaui0IdO
	 lAcgjBOofIrHiEnLu9HnSBcCfooNgrAjF5QSlMD2hxNdL/xE9Quvrujc0A7Oo5NotXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIY++pzt;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95D1606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95D1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIY++pzt
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38431138772so11759732eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866950; x=1796471750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
        b=fIY++pztOrkz3mXgf9ib4t6dfFX8OBpQkX0lKw53kp5erKJDD623zwcOExT2Rh11uW
         nNDm9wk1w8jWWreUGfYMBa0VGMf4a8WTwRYeMK8D4z1o1GIEoPyRNh6tKxcWtNBahuMs
         vxw6viH2/G0RoT/6U4ziIm39DLbpfapcNBFUd2LciAwu7fFoz6knYewxd7EtXxxo5g97
         idD2+Cm/qJLXDoji2Kb5PosFXr7RaMCi+Hyy1OmoxARpe7i3Tj0cWs05N8K+0QiLe0A9
         0+KeT+YGy4QPN+paY/OTdgYkIU1SIZgG5TviGk52oeeYARA/ZvDw99r4uCMpKSHa1w/Y
         I6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866950; x=1796471750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
        b=T1UPgtJIVxZb+cN+80uvF6f93CKZnFQOipGO4wep50ZDi9ZTgXLyDAp4y5B8z+QARE
         DVTj+shsVnsKzOo6m2QE8YcYR3cdbXzm4V2mW18SJPvvAEcNZFn0vNnj9QJX5RJurOix
         RK+Y1Cr7DaAADBwjuaY0vaPQwJXWcjTpHEN0wnZ9HO5sXmRO95fGzOmicDbm5Qwpe+SR
         +F9XmF2RQKzQ7weqPp9HsmODBP5lB+UDr9QyUOgnCZMsH50YJKiz5AO51+/kzMEFs61T
         CosHzgrZkT1IDcy4Th9KgPPMW7Gh8tZHPe4jiyce7kCn+t/jzSjcOOn2zrNa8heZ5Wou
         5C6Q==
X-Forwarded-Encrypted: i=1; AL+hErG8+jcyYS9esskzI2FiKm0nFi+INexHgArzZtdvqljYn/IlsWjv2ylZ4rBRxlp71/Wpc/uh5oI/WTCgXrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qT53GZVSPFA0Nqci6pynbTlf933AZUaloFALtCa/ce8DJzEmn
	FIyAZVzNXEBSUhI9jp6imLhPG3aYbD4/wg8eQS+1gU2Fa/b7mAl7jPp8
X-Gm-Gg: AZFdTZegpXjmT6Wu34rDzYNqFSdAVRHLr9rUH1XNUWyIGRnaJrM2PkeBW3xb+hCynWi
	pgNPgMlG4cm8aR4n4wns0qLXkvRLcPV71xtpY1mV7NfJJCHCzMyz2lfciW1nt1Vx1bk6iOWYS6B
	Z6ua57nlpd5/y6qwPNNZStkjL/Oc01sTMJQyc0OLUFo7E2BqNaEVPOM/yA/qkz0M2tiLnAn16V7
	k0OREGndwU+1jkpGVREiYrZXZKehphM95Ui9HJj76BKnq9LuwEvvj+PwpWAGVpdqrkXYZ+8bkzu
	z0ODcYP51Do7TgvkPj9mbtMlO5YdiFrvF5JxBsSkVqmvMlNWPv21rWDM8NaITRytJgmvyFUhVB6
	tr/mdTMN9iB6j5bdtcLODbL2ijOEag4YLDse4S3l8/zt1b2d3SN99q1ML4UMMwxPisMbqjyKUJo
	Ru/vQBt3TBWd7dShp2o4bTMLR7xSNGolgDujFXuG1TRPm7C9lb28WKBB5UrtfO7ySIuPCMmBTCt
	YRw2LrO614DWidtEF2W4oF6nkze9kqIvapIYrs21h09HelZtWWMfVFzW4GM6jM5cnB+sMfPLxSf
	ayIFQ2VSstoXlcFCRdb54yx7LlCbpTi2wjRlu+i9QqL8kHv22MV7r9HmYVIsQVXclzyslBx6o8A
	FTkAaV6RBY4/Rvp3PVqTTXET/9/5SuwDNRfFaZYjpRULtrwO2TCi024KN6ePn+t7W4wIbvy0ZUY
	B671YFbYTtpQJC4wX+/QFb52VurgaZ/pKR1Tsbmu20ATKyUJiFqk36Mdyd4dXDlWE=
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr40135576eec.21.1795866949795;
        Sat, 28 Nov 2026 03:55:49 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm76783178eec.13.2026.11.28.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:55:49 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 1/6] iio: proximity: sx_common: fix raw reads while the trigger is in use
Date: Sat, 28 Nov 2026 17:24:49 +0530
Message-ID: <20261128115534.558478-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115534.558478-1-kapoorarnav43@gmail.com>
References: <20261128115534.558478-1-kapoorarnav43@gmail.com>
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

sx_common_read_proximity() only reinitialises the completion after
waiting on it, so a complete() that arrives when no read is waiting is
consumed by the next read, which then returns old data without waiting
for a conversion that includes the channel it just enabled. This
happens in two ways:

- The device trigger has no validate_device(), so another IIO device
  can use it. While it does, set_trigger_state() keeps the CONVDONE
  interrupt enabled and the IRQ thread calls complete() for every
  conversion.
- A read interrupted by a signal reinitialises the completion and
  returns, but a CONVDONE interrupt already raised can still complete
  it once the mutex is dropped.

Also, when it is done, the read disables the CONVDONE interrupt
unconditionally, which stops the trigger for the other device.

Reinitialise the completion before enabling the interrupt, and leave
the interrupt enabled when the trigger is, as set_trigger_state()
already does for pending raw reads.

The interrupted-wait case was reported by the Sashiko AI reviewer on an
unrelated sx9324 patch.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx_common.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/sx_common.c b/drivers/iio/proximity/sx_common.c
index 4d4937395d9a..66d06435da05 100644
--- a/drivers/iio/proximity/sx_common.c
+++ b/drivers/iio/proximity/sx_common.c
@@ -167,6 +167,15 @@ static int sx_common_put_event_channel(struct sx_common_data *data, int channel)
 				     data->chan_event & ~BIT(channel));
 }
 
+/* The trigger needs the CONVDONE interrupt too, leave it on while in use. */
+static int sx_common_put_convdone_irq(struct sx_common_data *data)
+{
+	if (data->trigger_enabled)
+		return 0;
+
+	return sx_common_disable_irq(data, SX_COMMON_CONVDONE_IRQ);
+}
+
 /**
  * sx_common_read_proximity() - Read raw proximity value.
  * @data:	Internal data
@@ -188,18 +197,22 @@ int sx_common_read_proximity(struct sx_common_data *data,
 	if (ret)
 		goto out;
 
+	/*
+	 * Forget conversions that completed before this read, e.g. while the
+	 * trigger was in use, so that we wait for a fresh one.
+	 */
+	reinit_completion(&data->completion);
+
 	ret = sx_common_enable_irq(data, SX_COMMON_CONVDONE_IRQ);
 	if (ret)
 		goto out_put_channel;
 
 	mutex_unlock(&data->mutex);
 
-	if (data->client->irq) {
+	if (data->client->irq)
 		ret = wait_for_completion_interruptible(&data->completion);
-		reinit_completion(&data->completion);
-	} else {
+	else
 		ret = data->chip_info->ops.wait_for_sample(data);
-	}
 
 	mutex_lock(&data->mutex);
 
@@ -212,7 +225,7 @@ int sx_common_read_proximity(struct sx_common_data *data,
 
 	*val = sign_extend32(be16_to_cpu(rawval), chan->scan_type.realbits - 1);
 
-	ret = sx_common_disable_irq(data, SX_COMMON_CONVDONE_IRQ);
+	ret = sx_common_put_convdone_irq(data);
 	if (ret)
 		goto out_put_channel;
 
@@ -225,7 +238,7 @@ int sx_common_read_proximity(struct sx_common_data *data,
 	return IIO_VAL_INT;
 
 out_disable_irq:
-	sx_common_disable_irq(data, SX_COMMON_CONVDONE_IRQ);
+	sx_common_put_convdone_irq(data);
 out_put_channel:
 	sx_common_put_read_channel(data, chan->channel);
 out:
-- 
2.53.0

