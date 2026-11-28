Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866944;
	b=NttQgEen264XV0DJMRs2QwSqTfRMZV7weIlpUN8uylb6pFESJYxZ3BQOTGJnT22hGvJx
	 21kK3hKTClA2aoauX9eigTUtihAQDpyeUuzzE1oGoIcOVdijzscqyK9CN9B2TfOczeTj/
	 4cplSQoRKv2qcBmQnJ3z03oCOGCy2MOw6njP/8Egzu1oFx6LyTns25s4XkdMcNZ4JBlgh
	 kr91tU4y7iexEUVIEkjk4mFOC/TSC2YtukaX+7hbnO/N/Q1Z5xiZEoUnMqpUUexTPKbgN
	 Eh663W7UNrJgHyhq8LkDkfSjp5uDxa7pp9WCtACAZpBMiFf5KlTNVMlqIhvSdyY008Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aBocqZHKO1aySKuVEEUC815kdGRQLnhShgs9tyAzobU=;
	b=ljBSAT1IszNA4H8FpECfgUDjENaqc+1z8oHFo/shkT5RJ/QxXIZm0/+OPnIvbGI+pdHC
	 /04dP/vLkV0kw3/JrLoQOncSBF11aG3SVZSaxC/KwxS+3a+LI7PQ0QXuqiN0RDPl8ukOf
	 DxL1r2+C05UBTvxf6hHH1pGhp6ySms/1Li5zTtRJM0k8S/5NjNxzMOpnyCkzhfH7fhx1P
	 wbZ6axIZ+8jM6+DkwAOVgiPel3Wr6EYxAFErDABEqvWr9RLDoLTHvyIYswcyI3W0/kNIP
	 gIYNhom+W10GlVhccIKsGbU/j+0QmRCGQQboTcnLFKHeeCJTJ8/u4MlnZoLIu9GsPkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IF5ezen/";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IF5ezen/
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3863db981d4so12624515eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866943; x=1796471743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBocqZHKO1aySKuVEEUC815kdGRQLnhShgs9tyAzobU=;
        b=IF5ezen/nqsSLknLEYkdekZ5Pdco8RqRH4evjEQKhXI6LF1OVqEje19hAL9PFKb0/s
         WZ0nS77AoygoIIMusuPnorZXI3PlitG6BTEIjO84gIKje9ngVmWr1ul84fviQfNxSUBw
         pICmaUrCUlWFzuJDBP+sP/hpdv5y6y6w7642jtVpKjsadBLLzcR5XS1BpqQ+Va90Xvcj
         wFtSUXDV+wzg6SAHKYcsdrULszp3i2s5eKty6tj/H8sODT4RWYJHuvPnvdcV7U/ZyYyk
         YNKXgFHfbFNoMvdaDfjymOMCqjalLLlzas8m8UgAxi0n2CbYtLnuoj7XEs+qKjmy9MTv
         4nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866943; x=1796471743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBocqZHKO1aySKuVEEUC815kdGRQLnhShgs9tyAzobU=;
        b=lctxlur8klYyrv/QspzNu8c78dvfGUzEQ/uOGvImVVpeBx9S1xH5FpLekombJDuPE1
         TIVIi9CPdmV4b63Bxxzp3lJmGAbctmaNTe2mXh2tJL2GCuuRnggcHSIo0xaZPtqs+xD4
         zvZCKJ44C1RcGztsM/JzDaH/KEm251S5SpCIdxra33nJxYIRZC+VEED4kTN0to8cJ1QF
         rZ3zRNhyH+Tbh+0ulTO/jeNde4MwSzClHaPVlPKroomTiJ/+JsJ9IRWcu/ONGejO4k+f
         wMU43EdlMGMaFTqgkh5QdAUWVJiUdgsMVeiKdXL8hqPbC4q+DCacSPO8hiWgi9Po3uaD
         mAGw==
X-Forwarded-Encrypted: i=1; AL+hErGX4XI55Sf4Gpjvt0lrjHb3CzxVlcHO16DNv1uhbtSWePKewTd313GyC6obiYuM/ARPpsYIkOEO42WQyUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xaUykJMJEQR3WH+fcA/RsT4BDt0wrvefYDpidbkMotwDGSPLm
	4R4WGLDr7wkr+uBs/va2TJ8hDLz33RPshQRTIIXkbOPJ1UjnbzSYEW20
