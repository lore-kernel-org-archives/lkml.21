Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140656;
	b=nN4dGzdQOBSXesC89o/XKDPaUaw24k5g3FWZUZJ1g20kz0cXcdF8ZSK+A9QcUkYuGPnk
	 g+q4BSxewSV0IrRdThkWQvspH9t7L3xQRQI/prUEXv0ke6MfFJJ/j+MQmZ4yeHLwk3bUm
	 I4sDdEYwbp7OwWDrRpozTAT7GB9jdWmDyY1Rt9VX1EfV2XerPvQJpJg8KMSubkCFi/o9b
	 feo2uNO0F1h18W0PL27mZ92miYg+h84vk+vpek8FfnaJC+0eDmDucDQ7KmAFEqgSUkxiV
	 fo21HgBK5LCmIEJz90hKj0gwqLypVMST9Rvte7grAcfs3uW8QgTjhfR5oHNcbx1Q/Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RJn+hkZf3RqN/RrP1c9RUAnn/ZcmBsgELIXfGkI4e7M=;
	b=pE9Qk6ABjxAajFN0BMSWyqNRWYOQ8Aw90dv6D8nxKexIC+S7d/uHOPJVXezXD4bkVim7
	 37uwcu2hJjy3W2kJxitWqWJNE4MgGuNQ6FAM6gT0uNWcwbA5oL8FT+1ujExjrxCQiqOro
	 F6JjMtonMxNo10JRVSmYclAkjxeze+5rnfq4/WjUUNn2LMl9TfjjcPacrDgK4SX4PGXeQ
	 A0V0WuFDSEjj2V+qwcVrxuv7RBgDdj2WorNZe5TQHxZ6ftUClxY04OUXcbLdI7/+4Nkxy
	 qmUBTJr4loQQJrf17WetmCJWiwJdbdQwPBNUOZNrIMpQCtAo8eH18zPmtzIlSJdjkfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reflexrobotics.com;
	spf=pass smtp.mailfrom=reflexrobotics.com;
	dkim=pass header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bJXYVYyq;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15810606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15810606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bJXYVYyq
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so909358eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reflexrobotics-com.20260707.gappssmtp.com; s=20260707; t=1795140654; x=1795745454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJn+hkZf3RqN/RrP1c9RUAnn/ZcmBsgELIXfGkI4e7M=;
        b=bJXYVYyqM/nXgsKJZbji+NrgPfrpbV7fGjidiuCfWSU5x+2E8lyBQKNuI9gdFisAOV
         IgaosAThctvV+eLzR9GJwyjeZ/0/nglqbGgVhP2BlUxMXMDl0gzEzn4a0LS9oBSz503M
         bCNwWOT+6Jr3twx9YJrROzGEqAwZzXkPzQJ2PSndWyljE+2vi0rUbeUexzCmST2CZ/T8
         n+NISlTN0UyBRfZWJHBe/8eF0j+IrU43wrywZjik3Ccsd5lOfmirf6w1GQhYLgFwQLJx
         ENHlx10m1wvihgGOsqbhmVZcAcCiq5aCCIvF75BPEDfIpA8vBd3QU6TwyxN3AWYLf/7K
         2qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140654; x=1795745454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJn+hkZf3RqN/RrP1c9RUAnn/ZcmBsgELIXfGkI4e7M=;
        b=QdDNuD1PSxxNp+TznnTkMXfqdtsVgZq9SZjSE7S53pAt+0wdFg+6C3A9ggLEr5r573
         RMoAHsCRUua+rrKZv2wJhQltYRaPMfQymsvHe5fXjBk+JIHQuSjbQR817NME96bYaTas
         pBRM3qkWF4UlI7Hbnvh0kNtZWQM6ub4loe9C1L3ffuE6z2Dn/QdbgWp3k3AI2Pce8bBP
         ecvK/6EcrQOMiAcBiw4hrsZkMJ5Bja0tuKfaIDhJj+zSEkTm0OL8Fzk5ibj1pZ8iRd8l
         DtqqJym3ew8Qz28i7GNRcf8Dp+aI48UFhaOijg5YRFj+lfPlp78OnAqQ2iSxkgjkwqsk
         P/sA==
