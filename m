Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796349;
	b=0iNTSASdhtWCoXGn8XcrMGA//B4TUKauW5B7rtlZDfSVGtpGcuM1EzXc2fs+RYCAwFRf
	 7EKImZgC34Ig1tXRa10eVV/eZTqsjaO3qA2kgwIwX++ZAE6nyPtkWYWeFc4qgDoxmZnY8
	 gz4nN0DQ5y8/fNXHbo7zOpKVgbX2hpjd36U3asUWxtbBP45/gLgspDGeEYJ5U+VRGxH6D
	 cD2cuQV06GK19hCef4v9UtoCvfQpt3cd2iIqKgpgCsznrh+Qra0QS5Zs5EwEtWtWrFnf9
	 jppXhXIyKdWXPN6SwP5HoUlpvA4OCDgLKVBBp9BnoFQ59KAQN6vHvFnfYzACbStr7JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796349;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:
	 X-EPHeader:X-CMS-RootMailID:References;
	bh=+mS3OhBAT0MmLa4pJtM+GnResywpHJ0OX4QBbJjZfXA=;
	b=3ppNiag+0exftX1dX6o3+7VGPMN+pUZePeIx5QrCdsYevwD1e1Sn70DNF/5XjYK52pr/
	 E2VT0U5oQ9fiWWbV18HZmFE/1BtaJaY1ZfYIRD2mlWIX0HFexpoOPjRyfu9e+wzR85JTY
	 346az0wl0L0V+6vxFLgooZmjPmES/GIuFK+oQx5OAHg1YPr/eGgcBaqHQiN1nto0ZEWY9
	 ypMGSYKbrA+Le41jsvr+vLDziqq+d6TzBv5IcEFvBrHCqLFEZSIi9cMvUfkHd8l69Mebk
	 7m+GxAWemLwDfLRuJfl4ue7E+CIGsDXeM1TU8RjNHBg1Z29/HWFIofZ3U125ZUtnS+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QloqBOm9;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7515606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7515606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QloqBOm9
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261127161905euoutp025c213e7acbf29d682def58bd2e114a89~r80MF2J4-1147811478euoutp02y
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:19:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261127161905euoutp025c213e7acbf29d682def58bd2e114a89~r80MF2J4-1147811478euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795796345;
	bh=+mS3OhBAT0MmLa4pJtM+GnResywpHJ0OX4QBbJjZfXA=;
	h=From:Subject:Date:To:Cc:References:From;
	b=QloqBOm9P7uB01dfZ4H3oOeUI9Ug+A0RZhVJR3R6ewNj+VS8q7qtnSTDYv2ELXyxa
	 0MmgDLvrPfa5x+vHidZcGLgnLt9oEukX1gMMad+CLURcQziLeufj+7bmyV5ZncSaUm
	 Ut62SsgYOG8Iqv4dRyrkGlySwznsJPdb/qYVKmJw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261127161904eucas1p1e35356631d4599bbf6b2d02373d3b5b7~r80LfNzmj2630926309eucas1p1i;
	Fri, 27 Nov 2026 16:19:04 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161903eusmtip2351707b3cde8dece22823c2c0be40197~r80KlDCGg2969229692eusmtip25;
	Fri, 27 Nov 2026 16:19:03 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH 0/3] drm/bridge: inno-hdmi: Fix sync polarity, hotplug and
 DDC adapter
Date: Fri, 27 Nov 2026 17:18:58 +0100
Message-Id: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHKtCWsC/x3MPQqAMAxA4atIZgO24O9VxKE2qWYwlRZEEO9uc
	fyG9x7InIQzTNUDiS/JErXA1BX43enGKFQMtrGdMbZHUY240yFI5DEG1EiMXe/86IYhcLtCac/
	EQe7/Oy/v+wFilVK0ZwAAAA==
X-Change-ID: 20261127-inno-hdmi-ddc-of-node-67ac9a88fe5b
To: Andy Yan <andyshrk@163.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jernej Skrabec
	<jernej.skrabec@gmail.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Byron Stanoszek <gandalf@winds.org>, Dominique
	Belhachemi <db@domibel.de>,  Owen O'Hehir <oo.hehir@gmail.com>,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=eiDFzxOVwdZeVSC+PuwyPjEfgixdlKun5pUbOuX8rII=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWRzri3fduqRyUfT7e8/7V/Kkyu/hl1nghf3+7z591XFf
	ryoEXnv0VHKwiDGwSArpshydmO0keQ/hqflxx//gpnDygQyhIGLUwAmsoCZkeG5byxjv3v1a8Xi
	7kKvcL0tFldbygyyr1jm9PVIns9NncHwz1j85SUl/WfJQZNeyNoXH28/WHQpop/7+gt19tpZ5vM
	NWAA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261127161904eucas1p1e35356631d4599bbf6b2d02373d3b5b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127161904eucas1p1e35356631d4599bbf6b2d02373d3b5b7
X-EPHeader: CA
X-CMS-RootMailID: 20261127161904eucas1p1e35356631d4599bbf6b2d02373d3b5b7
References: <CGME20261127161904eucas1p1e35356631d4599bbf6b2d02373d3b5b7@eucas1p1.samsung.com>

Three fixes for the Innosilicon HDMI bridge, which the Rockchip RK3036
and RK3128 use and, with the series in [1], the StarFive JH7110.

Patch 1 fixes the HSYNC and VSYNC polarity bits, which are swapped.

Patch 2 fixes a NULL pointer dereference when a hotplug interrupt
arrives before the bridge is attached, by reporting hotplug through
drm_bridge_hpd_notify(). That also keeps it safe against
drm_bridge_detach() once the interrupt is requested in probe, as the
JH7110 series does.

Patch 3 stops the I2C core from trying to create an I2C client for the
OF graph 'ports' node on every boot.

Patches 1 and 2 were part of the JH7110 display series up to v8 [1],
and are split out so they can land on their own.

Patch 2 changed approach in v8 of that series, after a Sashiko finding
on v7 patch 8, "Split probe out of bind" [2], showed that once the
interrupt is requested in probe, checking bridge.dev races with
drm_bridge_detach(). Heiko's Reviewed-by was dropped because of that.
Testing on an RK3036 or RK3128 would be welcome; all three were tested
on a StarFive VisionFive 2 with the JH7110 display series applied.

[1] https://lore.kernel.org/all/20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com/
[2] https://lore.kernel.org/all/sashiko-outbox-201623@kernel.org/

---
Michal Wilczynski (3):
      drm/bridge: inno-hdmi: fix swapped HSYNC and VSYNC polarity
      drm/bridge: inno-hdmi: Report hotplug through drm_bridge_hpd_notify()
      drm/bridge: inno-hdmi: Don't give the DDC adapter an OF node

 drivers/gpu/drm/bridge/inno-hdmi.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261127-inno-hdmi-ddc-of-node-67ac9a88fe5b

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

