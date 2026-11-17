Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958338;
	b=mE1+dkrJW+ECN2gC+a3rnmZUeKcFvVyzGpKH49S7QLqP7zkOh86nvtvxw+tBhnBIrR8b
	 MYd4UlGNKlsz+frAJ12MqobcEAIh1ZIWFUx0pCXz3OZ6Muzu4DCCLnKhtmvqJ/uvd94tG
	 rfWarktA20NjzCdiFNIcSCW3Yf5CDX6ckk1X0AMjvp0muMW3+XxGBiXR6qmWkplfHOg9o
	 DyH7ZF2Gtl1wS3j2hLTikepGc1Eih6PbxlGcUoMuKhaFZ2g3xpfBDffUcsv8tYL8NRRT2
	 DrmcL34MqwtxzHSPyFa/gPfHx+jsEpzF7Z1nsJoRAYZalFTDXCiOZiNNsqOsOTWvotg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958338;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=9mke51kCsIvniGA5lBS7zuIakgVAc6c4NcAp5sm/WGE=;
	b=rc8AhgA2hgcTKBdde0eMBPomkmp/z/eHIrXpBtK4/TdLqAVjJX7Oa6maNZ8dAIX/TdW1
	 ldxOK+oAEPf77eRzYcQnyBtskKZCCcMZ/NC0su2VYh8KLSS9i9UYZOHiF3lxMf5k1DPJs
	 KEIlJK0Ynf9BwaT3FP9JNVO+TOH1nUy7IWA8rtzOQlnBLoCldAhjub8MIJrvdJ2F/IF3k
	 FCC4631BHI3KNxnpGaC/3xJ9UoMv52e/D0S9/n8VkT1sqV/948dCUwyO+liamY3Sj+DeS
	 Dfkr4RpuVY5fLfZEXa34iaPwQQ2csK+nOjFPxARu8fYhlEDHgeZ63XNpqWrntyfbAPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CFDc5Imz;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D2606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388D2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CFDc5Imz
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so229026a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958338; x=1795563138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9mke51kCsIvniGA5lBS7zuIakgVAc6c4NcAp5sm/WGE=;
        b=ivn+hAVOEo1BgF9BsFPR9GeF88fpiVVuEVXP881OVKvaIeXTa6xqmToMASA5IBuMJ0
         v4k08NWzZzow1ixhC3CQmsnuwDIYuzFR8YWpSSzkwsIC6CvxBqxG8WjnTMKkbTjrBTPA
         iB1eg+dA+lLxCFad+XvF7GsnwKIAFolaO6ISBu6v3q/0e7dgooITIhKIkM6ilBkKEODB
         97XO1VbEdMxX3FhQpqBvN7PLsBeCRyh/w2WhY1px3zdyYzxX5ddZ3MghztqsHg217Bi/
         TpKRn+VRAE3vj2ggJzO58131S0zQPRh6tl1xRARUAcWNN9YYEHKzIa8p5B9ZmEakRqvi
         +oWQ==
X-Forwarded-Encrypted: i=1; AL+hErF5CFaO16VGJ9PiQalVOafXi7hQbAlgAIjbCxNT0NJYYeGQ1xgQl8Jsf91Qs8x1OmH2YhoAIUglFm/pad8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aOH7T4pqt25h7CqHFmDHRdcpcZvkDTlOxPyl7bTVJAw1rujfe
	1Xrc8+CgG0c7XYvDrRl+X+Wbep2Ow1+TnXRsGxa38llKXj+VHkj7Eo+/XLQMHXdytkzf+Ze2lp8
	ulZ/VdzbdotUeGjIdIrycWU210mJUzZ2LtZkVAmFHWs/FadIcwx7Y25pjXCXIV3qXb8LPnpUT4n
	1ghPjStv5mFq32TqR4NUS1GqWjR4TvDvOWT/gczr4CU7nI+bLU6Si8WAXnVKLIKkyF0ezKuWHLw
	D2jVtCGsoKCBQFwkfytfAbS
X-Gm-Gg: AZFdTZeaBx5R/1ET/WYNJNPhhvOHbLcPOM7YO8tcpqdYiYhfnkj1dmdIV2hEK941EMD
	MfSsI8YH/z7ughUqTfy9zXVcfA7XxyDkx5PA5vbswCFQTJxx4kujiNazatLGq3OpoYNi4N5ifIi
	Ntwn28j5QIOIYExlAG/jnCpASx92qnRGrX61+coBtnZbVgOO+VHBgXDp5A0gxtrMjr5Sx+7J1v8
	rlUvj3nr7KB3DTY5Ylrueem0FNN9CxGMITjJqADR8yVXfD8xhlC0wNSONu5qPhb0LO6BIWCjyHm
	f2Zs6cvNqVmrfZNVgV0dxFv+KQOzQM6J8ZWbzRj9i8Y3TPg4csUsIE7qoC/ZSVq1XzRUBWU38Fr
	8A4I807IDZU9r7icEy0PI1pfY5uWedXYlbBGIxx+0Frd2pXaLLYbSNf2E1oVLC79r5lFRcj9is4
	mDWjhuqYiF6S+gAFjRYjKA3PUFhDw74fu+yNsri3GM
X-Received: by 2002:a17:90b:3d8f:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b3d07cd7c6mr769404a91.61.1794958337545;
        Tue, 17 Nov 2026 15:32:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac14d2dbsm2667769a91.8.2026.11.17.15.32.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:32:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so415850c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958336; x=1795563136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mke51kCsIvniGA5lBS7zuIakgVAc6c4NcAp5sm/WGE=;
        b=CFDc5ImzGM01C7N0flF2kgHS4eb3h6KCKcydz5nNFbfA/v+e6Soq5RGlFIrg3ikcqf
         SBtAXjUdWxTVxW8YDQsZvwPyvaBx7IUmwgstP4d8N8C8yCHKtLHQvqyBXD9aKAvbtlhj
         Hs2ZTcegxbJIY2IPxH1iUNh8WxZxq2S4PuY3g=
X-Forwarded-Encrypted: i=1; AL+hErFU99wR3a/FYojS0UR14WyNHQp7Piu3YA+mRMXfcucqKSaqxuqsRHewvbXqRzDp1SUYl44I0Jz7sKvSZMA=@vger.kernel.org
X-Received: by 2002:a05:7023:d0a:b0:1ab:fe29:5055 with SMTP id a92af1059eb24-1b543cb4d86mr1035962c88.9.1794958335432;
        Tue, 17 Nov 2026 15:32:15 -0800 (PST)
X-Received: by 2002:a05:7023:d0a:b0:1ab:fe29:5055 with SMTP id a92af1059eb24-1b543cb4d86mr1035934c88.9.1794958334545;
        Tue, 17 Nov 2026 15:32:14 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:13 -0800 (PST)
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
Subject: [PATCH net-next v3 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Tue, 17 Nov 2026 15:31:45 -0800
Message-Id: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
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

 drivers/net/mdio/mdio-bcm-unimac.c | 150 ++++++++++++++++++++++++++---
 drivers/net/phy/phy_device.c       |  24 ++++-
 2 files changed, 153 insertions(+), 21 deletions(-)

-- 
2.34.1

