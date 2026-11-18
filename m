Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039663;
	b=YEFYYhevlN9K86RZ6inD+Y7zioZqbyeTfuN6RQz9TqLtkSn/ISIpV0W+YUHrEypTzf1v
	 /apjkIxvXuS/wRIef7xjkpbr0tbR1P0kPjgVCsZ5U8eJAJeiLXwniefUkWSxP39JLts2n
	 5qVjaOm2vdknnU4e/9f2ZUZSpnmW6HT2AAoTg2LHqTv1w+tQE4SfPOI9+vf9yxp0dT/Yo
	 dOse/4uWSbyjUWALiy9buBsOpvGiIJmbauO+zfpoLWHmT/8JUdmNnd+KBOrnL1iDILOBh
	 0pvHrLCM5zteV5g6IJpj2GLUVjWKH10ThuCaYrUpHkOppqcRvXxPi4DD2MhZhOeqeCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mGGAH9zwZqlB4RSR5d8imk8M2AT/E+I9ZFv5C+97Tg4=;
	b=uFVVOy9L8NdO6MxujiuZGPe/pPfYuOl9ywSa5xuLpybjPorJVWlX+il/Zw6PZ8YuHKji
	 F5gc/8U4v6ymmnx/zVGiLSAFWdLhFq0ocAWJs3ER0YMsOaum2ICJUhNjzlEMYVfw10jfl
	 twd+VypTqL3m8mrepbdYJl9m5yHfrx3XHGTbDsv+fYU5uPVDL85/w9fmMdKiaPrYfsSI2
	 goJH70+qedM54cAWbUlSRV9zCb8GIBDErQ6ZdoNQMCpdw3orCh0h6YtkKnnPZudBLqnIq
	 zzmyQvaVUINR8iVfWeh9UTMShb0jKwsqQuqEuLWKuXa7z9Jle8r55n26YRXyi6D6f7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoX7dFU3;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85521606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85521606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoX7dFU3
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a42b34e930so1257822f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039661; x=1795644461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGGAH9zwZqlB4RSR5d8imk8M2AT/E+I9ZFv5C+97Tg4=;
        b=FoX7dFU385w67J1ryrceOj3KbgzdpkBdi6EtKp1JZT2snD+6G2ckyl76WgIkgFNUGM
         e2m6Ov41KgSqCwYGCxUY9K3CNvx+vIa/b8aDUC5MtzvNG80MLYK2IAHvCUzQgCmf6/D1
         cfSTwqX5+uJhddEUAb9pJmJzZVFINv+xbwh4dWup9bJ+2YOAYHZmnBuIszpbV06JbJfw
         WR3Ud4UJPUtS1rii8OsK4xSxhn1nOalf8ROIYJ+F1pmKXafqmtUCp81HJzhit6ywLX3y
         X7bjTAdbSSji1kI4qgkjKbxT+/krlRscab2hRBpKjaVsbP+0bhVIhluFvwpfrx3q5OuD
         /gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039661; x=1795644461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGGAH9zwZqlB4RSR5d8imk8M2AT/E+I9ZFv5C+97Tg4=;
        b=n9bl0VEYUbDciu9t6841QpJKYYohvKyNY4f7RijWI+/XnN/FS/ncvhnMILaUoa1NCI
         ov7NwdyYPcTbtO6zyaSYiEzkTJ0k41dMX9b3Q86ZZrJ2xBAoWujqjU6YLR7i0leBGngQ
         v6FVLaaJw+2rJV0x4OLMcn+bktL1302d+s174iydjeRJKVJhvpQFRwrtVS6qJBYZbma2
         xklNA4t45Stjdu856zWzPcXMn/r5nMRxIxP7nUVW4tD0RpM6qyysr/omi3T6oHoUF74K
         z0HwbG2Gfq//OlqywuV/NMUFpAfIdLokBJgh2WfwL4N+qxr1qxctY8piAQSpbMSeSV6/
         RZ9g==
X-Forwarded-Encrypted: i=1; AL+hErE/Iu/x4XHzOajYM6sg6Y5WlYjM4k0XTeY+jNcTrdKgjLavmHjb5LWcwJsnGRnS/sajOYF0z5G770SKc/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HNTWa2KWp4uU+32njDKg4p8vg0gizkTvoa4g2VNaee/UlVrou
	DedSRWB/s0le0zP5ngtZIeMvja2FNuUPGUHNS14GKzJyBFlyQ/KYQG2j
