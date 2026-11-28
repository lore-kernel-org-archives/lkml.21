Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868141;
	b=xb3tpAqcGpAwNr0VOwlj/tJe8wfFcca/SVqM+tQbtm8pkCyYYmEyUuqzPMkCD47+LNzF
	 gXCZL0Is4D43Wc0mb4Y7e+19FytSgGEIoDQ+gCzQzCAJAUHVhPePSlyXLzhoxzjuuMH9Q
	 0O3ctj3VXHTn68og/X+Qp3tzVJjlQDwhvuZkgzTMfh2wjfpdQkNc2rIe9WJm4e9kBpeFY
	 edfUkq0iq4cBEuM114EvHTW+nrueTLRHufUrkYwSi2RJgRuzvTDstZJyBOt34j3YNqfnc
	 G0LHazRb955AhU4bqmySZMrnl17OKGR+L+g0M3f+jtTzphirg4QO2exzcY9dclIYk1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T8XVXRW+yziMKCTR81AOVzM9uJmmAeBSDmuMO3fW8G4=;
	b=f8skwE/UKTas1N5DHb/C9qtHL2fbjLiuQi+h0u5wFs5Nj9eEFTvAqnq88t2T32WFSCaE
	 JMnMItZ+CHP2Xefr60+TNQO8lT1Kd/CjTZSWi4mJ02j8rALYaIeZ+s8XMByVxDFloe4Nu
	 OzX1FdiOBYMdrpAbpKRxq+Y8yV+BCOIjL9x1+8ozELunGZ+UTHXXMA6yuN9SNmyfgYxQ6
	 /14UQBfqv44tdKt8tMIRxQziGBbb7HMawOuVyxA2BU48l0h9cp4WbsBJeNcJ8aH3v4NPm
	 HpCoRzsUahlNQsltzVv1IuTHyMAAIOTVboT24HPz9GPc9whsDsnfcnaYper9oHxMn+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Y5hjfRiC;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD65606A31F;
	Sat, 28 Nov 2026 12:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD65606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Y5hjfRiC
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 619EAE838C3;
	Sat, 28 Nov 2026 13:15:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795868137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T8XVXRW+yziMKCTR81AOVzM9uJmmAeBSDmuMO3fW8G4=;
	b=Y5hjfRiCn1hBqK3P3ueRc1aja9ed2Nx0m6D5JpY4hpFJ4NqFmH6p8QWo+Pn0Bqvn5rqouz
	VAXIm8Ofv1c9/YvbgCvYplEzZj/quL6MkWriyj6B6veUXQtA3GM15FtHY7M/0FE9B2tphL
	PgMbVsk3cbQmDlq7MnlFv/PPz+nwDkAq0/AMLQfeRHkdUHZyYwUrr5JqAPa3tsjT6DGeb3
	f9NSga49RtQ70drXolsXC4Bj8iaX2KzHxD0LUM4R1a8kwzeMYCOFVxx+E1+Ma/dCqAMYOo
	lxbm49/qqVcm3xsjWIrIJ82ZVEs6cR0n67zXIwxVMalucM4tiaAl5AFoXNaaOQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id HEymLpSMNx3x; Sat, 28 Nov 2026 13:15:37 +0100 (CET)
Received: from p14sgen5.lan (unknown [86.103.60.175])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 28 Nov 2026 13:15:36 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	Ross Cawston <ross@r-sc.ca>,
	netdev@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 0/2] net: pse-pd: add poll path and LED trigger support
Date: Sat, 28 Nov 2026 13:15:22 +0100
Message-ID: <20261128121525.3909836-1-github@szelinsky.de>
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

Some PSE controllers have no IRQ line, and boards want to show the PoE
state of each port on an LED. This series adds both.

Patch 1 adds pse_poll_helper(). The core calls the driver's
map_event() from a delayed work and handles the events like the IRQ
path does.

Patch 2 adds two LED triggers per PI, "delivering" and "enabled".
"delivering" needs events, so it exists only on a controller with an
IRQ or polling. "enabled" works on every controller.

The poll helper has no in-tree user yet. The users I know of are out
of tree: the IP804AR driver in OpenWrt and an HS104 driver (S600WP
switch). Patch 2 is also useful without them: "enabled" works on every
controller, and "delivering" on IRQ controllers such as tps23881.

Two questions:

1. The triggers are per PI, as phy_led_triggers.c does it per PHY. That
   is up to 96 triggers on a 48-port controller. Is this fine, or do
   you prefer one trigger with a per-LED port setting, like
   ledtrig-netdev?

2. Kory: with the "disabled" budget strategy, a polled controller keeps
   the power control in hardware. pse_pw_d_is_sw_pw_control() takes it
   over only for an IRQ controller, and polled drivers may not report
   the events that software control needs. Is that what you want, or
   should a driver opt in to software control explicitly?

A polled driver also needs Kory's fix "net: pse-pd: fix bogus budget
evaluation strategy check in IRQ handler", as a poll often reports
DETECTION together with other events. It is not a build dependency:
https://lore.kernel.org/netdev/20261126143012.1595919-1-kory.maincent@bootlin.com/

Testing: on an S600WP switch with the HS104 PSE chip, polled, with
LEDs on both triggers, plugging and unplugging PDs, and unbinding and
binding the driver. Also in QEMU arm64 with fake PSE controllers
(polling every 1 ms, bind/unbind loops, fake LEDs), with KASAN,
kmemleak and lockdep. Kory's fix was applied for the tests.
Lockdep reports one inversion between pcdev->lock and the regulator
supply lock. It is in net-next without this series too.

Changes in v6:
- Rebased on net-next, which now has the teardown fixes that v5
  waited for.
- Poll helper:
  - Renamed devm_pse_poll_helper() to pse_poll_helper(), as it adds no
    devres action.
  - Must be called before the controller registers (-EBUSY and a WARN
    after). The register call allocates the poll buffers once nr_lines
    is final, and starts the work as its last step (Jakub, Oleksij).
  - The work runs on system_freezable_power_efficient_wq.
  - A failing map_event() is logged once when it starts failing and
    once when it works again.
  - d->name is optional. The comments that said events need an IRQ
    now also cover polling.
- LED triggers:
  - Registered before the PI regulators. A failure now fails the
    probe (Jakub, Oleksij).
  - "delivering" only with an IRQ or polling.
  - "enabled" shows the admin state as ethtool reports it, also under
    software power control.
  - Also updated when the core switches a PI for the power budget.
  - The PI state is read only while an LED is bound, and only the
    state that LED shows. Bound LEDs are counted in .activate and
    .deactivate. No hardware reads at probe.

v5: https://lore.kernel.org/all/20260429213224.1747410-1-github@szelinsky.de/

Carlo Szelinsky (2):
  net: pse-pd: add pse_poll_helper()
  net: pse-pd: add LED trigger support via notification path

 drivers/net/pse-pd/pse_core.c | 490 ++++++++++++++++++++++++++++++++--
 include/linux/pse-pd/pse.h    |  31 ++-
 2 files changed, 488 insertions(+), 33 deletions(-)


base-commit: f89726ffabef1b08c52e6163b7ab94b0d5f15503
-- 
2.43.0

