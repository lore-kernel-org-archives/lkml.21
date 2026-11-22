Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353545;
	b=iXO220WA+5oBoa3dfaBUM58BqUWVhbcEeEBJ5yOFWIvZTThp4ZDcMu6HOvqfRM24T/rI
	 idOB/NAdS7gIp3jHSgRKSmhUPeaAe6lswFLRyU47gL5yIVkQ4mh3Em7acQcOBg0i8LJT4
	 Jr+AEzAxuqVfKM1yfWNnCVc6mOpxbUU/P66uRKCShoaoQvK0j2Ws50TYy43wnSyYefEIu
	 ZXhUqn8m79KX2bJaazltKg9b0NJFwZecstcyc9ljQq+OFsYpkHCjO5zpHrKwfmD4Knmwi
	 hm4+FwTvuQNPOyTLSGqn6qctjxcqNbkgJLVZYPpG7CYWZWh3rpVWSubcBTjtS6mA9AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
	b=fgZ1QUBflFlZZCbQU8T+i0GT2/7bKgdMnoK/SQD98ISNhF9ifxPcJVFxL0ITS+YJ9fzf
	 AG5Vn6QO2XefNPMID8q1xx0nrbt3bv+t8Pyu7sFfk++umi9cC0Jx/2hOc/FFT94rNkZ0M
	 R48BOJ6BDv3ReAwmfUSKJ0cn8no1NM6La3lSZidiUnbLhu6MLMp2UH+m4lVLqddrxNkr3
	 bhBAeP+ieDlmSH25uxsO+XsAeTIEUrlThdmBwyJWLBijaTzVgCbdh7ZbjLVWmYJ+37MjU
	 v/7I/26DQtqefIIJ9QZqD00fbMgFkmuGnTZGJ+jLsK6vMkuYXW1a+8j2aYUCzYQj7jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60433606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60433606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so18066621fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353544; x=1795958344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=hVFVMHWLqX2IuGxnGPcTUcFvQXc3u3gzVUOHyRT6+uRwgnf+jlUlLRwhgwWNp33WZJ
         6ysfD6E0T6yGrY2xD0yhKSsPmTXQC2Muctoz41l7NxF2uUeOpJe5JduAul5xDvZ8f9t3
         jLNSHhH7x4AxrdnD+wUIyl1KCVSpyNp5HFVlZkPLaB3iIAteX0h1EbEIlPaJqnAp1OUq
         IIYAIPEE8uNeO9L8PIY55hTwMA2XKue7pEUkATtjvuFwfYSn5w4kNtW5CzDjEBClop9M
         IIhsdBxB/wLodKoJN7c5Kh4o2QywpbnAKpVEknheasWeEgteqhnqe8V4UE4PlmaprHnd
         qJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353544; x=1795958344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=xOEpRmYJBevVr/FtUMx1m2GTcgtfsBWNkeClfSLU6mI6KB4evtf3vj8XCIkM/3uX2l
         tPkIgoiv6qS3UGRaeSaKUxsE3ihHAPg8JyTZdMdwEKPTOd/4q1LdMSzFhAKcl3+4hT/y
         XuVIH/PdnCSSgukJQnID7eroe0KgNlRCtdyzqCU4MBmwp+r1tewDgWFvBwtOCKKvhWlk
         yR7+TL0c8ZgvwHwh3gOJjh8Ol90ruaZhL1NfFo/QLynvl3v49EbZXxUb6Fp/N44BT41k
         H0I4OiPN8IVIAsWnpF6/z5UMAQJdBo/xkuliHdxk5JUqEfXMf+T/ZsrPtso8RvDYADJh
         zY8w==
X-Forwarded-Encrypted: i=1; AL+hErFt0lAD4Yah7nt8h37+DnYwN0skBL6IsVHYgqdKgd5/NT6q4iwZaxod122CkygbHcVB+xdGGCTRqywvVqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lkFMWdX2q4Imefn0Wu3FMxzCTBTRpHA2NaoqcrUyR2h39KJxr
	QUNzwwMFMq1i7I7pFhGnl8ycGVYV72GVRsKgxNmOVmcxPDGS7MDQCzc+
