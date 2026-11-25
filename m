Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617637;
	b=1e4gHiGMRgRCjr3lqpq8cq9XHepNCqNjuAxBM9MCwWQ0PaB8dIrwW1dlC+AIZD7VFuOk
	 2Nlff1v9g72dpibAVvksT5HCCML3xucvFL2mak4YbxX4Y+0exxQm4JYfvLAxMabVBQTD4
	 ep/jDPCFzJUfm7tFEl79J+7kCTZpUD05CQUZqQjzGS6AwltL0OX+UEfBlNVWDST2JQxVS
	 ei3vdyEuAysXS3KumYR2wv0pXChhhcfmM1UaX/H0S98QP2dw4wrfMRtVMgrF59ddH72O9
	 1s063+z8McGDoYCtGROjCuF47CS3ACoCUU42d8QQir9bD8ChCqvRfqrhVQthGIpLr5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617637;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=jLAvEoAHUfE8VKuTd1ZAwIhKcbPimnvkmPksdUx/tUA=;
	b=HUODy2BZUQdrgl/Zo4ixIWZjL7PSrjKZA/IWteLQicjE5k7ZDHFaTt6Y0GbWRCuPd4h8
	 Ah/zBgWRUTxrCKe9gId+ghBtJoRF1k9ytV+UVZAOAZqkXzjrObAjvQWGDe5sbsv+5jy1x
	 GfDTpt1Hvp34HMgAqGBqy3SpnpbA9LFVKLa1i7/DjiF6BGxdZI3Xeh5MFNTblZ2PK8PS6
	 5r/MpMrkiWonUqnlaAqahxKjbafg+Lwf7p+Drg1z8ve9eAMbid+Zy3vQ8r4wIr/ZysHnq
	 090aaFfWhjB93Gu8acQwxfPc6KzIrrRSza11darNIAiKw9e81rBZXrXrUJhb9mBtWCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="n72lm1/3";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0637E606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0637E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n72lm1/3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BCEC2F;
	Wed, 25 Nov 2026 06:40:33 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7507F3F632;
	Wed, 25 Nov 2026 06:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617636; bh=QaHa4jDSJIuWxxmLynajb7RxGbl1sCzHTpy2awT3f1M=;
	h=From:Subject:Date:To:Cc:From;
	b=n72lm1/3Mq6Z5f7MG3utZwBkioz1dMf0NIrTMbAKN33m2v8uOBRrpYWbRV+xT1F51
	 +16FD2CdSyQJxOWIuN2kvemnRosc+aWjgtqK2w/LqkFNKKFGay4qJ/7NDHhWVLv/T9
	 abx3divkEIwX9YgG/gV7UnbIX0MPf1NezAGg6eco=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v4 00/13] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
Date: Wed, 25 Nov 2026 14:40:22 +0000
Message-Id: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
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
X-B4-Tracking: v=1; b=H4sIAFbzBmsC/33NQQrCMBAF0KtI1kY6kzRWV95DpKTp1EawlaQGp
 fTuJnVhBXH5mf/+jMyTs+TZfjUyR8F623cxyPWKmVZ3Z+K2jplhhgogQ972fijP1oS8bOyDPAc
 i0rirkbRkkd0czYeojqd39vfqQmZIO6nRWj/07jn/DJB6f+YD8IxvpagUKFSNyQ/aXTemv7I0H
 nDJ5Q+OkZPc6hoz0sIU31wsOBQ/uIgchIEi31GhtfjwaZpenM4bND4BAAA=
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
patches fix IRS allocation and routing, ITS table selection and cache
maintenance, ACPI coherency handling, and resource cleanup. The IRS
synchronisation change prepares for upcoming KVM callers.

Since v2, Fuad reported missing cache maintenance and L1 invalidation
when allocating an L2 device table, as well as unsafe table cleanup
after a hardware timeout [2]. This revision includes his L2
device-table cache-clean patch and fixes for L1 invalidation and the
host ITS timeout paths. The L2 IST timeout patch is deferred at
Lorenzo's request while he reworks the approach.

The IRS changes:
* Reject allocation of an SPI without a backing IRS and warn about
  broken firmware.
* Only program IRS_PE_CR0.DPS when 1-of-N routing is supported.
* Serialise synchronisation requests and their completion polls in
  preparation for upcoming KVM callers.

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

The ITS invalidation serialisation fix, ITS table-selection fix, ACPI
coherency fix, device-table cache-maintenance fixes and L1 DTE
invalidation fix carry Cc: stable trailers for backporting.

The series is based on v7.4-rc4. Thanks to Lorenzo for the review and
to Fuad for the additional reports and cache-clean patch.

Sascha

[1] https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11
[2] https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
Changes in v4:
- Rebased onto v7.4-rc4.
- Dropped the L2 IST timeout patch at Lorenzo's request while he
  reworks the approach.
- Clarified that IRS synchronisation serialisation prepares for
  upcoming KVM callers; removed its Fixes and Cc: stable tags.
- Collected Reviewed-by and Acked-by tags.
- Use FW_BUG for unimplemented SPI warnings.
- Mark retained ITTs, including L2 pointer arrays, with kmemleak_not_leak().
- Return early on device teardown invalidation failure.
- Inline L1 DTE invalidation and explain the effective EVENTID_BITS.
- Link to v3: https://patch.msgid.link/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com

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

---
Fuad Tabba (1):
      irqchip/gic-v5: Clean a level 2 device table before making it valid

Sascha Bischoff (12):
      irqchip/gic-v5: Reject SPIs not backed by an IRS
      irqchip/gic-v5: Only set IRS DPS when 1ofN routing is supported
      irqchip/gic-v5: Serialise IRS synchronisation requests
      irqchip/gic-v5: Serialise ITS invalidation commands
      irqchip/gic-v5: Use linear DT and ITT when L2 covers all IDs
      irqchip/gic-v5: Honour ACPI ITS noncoherent flag
      irqchip/gic-v5: Use firmware node name in ITS warning
      irqchip/gic-v5: Invalidate ITS device cache before freeing ITT
      irqchip/gic-v5: Clean the allocated linear device table size
      irqchip/gic-v5: Release ITS MMIO region on DT probe failure
      irqchip/gic-v5: Retain the ITT when device invalidation times out
      irqchip/gic-v5: Invalidate the L1 DTE when allocating an L2 device table

 drivers/irqchip/irq-gic-v5-irs.c   | 22 +++++++---
 drivers/irqchip/irq-gic-v5-its.c   | 87 +++++++++++++++++++++++++++++++-------
 drivers/irqchip/irq-gic-v5.c       |  9 ++++
 include/linux/irqchip/arm-gic-v5.h |  1 +
 4 files changed, 97 insertions(+), 22 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261102-host_gicv5_fixes-1eeea29d2ea4

Best regards,
--  
Sascha Bischoff <sascha.bischoff@arm.com>

