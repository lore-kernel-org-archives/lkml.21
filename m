Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943948;
	b=3szIaGiXRGFAKgauEhvQh7m213kB0SrNTDoyFleF2jDC/wtOlsKJvWvPcxfpiCDo4WEm
	 l6kXm1y4bFkHvjkPC91wu6EUfElCkzlqCFCAyGrGX6I7TNj1CkeBFnEwKgZmIhRV0U7/H
	 7MtEzoi7Quz16n0bkprN82/N108UKJeScF3RHq4MnvpXzyRjVaQAS9g3I7adw9VvDP4ny
	 TIlKncdu7vT5/lrKAuJmKyOIU/9DKxnDORzDncQYS6tfeAwPBnFG+vHlikPxk+VGIy0qU
	 oWwWMi17L9+UExAfIVojsKoFPZzXM2cu+gjeYbTxPyPrcJh8wJvoIPdIFPA38ba2lxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=blIHNGoq77sgX2t/OQClpCFe4Blt1RrVY9bNJJPMTf8=;
	b=DW2S6EGRacN+ev08CUQUj0lLG4JiMW+Hx/SdUyVXNosdhN04kUeK/PCYCaRlkML3mDdm
	 DJnaA45ik4/Gulgd7PoGFgQ9K+Per9bsdIcTsyFJJ4gbgnKTEyVZppNNOT28GkjTvpM7y
	 msn4bb63wtUwQY5lA/WY5XuLVrHxbgdx7fDMfh2xGl5Iib+1O+ZHeql9LwfYqp0m7sMQZ
	 YN7UW6SLR3tVJ2bEI9PRdeRfQIqWlKL77HLlGl/TWj/pJ2VgP2EhrtzG1X92Vd6bw8BDe
	 Cf+UviXqVCGL7tMV0ygZCrwkYYsCFz3w5OED1zxlMI3pnUYz3DEb59IZrBUUNXLgFFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUjJRn+Q;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEDC606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEDC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUjJRn+Q
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3712b6d9843so338753eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943947; x=1795548747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=blIHNGoq77sgX2t/OQClpCFe4Blt1RrVY9bNJJPMTf8=;
        b=hUjJRn+QdlbzcRdNQbDkJUPqq3WAtwVUaYeX8Y7aeMSvyCQGDnOt1k+OW3m+8gIDfT
         UmYh/b9nY6aMLIHg4F9KDE+DWKR0hl3ESMUNrzFtva3UmOvJqWFOt03BNNH0vLAOSe03
         4vc4/NQ/Ixk7wC8YqH/VbTr1zYETd5twvh2fNi38dWCzZJW420KuPCGxSK054CvYCDqD
         F3+UxgNFd6ehqmgiUaP+6qMw6o+wtUKk3lCdVuk36guckoroDPX7REfcHsCC3R3yEOIY
         tvhkyK2BLIxooZhdmcmRKJFpXPx084c34wYbfaPBm4GxtfEq0+kYpjkd8nLeE1KBu8R4
         41vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943947; x=1795548747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blIHNGoq77sgX2t/OQClpCFe4Blt1RrVY9bNJJPMTf8=;
        b=1II98WEcy2tjgK5YfERWhEssROAShDgfsiYuWwAiPxydH0FMkEO+2iGiDQXKeD4aBK
         JAo3RGS1PpHWG2XiAX79X6XbSn5hQmbz9Ro7THXBHbSt8vZLBEe45NJlzBdvomdIwsX7
         K8jfVMcSgN2sg+eU7TTOmdNSiLm+EtxBFoRWyszF9qHhVncNRJFtYycZUD6tgb8lK7oK
         U0xIHdU3ux+5e+JRgB8AWsFCL83UlV81hsRjVY8nzs0sLLCPCyJddTJVwVnabI/XwGi4
         sin5btDvAxssTKeUqJYs4O5Pr812yf27M0C/lFb3KxRVExDxbeQnCukw2nDzNhYetN6O
         CUcQ==
X-Forwarded-Encrypted: i=1; AL+hErGcgYyv1ouelIIcx0cPXJxI/uj7uDQV7lLoHlksz1p38NMfeuvpuhyTYQc4ODPp0kAUh5+YWz5qubkj4Xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/33r94IUssBHyQgzWROCfU+h8bPe53ShUKsl04Aq9uYCB06kEA
	IqFpVksV07JZpF9YeYP6ann4REqHYWga9s0B2U0zWekJHi6noKVqaidg
