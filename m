Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742786;
	b=VhdkERCDAD2PkIFQLJ0ifSjbdvQWquCd3Ftsa6f8+qKirs1gzl7/d6PPh8Gj//vxvJ3f
	 4VKj70QyAROYMXFamRoYJycKqmWrtlDvnCSGhqZoOj+HXn4nbU4FzFWuR+45Cdve/4kV9
	 0rMjjwBZaUPmvTcGfWRWjpC1ZL/shHvOj3lC0Bz7dHsy2uk8k/jyGvkVOeL4ffBBb7cSP
	 yYgDzhu8PIMrFwsIH+Ut8ZzLQ92KqvjHm9wEYbx0+/amIBRkRILslDb85vJViITWF+vco
	 ge/n6gJigMJcJNTNVRVCmJ9Q5H5EM9v35fqaD12ntaEQmFCxVvGCCR0u6iCJRPYnv7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZT5vY911PY+oPZWxUSYR9KkzLhjAtMnoOlULn7xIyWk=;
	b=ytxLK/PRuw7QgvenVi47fMaRoBIfDeUpxfBx+GH9uiavgQidMeL5k9hHslwDiqCV30qA
	 I25R26brY82dEGf6tgQWSJ/aYMa2JIT2HglgLM/RMrzc6e/Nvlk94ve/vNiR5D7GJLhAk
	 gvE+jBVvPqhB91DPcUM9ipjs5k2DsATxk5LXk4Vwk85b0HhXZGTiFjuoeNC4+AyLwvLrK
	 lig0bcgs5AS+PsyfAZKwM/wb1/7IFks644Z5aEiekwBWQllcX02EJxf1W2gj9va6vSGaM
	 sWwS+J0uKup9eHmpvZ96xrELhHsYw56j4bhXPTCo+IRvDnB+v89AZ/tLAQT2Gk30CLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5nhRQgO;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E6606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5nhRQgO
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so3755562b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742785; x=1796347585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZT5vY911PY+oPZWxUSYR9KkzLhjAtMnoOlULn7xIyWk=;
        b=b5nhRQgOvmU8zK254e7mxA0oUMCGzC+TNauGOd43QL/xLLkKG7nIylaXX9O9i1tsv/
         96gUbLIZ7bhY0W8vUpULQ2AiGgunxlQpfRMJhBcy1XLnFiGC+btnC32SzzqCNOBERWjX
         U+Ra9kZyRHKAJ6xECJlLcC1pBRwDMUrRMaV2YZ+qtYYBzfpa5RW4PljuRbNUm5jOVMis
         yTtYeN5OieTLksWFMQe73+NyCS88Wvg7IFgTcrw5OpPzNW3fZihiWCgAeXWvIDwUjaTm
         xdr+0cuqZTY+sdC3TogGdjDpEo+1PxTwG8bF91pDZjCZ+OxFuOa7Sj3yR0ry1bpY6J5H
         Dxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742785; x=1796347585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZT5vY911PY+oPZWxUSYR9KkzLhjAtMnoOlULn7xIyWk=;
        b=F/8r86tV6aQthkOszYP6tlyFjtFRB6A5boiU+Eq1iy83cfQqs5vMDSEH0fcw6QequG
         EizOg+iCLEvtRezF0LM2i+bEEWyAgCzXtMI0ERbVBHSiLeal8ccUOKMz8JKvbDEO3TxP
         a4G4ogspEVjjQCsvdN61aN474kiCGae5jTffKclxVlr4j8dZR+d3RIL+IfddD84rNTuV
         jfMdmMfw4akYZSTHea8iMIX/zghiF2KnD2leaDFtegk5yGXzuZLuXookwuD9fsz6I/07
         0VphMER9x9JbZQ+d17qeOoON1L2ZIEpsjAjwteYpzCFIbJ5y9QXPWOCyu0c10nsVB3GQ
         UiNw==
X-Forwarded-Encrypted: i=1; AL+hErE5yCaD9DpIKw5CqUYXdcLW7GM3X0BpnZn9Uhmsn5/9VPWAv2PqRtOeYzq3GyYGnGfpRaG9B7ieaxuqIjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FHGY238nvcwl9GpiRlS0C184Pu/zDry06m3jehYb5kRFOv53O
	xUXBjM2vR1esG6LMvLDJXFiQi03wt9kOhDVk1BZZk2UyFNHnDpqDB5qD
