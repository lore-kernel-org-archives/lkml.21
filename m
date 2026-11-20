Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205320;
	b=TYfbFFZXfVfeW4nmDsqHoWSLNa/78WHgP448gSjaYJRVBPAmKj4eynFN/Tu6A6ZaEtXp
	 lns6O/fQEwqUopGnVzUj8kbEZjrDp1I+GswTvYEDYTgakeVzs917wv/JsTOftqxGwU8AV
	 nFVUoaZ+ZHeI4wpAetdD1LwxomKYXbakWKw3CcxY3bQAfTlYGdMCsBPlJhH13+TDSLClk
	 QrPghiDo64LKczyUQ1k/oIiJmdfSwX3NDwXQD6VvVinJ/xIvS1sZ/baX2FwxKmcUzwJYB
	 ZP9nltOYI0YZu8Qg576dSLTaOqM70OyC/dpcKUh97z+dfZNcHAT4/J9io+MMa0s0YHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Uty8O3I7yR64QshHJyAi1i32cYAjS3ISDg9jbL0g2qc=;
	b=x1zolhsHGKRMXX7fIKpOACxSI4p82IpwvY1ThzdvkaZzjHLrjveD9slpySpnGu2c5Su7
	 AkkzzXjIC7WMCq5H7eNnLcwDyKLSGkFq23hDrSqFm1RooG4xW69zNqdXsf/bcFrkchy6Z
	 2qZ8xMFkB7+KTC8mkWbDu3kbNsw+RoboIRGRk6plK3y4jMDp0tBMYYQ1Ssk4V1effgz84
	 lfpnpHMB7hzA9NWp+oiDNWoCEPzKCOPWAn5zMOtUmgK4diTCDEfe66kPv0RRM0vMEagtk
	 9oPrqqumqbi/Y1C775EUzrwlYRDr/ya9Q8fD0kJj/Rd9Z4p3O+E1ZGEtak1NPqB1m6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWkRCgLB;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7AA606A6C7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7AA606A6C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWkRCgLB
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8253bc5a613so887065a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205317; x=1795810117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uty8O3I7yR64QshHJyAi1i32cYAjS3ISDg9jbL0g2qc=;
        b=WWkRCgLBRFYik8w6PAX9VkPSa6w1gjyAwzoliV/sFfvQ8Gyng0PcqEhZG4B6o0YvHW
         pkxUTJVWCmLCgbdbRsk61tOq5b5I+grQcYqy/dUplF7vEP4nwQRl9hmuhX4c5Mz84Wdx
         gStoQEOYHu/u5XVuypOEAQ+9oo9Zpb9yGrrHMHf4r+BcQIoy2liV6WDXVJKiMJRpsc9T
         F2anCsFmg8RyiGe+F/Vs+zj91b/+78dIVEF0lc1UTF56J7X/C2B/m24fbl+ecfd1Jvwb
         qkOf0BTbhjbONNa1tEyK2m9OkU2Kim7jO8ConwlW2S2l6h+4WEW9D4lmTZDO/er57ISI
         oTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205317; x=1795810117;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uty8O3I7yR64QshHJyAi1i32cYAjS3ISDg9jbL0g2qc=;
        b=2AvHkh3mElNs+FhANvEfr5fhAfqhsh6Xn8qXVXRXMTC2rf0M7wx4twV5jn8MoHNdWD
         Xhmy1Q/KdooH8WxnfojQodTF5nb2aWGPVS2Z5LtuoYO3Ofn34pYcXE6+R3am1tNoE7t7
         80M9v65izt307QWSIr8wG01PO9tDELyzOnmYRlmtGO9KL9WJ72F/4i3de/My7eZ6/fuQ
         xTSDu9iZJaBpHoEZRhSTx7pd47kMQwWyIcA2fOqwR3dUNK7lU6HKm4pfXfl5VIcoXxvj
         D7kJehwPTh9/ecn0iig5YxbZ/xquze+Utc75Xb1VtPOEvuFfT8Pk+hIDKkjEClVHb6ie
         eaUg==
X-Forwarded-Encrypted: i=1; AL+hErEcTeJ/+zGakOAtx+Np/DI0rxpVcViZ9bfgblWFWaJafA+jACSI40Kr/OPpxR0HN60xfkL+JgAnvi+5Hg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VXmNJVX+Cv1VwRbSXkR13It+sCoonLYdUQDpuiq1q3DErwy7h
	kQd4lfQ5eK6axap43ebGCXGqfP5v/yImb0RsIIkCbJwXvIGQ8zcrrzHe
