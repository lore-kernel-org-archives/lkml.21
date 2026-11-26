Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695217;
	b=5bVqI03d8c9LaW72ozAZ91kx3LYsKVAHOd8tv5V3GvYQM4NuGL9w5Dj1K0g2ulLf2d7/
	 RGdg/gLtBqQXEcqiMgmxahrLgZxn6cWkgAMTCFQx76FLhLAh373u/xp+RloNMMJfJPEEM
	 UvTtrg2Yzh15aAm4ZGLM3vckiOX/HCAtLyKJSQsO/VyngmJomsbwTuA9i2IJEbHmx50jP
	 xLIi9iyNTzhExMrKfGOfJBGW0luSAfFpwWHZRdJNBnnUwQBq8UXwXQ1gt+yLX4UrFSNKI
	 SuiINHNXxH4u37Yhr43Eq+uBsMPFKACMa0AZkqZUw2M5azLiq9qS/x8jCEMM9BMem5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vEZkd73R9Nm/7G0BLxBa+UkEx9fu59+1ux1PHVb/i/0=;
	b=J2Jchky2mkE1n6P9Q5PVXLiKphKdunaj7LN8Nky4aC9yF3G5AP6rhjLMkgPQRGq0k5sS
	 H+IX2xnLbeqxyzN1plihlBtmWp0PkK0I8krVgq6lRJsY30X3Wm/aSHKdaDimSw2jSAibf
	 cH3tMeFoywSJrUwKgNWCKdYDDWWz0LQkWVn0nWXLE11SfJY4SQn7Vy2JEebqZnQw48PaX
	 sIr/3bEQoovrDUgZQXfOIoHFej5LToMmXPaqkieqKhuoxJKvmr7QAdAoHW5HnYOi34Skr
	 HY2ESFBod3EbrmOBMhTJCrC724ECFD9iPbLaaRZ2lFRuCUcKWzqWge+0aND/6jc9BpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJD+K5Qc;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F7F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F7F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJD+K5Qc
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso5848905e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695215; x=1796300015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEZkd73R9Nm/7G0BLxBa+UkEx9fu59+1ux1PHVb/i/0=;
        b=pJD+K5QcCPh1YWqCKLAxIsYRS5OOAgSCoUyL3ov8+EWugSEefurT7jZFBWd+R4DhdE
         NW4DiPbLgtFOqh64pdD6i0hz+MgQsHTr+O7YVbK0KOl4S5yD3Vcfflawh3i5+tECNKJq
         MMTxZH6VPfbgkrERCtevSTKOfmjjHwVp64tX8LvcYh7X1mjgdS2w9UQ/5I17JXFUY+Z+
         0cq9dE8rBZNNIjDGfUyuB+wBH50n1IBBM3S3A1Uo6vpXaXJMDT8mmUgLGa5KVEfkBjYF
         sbRSMWLPrBk2mn0moDZVsI8JtE6lJEetnLx0T9a0Plog9DA9o5MrMfyomheg0lhv3Ywc
         xs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695215; x=1796300015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEZkd73R9Nm/7G0BLxBa+UkEx9fu59+1ux1PHVb/i/0=;
        b=AAMWA6bqXpVCdmfJZBFicBwqh7JstOgVYDwz09ZF6UiWa+9wlzhSqFgJGm/4zB004C
         xx17+C2XpJT6nG1lIGYtiYiM/Rpn7Tl2/4hLs75B8kdPCYFdEGhZ0rCuBGKv+hthLA3E
         PZ3WaEy6pWjoRXAnrtsF5mH8Qr/hsntCvmVC8XryiS7kHPGpq5/goaRLgRLOKj9MMfSZ
         vnEPfQy1EhTAHnEJP+Wb4R+JTkjOp0AHQHfq191EnSNK4G0cfVezit61VLWxowds4gA/
         fFPma02e28H6Klbmdaapz3fDEhZzdXigvPlmfsEdw0LT26nu8GcFjwmSJ3UPBxUy3JCw
         u+iw==
