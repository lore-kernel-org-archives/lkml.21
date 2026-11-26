Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671050;
	b=XVB5yEo6PsjpRhBG7VhCyK78R+JN/8lfLqxGfx3N+gOsMltqUR/d09c7YeWt2YZDtG1d
	 druQh9iRdv1GABjMU3fuoBvy/iwW6ZplmeR/UJmPXihfhEEzPTLg3z+a6OYR4mjcvI0gE
	 jfMOdM6SrXsOTBUVeqB3j3lWZ899IA2LNnvXXWXqNGGZeHuuv5DZ/Sqi2zSoaw8zQuOC8
	 C2LZGWZ25X07DS4gBPKAE7JEVTI5eFGB+MsTyndmIq/fkdqIerGE8MYu7MR7Ku9kuJ6UB
	 OIUYStflcGbMrtwHi4yHHJvBIYT/Tt780K+stYv6k7fND4JMnHfrZ1wwrHAsLUi4GUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OxFT/2fpz2YMPKiAOVO24hA+jqmsHhv6SbZ/zvcocJ8=;
	b=U5O56hkSYRxyTlQERlmNV5g5opdg8Zd5/49iHXm1/bXAmij4QP7bOqi+5f+4xJqrDZV4
	 b1LWmHZG17sn8po3mHaMYVWBVrjaCWW9VTgrEWWyM0oEdwgqoi66ZvsYPvTDIUczqEi+A
	 FV1Q+TYcnrwGOvv9MY43lbZcNVeE55MfXtL8WaNnNmx9EAibevzpGlhhir+pd5LzY80Tx
	 nlJWhnXFSOcOkHMl96lclPRehXizNteHRB9fN+pr3rEOGV591FGs4niw1KxkatFVfwJl8
	 uxCd/NEmT9nwmafFZo4E/NkZfAB5f+2e2ytxVEiDoArpdOMLRkMclrH5dinHC4Bei1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyRDJ5my;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F05606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F05606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyRDJ5my
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso3580062a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671049; x=1796275849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxFT/2fpz2YMPKiAOVO24hA+jqmsHhv6SbZ/zvcocJ8=;
        b=yyRDJ5myRtX2h7ehwSgXDAFBSxBfQF+AWcDnI4uzx1BXhuGr84eK17JmxM7CXIz2u2
         jHJ1K+xzFJJAY75K3Q93YbiS+wG+EaA15CYtBR9rSTVZX09sZiDlMxynP87qOkUbpC4M
         DiBg3ubEa0+pLcYAUD+GAjdLF3QlnOg1reNxbBtamPRI6ZUnWS8K638Gk2sJ4Pl2AINU
         VxwU9f1xXZfheplgLEb8+yzTrHZq9I6rewemHBDuOPHxae/usRgd5OMRLn95Mx4vFXCV
         MkrAJqsfP9z25GgDrpii/xvRpFvRq53nkRXYiVjSc+KJ8FER57K09qpStYhYBjxmPcnc
         tD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671049; x=1796275849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxFT/2fpz2YMPKiAOVO24hA+jqmsHhv6SbZ/zvcocJ8=;
        b=Pp0PlPjqr1/7QBh0W0+jmqrOsw+RZ/MXQjm0jlSHMH2bz2kePNSaKzIThxowMmn4Bj
         2Ujh1zQyKVS3+NGdLKITPpLXhpqY2mM9zwjnfgiNa4nDcZAmAOIYBvK/p0Y+3tO8n1PY
         3c4gqvcI85OK6L4eJ7UAVeuOj0VsRif5kYnqg9Jg6LtGArXeoet8B+1FIuK9ltjL3SYa
         Tu1sIhCMMFaSTuyOEqcc02V+oFxn27Wz4+NvA7my7vnvzk5DV0bzyI8hG/XKNPTYXrOC
         YpzCKMz1khgC8m7dFlcYq1LARTNx8SHUmW+rUsnvYPRAwDnP6IHuH+gJQXIdChBT/IiT
         tQRQ==
X-Forwarded-Encrypted: i=1; AL+hErG/Wp62slmw89XLYixsp5xbDvqahtnadXb708U/FKh14Vv2gSypwkh7WHs+TgjQ95JUgClffdoY3BdNGWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+enShQ+9qSzdhAFMjIrhuDJJ3aSVVoN+CypDgaIr8CjmWa/Nsn
	2rxuJbGX/2nG6CIoTghQqYvAlRdBbqgYpMxNPNqD8oF8kvb6OqNBSVxc
X-Gm-Gg: AZFdTZflpNAyPt2vwftLaJvfCwgeCmzwKN5RM7KoTMrzq67hR8kXg/eXo3LnBy9LoDh
	VpTvJPIeRkBO5ADyf2N3HG5y38kANepW7CgcP9JEz3nf32nCeG1G3UnuPkEuSdpgl8qs/wU9mSs
	UqtOqQc3A62lKgvAaP/BKYaEmBW3S2TA4z7Q8Td9i9AJgq19gNkAx8/Hw+g5ZFI1B2bqVkKFQwG
	XC0VdHE9yIwH7kr31GHvfWF+amSo4KhazNW4KBz9DScya8G7C0Exm+7ZGFc13zo2DqXf9NwAeWh
	KWED6E19EUHcxu89bbAzjgbEevontmka/pCoTdXbCbXvc5TDkchYkzmAvgiq3rGbKiod/8jDXnE
	wh+6rud/KAjLOqbh5w8I9xzVAU7VzBm7/lHTvaffrIjq5dYg/9eaDWo7gwlPbdTPcUSEiQdp3dV
	ZTubOfb28XexxlRS6CJu0vMytAkCcA14ZHiF+pnZOvVs05DuJyP3oh6PapafG/8FXIKM6xUlbF4
	f3Swkl4ONjvS5sJPcHIEeeACvRmv1WICKuRUs4keeNIoxs1KHaYXz0eABOIRpxJ3vLPfCtA6w2P
	ErkQwYkwkFS/NloQ5WEyMNi+QJEyE/X7bD25OC33g3T0oI8cDhSH02c3r7OwYDfqBQHhc5njR3a
	Qj7omAB1WIXxTIzB0FMafiiIpU+yoi7oU2FNMHtATUXBDYMjc7t+a8dmc+eMNalqCRMplh20M21
	o3ih/eHOhTX4w3nXr6gUEZkvc=
X-Received: by 2002:a17:90b:4d11:b0:3b4:d00b:d0b3 with SMTP id 98e67ed59e1d1-3b4d00bd2cemr8675206a91.51.1795671049096;
        Wed, 25 Nov 2026 21:30:49 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm33700520a91.7.2026.11.25.21.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:30:48 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wang Shuaijie <wangshuaijie@awinic.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 0/4] iio: proximity: aw96103: fix diff sign, missing config, async config lifetime and event values
Date: Thu, 26 Nov 2026 11:00:24 +0530
Message-ID: <20261126053033.603086-1-kapoorarnav43@gmail.com>
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
   aw_sar driver), but are divided as u32, so negative diffs read back
   as about 4 million.
2: without aw96103_0.bin the driver never loads its built-in defaults,
   so the scan and the interrupts are never enabled.
3: nothing waits for the request_firmware_nowait() callback, which
   uses the devm-allocated driver data; a probe failure after the
   request (e.g. no interrupt) or an early unbind frees it first.
4: out-of-range debounce and hysteresis values are masked into their
   2-bit fields instead of being rejected.

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

 drivers/iio/proximity/aw96103.c | 41 +++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 7 deletions(-)


base-commit: 793d80b04b6c4f7f896c273567f94eccd0fac54d
-- 
2.53.0