X-Gm-Gg: AZFdTZepEaWsF6CQtW3Q+2llL2YnBcnqBavjHYnhBw9UELbosSYiVYCAHmjEDvqoWX5
	4zBS4XR73252CdAlNojoi6iho97yL7RIfGesiukBM7vXo7pfWkRrT0S90tUM4FJOL2zKRWD25Z3
	vDGDKATPu6tXqYOf03FO4RKJ/I1FHBhr35RQqC5/K0gDqqAcDcWpr+TgHEIYRlB2aDAZ9gK9IuL
	qQP4alCE331rDSnv8Z/oo272my4sI0T5kF37aoDSvc6DVJq6tQpRFD+lUPmY9KglGYjdsuogENn
	Kdwed5ca6OZcneJ2pBc+8NQFig5+qU0HEtZMI4YtZRYyctmatFNiyNEJvDVK+vtyT3AGs+uagBY
	/sA/YnDjMX4sVKMpUnj9wVgPL3V6WMgfQoD20tBNTjMv11KQTtL3S9SLRjGX6U94woI8/QIuQm4
	A4+YBXYRmY7b7xZeKyRZ0zJkLUSaXNd1jp5YaWYswSwWJmgEK5PhUb0QHU5CsBDqPcaAOEdPbYV
	+8O8fWM+k9TR3VV783ElehIkthAPi3CER639zlWAngrsbgApDurQDUS0etdGM3FxCJ03W+k8/t0
	1ngsdvuHdU7tG2k+ZXf14btk7bDwV5GLYC6yKAFa4H1RkbflaFXJvKM+u0c5qmsgahJ2tR7QQyA
	5MS3IUSQjbTCBByL9ESxjoTEN7esIKF34PMI7C+VKMwXuNx971xqroWemA2Dehtn7SQv8W3l+Qu
	GtY6OYzqn9MxoUf/iwZynrPVNy+DRMFbAXeZmLQqcEOA==
X-Received: by 2002:a05:7301:10c4:b0:386:d310:4c1c with SMTP id 5a478bee46e88-386d3104c52mr13030189eec.21.1795866943488;
        Sat, 28 Nov 2026 03:55:43 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm76783178eec.13.2026.11.28.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:55:43 -0800 (PST)
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
Subject: [PATCH v3 0/6] iio: proximity: sx93xx: fix raw reads, thresholds, hysteresis and gain
Date: Sat, 28 Nov 2026 17:24:48 +0530
Message-ID: <20261128115534.558478-1-kapoorarnav43@gmail.com>
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

The remaining sx93xx fixes, grouped by driver.

1: sx_common: a raw read can return on a stale completion (left by an
   interrupted read, or by conversions while another device uses the
   sensor's trigger), and it then turns off the CONVDONE interrupt the
   trigger depends on.
2, 5: sx9324/sx9360 write_thresh() lowers the threshold by one register
   value when the value just read from an odd register value is
   written back, and lets some negative values through.
3, 6: sx9324/sx9360 write_hysteresis() turns negative values into the
   largest hysteresis.
4: sx9360 gain encoding, as in Semtech's own SX9360 driver and as
   sx9324 got in 108e4d4de2b5.

Changes in v3:
- 2: assign reg after the last validation, right before the guard()
  (Andy)
- Rebase on the current iio testing
- The negative value checks still test _val before the conversion
  (Andy: "the original < 0 check might be cleaner"); happy to switch
  all four to val > INT_MAX if preferred.

v2: https://lore.kernel.org/all/20261122074649.239441-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261116205320.26070-1-kapoorarnav43@gmail.com/

The threshold change was checked against a userspace copy of both
conversions for every val from 0 to 65535: all 256 register values
round-trip, and every write picks the largest register value whose
reported threshold doesn't exceed the request.
Compile-tested only (W=1 for every patch, checkpatch --strict clean); I
don't have SX93xx hardware.

Arnav Kapoor (6):
  iio: proximity: sx_common: fix raw reads while the trigger is in use
  iio: proximity: sx9324: fix proximity threshold writes
  iio: proximity: sx9324: reject negative hysteresis values
  iio: proximity: sx9360: fix hardware gain encoding
  iio: proximity: sx9360: fix proximity threshold writes
  iio: proximity: sx9360: reject negative hysteresis values

 drivers/iio/proximity/sx9324.c    | 21 +++++++++++++----
 drivers/iio/proximity/sx9360.c    | 39 +++++++++++++++++++++++--------
 drivers/iio/proximity/sx_common.c | 25 +++++++++++++++-----
 3 files changed, 64 insertions(+), 21 deletions(-)


base-commit: 8b5d2dd3cf0edac5171f40ca3d2fe69fedeb10a2
-- 
2.53.0

