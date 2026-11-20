Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208730;
	b=ZC+/51V5EbXfCGjVSQOFOiPDMmCstPPOVS23Sl1A2ARn2e64xu4Ue1ZVdM6IyrVkFsIr
	 DOe/aOU7UyXWiBnTDnHspu33ZOKXF4qerJfTmmJE8fpo29/KCCfCmSDct2Ye85LBYBh7p
	 2IqOo58b3kQRaabyO8BPdyYC/4lCo+Qpg0CgHAP2Pn8QME7ha2CV8y4sAsiuJBkTGFm7W
	 iYbm+jsdLZvdcmnpVfklaACRT5pd60kW8ENOZnW20JvWyL4M/qG28QiK3zIPXJJ0yr4p9
	 8FouOepoNCs91pydkznzdeohjJy8YWgM2PRdddX1VNkQ9HbRpOP9ih3BcgLUuxpePwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208730;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=Px6BMWcRK1Clgltu4ZRseAf7V7rdDjsA6IY7TVrirZM=;
	b=gHd44eE4lf0BJ+gUWa/FUE3PdnEXcfBohm8LkWH4aKZLzzxMQF3jGHG8Cxkub+W3Hk6P
	 ysgrm8bj2cj/UrZFBu7mpo8jVpyeIwCSTK83c6d2zYszsUGkMYxSePzv4w/HmQ6/v4UPY
	 DuYPlncXRHFLFycY6wmrmkmJyYPI5G0E49gqEMtpl2vFD/WCG0Wlop+/FsopZW4HfBLO3
	 2mJlvNOX22MfHaabUiyAQ39eApaIS2J4HH6Go2SqJkTOBpuxHf+Vob5+kUKFi+2mToB6p
	 nF/UufXPtI+f16jlyivdeKQXKtJBBQTZdS6Oxd6/wGAtl7mvE8thIYcaukQfnCjSvlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hwdPoHp3;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40389606A694
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40389606A694
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hwdPoHp3
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id UUmCxnwa0VK9UUVnUxg3JA; Fri, 20 Nov 2026 21:05:28 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UVnUxO2NcSgq1UVnUxTNVp; Fri, 20 Nov 2026 21:05:28 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6b00b618
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_vYEYYEux4mHT_UWPW4A:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Px6BMWcRK1Clgltu4ZRseAf7V7rdDjsA6IY7TVrirZM=; b=hwdPoHp3icxZgn0okO+irZZR+C
	tQv2JZ6XS8BtJL4DyS+bW/wmZZRvFkdlMg9zwR9Xgs+q/g8PqbR695s51hPXghneIWwnR2bXe/FEi
	Jh5MT5bbFnNf0GbzvMsenGd3i950Q4mvy9Iz7fzku2IXFcUbuwE0feWYUsrTzJobXOU9bB0Q7bpHe
	g2agX9Ms98q4N+8Xh42E3L8xxvOHGdSr4GR/LgnqeFPk/vPQHS4Am3SUUy1teYK4+hsjfztbT7Lxk
	DFhFO/9/0orizsD86RgIVNL0C5xEwLC0WmecYTeRClvqhAeMWfcUZN3om4W0ZpquOhsGAbNVCum8j
	PAULsSKw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:39720 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUVnT-00000002BVV-3XUy;
	Sat, 21 Nov 2026 02:35:27 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] watchdog fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 13:05:27 -0800
Message-ID: <20261120210527.799889-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUVnT-00000002BVV-3XUy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:39720
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOudEE2QqF9hA8GVJBYOYDb4dze3V9r4lAAxT4c4uXE93bShcl2CLb3YTdmFe+F7Rc5f3uQsZMAyC/o4unvquUlMzacbJv5wE7m4IkxXd3bzPxXZwnyf
 jOOPY9GDjLQICukGObwSUcXa2gbJnqXCLp0pCeelS5i/XagATI53hWFUn4RHP2YxEEgb0l7lFW5oyIr3p3+6HGw+Fl5nY8Xl1r39Vkd3E5o70DHaKAQcm7OF

Hi Linus,

Please pull watchdog fixes for Linux v7.4-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-for-v7.4-rc4

Thanks,
Guenter
------

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/watchdog-for-v7.4-rc4

for you to fetch changes up to d8cda274400b52c5bb542158ae9f220f72f059f0:

  watchdog: core: Update last_keepalive in watchdog_start() (2026-11-16 13:26:12 -0800)

----------------------------------------------------------------
watchdog fixes for v7.4-rc4

* Core registration and reference counting: clear dangling wd_data
  pointers and stop timers/workers on registration failure, release
  unclaimed running-watchdog references, avoid unbalanced module_put()
  in watchdog_open(), and restore WDOG_HW_RUNNING if stop() fails.

* Core locking and keepalive state: add missing wd_data and old_wd_data
  locking in open, unregister, and last_hw_keepalive paths, and update
  WDOG_ACTIVE and last_keepalive before pinging a running watchdog in
  watchdog_start().

* Core suspend/resume: prevent in-flight ping work from re-arming the
  keepalive timer and stop the software pretimeout hrtimer while
  suspended to avoid spurious pretimeout events.

* stm32_iwdg: set drvdata before requesting the pretimeout IRQ to avoid
  a NULL dereference, serialize EWCR register updates with a spinlock,
  and use devm_pm_set_wake_irq() to fix wake_irq leaks.

* npcm: keep the clock prepared from probe so the atomic restart
  handler only calls clk_enable() instead of sleeping during reboot.

----------------------------------------------------------------
Antonio Borneo (3):
      watchdog: stm32_iwdg: set driver data before requesting interrupt
      watchdog: stm32_iwdg: serialize accesses to EWCR register
      watchdog: stm32_iwdg: use managed variant of dev_pm_set_wake_irq()

Guenter Roeck (8):
      watchdog: core: Clear wd_data pointer on errors
      watchdog: core: Add missing locks
      watchdog: core: Prevent ping worker from re-arming timer on suspend
      watchdog: core: Stop pretimeout hrtimer on suspend
      watchdog: core: Restore WDOG_HW_RUNNING if stopping watchdog fails
      watchdog: core: Cancel timer if cdev_device_add() fails
      watchdog: core: Fix unbalanced module_put() in watchdog_open()
      watchdog: core: Update last_keepalive in watchdog_start()

Zhao Feng (1):
      watchdog: npcm: fix sleeping clock call in restart handler

 drivers/watchdog/npcm_wdt.c                    |  19 ++-
 drivers/watchdog/stm32_iwdg.c                  |  31 +++--
 drivers/watchdog/watchdog_core.h               |   1 +
 drivers/watchdog/watchdog_dev.c                | 154 ++++++++++++++++++-------
 drivers/watchdog/watchdog_hrtimer_pretimeout.c |   3 +-
 5 files changed, 152 insertions(+), 56 deletions(-)