X-Forwarded-Encrypted: i=1; AL+hErEVtnB3oLVZ+bDqrmIdVyOZ5txTqKBclKnYDTVWdnldZCswoxudhvDtE+87g8UbsGP2TerJWfpck78tTtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sQiK4TNu5rbjbSGVeasVVgmDPmvBB+9Gwf1xvPcwA7N6NRud8
	c68jIfgueM6jYCyt+znrQCUSeAPhgj3y2FmicvonlkcX7kNyF3YzY0zt
X-Gm-Gg: AZFdTZeAnQXsHalzoOSV7cRQXVm87Oc2uJHTKJsefq2FAyeHXUjN7FHkXYKcewELj5Q
	kQS3ke6KqxKVMlKHeHNUndcwJ0OHMxejjZW1PCJ43Hjjy7jApgQeu2uk3dY5AUFRoShccKx90G4
	gX4TzmKKz5V2T9OfC1Y0wEZVNrJyzsAVT8cppVbGj6d7fpzQNdhwj7lxIa+M77KqxsuJQVxHzCa
	hIgmnAB4/COwrrWgcTdCDeg3qeWXQ/aKDHqYmW3PSJSDC1dm1ERfvmRWGutVEE2ce86EvYHRaUw
	edHR5BtuXgvlUQqOzdwePkByzISx0DilSwjdpk0aiDEjHhfDH4RtT9PS3tuvEK2e7YyfTEhBuOQ
	FjrNIt9Rcteobi5n8V8Z2pi6g1UYxIYUvFVerxGPSNlyIqjeVY0L3GCmzZtmEp/ZEcUtYA2srJe
	1yNQeC3IefoiW0H5p/ehnljoivpeExfey7hw6uyEw7FuI6HYrVtV/qtyyZmgGn8YLePHruBeGZc
	9L4UfPXAr1ILRoZVl2Aa4Uo+91vXARY+trglLw0jVAClzhCKL1d+3uiFlRhdBzEyC2qdMS+82Vh
	iBFsIw2/tZWDDquoWpf5O2+S/FQyJzn1fpwBb7VjR86I3RLq/ARnCvXwvg6IwUA1+KNzH4kNE+a
	l0edr3As8UqzO2bCFFvZnkN3KN1tFSQUFB+MD
X-Received: by 2002:a05:6512:3e1a:b0:5c1:6071:76f3 with SMTP id 2adb3069b0e04-5c1bc87315amr6411616e87.34.1795695214907;
        Thu, 26 Nov 2026 04:13:34 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:34 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	u.kleine-koenig@baylibre.com,
	crofts@kernel.org
Subject: [PATCH v2 0/7] iio: pressure: dps310: cleanups
Date: Thu, 26 Nov 2026 14:13:23 +0200
Message-ID: <20261126121331.10438-1-zoone.rupert@gmail.com>
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
changes the wait after a reset from 15 to 55 ms to 20 ms. Tested on a
DPS310 on a BeagleBone Black.

Based on iio testing.

v2:
- 1: sort high to low, fewer lines move and it is the datasheet order
  (Andy)
- 2: "No functional change intended." (Andy)
- 5: wrap the poll call on logical boundaries, msleep(20) after a
  reset (Andy)
- 7: drop bits.h and errno.h (Andy), drop mod_devicetable.h (Uwe,
  Joshua)
- Reviewed-by from Andy on 2, 4 and 6

v1: https://lore.kernel.org/linux-iio/20261123220649.36887-1-zoone.rupert@gmail.com/
[1] https://lore.kernel.org/linux-iio/20260921183132.233136-1-zoone.rupert@gmail.com/

Cc: u.kleine-koenig@baylibre.com
Cc: crofts@kernel.org

Rupesh Majhi (7):
  iio: pressure: dps310: sort register field defines high to low
  iio: pressure: dps310: read the coefficients with get_unaligned_be*()
  iio: pressure: dps310: use min() instead of min_t()
  iio: pressure: dps310: use KILO for the Pa to kPa conversion
  iio: pressure: dps310: use time unit macros for sleeps and timeouts
  iio: pressure: dps310: drop the unused i2c_set_clientdata()
  iio: pressure: dps310: include what the driver uses

 drivers/iio/pressure/dps310.c | 86 +++++++++++++++--------------------
 1 file changed, 37 insertions(+), 49 deletions(-)


base-commit: f2cbef9101b9fc979a324bb1242b8b802a2484b6
-- 
2.43.0

