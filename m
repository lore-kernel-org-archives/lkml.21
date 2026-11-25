Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630862;
	b=ZoePKQi2d96KettFjep5TrwxfM/ASGMwROtL+QtTJKyXjZ9cXXBPCDWMmD43xGjGW5+8
	 AvXGqZd54jQX/MqkNBZobce56bR+SHDJON78NMNBdK35TbNaVgEcU6vIDelshaySLjfNh
	 C7tYmIA7NqWFJFP80aP7EtQwRml7b7eagJXsaZXeSIHI2M6fKrjBChUguInEpME13RSWN
	 lu2pbAFCMZga5LUzIyZhHo63Z1YDUnAcOETDGsYqYyhWlqXgUNMaK9M3C5pB4s4hgMRRm
	 WVQ6bu464fIs/Ma1gK+J6osk4bb2qAjgJfmli4YrGIG/yTAs7/abBAdVrJSzl76ETXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=S/F4REHKnNGd2R1KVdj00UINXhvcHz2K31NhQDQ/pxI=;
	b=yYNFkUNCPcSgP37EZEw/m6ob6WzgwkNzZ5AseOZCsQpe1x45ITsxKpT125kc3+TjWmWC
	 mYXTC9SYelG7oyQxuuTcddxN2QwHZaISBMEKO/wFnWBJU8Txemr8LuFjLZnZOF3racrR4
	 bAUusOImwFmsbjyl6fpcK2BibmTGYY3KpfPdWcCJUJD3XlKHdRz8jY+sFcxZ8W1CPtp4W
	 +AbUVFOey8Sg28pfMD3bcugOEJeveEqbZ7TLWAfMVBX7Q14pJvIwuf0Kx7Zc8h52EWBMa
	 gFtjuEo3P+e8PANahmK8GGvTbvYvIabBPCRbV4DdnsLtv/0aM9OP5di6ZrfqMcJQylQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Tekx5b/H";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9FB2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tekx5b/H
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb2893531bso3240395a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630861; x=1796235661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/F4REHKnNGd2R1KVdj00UINXhvcHz2K31NhQDQ/pxI=;
        b=iHrERsaxYJvsoA/L1sTFYKHGudeRCyx0DKscbvUlNCJhiBgoTtZ/kUZ1iBHwTm1f4n
         CuHAy1+8snzR2ccVWlVPINGYVoM55QrI8VggU/scyW46f7kMihoCfnvwyj9Gxmu+Rpjd
         WLoYhYFr16wg59ltNoDUbz8yL1HUnwJ0A3CAM+0fLZ6RJTvc8KG2yyA//ytrZuu6jcg5
         D6lFfJ3BootXBvw1GPkS8gghB5+jwIgtmdq0XBKKxgm9wGQglWLyQB9sSrdfCOaLxD77
         6tJmvYEteJtMDVvPKB1LsWVrP0t67wB68arpmSso/p/5PpfiXlgWq/tuVBO/D6KvBtG9
         naJA==
X-Forwarded-Encrypted: i=1; AL+hErEj+VPW0zxBCBwS12rUDBsJGKJc3DmrZaOI2s+EJvmQLjt/8ra8DeHlpvTVxsFKpWzV3WgNsBhnOO1XZho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ckE6M8BWSdBuRBUsFxggFtsG7EixmpE4wbplxvBd+rcbK4dCE
	t6JwrzfH5yh3+MsLi/LktUwMDibBLRYl8dwR0CBi2ameau7HMgrZO4bDeHPJAi6TaVigrLY9sAl
	xWyTTcUT7htDE1t2mKA4fK8HvmN4tnbMBCzF+/Sp5xLRaNLCfrZAibhtzbQ4Ct19QQoi3m6xjdG
	xiXNQjr+3lObuT8DZVkiJHatEs7bzhWFmJGaJbcdFLgAdoVWsexzRnTAHLFSmt8FENmfpRFhbAx
	kYuvVAgH+wgMuyI
X-Gm-Gg: AZFdTZdqqw1kXfJQ238sODRRoORb+Vzr4DB4Q8oaculPujoZ/9n4S5v33rsKZCZZnAw
	QSane/Kf4ACQ7bqFCE7iqU8u7amoE93Y7S6LtU3qmbzYvmTGT4nh2vlYEz4gHXttf/NsolsA7Iu
	Xl1Wx/oGZwGuYLbJKRR1PJYHMkf7vI/i2ExBJWg+BUVewpizPgjYVgQxo4KTm78z33mrFiMhfIe
	2nzW1txC7A43XVoHK9ZgmCiah1RzCzZqNJ0KLqmAy+DCjgbbS6UrzSDP5OhwpBvBLHHXBoJAr6O
	iZJCMnlFNaWdAaruKnNTM0PgLsJ/6KUUQWRyMnyClTsOtwEVREwnQvjl3PEVD+yI6+TEJ3p4kd0
	soMFqSf680Al48GjH1wa9sLw2RubiVErtmmmj42gu8aPQ99VDLKa77wL73p7n+J8cruC8Tv2AVE
	JdFGs1sKVJSvlR4qdokBpOcv+fnvRaCx5crOY=
