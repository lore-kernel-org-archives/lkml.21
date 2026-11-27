Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770461;
	b=emTedlfQbCkyAHGdSpkm9d14+XgWz2RxSCYQFRYwNaYtSSwvwNXZ/s+wjWDxIEfgOpat
	 F5Ov3CBqoq/k740YV86HBJD1JYzLOQgYTd1L+V/9mzjkSNqFG+7/st5QwgsOWCmHW7EDN
	 5319v6+TK9ruRkk1UMtwp4z0P+TDdwIeRT/KtRxmEoUr8kX/AnurPbRk18+99MXoDraPK
	 MKBoCJjQ1+A0QAxXPCjLT++Iij5KT29an3rXNGCjja+6GChdWQueKGDoICi3d+YwJdIQ+
	 qHPZuG7KH3gPbYzs8Mqg5Rr4IzFvOlsnTBjt5BEeT3AzZY3/QdKIJdxQjlNb865G1Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
	b=BN8CBxIjQ4U0+yph/4vvdTYYwByAp5sA8E6LMPBP+3EDAvu7QUacjO+SVg3+bhwp5PUi
	 KrpT8WoTmc1YNYxpBk6Bkqh/wBu8RAADCq/rzf1Xq26x1d3bYseON/g1kdjNpBrvCXvHT
	 0lu8E/c2yOakm9G5J9hHKqrYl0m1J3v1131LyoKpcQI1xAUyWOQxaWlYcswmztGO4c5qm
	 nS6Ux2zpwoNO/euYpCfTTu++1Q7Z4yKFAjd1Xv6bOnmn6kqrje78LVFpxF37zyLlMReoY
	 cdIcPk4CVrvjIiVwhsUyCHTUElPyAQg43KjoPxdmc9OzzykFMItgQFcrslvALg1mLFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR4o5Ikb;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81994606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81994606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR4o5Ikb
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f04824c47bso16884615ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770461; x=1796375261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=KR4o5IkbFqXGQLoyIT1YW7kELm0gIp6fQDtKjiSiV1p3o4dMubtE2rhPaPybBy0ytp
         674uHRbS8W0e+MjvSUR/LUXRedWUaU7lh7RCluwBYMXS+Wjr5sw456/UfD/zAYlFNLpM
         2DzG+BGnxajEpVbWJXbgAIdR1x6AZX/wSC7vB5c83YuhtHmkQF+/42jmMuwtWa7Zz69f
         pgZxTjfNxGDtsk2+uCNdZO5O4KjOLIkz3dEqToxl1EokAhcEdTk4ME82oz3tMUQYZJLb
         T+twsmqpm2zNhh9bS5W2Shbn7iB7jHJLTJBiMHBA0EJIR7mFcf9u1o8ttDDTJIu2zPbq
         ZfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770461; x=1796375261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=Gspg9xJrnrBH8byr5HRx3er38Orn2ay8Y5cWo6MYoFq8CqXiTfPG1rpNJHRLgN0oVp
         K00/kYafkCrp8Tzej/T82F1q+CYC63lq8MqoZZ4dkoHim/i7GZb0qnTN195dYY4O2z5w
         fdrTCwmakASd7EGdhZK9COxQ7UijHQmlmXaIjAN51ve6M4A+1y5XI5L7guefQiTJjwQi
         /J3eqgsZV3MZxRWvQg6rJUWF1ib1rOw5izL7TZ4PYym29KPG0YNkK3g/Ui6A1N2CEAS4
         nKqUiYpUgD6qTUTpapsIC26B7LqMtHA5F4Q/4YSSoCZ+qiS7X0UFD4eBJPH/s1KeCQ1h
         7U2Q==
X-Forwarded-Encrypted: i=1; AL+hErHerqpc1npOcNIVjmnXtF+pBr/kt8RAC/E8bVs+aor6BoU7OAN9fJB4rOCS+6tOg+lKoO9Ya+hGhb+IBpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RnkgnOM+jNwmz2BBLzQKeyzXH6tkfWMjq9Pd5C5NhsLpTO/Pd
	Elxy5NVus8Wwpjv/d9Seai5KU6sNMYRX865bZ0+07NiUEnwsM7L+BTLc
