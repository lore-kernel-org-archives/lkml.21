Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471616;
	b=e7M/r+2VyfWKf4F9JC/KVv4zgcyEDBZzrvUvfgArNkG8jUAmyDNBB8u0KyuD8eO8SyWw
	 csAw1MC0OpMHAJMmWxL6BpE9XkJha+Q1CVAfMYhhWbpPZvi7JTKBt8QaK/pnyi7UjV7OZ
	 GmKN4M7xzEKIu6ylIHbXXAjEEKCSjFXq/VaXUJtmfb4ot7XjrZ34R1xqTfgw8IA1AhLQX
	 TAO3YO5P44ltFYEOuzp9FyS7hAmDIbBlpw3nwDRzthenppuvmL5jhpE6fvKFEyul6+cvq
	 DeZ1yxAzp9hw/UYbS7Yu22MsRZHNvXTc1htkSVEs4j4uQXvABm8yM7k3NrqTgxRjvnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CM4vCsnF7HcDuCEgaN29fcizBuIpSO0EC7NoP3CO4/g=;
	b=M4oVVQq7Y049+8xw39YVYBROuNQtrUD4KO4T0Hm/zA/DeunLgppMBYp49nbnMaSKv6rc
	 dtVbKwJFFZy71u8/IDiGRSPlx2M3sfX3U+DRpAHJPV2ZvBY51eXO6A0OD9/RQI+Bsy+A5
	 YAMEVQllTvGIC6XV3RnQd0Dt+F3c9iHNKIaIFLtQ0bvJxUh5VsUzcIFpwsg/gbEkkN5ox
	 ycs8Ur7JB8kL7ULKxIpxyF+EQwT64ZWqnzVE9fpgWJz/d7qvW7UU+JEBD1UiAuR/2v0VL
	 o/80/TYY0PJyTFr4SPQaOaiFUeDGo4nM2UBeboP2HaBoML1Yc9Mkurcos7NE2QxycjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahSJVIkJ;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802C606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5802C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahSJVIkJ
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso3146567e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471614; x=1796076414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CM4vCsnF7HcDuCEgaN29fcizBuIpSO0EC7NoP3CO4/g=;
        b=ahSJVIkJui5LzCFbgJQkM3ZcJDNC3C8BKkGUUWMNKZ0bgHurEsVPyc6EOtDL8akxOe
         eqSgEX60Typ1a29S3SqI9ws69PmTGOfPrEUMmRT4DvImCWt3SzSTCqRWIY1XDxxbaTJn
         m1VdCWeBM/pdBms0aGuOa6Q2ZGDC1jWHrVVeK3JcfJS6GT1CpINtWf5mrXCHZV61dmYE
         +jiTMGcUHKSaVXBHO28kdxACX/1X4M/qFrEtzw/XF4oYLufkNOZSeE9S3w6iv/ajHjoc
         Uy71Y2PK8PVo9K/BGq7NSbB0DKWR8X4NcbWZfAlZhyVqnBVXYrp/dAvFV/8UDnMsMqaJ
         I4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471614; x=1796076414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CM4vCsnF7HcDuCEgaN29fcizBuIpSO0EC7NoP3CO4/g=;
        b=Sm4hjzdhKJrAJkEf2cMxTM6YfcTbzfSYiVfvphTzVj4/6uoCjBlqDdRXRCSNDT9spy
         VIk9sTSvaFnyEEqIfEzfbuCtnKIu00EzMqX9MjZNiB+Nrz6gAqRbxkl973iEcmIYm34o
         cRvZFuzsPc1USGab10AdKf47//UHU+czr0CRco6l96JtrwmowwzEr5tUXFBnAaupUf9x
         WL0R1FJXEMzDT37E0EHA5/PUdoC904Y0rw0X6ogEleeiSZgqVwsZTSEbDVIHFPMR/i7Q
         4fAxJM2io/lyDJo0k4sqhmfxLcaTVj4Ia2XGLKvjU6QeCp064TWkzDzFpGO24fh3u+bc
         X6yg==
