Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465581;
	b=uE7sHzKL/580sa8ctwHF3Hv2il6Z3SiOsLSpMVPe+OLsI7293EKY1X1mMn/r6geRJJW7
	 2JYMsuveVB3CMS5At/Us8AgLLY7hpHMbSLK+Fu8NjZdvsevp0NrfcN57n3KP6d2gK4r4A
	 9MkLE6ZC+vqwnfmoWU0LU1HGB6HgC8VBq/i12TBatbAPf0/kOLzCNt01iyozdwyqNY6Ck
	 7xrBWA3K+3OUr9bl1gsRSBhueYBgcBhDtySO74gVS8ygLJWi52OweV1hCKd7GDit+UHFX
	 Yzq19PZZyuJ2RopZOHx8TcSzNA9x9xjPNhCKjTsbWPYkkwabT2Ia4RGvG7gZZpqu4JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qmc5lnHTHHHfRq/qfxs84Enao8q8XNbu3+of0yEPf4A=;
	b=LSGYngE5yHxfIkFbn/DpmjU3ROLGEw6bAzUhIbsCbM0PasVj5Bun2hlfyRUpea2Hah15
	 jETGV7L2LuxInj/9VcXvIFJvI5p43bxb9FFA5beV685MLZ/ZiaM97MnhPiv/G4UMzHG3K
	 NRTPJUFEjH8n1RQYg2XxRrakgQs+zXT44WpIXX8L3xcBSIVMOZTXwiqBQ89DTAA2wNEdy
	 7bO1vLKRwksTZcFkqflwnu71SWQ3BLw4a8lSbdnb2qpns4HKpfLqRkX9r/NyZx9FwauDW
	 fDDuDSJ2G93cIpK773WDs1npIA5MicvTYicrl7uZNO0zAtAdLiriZC5YxyP7hgwPHPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dPYjC6L6;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB364606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB364606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dPYjC6L6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1769870f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465579; x=1796070379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qmc5lnHTHHHfRq/qfxs84Enao8q8XNbu3+of0yEPf4A=;
        b=dPYjC6L63YHdLT0szS2CodZQfYWxLhIVXN0cMjEXKLWwlPsR+Y3mkIaQTYFBxZgQXH
         3Sh0+2WGwFJZ47FfQE0qSj2LDVluDd95tGjR4wxfY+XeiYC/z5gCjFJvoZ+jiykmeyYZ
         g2nYq/nlEeGoDlB7/D34UbitpIu2o0i4e7y2qjtCbZwXAWgJIY3PX8TQAPPtPNuyaxVh
         5DI19f0Rhd9EvBEZzjRupMyKb4//SxxSuykmcNJTWxbPGIYhkdo2h0jgELUPVch37Re+
         fReFv5gGr8e4c2DHih8NF83SVLMzjuc5iAffSO0sQvFf34YZsLEwbPo4FhROIuG+r4Nw
         EfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465579; x=1796070379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qmc5lnHTHHHfRq/qfxs84Enao8q8XNbu3+of0yEPf4A=;
        b=ZeoA6avYk3FoBVs9JtNfucm5B7m/1Zz7Vra3fZkQtsJWBtqWCBpHmegopyI1Y3otjE
         94rG9zh0C1F7DKaa1r7oF4CuKWMWK68YMBL40OkChXMLxjKlQ2YHbj3wkDxHCVRS9pI1
         I0Ych3TI7fQYcnBVrr5S227piD0QmxtrVkUY2sbl75FQiXRa4lc5D4N7g172/QXDG1tf
         uenTWQvYhSRaosBQseOQx8SzVENbA2fvJMQi+0Tw6nsMMHyfMAKxEPX7kwpKFVPsx8uh
         8cdMwJ/AXs3ezuS2V6hFxjsJQf5y8jqAvkxAynGKahGMetfoUTtDlQ/MPMO6pdUsodpU
         4f/g==
