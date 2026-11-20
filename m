Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151853;
	b=Nr5trTEFRzVX6IBY8gIvEsg0hWk8wsmO59Y0iiO0MwnE5FtkFQVIjGmchimReEjl7nhM
	 9ZlsWLzeTpSPcF/uQ25KwRDYiOS05X5CUBtN549Z3CKZHbZBF9vCCdWeH/tbuQiQ1AoX9
	 QB3MNgGcT3PrvsKjtX6YE/wNinmjGhF6zKLJXW/JHvye1bEa9XMimcrE9SHk28UlEOPX5
	 z++P8k6kXIgOZtZZmBU35yrJXhxqK0Bjt+eDzsh8IGAoEUstrztuQ8LX/VgX9s467wuvx
	 uSJgbIGPQ2Hcn/shmlRf9hJ+OpYfrbnU2Y2stlBe5lJLPS+VPGiSpCcfVJ9VkBIdhlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151853;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
	b=2APHOVDLaeuONH07Yad5UrLrqJ7XDMyAsmFF3lUQBcAfhmAQoCWydRQdSDIYCW/AGRal
	 a9lSPc0UTj2ZR5UJVUXH9D1XXVSmU3Aa8vT0xE22khrFwE70YneznfMfazyDGKdBhDcxX
	 6rKPxc0f/YWObqK8BHP4bRUbONzgeTGss005uhVHQBaqVOXAorgVFrPQTPFdmpKwpMl4C
	 IJXib8ArvNYiuJOP8uGabKQJVzk+VTn6aookNp/gLAmyl9ZERUbYP8RtZ/sZe6ldejJqp
	 js+OOG9UOSi/ppy/fEx95KWhxjJSSwDkHBv4Y5vYM+SLk9lo/tsp7fWsvJnxTZnAvsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LFwlnMt4;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D39606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04D39606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LFwlnMt4
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so267500a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151852; x=1795756652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=L6QSwnx8R3LHiljWPFdigR8LCBdU4DeJLLh/vmURp4t+kxh7mLaufWo2mkVihyps+n
         xJYFWAWOeQmZefUZvqmi4SAe4Dll8GWLEmJAq4dcUKtyGO7Y0QXBk3qI/UEvrKn4XXkl
         YUs6r+xe9sUshVAaFeQuMhzzDn11YNGlfP0d5tlJOwgByCfTHAHYam1LmJpJpYFKTycV
         c8yKfC34BYbSJKf5N8Ij+hKW0NGkXziGBdjiwJe2q3eF/kMr1F9M4ftsGwTsZXcLSXpA
         tGXE7lpiws3VW/m1aIWMOecsXW1cnrWuyH77d/qGrCi3ZAUHASCEXl5YJSubHY9vK6EX
         yLhA==
X-Forwarded-Encrypted: i=1; AL+hErFzetAJOL/KjrrX9f0HMPCWSVLjXs3roHAD5QUgHvPMniyv5B6GEOxM8eIq9iE3ngq6fmYPZJIEtDJ6Nlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6djYBrnaxpJtma4PCMHrigoaFHArVXIHDzNtNkSo2frjVwbMC
	mikeI4nDD8b2scUt4XBirJroyP3yk7VFGEMwjy7ReSSWnJU47W25mCwWYGkHq9FXKTPpknS98KE
	G22GKNwdYhfKeV2CBxBrDsoa3g3nzjo5XFOgCT9JrPktPy19C2pZjN3GgdIMlo+TeLQprCuNdCz
	SgjUMlSLY0m+RU/ggvoqgbj+FvlfLhC4G/sYDRBq3yuOrAdpm3glcKZ/9SVqoPqrU6R3UBoqqYo
	KpZWRw3PD2tdLYPdI7ehtZC
X-Gm-Gg: AZFdTZdXRprYasxKztpBXkzFbD1uXlP0Fhw+urGhhMkgeZ9dt6aMIfWoPTpDIR5gpsw
	yiKF/j2JhslaTrBo7pfAPbuU8aJfFwcyFu8YfyljxJZ81YS7CpFRl3SPfin1SDU2cGyippWhVde
	EZPCHQAXqzvIxO8/oCw40iutqAFnnSWQ+XGkGAj61vRosWYXmX66e17HjYmMAf3pPlGGykAIt44
	RX6eThrRGVN6tRlgvvUXwinHkpKMLMOFIp6ZmOvZ1q+fgWGWkI0rHkUefN7qJuCX0U269hqXKFe
	TkxnaeVgHgB8Nmu3yVUEliGa6IzPWKqP++CDqbN73eyMYJLmhahtD03SiHRqTixUqS9IqH+p27u
	aoRdTQaz5WR5eKman+Zy8ZY7rG/fQc1/GIMd06/xe4hsm4CEJrem7gtfVynyR5vF+EwA+r87Rc+
	4gL5r7OHGQPaPeD9N9SkDTh+gDuvyGHyB+aADuFlAWTRI=
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1532275a91.12.1795151851869;
        Thu, 19 Nov 2026 21:17:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm823152a91.0.2026.11.19.21.17.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so100175185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151851; x=1795756651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=drRvNBldGZjy4qZkbZLlOV+QLmaf97VqNGgTP8eyCDU=;
        b=LFwlnMt4ZCjyfNo9qi78roBUqjDuSkvpLh/asc0zO1RnvMAM1TwthUOAs7OaF0Xtan
         13X60a7NfwkaB/k4o+Vfedy+8sNpGrBpdExzI3qsGcDgvekUjaRDTsjBs1NFE2uBoKiv
         esBR6/ZgDCOyLWAUFwuOsj+vQitOHB3ESY5q4=
X-Forwarded-Encrypted: i=1; AL+hErFdWiGWvYF4hk7wbzlk6vc1sv4nihlZiG94momK1HPxCpxgDk+FmPqVgEg7USbfSC7ZciIVI59e6G5TDDE=@vger.kernel.org
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr297722185a.81.1795151850664;
        Thu, 19 Nov 2026 21:17:30 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr297720085a.81.1795151850228;
        Thu, 19 Nov 2026 21:17:30 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:29 -0800 (PST)
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
Date: Thu, 19 Nov 2026 21:16:49 -0800
Message-Id: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
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

