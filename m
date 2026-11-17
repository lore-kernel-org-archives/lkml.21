Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939892;
	b=4Do+BHjVC1+q/c4oHJVb9znC/LGAePOEtW006wynGHiRRF9DDpExhz+cyMmNUgohQyig
	 gSzV+4YG3Lg4Vc7JqDeTmMbEHpoH7eKNdHPB36fHEOBEgsWfk4gQklfrACN39Z7hn/VHO
	 dnMSoMBMQEpgKOaODOQjxCTZboyFyKFfk5GxBckM3HAbtajLutuJKF3KyjFPC/3EWzSmM
	 VgQb1oDu1jqOTlWqwRoAXDoclyHva/+TZktG2yemuO7e8HIK1qcfKr/L/iiwX9D1B93Jm
	 pw+ijSgpDfudHGN4a9JiKhecFp7I6Y2m3cs9aiToRPaAfn2mWmIBvkEk3zFcPoeytPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
	b=kabu2xaZim2g9LsRapdRbvnfmyG3fFEmwq1MwDgNue1yCwvF7AZQP/1tp4qh7fPIbV6g
	 jrNCg/erpvmbA42WPgTc/E6aFavudB8BXnzIgXgjBQ3mIuUy5nHg6p6zRjuQqJuFYal+E
	 UEFKlZR44WWh6DKi6GoO1o/b3gl1T0J/SJ/JAtkS3Qycuugd7iziAzqTB8Ml6CA0Lkofh
	 SniJ13G2oTr0HJ27rMIwlN256NOiPb1YbzwryV6/FxhLBZ9WuKrhCdmuJTdVDVC/YIdv/
	 T7L7h6l66+seg25l/gN8ugz+eJTsdR8gMK72gHWP4X6c+IuDh1mjAFC1hgEUIhG1+eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5HW2ZWg;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E5A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E5A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5HW2ZWg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so59151f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939891; x=1795544691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
        b=l5HW2ZWgz9xyPWgg0S1tlLErSqqC51e8iDSks1fsTDM6TtJ3AY04ouoT/b82UUrqcY
         qhFwBtzg0GoL915Xzvb4eLZD0pzQKVXkBVCukTzSO7QlnAnDjm0DLKhA37Sg6QlvnAew
         jMnTFjY9w1UkCudAocf7xPLcHZmx9J+WexCLQYhdptzuaroFwxhr5njiOdgczPwbtx9p
         Yir7TVHCMFUadSJZboQNtP62fa55acdCfzPSMWgJJNb4bMjvCohr7yRIyyHuF3uQwWuL
         yGjPMmxXnjtQysvqAXAtrcUkF3RBkzRLxs+JEF+PObX5L3xMZ1KleKYvo9m0+T3WUL1V
         pV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939891; x=1795544691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
        b=qOWRRCT7tabhgE7TG0nvOoldhWOAbeU8rDtQSEoudMf5PRn1BBac2ts0Ck8QV+d0n6
         jsEfrSlg3z0ddRMgWo4cLRtCrHM1lJT6VIwcgMFLuKmWmjLwD+rndwrJQZXrteH/e2gO
         YfQxmSddjyOCwiCXSW5HUa7WYgV1PfqCskLhSguF4/AoVMmQ5CPSpZdspEJ8l3A/5xK5
         2PzGz10pLoW2guRVYIw/6uxzKe9+mnWajBlLbyWyJPLx4Oz375x1pC50vTLWu5iFhZS4
         83odEd/n+Mqi98l/7nA46U2FHjKMLAGBWRzt5EN4YVIYvjbC8CY1WvCLHfbWSQOWc/kR
         w2DQ==
X-Forwarded-Encrypted: i=1; AL+hErFi3jxhqUqVW4cPycEt4efwI1cHWP8x4ell/2xqmQu7/KE2NddBhlBnU9bmgxkgPZWpLax28FV4IU6g+Y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RU+K0PlovJ0wLk2HXtHF05IRKgsrsNpLzlPAVXgyEHFnzkV4C
	c2RejrqquQtklxsGfkhXaWJV3fTG3+769qjPVDfW9uXffFEGdv7xvbyx
X-Gm-Gg: AZFdTZdEwUE9mP/JTYq+5EI07KK0qs7qtlmNKgo5sphH5vyGvmwy/MUQxvq8g0V2XOd
	jNWEjqrW/Jkw9YWaLCBpGIyt3piwD5yEXbRO1RrA7qLH2v9GT35jxqbHxidaS35Y/xuVOiQMlqP
	1iKSETCPufF2Xi7ovfh8pWscUcLhLhSUPDSTmaMPM+ejavtSDRN9WqJjm8gfZXkOTjtB7OFhP17
	N2WfIX/uasqFFRumqXgnerqpt1PvuRugs1RLuDDIM86jjJ24dvDYkmHMjpZt/8nHUmqzqSKkFIb
	am3fL306eadZJzV4zHd/kgTF9IzDutem0rqITV1JinOpcNm87n0EkOAb49nJG3i8Db9BFTJYrsA
	1RQ1ASUTGmF96LDjXiEWDCqkif/76wmdek3l0XJg1bR3hht4IwZ6SKgvHjh/Ako04tsCMX5TGir
	Tb8clgMm4PcRbiJ2Z1h9U1IRvgSIW5rux1ONplhc1XY2KIw0bjae8CrQh78l8zPHsdQnHi0CRWQ
	94qI24QR2lWNdTLZQBK5ubI6W4bZeTIW01i2qqoswh1XSMiTopmu9RLTV+TXP98tGKhbmgRRGib
	Jx9dA43eVI+E24RGz28RfeJL8LXHMSqtYYSHjTVyL9uHFrmzui10QtQeE2K+1Y/xAapAJ5TsiUk
	yWNfleR37+wkzHq2AQ1pWxQuT89gJftrPsQ==
X-Received: by 2002:a05:6000:2c05:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-4a6394761aamr659338f8f.18.1794939890592;
        Tue, 17 Nov 2026 10:24:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:50 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v13 0/5] clk: add support for Airoha AN7583 clock
Date: Tue, 17 Nov 2026 19:24:38 +0100
Message-ID: <20261117182444.103123-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v13:
- Use guard API
- Drop spinlock on read operation
- Use enabled/disabled now that they don't sleep anymore
- Rebase on top of linux-next

Changes v12:
- Fix dereference on pcie early unprepare

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 340 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 422 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

