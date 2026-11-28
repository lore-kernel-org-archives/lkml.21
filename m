Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866714;
	b=xaXtURs+0RgXjNjpANgaI5Yi/EAlT3d02cAiOlF1wkRZ1NHmvt9tW0FPBQS0IfKK9hFo
	 tRMDNnuWnL/Ceaxi1jQD73nzvL7w4e9y0uzCjC3MEaRdHkzXrcFW0WhdTT3Ihv19dyivq
	 i/BtWft2BW2HQguvMVjMPWDz4MTUhMM2ABbSNdnU6G6SG4vJb9Zu7NBqq0Og9M6akS6Q7
	 vXHnHvqLH4HLV9WT5n2pdSe31yt1NlFM4tRCz6hnKH1LD8ZlhLLVQ1CYUXzCHK+yxPTyA
	 kFXN6QG5XWOfHPrEu0HksWUAPIuvpTPYqrrfy7KsEvKcnJ+I/ZOoCKO7hS95BVAKf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=liuG+zrcpJhh/5ym3HDAfZpu0y4pt1z67EI0PqPuM4w=;
	b=iLnRyldd26ARz2+FnVLlGgsiGyHqDxM/tRpTV3o7uBO9VHeF/CgIScA8d3AvR6O6ZV6J
	 uI4JV0ghtxJqC4AhMQaZiGcMI1UxF/GctxmMj6vzU4nX5L4jwGCYD93K2cMYa4Tp16E3Q
	 Nm+uRBHQwuQYdGbnwJ5ZdbF3I2oCJucxNxuDUa+Rq8PvQIgfZrp+kR4gB5nRGnC5zG2aN
	 P9AMmcRu8NxwQ5vgQgjmGlx3RpsXKip2PCFCHbX/d9XZ48kzst6MhnplSrQIUgWaPek5G
	 QZlVk6Wd6e7bqPSjHxYhU9D2ihjlzY+CeFH0qF3wL0+QfzMJ1dlrWKvZjXdTExOZNDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEdJrAdR;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069D606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5069D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEdJrAdR
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3866a784546so12410764eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866713; x=1796471513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=liuG+zrcpJhh/5ym3HDAfZpu0y4pt1z67EI0PqPuM4w=;
        b=VEdJrAdRSXS3H0I1Ws6jxU8Dge8z/jhZUYUuTUXFwYpoBlWLfCiIv/UWxB6AZv3nSb
         nlZ/MQMJnq67bmMW5pn/I2FvfFpJfFkZVfH+U2Cd/y8eYwqDgptBdtbC6UZzeT1QXo+e
         PSjsxtg1Ei0iDQYrQQsUyoo8pn8wTFSAW2JmfvdHJAuaZATJZ37syRZpSzRByPiz1HJ6
         6S89ICdRevUVdA5dfQ/0GHgV0VVE7a7y8nvYWCc0kAfoakkQMf010ibl1tTIhmvauq6j
         knFkH9nuKp300MKEuOhLGOYhDtE+B7nVwM+6e2Et8QRDhlv6KqFjYLF4Im2cOPuZwYAc
         R/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866713; x=1796471513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liuG+zrcpJhh/5ym3HDAfZpu0y4pt1z67EI0PqPuM4w=;
        b=P/d0q22JLx/9v6aOAM1k4GSnnwzH7XbBnt3nR1cYlirTzSnHYyXgALT46/NHf4sqFf
         NLgR9K0ZDpv9g/2fsrs1lPdHo6c/FlleB4JfFfTfuf5SOBvM1SxD2eSDG3u5oqYCeQof
         +MqMRy07pHC8Jt5Rxfy7dSoJsREboZb/E/F6tYgLhM4Lw6Yx26noM6xLfBtnOoLXHp0f
         uVS6mQu1xNwlvDaMp1VtWcBmKUFvqbuvFDnl+OldSRxLBpI4qT71mIvZtaRrYw5HnnDl
         WeW9nud2RPBVKslbgvupcph8rESHdO22EP6dqwbJyA7e1SCJ86uTyAlYJTsh9lQFfTNP
         sIfA==
X-Forwarded-Encrypted: i=1; AL+hErGe50MqV6/SJCrsQCph4Mm9iAAZ4Tg4BE91n6KzY+o+7Ong3qk+tuZIUfTTVec0+pCjOAoospWLCrS4gRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pD3Q10D+fTfDbnfq8bn4bMUuZRtDG+mnGbwvsIdlpjIG771lS
	S/FEqYqM9YLMM4ii/034PZJCJJ26KZ9530BqBxefWqC4XzkJEXuaue5g