X-Received: by 2002:a17:90b:442c:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3b41c9325a6mr18944319a91.41.1795630860995;
        Wed, 25 Nov 2026 10:21:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm12942279a91.0.2026.11.25.10.21.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920f97bcad4so103934176d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630860; x=1796235660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/F4REHKnNGd2R1KVdj00UINXhvcHz2K31NhQDQ/pxI=;
        b=Tekx5b/H5985aMceRVG3RA4Mj9KOy9Dp9Zua4cPcQRjE8rYrjgkncF3ird+QeMhrgW
         5TNcD6KAcTQtghmqsHS6uSzVVvvU7l9GTEuqzruzlyZZkmVXtZ2871NLlG+0lhuPIDOW
         rW2ktbeIJuxkmO+q93GdnRhSCdBSizQxAEtQA=
X-Forwarded-Encrypted: i=1; AL+hErETWGNBbkH/0w3WhDmChhOR+96z0oI435+ULsszXYkyyncPv0VhCOaYhzmh9KA4c/KSMQrF0k6EPSGHEkY=@vger.kernel.org
X-Received: by 2002:a05:620a:4713:b0:93f:31bb:e3c with SMTP id af79cd13be357-949bab1060bmr3347957885a.68.1795630859859;
        Wed, 25 Nov 2026 10:20:59 -0800 (PST)
X-Received: by 2002:a05:620a:4713:b0:93f:31bb:e3c with SMTP id af79cd13be357-949bab1060bmr3347951485a.68.1795630859301;
        Wed, 25 Nov 2026 10:20:59 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:20:58 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 0/6] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Wed, 25 Nov 2026 13:20:47 -0500
Message-Id: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware accesses the
card directly during resume from Suspend-to-DRAM, before the kernel's own
resume path runs, in order to load boot code using hard wired logic that is not
field updatable. The card needs to stay powered and responsive for that access
to succeed, and since it is never power-cycled, it also needs to be reset
before the kernel reuses it after resume.

v13: https://lore.kernel.org/linux-mmc/20261113211143.3759154-1-kamal.dasu@broadcom.com/

Changes in v14:
	- Patch 6: Clear MMC_PM_KEEP_POWER in mmc_host_class_complete() when
	MMC_CAP2_RESET_AT_RESUME is set. The flag is set in
	mmc_host_class_prepare() but was only cleared in mmc_resume(), so it
	stayed set if system suspend was aborted after prepare (reported by
	Sashiko).
	- Patches 1-5: No changes.
	- Tested with CQE enabled.

Review feedback addressed so far, including Sashiko's AI review comments:
	- v14, patch 6: MMC_PM_KEEP_POWER is set in mmc_host_class_prepare()
	and was only cleared in mmc_resume(). It is now also cleared in
	mmc_host_class_complete(), so it doesn't stay set after an aborted
	system suspend.
	- v13, patch 3: CQE is turned off explicitly when the card is kept
	powered, as the cache flush may not send any command that does so.
	- v12, patch 6: An error from _mmc_hw_reset() in mmc_resume() is
	propagated instead of being dropped.
	- v12, patch 6: reset-card-at-resume without keep-power-in-suspend
	makes the host probe fail in mmc_validate_host_caps(), instead of only
	warning, as the card would otherwise be powered off and system suspend
	refused (Ulf).
	- v11, patch 6: The host is claimed around the card reset in
	mmc_resume(), as it sends commands to the card.
	- Earlier series, before Ulf's rework: Sashiko noted that the DT schema
	allowed reset-card-at-resume without keep-power-in-suspend. Patch 2
	keeps the "dependencies" entry that enforces the pairing.

Tested on a brcmstb board with a Kioxia 016G01 eMMC, running S3 suspend/resume
(pml -d) with the DT properties set as below:

  keep-power-in-suspend  reset-card-at-resume  Result
  no                     no                    board resets on resume
  yes                    no                    board resets on resume
  no                     yes                   host probe fails with -EINVAL
  yes                    yes                   resumes, card re-enumerated

Kamal Dasu (2):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  dt-bindings: mmc: Add reset-card-at-resume property

Ulf Hansson (4):
  mmc: core: Add option to keep an eMMC powered on at system suspend
  mmc: core: Split sdio_set_host_pm_flags()
  mmc: core: Move and split reset functions for eMMC
  mmc: core: Add support for resetting an eMMC at system resume

 .../bindings/mmc/mmc-controller-common.yaml   |  10 +-
 drivers/mmc/core/core.c                       |  10 ++
 drivers/mmc/core/core.h                       |   1 +
 drivers/mmc/core/host.c                       |  26 ++++
 drivers/mmc/core/mmc.c                        | 111 ++++++++++++------
 drivers/mmc/core/sdio_io.c                    |   7 +-
 include/linux/mmc/host.h                      |   1 +
 7 files changed, 123 insertions(+), 43 deletions(-)

