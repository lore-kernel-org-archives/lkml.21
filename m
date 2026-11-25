Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631869;
	b=Uy7xbXalrPiM4k3uu59Mtm540C9iu8LGfcCvVtb3D96lG2UCt7juo2D4k4uknpeLuIt/
	 hjLtFA7TIkWRpDrK938C9laTxoAkSkYJo09XWRzWdEE02vSdIFVhJjnQ8ELsnA5MT/2R7
	 X6Yut8Ey+wiZtmG33sI70XB322BVI9tQq0KWTZ5M4O6YgtcpGZBTWZKa7HuSq8HF0pdBN
	 d3ZiptcIqIzMZba7p4oEpELUb83ne740dqGFV+w6G1w228EM5E0toAaX3u4tiSb468QVJ
	 kHmSPbSm+7/QGVvrFx+S8rbXX3vExc92IIj30AoP5QriI4N4i4H2CxIlMFgQewwmuxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
	b=tbYi6V6jEnaQPNA0hsRCAoWAc+pWhXUf8BRLN0RPyvFURYnLPSqf0D/CUl5WYEriT1oa
	 xpjQ2GmUgLVs6rnmeycfed4/kA9YeDlQyKelb1Wr/in0yDpSDCDr3uMPG/BpgyHyqI78Y
	 R9clc1y9CHm2zsXYKCOI0O8hDCXTjeCj04xGjjuYUJ/UjKAHVXNgxBjee5V9sUx6UCqGO
	 zvm2I//H0COkTPtgQ6Ugga8yxM6Apxp50Y4J2UNsrKEHC5jBr7NUZUP7gLRxUJ6zW/Pqk
	 NKt+/Bev5wk5znL8J+BsP/niRcR4pj2AcUyAI11+9e5QzX4DkNF6udkbnc5niFW4//g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB5MIJGF;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90094606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90094606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB5MIJGF
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adfed9a887so56213001fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631867; x=1796236667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
        b=PB5MIJGFsSGsLnz/41wkgUtlP2knNJBhBc4t3c30++a/pzxcSozvH6zFtS0WbcTzx4
         miR6zzP9eKDqvOGNPLKqMKyhsXIyF7PtfEVS61tELJ9fWv7+oY4VZdoxOtYQsocOkzhC
         tCD6DhrsCOJf+c69+3iDF3O2awLsxADq9iwbqzk1p91A8GTqp20mI9zYjJMLAT27JQv/
         W9LJkUpvQ/mRfWRIlNkzfa/xWdFU6rbNk9m+xOzh6OuKLqXlJk/ibOEnOVmmpdhQYYMp
         ts6X2S/KulVHQhGtaBNcmudaglk9aHsSDxlVBSw8r2wJNH5ODXb6sFZ51+YDB7NiGAsi
         scCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631867; x=1796236667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
        b=T8oZy/0LDbE+pbcIcmnWbAzaGwu3jv5XsmIEH4hQkv0mbC6EX99RXrPPCT3u9QLz2f
         fQSCi324rFPUV9cqLt4W+3W1TaqJIEmRaKKXyPCa4DvySMvKdhQydQyvz4B6dnCPZ4gg
         7rVkZPe/sfcZywQdvtWe4+bH/OxNjOkidBJcCK0DiEL4twmbUaofjUm4n4TBHXvQih6h
         Hv3arkejuGQp0iVm1vgYpHiPSE87axY0shoswTT9+wKD4JqlsnGsrHbUe7doGbcUGp/z
         +X9Vx8VdBkZbO7grv+8xhbNq54LBF8KAbrKptd8wtBqedIcd8s/grwYim7Vh6gh5gBsM
         pKEg==
X-Forwarded-Encrypted: i=1; AL+hErFV3/oYRPo3cfjCfhjcFI6zHNNsCyBzb332lgNT1ZtEoI9Z7nYyG3DgxMAMEQ3bFhE5iKt7fIm2Gkg58gg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KVTZjgyF1INoIX24Uhi32P7CRHux9udYlW/Icwe8ZYXPA5AYs
	/YbgrLrLGTyDua+GLBG7JJdo6y5OrYG8xsZr+I7NPugiNJyKmeO1vZFl
X-Gm-Gg: AZFdTZclDV81mqS7xFhGvyyztOr+cRYl+qXl4vKYHmtesAl8IN8DRL9cO6xD86HOnHt
	1tkvR0koPpQFdWgt9V4NtnGkbT2D0HQEGq93HN9th8pej9xjWzaLV47PlfRfPgMZxcF3aFhDoeF
	CvdUHMEPsZSw07VQsupxJMk6JNOHr03ItHwW70CHmZyNbKVnQLLVAr4Tm3G787PG9B+07utM7NH
	ZGIz49jOIlObQ1LUN0RwWPZWP64yE8mnxYHzZKzAR06ovRxuv7FDA4JGW96nrRVLv5h1rs/xT4e
	KBxq2Jlbjj2/ntY3/1VkQn4s4i+7GTRB0gB6fDQbZw8UEGR14fouIXnnpfd+Zjafaq9CYT6tWKD
	Pnff/xNfrw+TZRYR8QB9KyPf6h6aCt4BCz2tQ2avtGFogikCP6DPi1J3BabwgVDgyuZS4N6tAwU
	pyWP2jowBhLQQG1KP8NM/8ts3lLDKVgG83otfovTbFxum8ic2aVqd8aV4A7nTWDlpEYTHfXCvV+
	0bsR/8mnMUdqN+YnSsKCGl5m84wvxIrnwthU3yMitNW7GC98zk3p5Qcm/zwA9449a6spyUqBwIf
	ikKDvrVQRAXeayvyBsuTLpE2hkejLSmHCkGO8YaQe02xbn8=
X-Received: by 2002:a05:6512:1393:b0:5c0:b5c:4044 with SMTP id 2adb3069b0e04-5c1bc690966mr5240993e87.1.1795631866318;
        Wed, 25 Nov 2026 10:37:46 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:46 -0800 (PST)
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
Subject: [PATCH net-next v6 0/3] net: phy: dap8211r: add LED control support
Date: Wed, 25 Nov 2026 21:37:35 +0300
Message-ID: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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
  v6:
    - Return -EOPNOTSUPP in dap8211r_led_hw_control_get() if DAP8211R_LED_ACT_BLINK
    does not match the presence of DAP8211R_LED_RX or DAP8211R_LED_TX,
    preventing incomplete rule reporting and register clobbering.
  v5:
    - Drop redundant $ref to common.yaml and inner unevaluatedProperties: false
    from the led@[0-2] subnode, as they are already inherited from
    ethernet-phy.yaml.
    - Move write of LED_x_CON first and clear FORCE_EN afterwards in
    dap8211r_led_hw_control_set().
    - Report TRIGGER_NETDEV_LINK instead of individual speed flags in
    dap8211r_led_hw_control_get() when all three link speed bits are set, as
    netdev trigger rejects reporting them together. Based on [1].
    - Add checking of DAP8211R_LED_ACT_BLINK alongside TX/RX bits in
    dap8211r_led_hw_control_get().
    - Add -EOPNOTSUPP in dap8211r_led_hw_control_get() if unsupported
    hardware bits are set in LED_x_CON.
    - Link: [1] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-September/1172246.html
    - Link: https://lore.kernel.org/all/179560033613.3135.13122318439070700886@kernel.org/T/#u
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

 .../bindings/net/dptel,dap8211r.yaml          |  41 +++
 drivers/net/phy/dap8211r.c                    | 265 +++++++++++++++++-
 2 files changed, 304 insertions(+), 2 deletions(-)

-- 
2.43.0

