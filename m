Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874409;
	b=T58ucd4vcJYcDqr4W6mwvMylsa0iDpy7tEoXHK8Hn41LqoSuUNqRM8jHzeWtzPqy/krF
	 hYFEcwF+M4yFhhSnFF9bE06TiLcEwnUPwcOvjk8kb8743j8n83qdpzJJnZg6uOqgQ82Mw
	 1UYoAc7vu23T/pzqnhowJspM/b0tSK1lWw+8ciym9JSpCxS+ShqEUALAaG+Cs2G6caqIr
	 jfKU8lfTZvGFpDQo738DkyPcyGOUHNE60oa2DI+y3R87kVzUbYyPzEt/sQb72mmUs0wCT
	 /zDyCWafIzSQheNx2x9jxHtyOwHQ4DyQ68bKFOYG7ck7wFoj9On3WZdCh19I3dNcfiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874409;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=nvDqMRxHAbj8VjQiMrRlNGIKcpi28OjUAGKEfpabXAk=;
	b=bKYCeo53QIZ1rXRbm5knpMXYlYBHM20HW1NVY1YEUpROEqOQ6xfcqAmFWrnujzJB4GYr
	 00NQj4cHkHDw4vha7i86fFuDuamPjYYAmihx61HOSA5nor8A6y02STCYf4GlVmsu3l/FN
	 Hn6ip1CXpZhqCNop8wLPNYAtSsoePLT+JwgKJ/bIj2OrBqOq4amm7vgbNHYV6ot3hpyww
	 RgW6+UFVyaS/Sb4avvs/obIMqWMUijhkkWSHL8J2pLvtXX5mysmUveZ37LCU0xJtn1RS/
	 byqzAxBRoxiJOnAC6JC7PSbWA5gwuXCttXxSiwCt3yoSDv9bTLv6tMphreDuPeyvfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Qofv0FKH;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F8C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Qofv0FKH
DKIM2-Signature:  i=1; m=1; t=1795874406;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:CBT2DjRal74wRlp9xBqnqnN3MKG/
   6sr6m5lmr7fqmq3nX6cLby2qp2zZ5kZjg9oV28xrvVOviT5X6A1rkZZiERxylBGTxMgmgp5L7dD
   u2isN/W+irLQltgjF/awqToJaThUQtJQGetW3UvSWYDYuwknKzZDO2D1JN6s7e1S7JUdjvzmy5K
   HYf6qBLKiAnKVsOb1H8FCZh1E+2d93X7vU3aHTSFlzMtvleAIi8sgf5o3AsuEFE7YBVjuLwtydJ
   SSZ+YrWM8xgHm6fuABmhQigSwlsjtAlR15/M3ddRC4KQXtVk//oMERz6NYnC9adY74TbIGj+pma
   btoNwLVs+q0Vgg==;
Message-Instance:  m=1;
 h=sha256:
   RdfQx9djcwBdbhRUnJcQEoO7WlPu2jlrsCp/LKDcmz8=:
   7EnRTEdi1HNgc/661bK670XQpLa/hYdtVPxzzpGV1Gk=,
  sha512:
   ZA279vwKuTXlwCu14AuHbCYzfX/T5n5KB5mmVUHpPAWOyRYhCi+y1Q6VQUNDG0Thcnw7SOY42HNHd/ZPOFL2rA==:
   Kmldgrnw/j0KhS8lQQlOq7IgPb0wSZ96KzcosL0+vfOJ7WZd4ugIK4hZuG57E3GTtElw9ZXeTd75RTIH4wMyuw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874406; x=1796479206; i=w_armin@gmx.de;
	bh=nvDqMRxHAbj8VjQiMrRlNGIKcpi28OjUAGKEfpabXAk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Qofv0FKH4UjqKTEjwsp+lfHixXRcQ2ClH2i3DO5j7X8yI/3pj+vTGlCvZNonPD1P
	 9TpDFy0jAIik02TxkMylExliKqGp8AvINWamIZvs0APEPiwKXxfOwCtCVOrxFy2/i
	 3KGqXDR1//2utW3bAhTUzGSOjsGZhAy5K84uzAP2qz6FUWf7rhBFoXcAZznH8GvBQ
	 usZE5TPxBcmNfI/cFuDyedNsQmLOynuKInXBYZTRhAaWUAypuzz6OhDRA+y1DSWaR
	 IkC4SJhzge+08yA5uMk/NReMZjmg/yxbUpjSB21iKu8I4bFTiK01pC4MooBRHIIkD
	 ZuZPtwGn4ydP1LrdeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYLQ-1y8XXR2xeC-00ZnBX; Sat, 28
 Nov 2026 15:00:06 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 00/10] leds: class: Support custom sysfs groups on multicolor and flash LEDs
Date: Sat, 28 Nov 2026 14:58:37 +0100
Message-ID: <20261128135954.186682-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ecjRsXZASreVdVm3fHtbECYeQwRUJSVniyeKTO3xcN6bomQ5l5h
 bRcpKU9zasAiAK8WihOz+8nRy8l7krKluPdq8W6zNZf1T8bFSOLgeqIbT4juQ83PEWd9kNV
 9l7VrvZE+7tzERNMJ86aH/pCOT/uznIYiumCgZzOCutGAdfjy4y4VDQP9FHd7MJBzZyJ+0/
 psgppzFMvEFQgnYhzj4iA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/FVHdVIVwew=;n+IHPFTstG1cBMx20rA+yjJj4JV
 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

Until now drivers are unable to atomically register custom sysfs
groups below multicolor and flash LED class devices, because the
led_cdev->sysfs_groups field is being overwritten inside the
associated initialization functions. This patch series tries to
fix this.

The first three patches constify the sysfs attributes of all three
LED flavors, while the next four patches fix various unrelated issues
affecting LED device initialization. The next two patches migrate
the multicolor and flash LEDs to use struct device_type for
registering their sysfs attributes, so that led_cdev->sysfs_groups is
not touched anymore. The last patch contains a minor optimization
for multicolor LEDs.

All patches have been tested on real hardware, with the flash LED
interface being tested using a custom kernel module.

Changes since v3:
- add Reviewed-by tag for Rong Zhang
- drop patch for the KTD202X driver (issue was already fixed)
- fix checkpatch issues
- replace if (ret < 0) with if (ret)

Changes since v2:
- fix issue inside KTD202X driver

Armin Wolf (10):
  leds: class: Constify sysfs attributes
  leds: multicolor: Constify sysfs attributes
  leds: flash: Constify sysfs attributes
  leds: class: Create "brightness_hw_changed" attribute atomically
  leds: class: Fix race condition when creating the device
  leds: class: Access brightness_hw_changed exactly once
  leds: class: Use correct type for brightness_hw_changed field
  leds: class: Split led_classdev_register_ext()
  leds: Support custom sysfs groups on multicolor and flash LEDs
  leds: multicolor: Adjust maximum subled intensity during
    initialization

 drivers/leds/led-class-flash.c      | 159 ++++++++++---------
 drivers/leds/led-class-multicolor.c |  78 +++++-----
 drivers/leds/led-class.c            | 233 +++++++++++++++++++---------
 drivers/leds/leds.h                 |   3 +
 include/linux/led-class-flash.h     |   5 -
 include/linux/leds.h                |   2 +-
 6 files changed, 284 insertions(+), 196 deletions(-)

=2D-=20
2.56.1