X-Gm-Gg: AZFdTZfzmfsqn4bYIbFXNISujSVgxVchTdAbO1QEEW1wJmo+gGTBEyEYAx+guSiMYd9
	CEzgGvoHCUXHWa3JjHwSz6SI/GipXFPJJwhETXEVQk1o8Pg02pEFScmJWat7N/kRyeFA5DDZFa5
	n7YMZABrMBqVi8VOLocrjJ981S5ICPOQrag8/A5IIpkmGRdB8w4Nzb8NlnKOIHFyDOlzWI+uC8m
	V2z5azx32Rq/yIc3NNuuNDUEy3xnUcoKNcgsyUHm5CwFbnMKIs+9Kjue2puR+hD8ciP357SS1Cx
	zBolznzZ3tLo6+VoZ07b7qRLagYuikigcbLX6h+/F9w6J1wmrNygN8fpB7p69y3gUFfjByzDKjM
	2ZioCj+e4NVDd/w8uGvZ8arCeGw8LB1I0mSoQWTbaE7Rr9BBZiZH+JU6kWPXYhoCgQHajLn3zJK
	A5nvDgVePBGmO3S4/36XHY87CM5QGdH5rKwstgnDkvuHX+gr/bARLFWOlrjpFpPWCyn/a2chX/t
	8dA6BFLIGRoGigZtRo6t3FmNY4Bxazsf/SmFj52K6mBl8IZlJTSnMSwqGLdB7SFtsNJkTzQwKUM
	N9agmo0nlzBRCN0nfM4sItymG4CBDA==
X-Received: by 2002:a05:651c:19a3:b0:3ac:e5ef:1b8c with SMTP id 38308e7fff4ca-3ae7f9de88bmr24914911fa.11.1795353543336;
        Sun, 22 Nov 2026 05:19:03 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:02 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 0/3] net: phy: dap8211r: add LED control support
Date: Sun, 22 Nov 2026 16:18:53 +0300
Message-ID: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

Hello,

This series adds support for LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch fixes mistakes in function comments about locking mdio.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA and implements the three LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml 
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb
$ yamllint Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
$ grep -i "dap8211r" Documentation/devicetree/bindings/processed-schema.json
    "http://devicetree.org/schemas/net/dptel,dap8211r.yaml": {
        "$filename": "/home/a-shimko/patchwork/linux/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml",
        "$id": "http://devicetree.org/schemas/net/dptel,dap8211r.yaml#",
        "title": "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY",

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo netdev > /sys/class/leds/stmmac-1:01:green:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ echo none > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/brightness

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

--
Best regards,
artem

ChangeLog:
  v4:
    - squash extended register write helper into the LED control patch to
    fix netdev/build_32bit, netdev/build_allmodconfig_warn, netdev/build_clang
    fails (patchwork.kernel.org)
    - add andrew+netdev@lunn.ch to Cc of dt-bindings patch to fix
    netdev/cc_maintainers warning (patchwork.kernel.org)
  v3:
    - fix kernel-doc comment for DAP8211R_LED_FORCE_MODE_ON and
    DAP8211R_LED_FORCE_MODE_MASK
    - use FIELD_PREP() for DAP8211R_LED_FORCE_MODE_ON 
    - Link: https://lore.kernel.org/all/20261120081106.2919010-1-a.shimko.dev@gmail.com/T/#t
  v2:
    - add a commit fixing kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
    - move LED child node down below tx-internal-delay-ps in dptel,dap8211r.yaml
    - add blank lines in dptel,dap8211r.yaml
    - restrict LED reg index to 0..2 and fix schema properties in dptel,dap8211r.yaml
    - fix kernel-doc comment for dap8211r_write_ext()
    - add LED brightness (force mode) support to driver
    - remove rules == 0 statement
    - add TRIGGER_NETDEV_LINK to DAP8211R_LED_SUPPORTED_TRG for dap8211r_led_hw_is_supported()
    - clean up switch (index) statements
    - Link: https://lore.kernel.org/all/CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com/T/#u
  v1:
    - Link: https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (3):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 242 +++++++++++++++++-
 2 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.43.0