X-Gm-Gg: AZFdTZent+MZCu0dQ5NE0/6N9zNRJTbTXk/2jleeu/uB32aKylCzWAY7wF2MdflyhNR
	f/0707QAk7KVmM87B8Mtbh+nSnk4aSFt8FkkO0RfFxmWJ9qLmAgGdawXAa82+vL9rj+ofpC4QBg
	5H8Hn+ZL5ASJ4Az5UktGXcQIWWGzEv+UCCd8CWI2u1siXkchIL9XHQA4xDfg7j8HkHNJSREDrqJ
	IWk+VFE3ETf+msLmxt8klStGgYroqVP2fW0Akqa3qP5pJDykObBcC8CisHrq6vnz2okXkn/mv6/
	owysMVL3QMflXDuBltKTlQl1VBROX2kbXcu7CdFrHZUM/T1SzIvNGZdZ0gElQrq4SsMjhcuMcSE
	2jrCAp3Abi/4gU3mJ/DMSd6XDaQm/s8oiPRZgtU4wJKYspwugMPRxPQYPAeGANmIo250pOMtGec
	a2lrJl+UMFx0ZhHyqJ1FoRWluxMwsaBqTAknq+WnPoQhNrmP+zqkdUJ4LPRyui91vIv4XniahRL
	Ld9t8y1NOJwus08RpCi6tG9cUoC45ETJqxwtlOWRLqAZ/FTPAP84RghRSWUHUc9/lMNDsbw29eM
	Bz99izVGvZPjiJKkib6tHoSdyVvibVS6qGnqvdV2K2sv9y3C7RazK/JXp7yzsO3P5qx7gRb2+jf
	ZsqevuTWOPlypWAqXWA==
X-Received: by 2002:a05:6000:220f:b0:49f:800e:aefc with SMTP id ffacd0b85a97d-4a639475777mr9194709f8f.14.1795039660723;
        Wed, 18 Nov 2026 14:07:40 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:40 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] media: cxd2880-spi: keep the TS thread alive until kthread_stop()
Date: Wed, 18 Nov 2026 22:07:31 +0000
Message-ID: <20261118220732.29246-3-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
References: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
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

cxd2880_ts_read() is started with kthread_run() when the first feed is
started, and cxd2880_stop_feed() calls kthread_stop() on it when the last
feed goes away. The thread, however, returns as soon as an SPI command
fails, both for the initial TS buffer clear and for the buffer info read
in the main loop.

Returning from the thread function ends the task just as kthread_exit()
does, and the task can be freed before cxd2880_stop_feed() runs; the
kthread_stop() call then uses a task_struct that may no longer exist.
The kthread_stop() documentation asks the caller to make sure the
task_struct cannot go away if the thread may exit by itself, and this
driver does not hold a reference to it.

Keep the thread in its loop until kthread_should_stop() is true: report
SPI errors with a rate-limited message, wait for the same 10 ms that the
loop uses when no data is ready, and retry.

A change with the same loop behaviour (plus extra locking and counters
not included here) has been running in an out-of-tree build of this
driver on Raspberry Pi systems with TV HATs for several weeks; a 60 s
full-mux stream (19.5 Mbit/s) with concurrent register reads showed no
continuity errors. I do not have a reproducer for the use-after-free
itself, which needs an SPI error at the right time; this fix is from code
inspection.

The change and this changelog were prepared with the help of an AI coding
assistant (Anthropic Claude). I have reviewed them.

Fixes: bd24fcddf6b8 ("media: cxd2880-spi: Add support for CXD2880 SPI interface")
Cc: stable@vger.kernel.org
Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com> 
---
 drivers/media/spi/cxd2880-spi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index 36207940b..8e31771ac 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -278,18 +278,17 @@ static int cxd2880_ts_read(void *arg)
 	}
 
 	ret = cxd2880_spi_clear_ts_buffer(dvb_spi->spi);
-	if (ret) {
+	if (ret)
 		pr_err("set_clear_ts_buffer failed\n");
-		return ret;
-	}
 
 	start = ktime_get();
 	while (!kthread_should_stop()) {
 		ret = cxd2880_spi_read_ts_buffer_info(dvb_spi->spi,
 						      &info);
 		if (ret) {
-			pr_err("spi_read_ts_buffer_info error\n");
-			return ret;
+			pr_err_ratelimited("spi_read_ts_buffer_info error\n");
+			usleep_range(10000, 11000);
+			continue;
 		}
 
 		if (info.pkt_num > MAX_TRANS_PKT) {
-- 
2.47.3