X-Gm-Gg: AZFdTZed+K8LMZkeuPo/osEAJNPc0p20iINlp5k650h26iXqAzzGqZQyYMm2QwebovV
	XzPBKLgEaGdAmFm4xluw0L8YdZHbasMvaBnn9dU2zloni7dIXxQofLcMh/O5GMrJXBj9YS5Q7G7
	ZNOc0f0swegnwzRXuoW4JodWZvGzIPxrSrtWIG9KaZ0HnBoZSysS28XBkRIExjnPqawS4AUsxKl
	NLXl7E5mxvyQBnfG+t1wLR5l0AKAMNyIzIpKxVxWRacvuePZI0xMgQeDrKNcgtEJQf2YaML+mu2
	5mf6ePOj9i2xPX9oMFYpEoEafLkvUBqKOqPLrdLaaxanp0wCxoUd0r6y/49STDrMCZ9crpgW23V
	k4RUo5UyGJyhFZ+qIOotI6u4nETeRqT8XMlps1AEtXJ0t8AEVH7KtBzImk3IZS+vu55+INRY6gP
	Vb+L31zXKOMvT+pNebw1O67Rvmiu3Lc1Zc7wpsF/DY8xGgZzJsk85UXygvkUq+LYoLqDCJtTwK5
	rdhy43AQip4b17k0bfE0fSv1ZGQAdGARW119MAARbTYQUd+NCJrennidZFuj4RKVxCXSkSfE9lD
	XdSDlRu9vkBXygpVhDIRoNgpZep0bBSDB5/zmvmGyg==
X-Received: by 2002:a17:90b:5287:b0:3b0:d35d:bb86 with SMTP id 98e67ed59e1d1-3b41c8fe261mr23255612a91.15.1795770460754;
        Fri, 27 Nov 2026 01:07:40 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:39 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 0/8] kdump: reduce vmcore size and capture time
Date: Fri, 27 Nov 2026 17:07:15 +0800
Message-ID: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

ACPI systems already filter reserved memory out of the vmcore through
their existing path: firmware reports those carveouts as unusable in
the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
(is_usable_memory(), efi-init.c), and the ELF header builder has
always skipped nomap regions; only DT-based systems currently fail
to filter these regions, which is what this series addresses.

This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
memblock to filter reserved memory on DT-based architectures. A new
flag is needed because MEMBLOCK_NOMAP can only express regions without
a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
so kdump omits them; reusable CMA regions are different because their
pages are handed back to the buddy allocator and may carry crash-relevant
data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
             memblock, fold the duplicated per-arch memblock walks
             into the weak defaults, and serialize crash header
             preparation against memory hotplug.
Patches 4-7: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory entries with MEMBLOCK_NODUMP.
Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
             ELF header.


v9 --> v10:
1. Rebased on the latest linux-next, which includes the
   reserved-memory rework.

2. Patch 7: fix two issues found by Sashiko [1], by skipping
   the NODUMP marking entirely when early reservation fail
   and clamping the marked range to page boundaries.

   The changes only tighten the conditions for marking NODUMP
   and the overall logic is unchanged, so the Acked-by and
   Reviewed-by tags are kept -- Marek, Rob, please let me know
   if you disagree and I will drop them.

3. The remaining x86-specific race in patch 3 found by Sashiko [2]
   (Xen balloon inserting a System RAM resource outside
   device_hotplug_lock) is pre-existing, and fixing it depends on
   resolving other pre-existing issues first, so it will be sent
   separately.

[1] https://sashiko.dev/#/message/sashiko-outbox-181183@kernel.org
[2] https://sashiko.dev/#/message/sashiko-outbox-181179@kernel.org

An Ack for patch 1 from the riscv maintainers is still pending:
I have pinged them, but no response yet. The Ack will be added
once received.

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed. SH supports neither
   CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when both
   are disabled.

v7: https://lore.kernel.org/lkml/20260922084256.1515554-1-chenwandun1@gmail.com/
v6: https://lore.kernel.org/lkml/20260902073116.802752-1-chenwandun1@gmail.com/
v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/


Wandun Chen (8):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/crash.c                  |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 30 ++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 116 insertions(+), 94 deletions(-)

-- 
2.43.0

