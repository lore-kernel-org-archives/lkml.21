Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296473;
	b=YEWx2v5qkAdufxFjLLNeytYjrP4dsnyAk3iyHjV4tbvsogyV7aHi5mUAI8KBEnnqYT/s
	 arpSccSgEE6iuuTbUuvlejNEN+0MuDjLqdYLA+AjaqqcSbvfLaCx+6ixEzk+OlfJth+KS
	 LDK4IOW0PPhvNDgUiWob8yfQN+1eziDrq7PasxP4dWRfuLhNZ1JBXC2BZSSpWuUDjDR1I
	 bHmDR+7SW4GejNwneUrTlAAzWs05Z80qPSWhAauK+mVRhoFM9OPL4pJBt0rIVIoS1hRfW
	 BqBE1HCojmZy3h2T0iNJn+3a6n/d004p5QSJ82HAhdQtDB6ZGKgJG9Uvm1gU6cFEBBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
	b=0G4CWq7fUrbzI4MrulwsGxCXjvVwpuRelGeBmIg2vTUCLykvERzSBbLTmdbhIUorqe9u
	 GMqz7QvpWDc0PXuZSUG2tJboILBM1VvU23hro6OP9LdnhQzWWIDnYLFtrpRVG1qWlmlZS
	 rhGtMUJN39oSLesjEsnA6//8DXwrNocDYRvgKGsP2oLDIH909RXhr3KQ7OcwTE0HY6MpU
	 G87bhhlfsPD0bYvtLcyAa9vZfrLMBEYWpijyAnnC4TkEKosM0fzklC15pLUo3wChPYXlO
	 pN2bwMkg6poNQoivfxWFEz7y2qcUoxbrEwkVXl0qr/fdKTG2AENlurCelkrj8MXzMmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=al8q8kIV;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0094606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0094606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=al8q8kIV
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so23637565e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296471; x=1795901271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
        b=al8q8kIVCmw6MiMt65Iueza+XABxhPxX2xNL4nlblp71fgfW7crmFSA8Hp3q8CmhtF
         DIM1fpexXucynuyKElHILyjLatX8my/uTR6lEvTpUWGmFBxAw45nsRNmF0ZJ6Gc4zLL6
         58lE30ykrI7kQ5mKTQsiX9dvy92N+KI+an2nAkRwh66/tWiKXf/hSMykEJMMMHM/Ts32
         fawEkD+1Md1nVfYU5hk4hcZ67G4hxrGxrgVvOZ1SXoLBekwtHtL9FefZKNEIII4YDaU1
         wZEx6XmMfheqEiFvBim/U7PZ35vnAhHz2GdCd2z980XD1TzQ+o8fe3EsbROUnJWg66q1
         4ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296471; x=1795901271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
        b=hFres0k9r0Ef4kQHM3+yhBaBVU57BVlWv9dTUnAbNDI9mNEQ/aG4pbCgbDg0wPd/M4
         ncpKhWmSCroDoVJAzZvXNG0pBWfv9LEjBt6K0buyJXromTWn6sn2H+LVa2XMRLCTP6rg
         rolbyxyf+DK4kN3Qi4Tue8OZHwZLkliQKI9RYGgj0iSn2fGBTzPD0HIj16e998zHO65C
         7g/CXWcqPBsWt7fTgxrX/3YA+l9gJ8A3vpGgcj7A4NZzzIdBxbR67xb5Paz3uUPeBuqC
         mc/QtE2fzDlmGUZlJSfHaVl5fut/cHiTO5W8qy0dpfquq5FHeY0FrfKwDYYa7EgJedXE
         mtKw==
X-Forwarded-Encrypted: i=1; AL+hErF5eJuHWkbWwo/ZBGHGSHlMtCpO0Rs+U5C/lTM1rz2/YqaSl2sydaP+GcS+2dmJ6bLlt+RLra3RBcrDC54=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OCfc+pcjksiC8Dyka8RIDWSje5QMawasFpj24+cNSuv0lUUgz
	p+sdoOukSJyKVZqcNxYnfhcHGqhHaHQTvrAiAq9simsYB0YmDoUk0CbL
X-Gm-Gg: AZFdTZenNwQM9pNSkRPCxvcKPpkLtJXjsaoqgSLn2MICKrNR9Zu+sMzNbEdCBjCE90O
	W5PiGFD8FotiS1L7NUSUPxpHp+W7i2NkYcMK9j/939Q8/mdeCpE9OYoxUlbD++d30Et9df/Cp7z
	abR32Nx2KS/Q3OVCu1cPrpLClbJuBytD2goVbxJGjkn32Vj597uk8YxK2QpkPjqm1SsHnL6Tfdi
	vnONxmdcYU3iTgFn6oRQZ7qznx4FObWN2gHqcXOB2y47SMYyDC7Xvp5R2EtiDUKLh2LqShzkpyp
	8JyNTk+Mfdj/EGzv4o1hDv4DaaV5pw7e+eTkg1MSCM91qzl0ybg3JwCnc/xCj2tE9MP0eQCHSQu
	lMS/Gj0BYCXIKJS1e746EkKATzr8drrPoPAZXaoMOw3tkmOlYw5xVXOEEnMAL0Xi/DU/oC2OGbV
	ruXCXH0qUSd8Jf53BdyiVIx6WAW6hXCx9USd8t2T9zR/QsEPszaRpNPuiUgkWjVMWHcknWEJLtR
	iuXTzwNS70Vm5cCwOyet4r/OFUVzsLm5rHQgrdI1BiS4hSQYftgjGVRCys6LdRsFuYhToqPW2ZI
	XN3d+zkeoBpDTwbrmLFEEiaFEfKEqpZ6dh1/6UBOKl2jnRCpxpae59PWtTjrNvxHIrEdO1uo84M
	LaZjgMhB4Chjw/oyRrMKTCQWlfK+pwxxnug4HiDn1envH2rDs9Yg=
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr168468595e9.5.1795296471125;
        Sat, 21 Nov 2026 13:27:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:50 -0800 (PST)
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
Subject: [PATCH v15 0/5] clk: add support for Airoha AN7583 clock
Date: Sat, 21 Nov 2026 22:27:30 +0100
Message-ID: <20261121212738.170775-1-ansuelsmth@gmail.com>
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

Changes v15:
- Fix num_clocks with new implementation for AN7583

Changes v14:
- Fix wrong definition for chip-scu
- Use scoped guard and guard API in reset
- Rework for better num_clocks handling
- Address some forma impovement suggested by Brian

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

 .../bindings/clock/airoha,en7523-scu.yaml     |  26 ++
 drivers/clk/clk-en7523.c                      | 389 ++++++++++++++++--
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++
 4 files changed, 447 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

