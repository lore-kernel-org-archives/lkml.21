Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023355;
	b=U+7zNc40RUoCoINFwBIiLs8pceScIxGHJPYQrBeU1Z9ynqjnXcsm1L4dvaRqOKfrsdIw
	 pG2JRpZCifZXFTAHTa7ofD/OHjJ+mO7QU7xem159qkws6Jh7KM1m0V2qZbsOQi+kWmTgT
	 iWxhgU5l9miDrxFdy4WqmE0ZxzIHe9DeHGxO14DtBKAUYCBLcjjyNRwaTODQcW2QBXFgF
	 WSviGSnC+5JvBo28I3iqGCnh+cYrZPkg8fiLTaIVVAZgde05o5vbaqQNZF0FaACNQT8m/
	 tPudvQIY+mURyUa5WcQ0HoUy2qsjiFhUNxvxmr/F3mRJwNcF+GOwHHyIqLeWw238Rzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023355;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=coiu++CkI8S6volqEK7i4zet8hhL3SiCBfWVh0F3hvM=;
	b=oI18UlHbVkLeKGqzkg+XtW3TkEkr9RnF6a73tdUQVzQzvOFs1v9GBkmkFgQHq5my4mhv
	 34hMExTIbf0FFhp+Ow5R8alxefDksi4MxzXGjXcdusEEXMMpllfcLUAIYZFdfShPJ0aCN
	 spWGgmNhetk8lhRQslgb2rsnMHpOfHIBn7bzgCo85XF7M9qeZ41Q3Xdg93nCwkLaV1xke
	 gPwPRYFU3ooGBEe0jbwosUadshVTWe9OhYIc5Y0CASPAPgj8qBdUOihFYUjxRIkJlDuSP
	 nEyuQkPx2RhwpKLkbaAkPfyYhEmhr8mVlvNeAAgvWGj/oPtruRrVT92YjtXz/xjH/CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g49UnPYF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CAE606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g49UnPYF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 716B61477;
	Wed, 18 Nov 2026 09:35:50 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1B23F632;
	Wed, 18 Nov 2026 09:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023353; bh=ECCDdR84SWTkFqge/zOyIB8SKY5/qRtWm4u3J4fBHAw=;
	h=From:Subject:Date:To:Cc:From;
	b=g49UnPYFsTZqbkJ+k9jgcD5W24EdR7GxlQiN932vbPl7pT96JdyI1ryBkIo0qfUYG
	 GQT10GJDQmS2DCJznEDcS9AecO4vocqB0ii0WmwoxRDRvBdGL0gdyRcfYREbIefIks
	 rt86ZW1jVNdpbsskIt2ZDFhnqhh3DQe2i40+eNsg=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v3 00/14] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
Date: Wed, 18 Nov 2026 17:35:29 +0000
Message-Id: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
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
X-B4-Tracking: v=1; b=H4sIAOHh/WoC/32NQQ6CMBBFr0K6tqYdSlFW3sMYUsoANYGaFhsN4
 e62uNCFcfky/71ZiEdn0JMqW4jDYLyxU4R8lxE9qKlHatrIBBhIzhnQwfq57o0ORd2ZB3rKEVH
 BsQVUgkTt5nA7ROt8ebO/N1fUc+qkxWD8bN1z+xl42v3JB04ZLUXeSC5Bdro4KTfutR1Jigf41
 sUPHaKOolQtMFS5Pnz0dV1fOEJtev8AAAA=
X-Change-ID: 20261102-host_gicv5_fixes-1eeea29d2ea4
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Sashiko AI <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

This series fixes issues in the GICv5 host IRS and ITS drivers.

The ITS invalidation serialisation fix addresses Sashiko's report of a
race between event and device invalidation commands [1]. The other
patches fix IRS allocation and routing, IRS synchronisation, ITS table
selection and cache maintenance, ACPI coherency handling, and resource
cleanup.

Since v2, Fuad reported missing cache maintenance and L1 invalidation
when allocating an L2 device table, as well as unsafe table cleanup
after a hardware timeout [2]. This revision includes his L2
device-table cache-clean patch and adds fixes for L1 invalidation and
the host IRS and ITS timeout paths.

The IRS changes:
* Reject allocation of an SPI without a backing IRS and warn about
  broken firmware.