X-Gm-Gg: AYBFou2KvKrP8thHY7+qV0EF9azwbhp1l2T5Ka6ynHBbkx+JxM+rZE+LvHpKJ7ZD5//
	w2PVyrntzqEwjBabJvhSKfbHR7g6ASLJ7D3zyKG3yClNFklhp65B70Z9+upGW5pwDpsUTsrG+Y5
	q28g/VLnnrDQf/6D98+20EGveMKZrnCcNhYL8rqs6qYhcsOnil8lM3tPWlvpaaH8umt3zBtmogN
	+VRbysLota+VgDTvo9ctPr8C+Gag1vMXNRrrj1KWQYfs3K5e4OKNHT4U2M4OyqnE7EK9Zu+hEhR
	Sig5fmeEt6aURfhQAUxfF+Wv29r0sOhk0aqZmO7XCX6iGWRQgTtBKbGWm1Q4pjW6OzMx4/YVLF/
	VkmxGEa0S/Z0gsY0Ga0sgVBuGm/xtko5oMHSUu/zlu1Lh80tm/4thJC61n/2gDXPoT9IniN4yHT
	0owTmp7hxs4dIMZZfXRx6nLe3GWLswm1SUhysCUf/YruTDxIdxIQH/P8HZMQSc4AVLmAcn0Fe9g
	I4MTEf8ynJtHMX9szWdce9efb5t+xv4sYObR9livYQIjo2mE3b+O5cRtutTDgihPLvl2sUhrA01
	53SRlyoA/AOhE4kb440kuEvlbyccwNaHqZViNSGhwIyRS1tWaylEPG8cx3N407LkccDMDE8jT3A
	qRphFfW1E2OBHElvVjXDIQDMskM6qa8Kz92Au0rEXZAg4mKPSnQdLhE5pHolnzgh8a7s6tCkgrX
	cDQLvmd7a5rV3VXnw4huX7BsVYhLprzF/OrahQXw==
X-Received: by 2002:a05:6830:640e:b0:861:5a01:b30a with SMTP id 46e09a7af769-86315aabdecmr5184841a34.27.1795205317253;
        Fri, 20 Nov 2026 12:08:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 00/11] nvmem: complete provider and layout disconnection
Date: Fri, 20 Nov 2026 13:08:30 -0700
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQwW6EMAxEfwXl3JBN6LYsp/5H1QMJDuuWJKwTE
 NWKf2+AHvbYSr6MPHrj8Z1FIITImuLOCGaMGHwW1VPBzLX1PXDssmbqpF6klK88Ttph4n524Ph
 IYcYOiA9oIaEDPktutdJVJy/KmpZlzkhgcdkz3j8OnSGfYNIG/nUQ3KYcng4b020EngigKa4pj
 bERosdUfgF5GMpAvRgnLaJxYkA/LeJYbB4RCT2K/b4y68IG4h6WxLbsK8YU6HuvO8s96h/N8px
 4ZazunutaKn1+612LQ2mC2+mzeiRe/kJUmVjnR1VgzlbW5pG4rusPfOc0UaABAAA=
X-Change-ID: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

NVMEM unregister already disconnects register callbacks with SRCU. Some
accesses extend beyond those callbacks: keepout traversal, cell
post-processing, DT fixups and device matching can still use provider
state. Layout unbind also leaves its cells and their callbacks available
to retained consumers.

Extend the existing drain to those accesses, and retire layout-owned
cells independently of provider cells. Old handles retain core-owned
metadata and reject further access. Explicit cell references and sysfs
group ownership make layout removal and rebind independent of existing
consumers. Release the write-protect GPIO when callbacks are drained so
a retained consumer does not prevent provider reprobe.

The final patch lets providers distinguish an explicit NULL module owner
from the parent-driver fallback, for callbacks implemented by built-in
subsystem code.

This separates the NVMEM work previously included in the raw NAND
retained-handle series [0], following Paul's request for smaller patches
[1]. It builds on the NVMEM for-next tree at 6628e7d4c6b, including the
existing SRCU protection and device-reference ownership.

[0] https://lore.kernel.org/r/20261115-submit-rawnand-retained-handle-lifetime-v1-v5-1-cbc49c5c5e74@gmail.com/
[1] https://lore.kernel.org/r/9c247830067d2192acfe08080d1c5f2bb366cf1a.camel@crapouillou.net/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Correct the Fixes tag in patch 4 to point to the commit that
  disconnected provider writes but kept the write-protect GPIO held.
- Link to v2: https://patch.msgid.link/20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com

Changes in v2:
- Use one SRCU read-side section per register or cell access, including
  keepout traversal, partial-byte writes and cell post-processing.
- Use device_set_of_node_from_dev() when inheriting the provider's OF
  node, following Bartosz's review.
- Use an SRCU notifier chain so listeners can register another provider
  while a cell notification is in progress.
- Check cell publication against disconnection under the list lock and
  drain cell-add notifications before reporting provider removal.
- Simplify error unwinding in sysfs cell creation and layout registration.
- Link to v1: https://patch.msgid.link/20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com

---
James Hilliard (11):
      nvmem: retain the provider node until device release
      nvmem: drain keepout and cell post-processing accesses
      nvmem: exclude disconnected providers from callback admission
      nvmem: release write protection when the provider disconnects
      nvmem: reference cell entries independently of their provider list
      nvmem: manage cell attributes independently of device resources
      nvmem: distinguish layout cells from provider cells
      nvmem: disconnect cells before removing their layout
      nvmem: disconnect published devices before registration rollback
      nvmem: u-boot-env: propagate cell registration errors
      nvmem: allow providers to specify an explicit NULL owner

 drivers/nvmem/core.c                 | 545 ++++++++++++++++++++++-------------
 drivers/nvmem/internals.h            |   4 +
 drivers/nvmem/layouts.c              |   2 +
 drivers/nvmem/layouts/fixed-layout.c |   2 +-
 drivers/nvmem/layouts/onie-tlv.c     |  19 +-
 drivers/nvmem/layouts/sl28vpd.c      |   2 +-
 drivers/nvmem/layouts/u-boot-env.c   |  25 +-
 include/linux/nvmem-provider.h       |  16 +-
 8 files changed, 401 insertions(+), 214 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
change-id: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

