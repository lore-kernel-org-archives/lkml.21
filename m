Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804002;
	b=0vsjBuTGRQse5qr6mS6DWL/FvfCqeVWS2IEFb2BcKzzVAxvsXeXtEak4UQ1xJQbi42It
	 Xru96XOI81lJ4Pj3P5gveeRGm5v5/OpBOF0BNqi9Sx5Emylfq1dRWS1vrehIFUnX5uh1e
	 kgtN18+36zuP8EDDzrgM5nyo5CmCkvTHslUAMHSfwOYJeSaxl5wmAPaT5uiwnIMgjQ1iL
	 QdE0FvJhSXAmtUOT8cb/Ksev5CDke2O5A4AmINvE2j199bY398AbJrOPqXGi9ULhiIIRK
	 0rwGqVy4GpylZnU/erKR4iUQoRtOqmt6Hyso3Wi6OS29IXFnYeVl3A+6a9+f2Ka7SVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JUIkJDYEkx7nTz2oOBs8uKitK8ANRmBUsBm3gZYTVu0=;
	b=tiP2IXTyLg673RcDnToEPtLoHIt9R6Eps2JaIWcb/x2twNL4emsoHGXQD5AVwfDoISLh
	 EIHqd3JNJQbs7Qv7PlTWL1ZKYD6hTNanV1SVU0p6O9Cp61KtlxkodtBc/2lNGIRC0yCM7
	 Xz5buYO7tZtydyJSXbTbgJTPDZPZIkKKo2IzFcb8iREAz13WkACCaB36QN5oxRmZtqXbz
	 L+Mj7ci1hFkRged14x8ADfRIRATji1ypRkr87uq6UQOAfjIRpm6mIenqPMyRFiSAxp0nf
	 2xc2O5LgBiqd1ZcJ2gjX+xQspJoIbfaC8ytmbWbUo5+o0V8YqQSxhODxMddYyK/6MJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=scKjForM;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C1C606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C1C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=scKjForM
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55d30c054dfso83546901cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804001; x=1796408801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUIkJDYEkx7nTz2oOBs8uKitK8ANRmBUsBm3gZYTVu0=;
        b=scKjForMyMCNBTCUEurAxDY/3EwMt/oA/zkJdNGd6I97dJjAZF1l+GRpZMtuWGSCGs
         AGAKCPFgA4jiH08vzap3RvR+6VRN4lDcGKWIRhLP0Wmw6fm4R9zWkmvCicZ/VPeerQo7
         GHk50Eb5ykRVYKTbeEFCDMXNDOBev2C+EffTurrpZ9yK184OtGWZzMAyZobQS3OgCj9A
         SgZr5xyxMBwhn+K/Raebsvg/P5XWiVwOVfg/05/Fr43aGHzd0Y4Nh5x5PJCjwdj2GgIN
         WzOcnxBlWrpGQtiCZ3CSucUPrPuaFZHLYfgMuGJDgKZcvKbQw/c82zso4yc/4/W2LmzG
         tjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804001; x=1796408801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUIkJDYEkx7nTz2oOBs8uKitK8ANRmBUsBm3gZYTVu0=;
        b=xhkyhNvBktNAdzaqC5PIjDgooiod3IxIbCXo/ERE6YHO9St5bG0krzyjLm2mQzZL1G
         bF8urFEpmdGL2DvI4PcxGb1cpeAn/I2DTx0zH85EN9z6cuzRDHbNq6C5qZyl8vhOuoJx
         +IDkBmEmSISnSyVy8e6EdbJ4ZG7NielBHWv5A1GWkjbqFp5RT+WHpgSQiVefho5a7B0p
         Zn9IKcWfnl6Q7RYmfylnaJ0Pun70gklVO60owJorr8z2lHg6use2b7Ie2Y9cApyFfj6w
         qUk5fuV9K+9WBDNM5pF8XHsewbjF89EO2c+7fbg0bSWWFxVoI8rygfwypdTtaSxvwKJZ
         mhwg==
X-Forwarded-Encrypted: i=1; AL+hErEdboWIzPyUWjcr5EzP6sB9Xpm1grg/YLYTMPblP/JEQHGIly9XF/V8q9ebsAK8wO44z1ETmXFfXEiJvIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kvC/4xDyvZQHc+ixDgxWjJWdOsmT5il2j5GL2UPE7mp6zRnuD
	+7tnPhWhHfI4a+2/vjvdhT76R3wCX01ahHXFkhWv+uGGbLc0eLVDXmCJdl/wzN/zJqM=
X-Gm-Gg: AZFdTZdNUrcJ+wyHEu0x8DERARzNeiXYuJyy5cQtCKZpwkt3jljBl5SdlLY6iM32Cka
	auGvARFF/Otyun9l9OnH4d7kRr+xAzIfToBCK4f5MDU0kM7MAMpaSgCOo/EX2qS6j/PBYeYj4sZ
	v11n7EgbIfEV9XkJL6Yio2qkcMYrue3YhTRGDW3IqvtlZyo/bdLp2G6s0ieaptkMoZD4/VzUJxP
	1DEBI4l7MXR+GdqZ3jPbkByfyrGmeTQtMX08EAnNysLdtq2GGzZ2tp41kUzEQqiNzm/LA+JuqKU
	NRiF3HuDsg8dGTWcHq2h1ZrGNYh6/pPu26KNsukrcOKEWbO5fjHWRIdUKvG2o1LvgWa/USm88sA
	KQ1HbanhyzPqQM+qFnCDWZRnTzyRGS1JdbJreUpbdk5T2/3J3FQADJ6t+lUPdSYwhEY6pOrZ+Mn
	pxs9qAhUKZkbAW06YEXt0yDvurH4fCVqhYj9X3pdNhPiXIYIs32V1YVcH/Mh0leY13a6RglYXxf
	V87N3q1t1x01E7HLPRiDwcrITDk3e9YzidliE9/SBpbpfstsoM5Wt3oqPEhdhP4PLi1avu3h+/z
	tOaRrZIBxT9w41LdNXxE+/JMCI9MMdp3aqA=
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr4566002785a.81.1795804001385;
        Fri, 27 Nov 2026 10:26:41 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ad6dsm1889062885a.12.2026.11.27.10.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:26:40 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	pmeerw@pmeerw.net,
	matt@ranostay.sg,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/2] iio: health: max30102: fifo_ready() rename and I2C error propagation
Date: Fri, 27 Nov 2026 13:26:34 -0500
Message-ID: <20261127182636.83803-1-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Patch 1 follows up on Jonathan's comment on the NULL-dereference fix
and patch 2 returns the actual I2C error from max30102_read_measurement().

All patches were tested on a Raspberry Pi 4 running the IIO subsystem tree
testing branch with the max30102. The module was reloaded and buffered data
was correctly read, with no errors.

Marco Chen (2):
  iio: health: max30102: rename fifo_count() to fifo_ready()
  iio: health: max30102: propagate I2C read errors

 drivers/iio/health/max30102.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)


base-commit: 39508411b82d4dc29dd245bb471ec9ecc1111c9d
-- 
2.56.1

