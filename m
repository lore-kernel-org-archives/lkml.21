Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082107;
	b=3lRXhCibcOBDr1IXGLtI8WYozSdutFrCP6jfIY84TuoHsblhU8Sb9IMsX0jcSvb2iawa
	 vJhFIvgrcEy9BKPsQBZhcTh8rs5ztHbL/gb5Gm4Gy4LYdv2QPOBALZ1Tx6h+Mwy8hLouA
	 MbHabaZ7pWVMJisxJFOv1sii+BQsDs8WbVtXJL4AT9kiOrZuotbLW2L7o+eRsAoAHQVMi
	 k9VjCMI+eNRFDFQRc/SQr8S4eM+amLVteiNsB2TVGZrhoJM+Zi4czzQF23K7ZsUu7X62Y
	 EM+z+1uuAOqDJnLxwLsKO3n2vbzcAXsGBIwSX57qWf4V9PoZ1Ajr0yax+UMXtex5rIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082107;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=JLN20K6L7rdaMdVFmfH9qQYDec2EB2BAQiiGJc5kVtM=;
	b=M4dG82PkrQSlFSFTLZ4YOkmNDVlxWkLTi/6fXZwRmrVqyTRhsoHkgGd2V03ZQDJK/lcz
	 P4F05NySvwlkeZscS7bFPnDANYWoFUf12Gv6EOPWfRRNllQWrco+8tz/7Z2yFmNx7XB4P
	 mnV54ytH5p2gkwp6fx1JaD/Dk6mBsWM7qPhd2Q13mg4nEic7cikQ+ROHKtaCZsUpjuRMP
	 yiPP4bP9qUSrBhnoEdlL4Vsh6k7qe/+1/dtbTYEWQ3+VsCB1HCejRCGybv4w/gMW1maxO
	 gyDFHqsQfy9Rl3dLdPC/qjEXLNVKOFQefG3S+pIFdsm6CfjHYlIO/7egHvriS+kb1WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	arc=none smtp.remote-ip=92.121.34.21
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7799D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7799D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6418620000B;
	Thu, 19 Nov 2026 10:54:59 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2F77E200003;
	Thu, 19 Nov 2026 10:54:59 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 79914180006C;
	Thu, 19 Nov 2026 17:54:56 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v22 0/5] Add support for NXP P3H2x4x I3C hub driver
Date: Thu, 19 Nov 2026 15:24:44 +0530
Message-Id: <20261119095449.555593-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
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
X-Virus-Scanned: ClamAV using ClamSMTP

This series adds the MFD parent, regulator and hub drivers for NXP's
four-port and eight-port P3H2x4x I3C hubs. With an I3C host, the hub
driver exposes I3C ports as virtual controllers. SMBus ports appear
as I2C adapters with either an I2C or an I3C host.

The I3C core helpers, DT binding and generic hub support from v20
(patches 1-3 and 6) are already in mainline. This revision adds a
generic I3C address-slot fix and addresses the Sashiko findings and
review feedback reported against v21. The series is rebased onto
v7.4-rc3.

The earlier v20 Sashiko reports concerning the location of p3h2840.h
in the MFD and regulator patches appear to be false positives.

Changes in v22:

Sashiko fixes and review feedback

- Factor the common I2C and I3C MFD probe initialization into a shared
  helper, leaving transport-specific validation and regmap setup in
  the respective probe functions.
- Replace the generic I2C device ID "nxp-i3c-hub" with "p3h2x4x".
- Use platform_device_set_of_node_from_dev() in the regulator driver
  to avoid leaking the inherited Device Tree node reference.
- Initialize TP_NET_CON_CONF to a known disconnected state during
  probe, preventing stale routing state from connecting unintended
  target ports.
- Mark downstream DT-assigned addresses as I3C_ADDR_SLOT_EXT_DESIRED
  instead of I3C_ADDR_SLOT_I3C_DEV on the parent bus. This prevents
  DAA reconciliation from treating downstream devices as orphaned
  parent-bus devices and probing them again.
- Connect each I3C target port before registering its virtual
  controller, rather than connecting all ports after registration.
  Keep the ports connected to prevent downstream device probes
  and IBI operations from accessing disconnected targets.
- Advertise supported SMBus emulation operations and reject
  I2C_M_RECV_LEN, avoiding unsupported variable-length block reads.
- Add combined write-then-read adapter quirks and reject transfers
  exceeding the shared controller-agent payload capacity.
- Reject empty SMBus receive buffers before reading their address
  or delivering slave callbacks.
- Clear pending SMBus receive and overflow flags before enabling
  the slave IBI, without clearing the controller transaction-finish
  flag.
- Reject unsupported 10-bit I2C slave address registration.

Additional changes

- Add managed cleanup to disconnect I3C target ports after virtual
  controller teardown.
- Keep port routing updates serialized under the hub routing mutex,
  marking ports permanently connected only after successful writes.
- Document SETDASA/ENTDAA handling and the shared parent dynamic
  address space.

Changes in v21:

Sashiko fixes

- Keep I3C routing callbacks active during virtual controller
  registration. Serialize routing updates under the hub mutex and
  mark ports permanently connected only after successful routing.
- Filter both DT parsing passes to "i3c" and "smbus" target-port
  nodes, preventing unrelated child nodes from claiming ports.
- Process pending SMBus receive buffers independently and clear
  only the overflow flag after servicing them, preserving new
  buffer-refill events.

Additional fixes

- Reject duplicate target-port indices in Device Tree.
- Reserve DT-assigned addresses for all I3C target ports before
  the first virtual controller starts DAA.
- Clear only the SMBus controller transaction-finish flag before
  starting a transfer, preserving pending RX and overflow flags.
- Initialize optional IBI support without holding the routing
  mutex, avoiding an error path that could leave it locked.

Previous posting (v21)
https://lore.kernel.org/linux-i3c/20261112124437.3367252-1-lakshay.piplani@nxp.com/

Previously merged upstream patches from v20

[1/8] I3C core hub support
https://git.kernel.org/i3c/c/9d60a0eafae1

[2/8] I3C controller-only operations
https://git.kernel.org/i3c/c/8d0008260c32

[3/8] NXP P3H2x4x Device Tree binding
https://git.kernel.org/i3c/c/58c018414635

[6/8] Generic I3C hub support
https://git.kernel.org/i3c/c/b0cfe49a2e3b

Aman Kumar Pandey (3):
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (2):
  i3c: hub: Mark downstream DT addresses as desired on parent bus
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 MAINTAINERS                                   |   6 +
 drivers/i3c/Kconfig                           |   1 +
 drivers/i3c/Makefile                          |   1 +
 drivers/i3c/hub.c                             |  18 +-
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 358 +++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 437 +++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 247 +++++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 685 ++++++++++++++++++
 drivers/i3c/master.c                          |  20 +
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 156 ++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 289 ++++++++
 include/linux/i3c/device.h                    |   2 +
 include/linux/i3c/master.h                    |   2 +
 include/linux/mfd/p3h2840.h                   |  41 ++
 20 files changed, 2296 insertions(+), 7 deletions(-)
 create mode 100644 drivers/i3c/hub/Kconfig
 create mode 100644 drivers/i3c/hub/Makefile
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
 create mode 100644 include/linux/mfd/p3h2840.h

-- 
2.25.1