X-Gm-Gg: AZFdTZf+Tru3PR0zQE+uQjZRDwRIUMJU3+RCxeSCBEncD/8HGU7HJsiJLEwEGDUr/ko
	vvwgpgfNQe0SSY/7VBuC1XY4QcB/10qCjh6KG+Y8EnPaFLcy2NLhMTzlnyif31ZQwrq6VUfzLG0
	4ZvU7YvHuY6vgYUvMka9d6ONYhxK5jLehovjIvEdD6HAfiosY550TZdi1klnWXpp7zMXzZ1v4in
	3x+Wg+6LUcPoilUdsDobeCKsnWdxlYrRu7kitq1UMd/z6iVe7jipxOvd5YPay7tzPs5+b+FBwZK
	4bpfv/Aneom3C4pogcGIxkQMVL0dIQ0RJPV+cmKGVeGZCC+Bj+Ctr6lvJWoDEBuVp8i0kztADoi
	iHIOUPIHWoImQv8Jr4UmwprozyBvesW8LOTpE4eSV+xlAYTBF6rzF7HnqxWJsn0nVoVYKmddeHP
	5q/sDVCNc0SJEsSjhoUKRY7Dx1Ev6gsL+ESfLl4GvSkUdOT19xSn4Lf421+7H3x7jhYny8MalEU
	iqsw+AEcqMSnHvfh6GgFhf7zbCz6ZP+9bvPqFlSp2XZsEumiCNKgqXvmJReK7qnS3YRzkeunu2Y
	S6J2PCM1JNU6WAGtUkxBBGwRPnQSn+loeYfmGEEzbfFWUhrSxkvKHbXcfcYwR3zByM0jHxY96lx
	ORIlhHUdpVUVL/7k+DWZmctAhr3hXA3xHWyQLtwdZ+yqHSjMQq9qzKBBqZFssZuQgc1hZ2T0uTq
	r5Fl8M91qF4oASrR8DaGTjLy1LUCfPn6bGYeVSgzuEJg==
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr27167572eec.36.1795866713303;
        Sat, 28 Nov 2026 03:51:53 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm74256544eec.20.2026.11.28.03.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:51:52 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 0/4] iio: proximity: aw96103: fix diff sign, missing config, async config lifetime and event values
Date: Sat, 28 Nov 2026 17:21:37 +0530
Message-ID: <20261128115144.557411-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Four fixes for the AW96103/AW96105 capacitive proximity driver.

1: the DIFF registers are signed S21.10 (as documented in Awinic's
   aw_sar driver), but are divided as unsigned, so negative diffs read
   back as about 4 million.
2: without aw96103_0.bin the driver never loads its built-in defaults,
   so the scan and the interrupts are never enabled.
3: nothing waits for the request_firmware_nowait() callback, which
   uses the devm-allocated driver data; a probe failure after the
   request (e.g. no interrupt) or an early unbind frees it first.
4: out-of-range debounce and hysteresis values are masked into their
   2-bit fields instead of being rejected.

Changes in v2:
- 1: declare data as unsigned int (the regmap_read() type) and keep the
  (int) cast, now before the division (Andy)
- 4: kept the explicit range check rather than FIELD_FIT() (Jonathan):
  on 32-bit, FIELD_FIT() shifts the value in a 32-bit unsigned long, so
  high bits fall off and e.g. 16777216 or INT_MIN pass as fitting the
  OUTDEB field and are written as 0 (1020 such int values for
  GENMASK(9, 8), 16380 for GENMASK(13, 12)); on 64-bit it is exact.
- Dropped the Cc to Wang Shuaijie: the MAINTAINERS address bounces
  (554, recipient doesn't exist).

v1: https://lore.kernel.org/all/20261126053033.603086-1-kapoorarnav43@gmail.com/

Patch 3 makes unbind wait for the callback, which can take as long as
the firmware loader's fallback timeout if a user-mode helper fallback
is configured.

Applies to both fixes-togreg and testing.
Compile-tested only (W=1 for every patch, checkpatch --strict clean); I
don't have AW96103 hardware.

Arnav Kapoor (4):
  iio: proximity: aw96103: report negative proximity diff values
  iio: proximity: aw96103: use the default configuration without
    firmware
  iio: proximity: aw96103: wait for the configuration load before
    freeing
  iio: proximity: aw96103: reject out-of-range debounce and hysteresis
    values

 drivers/iio/proximity/aw96103.c | 43 +++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 8 deletions(-)


base-commit: 69bf7489f01ffa3c3269d09eb8a0668b1bdfa053
-- 
2.53.0