X-Gm-Gg: AZFdTZfSy+u2mdn+Y5F9u4dY6TpylSsasPDXbxodsJFT9eVtRLqOKvXf5GrXZlMjFeO
	oHSxh+/HX58TGjKVSYTpUA07L4GZv9xzYqAzLyP2HBI/W3yH2Tb47f1C898DmLhxxywuHWy6S9J
	8yaevKRyk11ghqH3QJWJL3AAs0T7o2MX6ZJmnVwiXKhtJCZchFyxmsVQneWr7blCobt5d09Dpax
	AqWgAfZdxqEoQbKq7U/+AnCyj+FltO/KJv7Db38GaXCkoKNX2vmT5FxMk6AqgxpRH2/flen7Psx
	wSVZs941XM6djqWl14VFdJrZXVg6OUTV2nuDzUWp7CzgrBkPtqPyGMqH/jBb+K1OcY2dfHktbTZ
	P072UsUx6Hv+pIzg8gD/RPdajOkIBxM3VKjKiL+Ipeo1ZMDM7n6KYdvaobTsIGRjXOXUAEtLsfa
	1mctv3+DCeAy1DH9BvVEhHO8W1vkOkxngbZTElqPcL+rPKGwSa1Ovq4jbjxBU/8crb8e34J/Sjn
	aDrwmSOaxEwM04kqcjFA2TR3Jxlcy3+5U0fxw4z8WE/XN3V4I1RwC4i9ww0DFPy5rlMfRSHlSxf
	6G7FfndN
X-Received: by 2002:a05:7300:51cf:b0:381:1d8a:d402 with SMTP id 5a478bee46e88-3827ff7b022mr361034eec.12.1794943947161;
        Tue, 17 Nov 2026 11:32:27 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:26 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 00/10] net: au1000: Bug fixes
Date: Tue, 17 Nov 2026 11:32:13 -0800
Message-ID: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

This series fixes RX descriptor recycling, receive filtering, MDIO error
reporting, TX ring synchronization, MAC/PHY lifecycle ordering, and TX
bounce-buffer bounds in the Au1xxx Ethernet driver. It also adds the
LAN83C183 PHY resume delay needed for MII clock recovery on the MTX-1.

Changes in v3:
- Drop the no-platform-data MAC-address patch: in-tree platform devices
  always supply platform data, so this is defensive hardening rather
  than a fix for an in-tree configuration.
- Drop the buffer descriptor free-list insertion patch: the affected
  list is only rebuilt during teardown and is never consumed again.
  The series now contains 10 patches instead of 12.
- Distinguish MDIO write-completion timeouts from pre-write busy
  timeouts in the diagnostic message.
- Clarify that the LAN83C183 recovery-delay patch and the following
  au1000 MAC/PHY sequencing patch are both required to fix MTX-1 reopen.
  Keep the PHY patch first so its delay is available to the MAC fix.
- Remove the unreachable initialization-error branch and PHY rollback
  from au1000_open(). Correct the commit message to distinguish the new
  synchronous PHY resume from the existing initialization-before-
  phy_start() ordering, and reconcile the reset comments.
- Expand the TX bounds-check commit message to cover plain AF_PACKET
  sendmsg(), PACKET_TX_RING, and oversized software-GSO segments.
- Rebuild the kernel and root filesystem and repeat MTX-1 regression
  testing after the review changes.

Changes in v2:
- Rebase onto net.
- Reset the MAC after PHY/MDIO teardown, and avoid MAC control accesses
  when its clock is already disabled.
- Use sleepable polling for MDIO write completion.
- Advance tx_tail when submission reclaims a completed TX descriptor,
  and consume transmitted skbs outside the lock with an IRQ-safe helper.
- Restore receive filtering before enabling RX, with the address-list
  and device locks held to keep the programmed filter consistent.
- Resume the PHY synchronously before MAC initialization, clear cached
  link state on open, and use acknowledged link/duplex state under the
  device lock. Place the LAN83C183 recovery-delay patch before this fix.
- Add a TX length check to prevent overflowing the DMA bounce buffer.

Testing:
The current series was rebuilt with Buildroot and tested on a Meshcube
MTX-1, using the Alchemy PROM Ethernet-address lifetime fix as a separate
boot prerequisite. That prerequisite is not included in this series.
All 11 boot-smoke checks passed, including 15 down/up cycles across
normal, promiscuous and all-multicast modes, removal/rebind after an
opened/closed interface and a never-opened interface, and connectivity
recovery. No kernel findings were reported. The final 10-packet ping
lost one reply; a subsequent 100-packet test had zero loss. The cause of
the isolated loss was not established.

These hardware tests cover boot and Ethernet lifecycle behavior; full
AF_PACKET overflow triggers and fault injection were not exercised.

Sashiko AI review identified issues addressed in the revisions. OpenAI
Codex assisted source analysis, code and changelog revisions, patch
consolidation, and regression testing.

Florian Fainelli (10):
  net: au1000: recycle RX descriptors on allocation failure
  net: au1000: clear all-multicast mode when restoring hash filtering
  net: au1000: disconnect the PHY before freeing the MDIO bus
  net: au1000: report MDIO transaction timeouts
  net: au1000: serialize TX completion with packet submission
  net: au1000: restore receive filtering before enabling RX
  net: au1000: restore RX buffer addresses when restarting the MAC
  net: phy: smsc: wait for LAN83C183 power-down recovery
  net: au1000: keep the MAC stopped until the PHY link is ready
  net: au1000: reject frames larger than the TX bounce buffer

 drivers/net/ethernet/amd/au1000_eth.c | 145 +++++++++++++++++++-------
 drivers/net/phy/Kconfig               |   2 +-
 drivers/net/phy/smsc.c                |  26 +++++
 3 files changed, 133 insertions(+), 40 deletions(-)


base-commit: 145480b28ca82e9fae789427cc4569e596515a32
-- 
2.53.0

