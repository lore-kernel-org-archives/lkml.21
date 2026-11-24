Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513761;
	b=DRtsW7wS2fSAMwstPPVU6H41ilZ+egwpYKzwQzdBKWzscI3EsB/aOhR6cBcgaPFozy9j
	 +AXQctHMPG+uQeRZHnudpWSMDWX0IPPlsc6l1Tt/CpEd7QW1mXZTqD3AjGMxYgPb8KDRV
	 2eF9OpqaqduHgzCJQlMmbYkpveeEZM+9C8H0RP1QlrfuKww12mHNAXfO3AzEzAN6HeSWJ
	 T45vqOynjDOY+N2GH9sj2BIFl628oHZWFK2wzbI8CCCKsMKGDtWsdHIp2aIDeXlJLJRo2
	 /oA1rbTxp61lLlkyGGzGfP61/7fDrMIL9XZYy8qPgs8d0dQwTflh+Dcs52M8zkoWNjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rX7X115JgfakFeoi0yaVLbpqCl54/vBNVgzXw3d6i5Y=;
	b=vg89I3/lI3pwjCzAEplqBtIeTnqge1rfGrcOCH+J3qOwyS9f7HAa89ym+Pa9jFCWyAIe
	 w156lyJT7zFQIXjC9dhBqP+M1+ZCKnJIB5MAPp8zsHxz2e9dMFY+ReapYElPOCXum/Uet
	 ZtbmaKUqzqwjCIxGHUgFgyW6TGyP26vo2jHVKsrYjAX7JzMqf9TzxVwyaEfG8BTI8EfhR
	 su0rKno5e1QTYHPPwLcXK/EAqihsP4AbW28qtirqYrj0SoPf5mGcpoP3TVJWUwzNjRTl2
	 zQ7aJ1mJsUaBYT2S+Op6mLIRR1SM+TJPzZFsBAyYou0eApkpN2s6ITvHfNKlVwV7FZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JejtrES/";
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DE9606A87D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DE9606A87D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JejtrES/
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so42360391fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513758; x=1796118558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rX7X115JgfakFeoi0yaVLbpqCl54/vBNVgzXw3d6i5Y=;
        b=JejtrES/lnVMjmjUdXjmQXLRPKx7lAtzYlK28LW0y/7fmrMUltLhAlEO2z9BJY4BH5
         lmtqOc8KpsbwBYUI4eUM9n+yO8zEKvLaXIINlJckyZnsvVuL6ZnKBS4CpuREkZSQiBg/
         bWsBaFlmm5HSgXbuO2DpbgO+Hkym1r88ylUmWj42VW8bBmBRKvItKfLms9Ynn3ESa+/e
         q6R5/NfHWkDZpm1jW67w59K8rVSWui3PPJD03CPAoWoUxpotM5sFauyIn2x1ogmhM+3L
         AEXZT/+ly9zqautC7XDkEE45IFQy00pvT4FvVRHEEQMzTQ4ZG7Wf6N3dym7ThosSWjg+
         hPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513758; x=1796118558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rX7X115JgfakFeoi0yaVLbpqCl54/vBNVgzXw3d6i5Y=;
        b=STSZ4trMAlrkSFIVI7554PICNXXhe/oOzfb3AC0yTFUOxkxpwEDB0zCvdFejqkclpO
         NKJdosdadcbDkDXcJXuaAD8GjT+TqlSJhCymnnT0Nw3kcKq7lDrwadLnatKhIIQv6xA3
         fXP58V5+nKraAEQYvBAycqbdRCqpYnQYyZIWhKX2w1rg8PePTP9AS7SuTg9KsUXF3ZUX
         Ck9vVSheTDuWoR0bPYVYDl/41DgKMFZatJkfnFqfeUhPdYFgJLERrrz1Eo8E+/Jvroy6
         8fpy1pQW4vR3lMwYQR9VBt5WhfoNfsC0MXHi5Bzsixm6wCUwoMa0mpF2WxsYgPzftG/m
         92ow==
X-Forwarded-Encrypted: i=1; AL+hErHl0e5BNWnZFQ3r6fv3TYDqEPEBwy9s3Rucr6WMaYeTQ1qvjDWPhnhb00VQu19I2kb4wFojsRnX+hjEMoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wIa/6hQ13ETFA9lP3qujExWKbGxP9hwI4St1Sm88sH4toAGrI
	NoqoJY4Pj6iYJ4KDBnQu7FbGLbrTeVt3AjfL6eO/kNZM8iLuZ1R/aZ4L
X-Gm-Gg: AZFdTZe6lTX7yGS5HHS4pMGUV0c1Baah5rv5IuD7K3/CxGJj0NUSYJUfBF29ImHPK4R
	dYN301nJQoERmYUk0xZ3EUhHzUQO2U1CP0cfd3axXJKhGpxAIuaf9tMGpXFwLwMrTylhTRSkUtu
	sCONrh7uBmcIvPig24Nwtr7dw/6yHo/7iAR/pwW0sK8H/n5dSqLXnyefY5iGVX6xjE0MLnmJ39J
	oVlkjwmwGuiQtFTtISRdyu1Tu+CcECsKbbM+iPS+bRbpC5P7tqqSRYMr1FgXYbNMDqPxQHHWrf4
	ipoCKb8Y8vxTev3GGmf9S5cY5RMMKV314X+qGrr0d6sX+/yEz7gLB+aqKTpY8wgO/OrRuIkFtGL
	HkYD0ws6MhLBjP/oPlGRHTLCyGZ+BYU2qsJyS0+qZo6lQOnFM+8mASTCCUC46rT1V+2RBlQvWt7
	xajhKjrAz5pfvetaslr3iAZBUbHu0oy68tWrXdVsIz4EYK2Tl27j+PAoNOv6VWtEczPV93LUuFp
	uI31LaQqlHvYBzMqef7qjtOaHO3OScN7AS/+jwYu8VjZnuEL7fnGubkwrR6thwiE1qbAvIheIlg
	0quh6HSNwu2cIVxUEQd9OyVMAZGNrRNd9cS7QHNgt/m4sJE=
X-Received: by 2002:a2e:a98e:0:b0:3ac:ee2a:ce63 with SMTP id 38308e7fff4ca-3ae7fa13056mr38666771fa.18.1795513757928;
        Tue, 24 Nov 2026 01:49:17 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:17 -0800 (PST)
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
Subject: [PATCH net-next v5 0/3] net: phy: dap8211r: add LED control support
Date: Tue, 24 Nov 2026 12:49:09 +0300
Message-ID: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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
  v4:
    - squash extended register write helper into the LED control patch to
    fix netdev/build_32bit, netdev/build_allmodconfig_warn, netdev/build_clang
    fails (patchwork.kernel.org)
    - add andrew+netdev@lunn.ch to Cc of dt-bindings patch to fix
    netdev/cc_maintainers warning (patchwork.kernel.org)
    - Link: https://lore.kernel.org/all/20261122131900.2951586-4-a.shimko.dev@gmail.com/T/#u
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
 drivers/net/phy/dap8211r.c                    | 261 +++++++++++++++++-
 2 files changed, 300 insertions(+), 2 deletions(-)

-- 
2.43.0