X-Forwarded-Encrypted: i=1; AL+hErF/33IOeG6+YgBttRowLzidgDn7LHFaSxJygvCM+QC4ZEwGdmis7NdjAwC57swnrTb9ceQG6+Ms+CBlLs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+i8YR0eB9Pw3D+f4kl221GLDV6DZxxOZnGeBNTd2fNg9KUUda
	leZ36BnNKKI2JEVRp4vOsspy2U8rcD3+ZcyokhQ4ygAddiIoB0x9ifoqEPsWvd18AvQ=
X-Gm-Gg: AZFdTZcplmnV9UXu8wgafikz26BI306hNaijixIlA4fJ2gzhmO3Jnq4mXkdZWU2Ucjk
	zUfipZODRZTz8vogoQxuQ70JkvBbGiyS8kcqghunMPUz51ZrQ/GM2vdfOU6WexylQ5hUQA0kLHn
	RYlPuO3MIDuzq5zYWoJp1dH492U7klNhTSlhyqxJIegyEiNPAEDJOHadLlcdsLTsqSRNuyX8J9Z
	cBrbcFusbexX8I2GU65ptKdlmLEGR7D4U2aScCgZ/umM6lkLGEi5RKhBcjT2lyIqrmbxie2jS1S
	DlaBeFdHDLPF13Ntsv+aigIW1s2FaUXJOrutXY8n9S2aetCZVXAUrRnXneHl7s6yLR1+DqdlMkb
	K6wvTSd2OpVVQzhpHj6a4+CaaQFlZ58XKHqB/o0b+dOQhZX/qydc9Tf4MY39cWBhAvlsLs1I4Vq
	ChwR7S/ZewzvNYhuZXmfLYkDvkdrOKUtkXZkzZ7os/8dYurv5D5TDjTwDoAbtDXDK9jT9uyURhu
	/LX+gRV3ph8sJLtTyKyRHtQWxQ6HXJ4AckVAkHx3UKXiZkMWVi/SZM2Wya46VNpbBKmx3b9TrTP
	JOCCZqSEVAJDQh/XqdEG2uZbqaSPsRMxPsltoo1CgY2hBI6bB4QztVox2+UqWMH11ISgTybohxt
	mMI9Zb5BQU3Up
X-Received: by 2002:a5d:5f51:0:b0:4a5:a777:b5d5 with SMTP id ffacd0b85a97d-4abb4c7aad1mr23466010f8f.55.1795465579053;
        Mon, 23 Nov 2026 12:26:19 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:18 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Mon, 23 Nov 2026 21:26:11 +0100
Message-ID: <20261123202616.17334-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603 and MMC5633 are listed in trivial-devices.yaml, but boards
need to describe their supply and orientation. Patch 1 gives them a
binding of their own. These bindings are also used by PebbleOS, which
is where the need came from.

Patches 2 to 4 add the matching support to the driver. I have no board
running Linux with these sensors, so they are only compile tested (W=1);
feel free to take only patch 1 if you prefer.

Changes in v4:
- Describe tSR and tOp where they are defined, citing both datasheets
  by revision, page and section, and drop the older tSR comment at its
  use (Andy)

Changes in v3:
- Reference the datasheet timings tOp and tSR in comments, with the
  tSR one in a new patch 2 (Jonathan)

Changes in v2:
- Cover the MMC5633 too, including its I3C connection (Jonathan)
- Add supply and mount matrix support to the driver (Jonathan)
- Drop the mention of the missing I/O supply (Jonathan)

v3: https://lore.kernel.org/all/20261123194943.57601-1-gerard@teslabs.com/
v2: https://lore.kernel.org/all/20261122190836.66111-1-gerard@teslabs.com/
v1: https://lore.kernel.org/all/20261122093412.71604-1-gerard@teslabs.com/

Gerard Marull-Paretas (4):
  dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
  iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET
    wait
  iio: magnetometer: mmc5633: Enable the VDD supply
  iio: magnetometer: mmc5633: Add mount matrix support

 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 drivers/iio/magnetometer/mmc5633.c            | 41 +++++++++++--
 3 files changed, 98 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

