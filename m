Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546710;
	b=McEgSPQR8qlIiSI2a+AE6xTnob7gyQFRtXToHUIE5y8AaAa9+AGD9/V763tcz/1U+wlj
	 E+ohGKTwnaIuBFdN3aB85tQmarlMmfJEob695/awM2BgfbhyDDmZxPKSduvuppl3Kvxi9
	 CPqtvC6anXiwNP/e4BqBvyid0hxt7+titTLZPJG6MEH5dz/CFvwlW1NQnAptzjck2BU8E
	 ImPFN37JlJgGoyKmyjq4c6Hb5ky0sX3uEkw24pBMgJt7B0NrfHV7nKciqhe6JTUce+6ro
	 XtR+wBekr0MD2sII3FA8OlkM3356XYyHRyacxVw2wKtMCd5F/2hSff2SHwJ5uidoarQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546710;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SQM2BpLjbCL5cdHsfYKLxZA0LlvrqCit+Tm1g4u/PRo=;
	b=w8mjm3CCjqq8YQkbiz2lylRE5rHHehZcR5ywclwf0khNSC9fG9gbkuNpXytFHYoLyQJh
	 Qaq7EmUVV7pZlV1r1oDN/jMHrubnp/ai2M5RH6Z67UahTDlmGjMLsaCNU+4F6K9V3F9Dv
	 1Bgq2ygDuES/dzdjy7LrV/+QGStcaOy2au6XdVdTEFqhM7ikgYr1ngV8zbZzzitzFwAOg
	 1IbYD6prS74Tn5AU4DtLncqSiMpQzMRumojpGivWXJpfAEL5OMnFqA/3iFGTYla/gjM11
	 wRrlx55ZvcDp9A0pz8RN7WPqa4wCp77qvj7KAhYSP4XnKuwxvA59O2dNTK5KMqCw27A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R+Cwe93O;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3241606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3241606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R+Cwe93O
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdeaf4ea5e0so95428a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546709; x=1796151509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SQM2BpLjbCL5cdHsfYKLxZA0LlvrqCit+Tm1g4u/PRo=;
        b=oQrRQuXVEApu48lmroHBJCa4n4iQoII+MTV5op1H6OI71f4qo//piUvV5N7QitKT4/
         GnBmwEEm+gZfqABb2Y6JvS8fvpmTwQOoBOYtEINX4y0DUpD8KXZ3xLFwdsTTrvlneAFX
         9cau12FpXmX5AibuWevw0mkjLMeSoiyPXmdXcfXm0w2Qedd2P/EYGGx2ulUyzH79pKmt
         KKhozROJuv4DFO2O1QhnmCXxHrxZ0WEnG1H2TZpeEw4IYC74AYEOFSXR6TsOJyziVz22
         qeOej2wOY0nlnU1o/u6aUQr0kDpA0K/UIh/OZITtGKwaxXPUwXoa2yOuAmFSPsDfFqNE
         VRew==
X-Forwarded-Encrypted: i=1; AL+hErGe9pBEPWy1uLdxDIwRqnSvM9ZS9wJy0G+/K36cAKjwdsOXLFuCAAvSNb1VO9blIN1NdbWnLoIFXeC2kZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A0TigD8km8rhuiibRak82eB3xFexNmxpRE0//10IbJ8m8C53t
	Azuaz0aNdzklhz50ohWZD9jpyDezdkxtJB/63fErKlDzpi82N+yRarGRmroNONHbcExZY4SXiDq
	EVj6YWchR1cpuOBPT82NlIHUf043BvHpRUVLkuplyrHzXP5fOVobP48hTIjccx2lw9gImfyG1T1
	2tPUV0lS2drmfP0XF2Fh3KKwfXrTSPuwPqG/3d5KRTd/TIa7pDAKfFuHrNxedVxXfbVmbsXBkDq
	F0RmE6M6/eBDrtWbLulIuqP
