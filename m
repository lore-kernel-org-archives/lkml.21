Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452527;
	b=S2UEF8E7spCte+GvCsw3hL4OZ9Y9/kSBQ3OYWcNmFfIOY/tLgnZblxOVHM/itMq4w/im
	 GWjZDzItRsRnmD2++j3wTfKTNSi+z8rJpufvAU96nUWAypkbnmLOzAViPM8E65Tj6eDhO
	 m4Bhyn5G4nYOkjZnIpzCm/vXoEf6WyxMutwWAfbT9ce3FWz/hrnXYonzp3GZdCXDbTlik
	 ldJ5mMAz5W3Dkwzm3FJiogoqwSvEJtthPzC8/6ANI/IapQ0oLi14H1YUkAp594fZifgvj
	 Y55HGSyQoM25RunGTmToXGYIf8NXnm66ypmpTMMxOf9kDtjn5B8jnFclW4vKuZlq51w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452527;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ETbTukZehFn+Slg6lApR+dONEOxSCr9lTyrvYGlsQGw=;
	b=Z90qTSoXFEEADM73+T5A3KL/myLHhJbEUWGUR/TsS3kQmggoKAu03VjO29Oq1E4VpZV7
	 wUUbEEp0kQOyingTRy+bxPNLjnlGCyuGe9NTF1U519lSfJUbaxBtebLXmxN1Mln1KxIfl
	 x+/LFgfw0xwF0C6CGeiAey9kHzpyxnbH2JmhjZbRa59Xn+vppZLYW5RLCsbT8MNmdaYbj
	 bTdmLGgGklQtNdgBsa3HiamSkHwTw0qoadKM+Bsb5AzCeCXOFlqNKVdUqrQx5IPhA7CEq
	 KxjXHPt+qXN8VAF/0M0Vd6x3D/NpWDPjLmpqndG1/FZUDqmsNqve3YPVgLjT54AayxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C+ywZtvZ;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2BD606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D2BD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C+ywZtvZ
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso2230593a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452525; x=1796057325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETbTukZehFn+Slg6lApR+dONEOxSCr9lTyrvYGlsQGw=;
        b=YMqO6Ckd/rBr5AQYgPXGwYl24aq5MDYG1Ed/mPPfZQ8BcBE9A32McxS12xuz/LvtWK
         ppAxlvU2tPLN7O16s8Kq/oWY4y3bZMDXUtuuFd8fyd1UdH+QIdk7VuLxgHyo6ERVSRVP
         EyDe0lrN+k64eK81bSpf0LFT2NZEcvFhZSMGjLUZ+3lHtSLAeo3L+14aEQ8mh1D6G3MK
         mJq4bSuAgEUzsvq8GWWHBOgEpO08GmVixlZoZZz9MW15JXqKmBP5Kvqo+SwRpHLIqODE
         NIIKA8XKo7fPw4S8GrkL7s9TY15VRY35yZcT5fX2SRk9PU9AakVvxfIgKK2rAzuspAtQ
         kL7w==
X-Forwarded-Encrypted: i=1; AL+hErGJAOfAxBTj6cl8unLo8DgbAe1DjTnM75rO3HtN2fbOfR9HOtXrTcUUVaIwF5eUMtb1RHp1lppueKXATuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wOogimTp4tJeGO0RYDa7GECb/Bkhpc/eTtxddLTV37YkBQkpp
	FIWKXCvvnfPpKp4U/fvAfeh8C6TA7oDBzUnOsNt1xKjWZZFV7QaYKahzbaq+d4B/JHzIMKW/OKk
	H4t1G8RriomFnVkaUgnUyY/DQu+zjXvWAvdiVM+k/OccXoItqwSVghCQhmB5gD/MMqnctIJkXPy
	ka7aWushXQg2KckDfCSXAIdWixl1LFDknSyJGXrCpkjIUqeFC+oev9gsISNhWSKsi62dqocTZ3w
	0UFV7GHmdKFV8JRp8Kh0muQ
X-Gm-Gg: AZFdTZfldL986SJdf3n0WAyU129JJc7ciFD6rxK+3t1krnc+faKPwUDVtaiby6E9QtW
	xyHoCiJyT6wu82sIqJHnbOuV/KsJMRmfxdKUOrREIl/Dh45f2/mPVpwGpS7oV9OFIymwIwth5Do
	2+7QipG4Ll0NHHErwOSKzgkMSQs5e+HBxir8SQbOF1kaXqD51T5GNN/AeZdbcTXCM3HTNVxG2rH
	H7DW6mnhDWrPON5vEHL4xQX+g2+wFDT4B7COElVPsE6dmzZygrxMfQByxfZN09D4ocwBZgWxxph
	uLzeqyncCfhKzssXUVTmpEVhLkmTyYEmPOb0YCxLDtoopwdru3Gabrpy7SjXkrbRAfSJIoq2ogM
	IdqwJAxSspY5a0aHUPxVn+hOXwg7eXUM5vPR7A2wzeqav5u1L9Hqh1YaIQJyT4UarmCmdmt660w
	aow8vTBg/abfFjBu65lV8NFb0cLA7zumgFcg7kjYN2r48=
X-Received: by 2002:a17:90b:5287:b0:3ac:7556:8ee6 with SMTP id 98e67ed59e1d1-3b41c8d95damr11666134a91.16.1795452524812;
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f03f109142sm1656775ad.34.2026.11.23.08.48.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so660688185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452523; x=1796057323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETbTukZehFn+Slg6lApR+dONEOxSCr9lTyrvYGlsQGw=;
        b=C+ywZtvZ5p4RymCz54dQEFEerz3mTqIEG+VrPmmv+SayACV8XAPFIBObdc+ugTiKuX
         r77pA2JI2Q//yj7Wm1rqtvw9SnCrkjsEqNvmv6+3FB+HuN99gbxr9Qdm/pHfgMVwz9/o
         bfKL9AC4MoqfJ25THzGj63RUY2MtvaIVhtLvw=
X-Forwarded-Encrypted: i=1; AL+hErGOyXpkB80Jthn/wcP4q81LuL9lCn7ix3p/AJDl7wFufRkNJxg7W10hMLe4XAt6oKEoYn8TpOZDyGw5yXU=@vger.kernel.org
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2032505485a.42.1795452523072;
        Mon, 23 Nov 2026 08:48:43 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2032500785a.42.1795452522527;
        Mon, 23 Nov 2026 08:48:42 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:41 -0800 (PST)
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
Subject: [PATCH net-next v6 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Mon, 23 Nov 2026 08:48:31 -0800
Message-Id: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
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
 drivers/net/phy/phy_device.c       |  50 +++++++--
 2 files changed, 184 insertions(+), 28 deletions(-)

-- 
2.34.1

