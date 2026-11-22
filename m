Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333625;
	b=fWEZFV7I5MBlB9cS946ep3yLJwbLMCYpivhv/irw5imFdsHGAz2+o+eTIYfQLiNo3MNU
	 8sZNBlPru4y9UNiuBAaDeJ/mpVKIm3q+G+FoWXfUZddxR8S92UbiCVSAxW8oaBbwvLUyu
	 spzublUTKn+Edd2jJo8xRQ4mdRBv6HBmw+RMRLtl6AQ3jueUerWqYIcJU2sCFIhLO8dJK
	 ofQzyp+3N69TeKPzJxF/+vQD6IDEx5igfosr0+s+wjA1fG+BXhe41eK55yA3rqywqyAeV
	 fTneF1aMqE+lno6f9A3pN6lppQRF4akEj6qFhf0z2MacpWj2nCTtxxoSHa79CIE4EgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
	b=FldmjxZPSLfVanC66QU03/sG4hp9dg9SVHQrBDgVA/gax5eZRbA55mLV91gCnQH2UuSL
	 UuPKwXsZMeRtBtWw/uy90b/zGmz1VWl6/cB3oUEj2FT4AIuvh2MRP88LrhyWNnAo9+aGG
	 au8678awJUfzD2LrtL5iuvb69LZfUlNR4xWMLleK+9CvnqaCQikyZh030neApP4cyG9Jj
	 KNDLCFZln002bLO2jR/etJK/5LyfucYF0rd/C+YPQwPLEAHGsgvuGwip14QVg1/RyTxts
	 AaaIaPSHt0vP1BJM5h2o7l8SkJ5ukypBJtv7f3klJ+GZnqaLUmnTsGMHC9ev6Tsh3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNMQQkdc;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE7C606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE7C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNMQQkdc
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so3745080c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333624; x=1795938424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
        b=JNMQQkdcmULr0DYvlgyP4WMcFM9gusTnKZyos7J2BRoW5/O7xoyz+Ng0CpLtX9E2nR
         zBFu/tKNkrKsxvfhkomnA95E67ZJOi3npDO4Ziqmgf/mK42zgNWueBqNHduSckNKnydz
         WiuhMjEIBWL4IMxCy2tEklRd94yH1DG3j7ZXnKnTi2yg8BJwl70W0IkHKdQFzGxQxsYF
         lkgRT7dlHT/JNQEpqmRRyrqW5atC/kyLYjPCTbXjfMd3IkRr7csmSWM/k6tzwfqo6ofU
         hi4fbmnpFUGbmOguDLg2EnwkrQHQ+WFoUQ7QTHMjIjrf5+W47/+mZovZCJ8ebrkxSGN9
         zWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333624; x=1795938424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kj+W82NANvfKgUyKf6IsWAM4Mpg0yQ4fSrxz7u58oqs=;
        b=sVRPgVrNbkjVKkkNmAUCtBJ7y7o50GihKNs/5vUyJyrylxLceRLXzHLDvSW6CsRN5F
         FRfxQ/jp0n0y8UiasjDDfLHFqnguwbrxRQ0Up7n/8cKCrzEbqhM0MFLyF1ISA9SrpjVS
         K3/RHLK/chPPH3ZVbZPQDn9cV0/2Q7A6jyxlO3+W86+GgGN6JfIH7PUjq6vi+7u44bw0
         TaIe8Td9CnA5sHlgoZw6NEf2wKnJqqE/8JKFfWw5EorvakSq1VgC6/qbPgSpabEsqEQQ
         eTmkDPaiz5xRoACM/U6tY46346ogsOu4uHQD9CsX8gO22zl3t3qDgmLm9ybaUDee8YoU
         oYzQ==
X-Forwarded-Encrypted: i=1; AL+hErFC2C4Cb+Bb07HKzyIRVfI//zJdnt8Y9ZdAwAt6gUgfnyOz3jS62QwfWZiqodwR4PyzEUYsiYIjWCFBKeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z93pa4nsCxQ7KeifiO04e0SbcQ5sfeKnspoB5S3Pl5245u4ejZY
	XSKvADgemX48XPdRalsA5MqLjch+EApXX7V3Y4z/I5XzLW7Xy5fLseXMCT+vPUP16V3vgQ==
X-Gm-Gg: AZFdTZctcCLYt96nYd2MLfmC8fExxNv79newIjlN5aoQUmxk3ymUz8r/7nMxHX1+pdE
	B/LNHi2p0zpiZ7FULLvs0PjlYaAsYKLXl6ZuuBdWDaxxMx/HRa0GecPk8W0LErWlHc2qBU748zu
	mphrcq8MOMMOxALnCivHBBTmfiPNvE6C8iGNKnD2WFFOhG/V/8R7JiZv/qu9tbojU29oOyvPWAI
	K/drzmlk7anKsTSQ4y3kvVRp9vzGbdIl0zyAm/buzD4H9GlDgOj+s0XDCni0AnCf5Pl8+T3NHLo
	n4MESwS6WiPPGG+VVbaDbr/QA60n9P3GoOAOEzQt+YGrNDDP0oQt2fVDBHkCgE6/pZyNlmJD1rY
	CcIaKyhYh+Wur8hFn3lhFrvwqTTN1lWdRb6hHx9z/UpX9RE4Cwa7cabfjnLZeiQbx3S+SytORJS
	0DICyrV8b/kTAphgk9MjesqlwdGkbUAK8i0nEgHAzaWDYzlOjZPIeJEI52gDowO7p9dMlZTCi9L
	RMovcWScB+tGKAMpla44ih8POTX7ro/q+Zu3Ez89GZLl9pHviiNyJG4x1lXIII3yUkRgY/39Z1t
	03+E5NGtaEY6xMwDrJyvD+QsPUV0fsQyIk8Z6gwH8S2RXQyF+A7S+Er567xioHDPZH4hnd4jAGT
	i7TMkbOLHEk5cwKBM+n4+9HdhbTEuS087JrHDI+10LtCRkgIZj4vYcKfSU2dRc2K65QWRyc2R8b
	uCz0SXo6mrYd9BP+rN9EBSAhLxYDn9AhzzJlfuXhy5cg==
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr8893767eec.33.1795333624512;
        Sat, 21 Nov 2026 23:47:04 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm24898071eec.9.2026.11.21.23.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:47:04 -0800 (PST)
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
Subject: [PATCH v2 1/6] iio: proximity: sx_common: fix raw reads while the trigger is in use
Date: Sun, 22 Nov 2026 13:16:41 +0530
Message-ID: <20261122074649.239441-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122074649.239441-1-kapoorarnav43@gmail.com>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com>
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