X-Gm-Gg: AZFdTZdqGjpN0+KGLK/la+5wxSDR9IByl+1bG/4b3CyyZjW/poPOjNy74LTdqNmIouc
	R1xAqJ88TamfKGUk5wEVjfa8uvpk3QTBSTcFjZYQeXcrj6HQR9xcFG/m7I60eET+xmUYItLFnuF
	m3hb8nnJYqDd25xiSDoeuO4SVOSBDjvQoUAFokO36QCu53giqeh6MBXR2/qLWoOiBd+UStr0go2
	yFExaOdTCGUGsgax9NVVldujRmUVemll5z+y4pLOdK67l+zg1dMTy0hQNQ7AIBRK4tlwdvN7SwT
	ztdQMt6WnriHQ9ZcUch8AfZj1GjdJuXhC8jJkBYIG7/52fjon3qLYMXGlsQ2dArdi9wMcYaOMxY
	mTaqjlhxtk8dRTNTC3KZw6Ge1oLw+srmmZMlFleoBQEcx1G5OpV1rIn2zCzm2/5oKKFTYkvpZ6t
	Dz6KjaMbNq8oCwAYY7NByUeTT91yKfYZlX3YkVwhsb7EQ=
X-Received: by 2002:a17:90b:442d:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b41c982edbmr9474310a91.43.1795546708843;
        Tue, 24 Nov 2026 10:58:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm10942019a91.3.2026.11.24.10.58.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:58:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5764133eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795546707; x=1796151507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQM2BpLjbCL5cdHsfYKLxZA0LlvrqCit+Tm1g4u/PRo=;
        b=R+Cwe93OjfrWJhvLgguVUbdEZ0ofXS59j8YiQhQBDka//e4Q96JfLq2Zi5kwZRgY2j
         ngUK1t6sRv2V1WEWiyzJqTWUJ/PvzRsRwPOrE/KrfYaitugeP0Ma99+keci//qIfbAWO
         CJ7LRPV/dDAm7ekVLUHufZ2FMdWvZaei2g+3M=
X-Forwarded-Encrypted: i=1; AL+hErF1epGC1SU1TSRMtlNIQXtNXAF8uB+Aj2tqFcM88oS/oMc0JM99MybZcnU4XJzh/lynD/nn0zs+KtjDxks=@vger.kernel.org
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15258705c88.5.1795546706927;
        Tue, 24 Nov 2026 10:58:26 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15258677c88.5.1795546706183;
        Tue, 24 Nov 2026 10:58:26 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm41712779c88.13.2026.11.24.10.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:25 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v7 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Tue, 24 Nov 2026 10:58:16 -0800
Message-Id: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
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

This patch series adds support for Clause 45 MDIO operations within the
mdio-bcm-unimac driver. The series breaks things up in this way:

- make the C45 bus scan done by the MDIO core carry on when nothing
  answers at an address, as the C22 scan already does
- scope the existing defines to make it clear what is C22 vs. C45
  specific
- rework the polling completion loop to be a tighter loop
- add support for clause 45 operations

Changes in v7:

- patch 1:
  - only map a failed read of MDIO_DEVS2, the first one, to -ENODEV in
    get_phy_c45_devs_in_pkg(). A failed read of MDIO_DEVS1 happens once
    MDIO_DEVS2 has answered, i.e. once the MMD has answered, and is returned
    as -EIO so that the PHY is not silently skipped. This also gets rid of
    get_phy_c45_probe_err()
  - correct the commit message about sfp_sm_probe_phy(): the mdio-i2c buses
    report a PHY that does not answer as a read of all Fs, so only an I2C
    transport error on a RollBall module is affected, which is now retried
    and reported as "no PHY detected" instead of failing the module
  - the errors of the vendor MMD presence check done while reading the
    identifiers are returned as is, as they were before this patch; reword
    the commit message to not claim more than that
  - the commit message explains why the loop over the MMDs does not carry
    on after an MMD that did not answer: the vendor MMD presence check would
    end the scan before MMD 0 is probed
  - the code changed since Nicolai's Reviewed-by tag was given, therefore the
    tag was removed
- patches 2 to 4: no changes

Changes in v6:

- patches 1 to 3: no changes
- patch 4: collect Reviewed-by tag from Nicolai Buchwitz, no code changes

Changes in v5:

- patch 1:
  - the commit message now says that mdio-bcm-unimac only provides
    read_c45() with patch 4, which enables the UniMAC case, so that a
    standalone backport knows about that dependency
  - the commit message now lists the callers other than the bus scan that
    see -ENODEV instead of -EIO (of_mdio, sfp, mxl-gpy), which is what C22
    callers already get
  - the vendor MMD presence check done while reading the identifiers and the
    reads of the per-MMD identifiers are intentionally not mapped, since
    they only happen once a device has answered; say so in the commit
    message and reword the kernel-doc of get_phy_c45_ids() and
    phy_get_c45_ids() to document "a negative error code" rather than -EIO
    as the only alternative to -ENODEV
- patches 2 and 3: no changes
- patch 4:
  - check that the controller is idle after every cycle (the C45 ADDR and
    data cycles as well as the C22 ones) instead of only after the ADDR
    cycle, since a wait_func() such as bcmgenet_mii_wait() returns 0 even
    when it timed out with START_BUSY still set, which could return the
    command bits instead of the read data or switch MDIO_CFG in the middle
    of a frame
  - the commit message says that unimac_mdio_resume() waiting for the bus
    lock means that resume may wait for an in-flight MDIO access
  - the commit message says that the C45 scan is slower than the C22 one on
    the platform device GENET registers without a Device Tree node (e.g.:
    ACPI) because bcmgenet_mii_wait() sleeps per frame until GENET's
    interrupt is registered. This is not worked around in this series;
    making bcmgenet_mii_wait() poll in that window would be a separate
    GENET change

Changes in v4:

- patch 1:
  - when the read of the devices in package registers of an MMD fails with
    -EIO or -ENODEV, treat it like an all Fs reply and probe MMD 0 instead
    of returning -ENODEV right away, so that PHYs that only respond on
    MMD 0 (e.g.: Cortina CS4315/CS4340) are still found on controllers
    that report a bus error for an MMD that does not answer. The remaining
    MMDs are not probed, to keep the cost of scanning an empty address
    bounded. -ENODEV is only returned if MMD 0 does not answer either
  - add a Fixes: tag
  - update the kernel-doc of get_phy_c45_ids() and phy_get_c45_ids()
  - the code changed since Nicolai's Reviewed-by tag was given, which was
    kept, please let me know if it should be dropped
- patch 2: no changes
- patch 3: reword the comments about the poll timeout, which applies to each
  frame, a C45 access waits once for each of its two frames
- patch 4: no code changes, the commit message now mentions that the C45
  scan also runs for the platform device GENET registers without a
  Device Tree node (e.g.: ACPI), since it does not mask any address

Changes in v3:

- patch 1: collect Reviewed-by tag from Nicolai Buchwitz, no code changes
- patches 2 and 3: no changes
- patch 4:
  - after the ADDR cycle, make sure the controller is idle before starting
    the READ/WRITE cycle, since a wait_func() such as bcmgenet_mii_wait()
    returns 0 even when it timed out with START_BUSY still set
  - take bus->mdio_lock in unimac_mdio_resume() around
    unimac_mdio_clk_set(), such that its read-modify-write of MDIO_CFG
    cannot race with the C22/C45 clause switch done by the accessors

Changes in v2:

- add patch 1, since providing read_c45/write_c45 makes the MDIO core scan
  for C45 PHYs on all addresses that are not masked. On a bus registered
  without a device tree node (e.g.: GENET with ACPI) a read from an empty
  address fails with -EIO, which get_phy_c45_ids() passed up instead of
  mapping it to -ENODEV, and made the whole bus registration fail. Reported
  by Nicolai Buchwitz.
- patches 2 and 3: collect Reviewed-by tags from Andrew Lunn and Nicolai
  Buchwitz, no code changes
- patch 4: no code changes

Florian Fainelli (4):
  net: phy: Map C45 probe read errors to -ENODEV during bus scan
  net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
  net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
  net: mdio: mdio-bcm-unimac: Add Clause 45 support

 drivers/net/mdio/mdio-bcm-unimac.c | 162 +++++++++++++++++++++++++----
 drivers/net/phy/phy_device.c       |  37 +++++--
 2 files changed, 173 insertions(+), 26 deletions(-)

-- 
2.34.1