X-Forwarded-Encrypted: i=1; AL+hErEOOq9GAzdGU3WypsimZQ27XUgSa8w6uB7cx2FKMFTZ7Sg7buoJxUoOfs2HOWcQpNZ3R5Y27khoE3GLm88=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CJkFIiIx1z/mCdqYtcSZk4eVGrPqyKHuzATDpiIOseQrN6lbH
	4/G4QFTeK/sHT5/Go5SVTcZAW8quxcq2HVy5pWsL4DK84/aQ9E5uiDq5
X-Gm-Gg: AZFdTZdY5GnPqORJodL75npctdzClo6Yu96WcYMntJ6bUQX/QFw1l9bEMouBIIIIIZv
	Xz1cd2YP6yky1SMVd525Htr9TCVsfW6BNr53sLwf0ggkS8rPZE9mqQUwllisQwtUSV7UrKx5g6+
	+Fp4aALAcOmhJ+YgkrJgeb7ApIn1wEmI00DGkUjsSCUCC8Jxq29uJpcQHnniuAU5eFbNaP4g8EW
	inJ/VbCRW2IIyRuySZaGBRGSz68D2+TeOY6/Wf7sRzs1nhTHmbGlDB7nA7zKuc1v5Vu7GABmNxS
	hx9EOyO9nu7odFeg4ty0SFBOWoG1/3V0hXz8VssihmAE/KkjvR0zGCT0EvPlqiHcYrIcAaWkQmZ
	dhnPqW2jq3x58Ejgu/AxMLWtvpH4b1Rcw60TrxiufgibU9EbXlq6PqA67faA3EyjE1j7smwxtc4
	PfepVjx74Hh67qToRtyhwWGYoQ2tmHykFyRLEmJGxozuub0TYm3dTkzmK3swO41SOVjJfmlUcvK
	EAm2sjBxuNxFPzrDq1B/eBDu6MBGsAcN4eHdmOKAbivOkA0DAF26WaOFstVwcJwplyBugrlKAZN
	NK8xpR9/k5JEMBbbNqRaMLFbu9X01UXOxqccD3uGqFto6IJd3WwLsHaUNYAoj5wVxrmPc3C4iSf
	/Z65oq1hFtRALIswdFZdS7PcdAYTddZiBNZMjVnpflwWqBWnmUcrUgt+WvJg=
X-Received: by 2002:a05:6512:2387:b0:5c1:4a79:b9c1 with SMTP id 2adb3069b0e04-5c1bc844b9dmr3838498e87.22.1795471614301;
        Mon, 23 Nov 2026 14:06:54 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:06:53 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 0/7] iio: pressure: dps310: cleanups
Date: Tue, 24 Nov 2026 00:06:42 +0200
Message-ID: <20261123220649.36887-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The cleanups promised in the FIFO series cover letter [1], plus the
rest of Andy's list from his review of the ACPI fix.

Patches 1, 3, 4 and 7 build to the same object code. Patch 2 gives the
same coefficients as the old parsing, checked on random input. Patch 5
shortens the longest wait after a reset. Tested on a DPS310 on a
BeagleBone Black.

Based on iio testing.

[1] https://lore.kernel.org/linux-iio/20260921183132.233136-1-zoone.rupert@gmail.com/

Rupesh Majhi (7):
  iio: pressure: dps310: sort register field defines low to high
  iio: pressure: dps310: read the coefficients with get_unaligned_be*()
  iio: pressure: dps310: use min() instead of min_t()
  iio: pressure: dps310: use KILO for the Pa to kPa conversion
  iio: pressure: dps310: use time unit macros for sleeps and timeouts
  iio: pressure: dps310: drop the unused i2c_set_clientdata()
  iio: pressure: dps310: include what the driver uses

 drivers/iio/pressure/dps310.c | 95 ++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 52 deletions(-)


base-commit: f2cbef9101b9fc979a324bb1242b8b802a2484b6
-- 
2.43.0

