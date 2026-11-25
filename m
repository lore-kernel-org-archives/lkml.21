Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607023;
	b=yK1/Pev+lmPi/jJ0hCN1nQc4j6GC2nO7Rk033W5dFy/29lIZ8ylTpWVHdFCpsU/4aWZv
	 RAL7y+X4YfJ005QdnefvRGJlnFrdhquqNukEzfI5LcgC1HEmKN1qlDrmacJDjAT+EcORm
	 ZT//jIbjDspV2iB379iH0r8H7vdDnRawZHmhN7J21oRfljwxdTY78liLTlYLeTBnCtxQM
	 sDBJDAantmiWGQK5UAqHzKbX20IFGi6Pa/RSETTQehqUmSHzeejW96jm8dxGVjbU37yVi
	 gggu5UxD5aJbaB1x62iWiJmCvmgj8bpWx4Kgib0MNa4zkN+jdgC4Nlht0Zry2YNdOSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607023;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=Cu6EkesjJ7FuSk5yjt5PFisQjtujNk4uVoJgpnmQ3Pg=;
	b=b/EjC4x3uxrn0QPfmYRqMfy1rNucANafV/Zhoap7ARJryvCom7EUsBXUhHGyF+OVfKiF
	 Ka0zNgAqOnXBPGT0B56o2MeNLw4YgtT1MtByGF3JXF/OcTXASIzfuR8zfEcGfMVDOMT4i
	 SG7u2Xsw6T0c5csoCvAXrzu3d6Wbcr+s+wJ1pVKVCr6OpqTNfzBW7S5lmNsXjy9TlJa3c
	 yUrJGXIx8ybCOSRLFYeXiQjD4PlqdY6hEYLyDF5lSVIpnyDyZMZwMN09F2l9sQ3dLOh+z
	 CtrpNSRxURG1hmrKtcbpR0vGautrWcI0uwiQAn8kaNgL6f1HfqB6l9sYJMj0wuHFj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fintech.ru;
	spf=pass smtp.mailfrom=fintech.ru;
	arc=none smtp.remote-ip=195.54.195.159
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B05606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B05606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 14:43:33 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 14:43:33 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sandy Huang
	<hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Alexandre Marquet <tb@a-marquet.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, <linux-rockchip@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 0/3] drm: analogix_dp: Handle runtime resume failures
Date: Wed, 25 Nov 2026 14:43:12 +0300
Message-ID: <20261125114319.1089186-1-n.zhandarovich@fintech.ru>
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
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

This series addresses the unchecked return from phy_power_on() in
analogix_dp_resume(). The driver currently continues controller
initialization and reports a successful resume even if PHY power-on
fails. Patch 3 checks platform power-on and PHY setup errors and returns
them after unwinding the resources acquired by the resume attempt.

Propagating these errors safely requires two preparatory fixes. The
bridge setup and AUX paths currently ignore runtime-resume failures and
may still access hardware after a failed resume. Patch 1 checks resume
in those paths and avoids retaining a PM usage reference when it fails.

On Rockchip, the platform power_on() callback leaves pclk enabled if
setting eDP mode fails. Patch 2 fixes this partial rollback, allowing
patch 3 to return a platform power-on error without invoking power_off()
after an unsuccessful power_on().

Patch 3 depends on patches 1 and 2 and on the Exynos pipe-clock conversion
posted by Alexandre Marquet [1] (used in the development of this series),
or Marek Szyprowski's alternative [2]. Both move the pipe clock to
encoder enable/disable and remove the platform power callbacks.
Neither Exynos patch is included in this three-patch series; only one
of the two alternatives is required.

Important note on pending work: patch 1 overlaps with the pending
analog-init cleanups [3][4] and may require include-block adjustments when
combined with [5][6]. The bridge-detect PM fix [7] is complementary to
this series. Also, patch 3 is built on Pengpeng Hou's earlier
proposal [8] and addresses the platform power-on and
unbalanced-clock-cleanup concern raised in its review [9].

AI assistance: Codex was used to analyse the error paths, help draft the
changes and commit messages, and prepare this cover letter.

[1] https://lore.kernel.org/all/20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr/
[2] https://lore.kernel.org/all/20261119223843.3694307-1-m.szyprowski@samsung.com/
[3] https://lore.kernel.org/all/20261120083302.3719465-1-m.szyprowski@samsung.com/
[4] https://lore.kernel.org/all/20261111094845.1673-1-laixiangwu@cmss.chinamobile.com/
[5] https://lore.kernel.org/all/20261113082305.541652-1-damon.ding@rock-chips.com/
[6] https://lore.kernel.org/all/20261111164243.77775-2-blum@kernel.org/
[7] https://lore.kernel.org/all/20261119103742.1161858-1-m.szyprowski@samsung.com/
[8] https://lore.kernel.org/all/20260828091334.5793-1-pengpeng@iscas.ac.cn/
[9] https://lore.kernel.org/all/20260828092624.9054B1F000E9@smtp.kernel.org/

Nikita Zhandarovich (3):
  drm/bridge: analogix_dp: Check runtime resume before accessing
    hardware
  drm/rockchip: analogix_dp: Disable pclk if setting eDP mode fails
  drm/bridge: analogix_dp: Propagate errors from runtime resume

 .../drm/bridge/analogix/analogix_dp_core.c    | 36 +++++++++++++++----
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  4 ++-
 2 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.43.0