X-Forwarded-Encrypted: i=1; AL+hErEVpxRfbOBDCKdbb2jyaKQbamKmdGGjxHH+3EGQxeYre9/WmkQoycTLaJcI+DmfuBklc0Qo1UoY1yy5KmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MKMFt50z1X0DnjgjMJLKxgNp4fDEfpG5Y4Yn+qgJIvPLdnipl
	sw7mpr4r4KrFl/Kp+UFTDG/Y0pIMOq28BRZZcR6sADXYB+zvp4cfs9fl5XFsSyYtErY=
X-Gm-Gg: AYBFou1uYxCpFINL0BSnqZoQZ3p2NbyYtMML2Su4GESTxoNvHa6UOKCu6JQo9Iy18Dg
	X4rDGJ94hU7Dfkjw5WcdWvrrDauUmo84ynzOJ3YpLn4werDSrFdzF5l8E2qDkzCNXFKbsDz0CAY
	vAgNS8NjPGsqIN7NZb4UokhE8VYUGC7bVp+8F1uMxh7s6QzhHU+NEPz4jz4SyPcrLot8Xu2MOSp
	QUeUrXLy028j+JrsSABOxgJ9JtZDQLWQybZdylNk9dvbBi5e6NECES7hRe18Zt8PA2L9sd4MrnJ
	44fb0hcJ0R806EUdhjecC+MbqitewGzKUeXvPNmaEx6ChXgcFvtJowRfntUpJxLKcj2WTYuc2jr
	lbG3B6CXdWs2VEFJvYW12RsOwkmyeYqnEKusiL1yOZIjI//BbnYhd+WPtM6C6o8J5WEmiDhfdRx
	sPEjbmqjkiGGxT6QPuQbL2wzrrgS6zm0vVXwMCYCNVszP6NWPNBkypvMtKEoyCIh8tTcKvUB/6G
	STB2MvZbAPynQTRHnbb1MaONNzOXjsSQNE+1HUHZlEMxgGL9ZCidPxnq3nq5+RwBrzz4FwY/u+T
	tiEHZ/um/CYILpQKmvgoEn34sttLTwaP2E+zf6upnwRjwY0DSMK09SHZDGvY0FCz7qoQTVTSj+b
	xI9GhZandcoNWAooBWaSKFTQ=
X-Received: by 2002:a05:693c:41cd:20b0:378:3227:b4dd with SMTP id 5a478bee46e88-3856f03cacfmr1229064eec.18.1795140654085;
        Thu, 19 Nov 2026 18:10:54 -0800 (PST)
Received: from localhost ([76.51.7.19])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38567da4f85sm2806190eec.27.2026.11.19.18.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:10:53 -0800 (PST)
From: Joe LeVeque <joe.l@reflexrobotics.com>
To: jean-baptiste.maneyrol@tdk.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe LeVeque <joe.l@reflexrobotics.com>
Subject: [PATCH 1/2] iio: imu: inv_icm42600: return -EBUSY for temperature reads when idle
Date: Thu, 19 Nov 2026 18:08:49 -0800
Message-Id: <20261120020850.24318-2-joe.l@reflexrobotics.com>
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
Content-Transfer-Encoding: 8bit

The temperature sensor only measures while the accel or gyro is on.
With both off, its data register keeps the last measurement, so a
temperature read returns stale data. On an ICM-42688-P, a value held at
about 52 C was returned while the chip was at about 62 C. The data only
reads as invalid before the first measurement after power-up.

The temperature is the die temperature, used for accel and gyro
compensation, so return -EBUSY when both are off instead of stale data.

Suggested-by: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
Signed-off-by: Joe LeVeque <joe.l@reflexrobotics.com>
---
 drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c
index 7f80bda471c3..b35706bb1c8f 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c
@@ -23,6 +23,16 @@ static int inv_icm42600_temp_read(struct inv_icm42600_state *st, s16 *temp)
 	pm_runtime_get_sync(dev);
 	mutex_lock(&st->lock);
 
+	/*
+	 * The temperature sensor only measures while the accel or gyro is
+	 * on; with both off, its data register holds a stale value.
+	 */
+	if (st->conf.gyro.mode == INV_ICM42600_SENSOR_MODE_OFF &&
+	    st->conf.accel.mode == INV_ICM42600_SENSOR_MODE_OFF) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
 	ret = inv_icm42600_set_temp_conf(st, true, NULL);
 	if (ret)
 		goto exit;
-- 
2.34.1

