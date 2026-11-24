Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513598;
	b=vldZHgjB+GAb1jhA8YqLxNRkDAlL+HeV/os3PAx0sDwReKrv5duI5pGtzXKq0pKYtXrI
	 hfAZQXOoF7afN7mQgVZ7Wu1wzTD6b85WIxZOfYU+S0Lxk1E35Ck+bPpEFOYP4q9g38rx8
	 +fSCvDipw+NqjIIZMIkP0IUX1zcdZkIyUVNfQGFG4f4lVcKoc3h+5AB1Ud6Tme2e9G3K+
	 89WEN5PCbrFIX1Z3ssYhPxul4PoLCiZf3mpWu/XhkX7jE0o8MbcfbpE6miHaO2Z8jGdH7
	 w0hqs3zo8WYh2mRoOGqZwl8PdWJq/vg8jD1C6cT2aeTAFHA/Yw9btoJc8H3iWaY10Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dw2szGzhNZKbIRuCqz5QNq1//TAtEEWAm+O/VeExQnI=;
	b=qwDu8YwMEnHJ9HQ2S2sVOSQBlD7r1lZReImoGimtrNAyOCoxlRv4rKJTQGzBgNNwiDvm
	 p7rdT5B6q5HduY6aIwHFmPiK9xczO99RT/YrFshFmG6T8L7OTTwQAjprdruuXn4MtPE3Q
	 GWlveynqZTwMBKENCIoZ/3zmvyGiia0i7JHW+X2LM1ZwHwgrOdvOOH1tiaOXC7bhhuZWF
	 JygsJq7ecjC2gUq3TUzPGvSFhQNgeakHJF3tJq1cScfk74ZpDubqvaZdSnyEi/4qKKNr0
	 jPVj7lPtqT0vKj3VZrPc59HDa/EZeZPR5iHAiugY2S0jTbUPUKLEoGpxQOCxcGBDiqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XrTkkVIJ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C6606CC02
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69C6606CC02
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XrTkkVIJ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so37024315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513594; x=1796118394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dw2szGzhNZKbIRuCqz5QNq1//TAtEEWAm+O/VeExQnI=;
        b=XrTkkVIJOxi9g1abZS5IU2PN3XbVXZxOdgQbHNuwB3hQFXIzjJe6KLtEEbcyKD4dxD
         XiBMBMPe3jMdueNkFlAO2uTMJQNxVvmQnkxW49siEpTgg3ZdP8eigBhpc452GIPle7Ll
         qhSM1xVYjNGoftUNMqBbx0oyIcl/1rlCZqV5J1gdgdaX+nmZW9vEcvywix0MTFtiXzwl
         qQ/SUyiPazIzGlSYtBrFPsn0XGK6d/f99GFjwxicWHtDNp/TupiR3f8QiPIwMLskRXCP
         oAAcZP9jFFDk2H2KyOcc0tDXnzDTOpRft6ibynSlFrnhrYDO3gcg7FLblBPZNUb3vOAh
         ActA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513594; x=1796118394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dw2szGzhNZKbIRuCqz5QNq1//TAtEEWAm+O/VeExQnI=;
        b=GWoH3LiX5NOZRoKTXrq0JzRX+etzYvzpXFN8vFZua6TydXSibk4SR11MuRMrlZULZz
         R9QSmnz6yDlNsBY8j95H28zkDuVuAXcqoLVZVTmHfxMLy4rBTO2MmWkutwOqarUqqD1l
         HyZJDcm7fl7P/0LnMUF64ojmHp5jQzTQnNOQAY1rxp63JVUAAFBpqL9vz9pK6WikyB8G
         QMDzEE1IVQAIp2QH1U/2tluW2keu2dxwf3ts3zya7LjboUZK9BpUViWLPHEoixvw47YS
         luUXemEFQ6Z6eSvtTM5RkXyrb0o5cFXUloQm9gk+cMpQj7zI4ELjvadjk9FusrmxtIzX
         64Cw==
X-Forwarded-Encrypted: i=1; AL+hErEsSGt3O3/y179ORntGb94o+NyOvMFgfg4cDnyLVQLtFQCgasgi3oIHRBnekXoWLBI6f7mJlT66rv2T0I8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KQg5SmaQHfKk6bVZ2/0pGWvbmPYzreUG+T+bjgcy6JBstbAkb
	JU/EQkdUIcAN8ATGDIHaKERLC5KkS3RSkYrkfXx26vYxgvGAcZv/qIRLDC5xZrtHiIs=
X-Gm-Gg: AZFdTZcDV0Bz+a90yO0mlFKYWN/mToM59riTUKYJ4GU0eIq2o+89vxUMwNKWKZfZqQ8
	0TX9kyU0zI1rrEBXrehAzxGuUMfScXWaTS2zsyXf2TVoTqNQeF9diESh4Ce9HnTJNlUGZvW+/Fb
	PGinjGW1zcV43ivc34H29y0Z1fhWkzY7LGEFNkRDODzeQnAKIbAMhu9uTRZsgvakXK3ulY0tJBD
	rY9yr5nmq/uT6GTlBEYsebvGodoBIXx1idbGnzkTgxkIatSXc84e6DlpstA+p430P9rswbGU+ui
	84aXZrMuzWWOYgEgaTqYMIrtUWVgucdzHDQNa3t6wsmQu7JGUyL8AD7mm7vR3FFeDTwAdvCCciO
	2YTAEgV6PJ+WNCLif73oqbOs6zugEl7xUb63h8TQuS28OfG3QtMJIxIaopkKvzMTbCThvEnthid
	LDSswW8802iXuqxDva0HNYYQPX1ITeV4JX6bLfMWJS0ERzjYfd25mle8DoDvkhm3ubVtvo8NxDu
	b3UcEEIZCfSkWpr9O8n+lhEyAsEiNBiNPOyJ6uU8z7jAm2NL/eUHTgnmffGd/d8J9+uPEo2yecT
	rMubcHTVvYCqMphZy3wbBtlK8tdNxNQ9IjvkjkvhG8YH+xjvG2VmhJ7OKCtcsj9BYu8R2wcpxGD
	idpceI9ZGjpg=
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr296620815e9.4.1795513594081;
        Tue, 24 Nov 2026 01:46:34 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:33 -0800 (PST)
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
Subject: [PATCH v5 0/4] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Tue, 24 Nov 2026 10:46:28 +0100
Message-ID: <20261124094632.8879-1-gerard@teslabs.com>
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

Changes in v5:
- List the datasheets under the section in the tSR comment, and give
  tOp the same full reference instead of pointing at tSR's (Andy)
- Add Andy's Reviewed-by to patches 2 and 4

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

v4: https://lore.kernel.org/all/20261123202616.17334-1-gerard@teslabs.com/
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
 drivers/iio/magnetometer/mmc5633.c            | 44 +++++++++++--
 3 files changed, 101 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