X-Gm-Gg: AZFdTZdSZK0pLGVzr1iPq5sMjd9QrhZ3ra0lbr2FVAd3uEVPgdpfqJGkVukI9eRpkOf
	j4nZMglJZzpOdzvXI3msoSUTz5DRLpYn4CUhra6KgxJReCPLWWwYOOJVBIb4cWWH9X+OWi4cGz9
	vSPvj8KgbYOcm3O+I5n2KP4I7DBWpGbxyJBcEgin2Vo7ok4WUhrfxXwybcbanD0zK6SconYhZWA
	gKMO4iTfjXhVOzDvZ5g+Opp3sbgihYwWqXgrZxGPFPK00+7swhHzLR0ArcijSjQUnUcm7aHYZXa
	JcWCwm4u47WI86M4onR622JpdyZ0jWIPTCVNMZXyn3aQJml/dzG9N7JkcsUUuusGFWMfyd5QFTo
	RklbjnpwmAUXmka7Vl47KbnHRNyFzyccRFjJYF6OAPj6CszMjTrhKSPIvAI3Pe8GRKS6x3iqhiQ
	Wv9jq78tzruGViZG9L8hI5CPRuwoYhuziOc8zEtzHakFjutNYPy9NqGJHa2nR8loaJG41gVLhx3
	MeQigpwt8y0Vno/IiptBpl9DHZzTEdmsWIst/XKcXE4Qx1FAnyuREZ01QeJEoJQujS6XaiyHSOj
	Wunypqgb8z7u3p6cZjH/+rbpu7MQYuEj2ScR2afmlqAm+SXBIA1fnUPXoP4uBG0AwNzImFSsviX
	GXeWXLaOsJev8tqvfx3qor0ClBPByFNSKvCQFxsuAE76WvQ==
X-Received: by 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr22091582a91.20.1795742785083;
        Thu, 26 Nov 2026 17:26:25 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:24 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 0/4] iio: adc: Add the Miyoo A30 and PocketGo S30 analog stick MCUs
Date: Fri, 27 Nov 2026 02:26:08 +0100
Message-ID: <20261127012612.1589039-1-romain.tisserand@gmail.com>
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

The Miyoo A30 and the PocketGo S30 are two Allwinner A33 handhelds
whose analog stick is read by a small microcontroller: the MCU samples
the stick potentiometers and hands the raw 8-bit readings to the SoC,
on a UART (A30, a stream of frames at 9600 baud) or over I2C (S30, a
four-byte read with complements). Neither MCU takes commands.

Both drivers expose the readings as raw IIO channels for the existing
adc-joystick driver. The A30 MCU pushes its frames on its own, so its
driver also feeds a software IIO buffer and adc-joystick takes the stick
from it without polling. The S30 MCU only answers when read and has no
data-ready line, so adc-joystick polls it, as on the Anbernic RGxx3
boards where the stick is behind a SARADC. There is no scale: the
readings are raw ADC codes of the MCU.

Patches 1 and 2 add the A30 binding and driver, patches 3 and 4 the S30
ones. Both use the existing "miyoo" vendor prefix (the PocketGo S30 is
a Miyoo/Bittboy product). The board devicetrees will be sent to the
sunxi tree.

Testing: each patch built with W=1 for arm (multi_v7_defconfig, both
drivers =y and =m) and arm64 (defconfig, =m), no warnings;
dt_binding_check clean for both bindings; the board devicetrees pass
dtbs_check with these bindings.

On a PocketGo S30 on 7.3.1: about one single read in four fails an exact
complement check (the value and its complement differ by a count or two
at rest, up to about thirty while the stick moves fast); with the +-2
tolerance and up to three tries, polling as adc-joystick does (two reads
every 10 ms), no read failed over 2 x 6000 reads at rest and moving, and
under 2% needed a second try (exact check: about 4% failed). The in-tree
adc-joystick driver on the S30 channels reported 365 and 374 events over
15 s of full circles, 42..231 and 24..246.

On a Miyoo A30 on 7.3.1: rest 136/123; reading the channels from sysfs,
full circles 22..248 (X) and 11..221 (Y). The in-tree adc-joystick
driver, without poll-interval, takes the stick from the IIO buffer: 826
and 852 events over 15 s of full circles (the MCU sends about 67 frames
a second), 37..246 and 11..220.

Retested with this version on the A30 (7.3.1): with only one channel
enabled in the buffer, each channel gives its own axis (stick held
right: ch0 alone 141..242, ch1 alone 116..119); three unbind/bind rounds
with adc-joystick bound: no warning, the readings and the adc-joystick
device come back; at rest 139/118, +-1 over 50 sysfs reads.
On the S30 (7.3.1): at rest 152/126, no failed read; adc-joystick 1213
events over 15 s of full circles; three unbind/bind rounds: no warning,
readings and adc-joystick back.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
captured the MCU protocols on the devices, wrote the drivers, the
bindings and the messages. I reviewed and understand it, and tested it
as described.

Romain TISSERAND (4):
  dt-bindings: iio: adc: Add the Miyoo A30 analog stick MCU
  iio: adc: Add the Miyoo A30 analog stick MCU
  dt-bindings: iio: adc: Add the PocketGo S30 analog stick MCU
  iio: adc: Add the PocketGo S30 analog stick MCU

 .../bindings/iio/adc/miyoo,a30-stick.yaml     |  42 ++++
 .../iio/adc/miyoo,pocketgo-s30-stick.yaml     |  48 +++++
 MAINTAINERS                                   |  14 ++
 drivers/iio/adc/Kconfig                       |  24 +++
 drivers/iio/adc/Makefile                      |   2 +
 drivers/iio/adc/miyoo-a30-stick.c             | 204 ++++++++++++++++++
 drivers/iio/adc/pocketgo-s30-stick.c          | 149 +++++++++++++
 7 files changed, 483 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
 create mode 100644 drivers/iio/adc/miyoo-a30-stick.c
 create mode 100644 drivers/iio/adc/pocketgo-s30-stick.c


base-commit: 92c9d64c0cf749c8369403a32630562f0e855a6c
-- 
2.43.0