* Only program IRS_PE_CR0.DPS when 1-of-N routing is supported.
* Serialise synchronisation requests and their completion polls.
* Retain the L2 IST and its L1 entry if mapping times out, and prevent
  a later allocation from overwriting the pending mapping.

The ITS changes:
* Serialise event and device cache invalidations, which share the
  DIDR register.
* Select linear device and interrupt translation tables when one L2
  table covers the full ID space.
* Honour the ACPI noncoherent flag.
* Use firmware-node names in initialisation warnings.
* Invalidate the device cache before freeing an ITT.
* Correct cache-maintenance sizing after limiting the DeviceID width.
* Release the reserved MMIO region if DT-based ITS initialisation
  fails.
* Retain the ITT if device invalidation times out during registration
  or teardown.
* Clean a new L2 device table before publishing its valid L1 DTE.
* Invalidate the L1 DTE immediately after publishing the L2 device
  table, including when device registration subsequently fails.

The IRS/ITS locking fixes, ITS table-selection fix, ACPI coherency
fix, device-table cache-maintenance fixes and L1 DTE invalidation fix
carry Cc: stable trailers for backporting.

The series is based on v7.4-rc3. Thanks to Lorenzo for the review and
to Fuad for the additional reports and cache-clean patch.

Sascha

[1] https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11
[2] https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
Changes in v3:
- Rebased onto v7.4-rc3.
- Added Fuad's patch to clean an L2 device table before publishing it.
- Retain the L2 IST and its L1 entry on a mapping timeout, and reject
  subsequent allocation attempts that would overwrite a pending mapping.
- Retain ITTs when device invalidation times out during registration
  or teardown.
- Added L1 DTE invalidation immediately after publishing an L2 device
  table, keeping single-device invalidations for registration and teardown.
- Reworded the IRS synchronisation and ITS invalidation commit messages
  to describe the host issues without relying on future KVM support.
- Collected Acked-by tags and reordered commit trailers as requested.
- Link to v2: https://patch.msgid.link/20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com

Changes in v2:
- Explained why IRS synchronisation uses a raw spinlock in the KVM
  affinity path.
- Clarified the ITS invalidation race and described the KVM forwarding
  path.
- Reworked to calculate the device-table size after capping the
  DeviceID width.
- Reordered local declarations in the ITS probe function to be in
  reverse fir tree order.
- Added Acked-by tags.
- Link to v1: https://patch.msgid.link/20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Sascha Bischoff <sascha.bischoff@arm.com>
To: Timothy Hayes <timothy.hayes@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Jonathan Cameron <jic23@kernel.org>
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

---
Fuad Tabba (1):
      irqchip/gic-v5: Clean a level 2 device table before making it valid

Sascha Bischoff (13):
      irqchip/gic-v5: Reject SPIs not backed by an IRS
      irqchip/gic-v5: Only set IRS DPS when 1ofN routing is supported
      irqchip/gic-v5: Serialise IRS synchronisation requests
      irqchip/gic-v5: Retain the L2 IST when mapping times out
      irqchip/gic-v5: Serialise ITS invalidation commands
      irqchip/gic-v5: Use linear DT and ITT when L2 covers all IDs
      irqchip/gic-v5: Honour ACPI ITS noncoherent flag
      irqchip/gic-v5: Use firmware node name in ITS warning
      irqchip/gic-v5: Invalidate ITS device cache before freeing ITT
      irqchip/gic-v5: Clean the allocated linear device table size
      irqchip/gic-v5: Release ITS MMIO region on DT probe failure
      irqchip/gic-v5: Retain the ITT when device invalidation times out
      irqchip/gic-v5: Invalidate the L1 DTE when allocating an L2 device table

 drivers/irqchip/irq-gic-v5-irs.c   | 34 ++++++++++++-------
 drivers/irqchip/irq-gic-v5-its.c   | 68 +++++++++++++++++++++++++++++---------
 drivers/irqchip/irq-gic-v5.c       |  9 +++++
 include/linux/irqchip/arm-gic-v5.h |  1 +
 4 files changed, 84 insertions(+), 28 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261102-host_gicv5_fixes-1eeea29d2ea4

Best regards,
--  
Sascha Bischoff <sascha.bischoff@arm.com>

