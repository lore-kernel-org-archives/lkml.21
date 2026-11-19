Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049997;
	b=Mw+aToSf++7zNd8l21Um+7g4oOjPg2ZZNTAscbyqrC+8EOBeSpnV1rE3XBUUEf6bPD6r
	 ZJAgNr2O+4L/4XduzJBJZy0BADqviQUKmbyRzzYWP3H+uZEzmX7q078OBQWBJKj2WEvVC
	 b/5ooL+wnL/yZLd3E0ouvZnoa1z/tn5WWjY1xDvTuYmXaiIfTfwMVioSjhF4vdaWafCYu
	 KVCTpbV0GFxVTz8zlLJrl5HNDpkGyM2iH3mMMaRgiGOgjCXHdFg4vvx1OFR9l+V+2lPH0
	 jkT00lD+rxG/X7q4V9Apc+n5t+wfk3L9Fp3BU+jTemfMyA+dkp+bKbmB8AMwfLecXoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049997;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
	b=l6SrLgpyDJsPWcKcjjc+gMgZEu//G7C22ClmCBOjevSO5/+bEtJMGqSspganET8x6PqJ
	 FpMebHrTMSaWsr+e+mxa37ZcNVS3MMfJjYQRJopkzLp45+BZuQVi0cn0+nyCFeSZmwZMb
	 JXYu490wvDxsViwMsRdhfqmE8iq4SIs/26Y93qv2vfBdHenl98vLt2mbheMi+sCKqjneT
	 pCqcErPBBnXd2SpE68AUkD7o3XgVAgniLolxvC3FXXGfprDsrn2YwrJ2Y7jY/KzdSd4Cg
	 0vIFyqPMJzeKWiDjoqDSDfhjcoFTiZ25wqfFIFVdoAWfmm6yhGhx1Vw1ijsB2AFstTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbFBHqj1;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0A606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E0A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbFBHqj1
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc758830601so1395953a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049996; x=1795654796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=ViRkAPyKjkDBhhmzLtc0WA9lBpPc+LGRSChdsSR9VFXITaJlMfd30nLzvHoW2X+Pk3
         2UdtDgSDcEy8pwjCMxcWyiR40CRUXwKNXSRMy5MBm6NNXEIonZId7WJI6BBEBle2PRKx
         WOuBSY/N87pJQWS+Z9GT2jDutO43Gv9t5wieHTtToGhZfGKkmLOzKqTnnqiioBObIPD6
         CR0TAkeC7by7dv50JUhdJ8cBIi/otWSgcfrN6UrFSlh7laQmB5huG8wqMiNPVT8XEVhP
         tebn6Z7TVJaLW1BJWx9hi3vzEk4WhwdFRdoG+XFvjrrvA8pya8QIw32kJoqOh3PQE4Af
         aKHA==
X-Forwarded-Encrypted: i=1; AL+hErF6rUdQrT/FcmbqtGgBPAtzgHf9vh9RR8/CqtbOD56D6FdLVubaXxT7wjnMJ6ZqTmpAPTYz/tgJWD5X9As=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G0Nc2Te6SnsfzEdY0oecyiKnScTPD2AVQLvwHmWNC2U8humkz
	2nlbtiUzUU9gqGkYFXZ5VHsIHL7t071gNh3swRn1dHaT5HbGyBnsGp/GphjNrpntLkBzEK8MfoT
	Rf8n4ww3dTXA8PbiEyO2txp1sf4Bxq76jyDifCQfT3/X/19rmVm8P/sRUGLKRLANQj6ITjK4NeP
	sJXyTo3wMdplp1zqNe7OEUiRkkAfiG0CXoonzJ6/GNsgfzBwu5lHOA/NI3vazahI7JgJUmVj/Dn
	lH5sJmivp8SzeREaN5sRdGd
X-Gm-Gg: AZFdTZdTGx8Yu2OGs/58juTAcPhzQ625MS1KgMuJJvicU4LOKZ6zesFsWD4rkHxuVn7
	Gy9LSZnZbJzAGNNca0dwPBfy1To45u/xBjBJRej0EAFVTlI6JBRyRPtuWHnQchva98iMm6VwimK
	2c+mvdgw+si+r0sjsUG0eAEnnORaK5NfDgOK7mUyeuYIdEzVr2CJZjsikLWMG75xNl8ZeMdC6Iq
	fn8V4QSvtaLkppihqnGIBXYzI3md5MySf6wvq8eyV11hOmvIgG5lTpGIHxVB0OjT3P8rNUF4eL0
	nVLdr4O/ANbmdYvkyKmd0CrjCMtj/jEe/7YxFFPGdRAs/dtr2LG0nA0AhVDPySYOMDEK33M7+iX
	vHCSiFBBmrY6TRbsEF9gd1EC+3VC5gYqqxhVX6Kt4lp+Ya/QjzxqUFYyj+MKkbcnEQoEnVooUp+
	tkQWk7FGdWZc2OjsV7RSHr0pKL3Uzw9RalUxzylSzt
X-Received: by 2002:a17:90b:4410:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3b3d07a25c1mr4470336a91.20.1795049996218;
        Wed, 18 Nov 2026 16:59:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b402992c21sm27826a91.3.2026.11.18.16.59.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:59:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211604468aso18787756d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049995; x=1795654795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=BbFBHqj1fnu9hg25Usrhd6sqPdrJGhOTfVfSdJIH+qMpHZlJrUqSX4w/brIS7zs/AC
         63MA1JD9huK+1PDQW5EqgUAVyuySQs4o1YIBd0UKmQHA1hzVqof3Z7ebmKffeeTd5wZd
         kNaob2bczsy58tqw4UBpwpFj8W2sBfnnzE0VA=
X-Forwarded-Encrypted: i=1; AL+hErHLYZPukc2G29uZo9Ov7VDQnIKD3X6uHIGcqrvQZ0srkyaBoSYy1PdX5Vv0LHnpamXtHSK6FtTsS6Zjfxg=@vger.kernel.org
X-Received: by 2002:a05:6214:1bc8:b0:91b:9536:21af with SMTP id 6a1803df08f44-92114eabcfcmr70727716d6.46.1795049994437;
        Wed, 18 Nov 2026 16:59:54 -0800 (PST)
X-Received: by 2002:a05:6214:1bc8:b0:91b:9536:21af with SMTP id 6a1803df08f44-92114eabcfcmr70727286d6.46.1795049993735;
        Wed, 18 Nov 2026 16:59:53 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:53 -0800 (PST)
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
Subject: [PATCH net-next v4 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Wed, 18 Nov 2026 16:59:39 -0800
Message-Id: <20261119005943.999981-1-florian.fainelli@broadcom.com>
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

 drivers/net/mdio/mdio-bcm-unimac.c | 151 ++++++++++++++++++++++++++---
 drivers/net/phy/phy_device.c       |  48 +++++++--
 2 files changed, 173 insertions(+), 26 deletions(-)

-- 
2.34.1

