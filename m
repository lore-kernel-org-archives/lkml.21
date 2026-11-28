Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833320;
	b=kNuwYb7MXxBEiLBAJYmwJUhHagAfJWFQKc6MGRhq95BP7Xl55KSuBFnfAdsV+HADSSRu
	 ur+QgrpE5qhYbZuKiMedVixzqJlnK1v1d6xjtCx+kRydf+yc3jyu9GheGhzxbSxdQOZnr
	 sAQHNqrSdDNmPm2X/MQSsg850Ru+dP+L38wOAX8rLueV2OBQMy8Rv/JVYAGrWzKNY52M+
	 MROKJj9KOr/Ah087YORqHuH9544D4r/3DEDCccDiI9oQlDFsYqG3nbr2Q58vyFS4PDWLZ
	 LAIq6YGuvjZvI0cFSWLdKiDzZSsb8Qn+dxTBlkspkjyS7JN2CiwiBv69wyhPdcErTvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833320;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BW0okBwUaWbI0A6T4M3ANMlFG5qtj8+OVor/tIKqbZs=;
	b=02BuUlrj7PcMPvzDx6fjejL+SN39U4LtmlhlWttsYJFbxD9ZGoBjWyAvZw9fgZGQtctm
	 LoHdie0zDJ3ROHuSUBioewrqldsr6U6b5uPqdMnPmZf+dvvgJipGeGj+qQCVMEC/VWHCE
	 dQSshxTyM2rqKPiuIQCq3FFSNPGiAXZKC/Da0XRcnprorR67wzN7vRmairg2D+uZ/J5sp
	 byVq3yLE6e/T/g+f1YY/8wiinrwkKER2iaUXye7Bz427p8qVO5L72aGeCFxPbbETKeVED
	 MWxabFqkx7dJhdDRpItsfRUtkxTUJaXIWDwIIdVYHGLoipkSYDmBPkBT7Mf/voZqOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2ftZ7QzS;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2ftZ7QzS
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BW0okBwUaWbI0A6T4M3ANMlFG5qtj8+OVor/tIKqbZs=;
	b=2ftZ7QzSl/EUpdmhtAM8ZyMTri8ajRFT7dHnS4F8hJPmY3w/3Lkl3cOqK+69okFLK4K0ZJxNz
	U0EzNcS7+F7UeTB377T+WedK0CkCwWRl8TXgrttd9O+whkbZFr35YbsaGeMpZEHW5R2hjCqKJKQ
	C6pAIvCmyK/njyGTK0MfEzI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jbvWf0DvXzRj28
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:34:54 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 50F8740561
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:35:14 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 28 Nov
 2026 10:35:13 +0800
Message-ID: <42a15fcb-36f7-4a85-b309-c2f96d8931c9@huawei.com>
Date: Sat, 28 Nov 2026 10:35:13 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/8] kdump: reduce vmcore size and capture time
To: <linux-kernel@vger.kernel.org>, Wandun Chen <chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Wandun,

Could you help review my below kexec rework?

https://lore.kernel.org/all/20261127100925.3019877-1-ruanjinjie@huawei.com/

Thanks
Jinjie

在 2026/11/27 17:07, Wandun Chen 写道:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> On SoCs that carve out large firmware-owned reserved memory (GPU,
> camera ISP, ...), kdump currently dumps those carveouts as part of
> system RAM even though their contents are firmware state that is not
> useful for kernel crash analysis.
> 
> ACPI systems already filter reserved memory out of the vmcore through
> their existing path: firmware reports those carveouts as unusable in
> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
> (is_usable_memory(), efi-init.c), and the ELF header builder has
> always skipped nomap regions; only DT-based systems currently fail
> to filter these regions, which is what this series addresses.
> 
> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
> memblock to filter reserved memory on DT-based architectures. A new
> flag is needed because MEMBLOCK_NOMAP can only express regions without
> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
> so kdump omits them; reusable CMA regions are different because their
> pages are handed back to the buddy allocator and may carry crash-relevant
> data.
> 
> Since the reserved memory regions are filtered out, the vmcore is
> smaller in size and faster to produce.
> 
> The series is based on linux-next and is organized as follows:
> 
> Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
>              memblock, fold the duplicated per-arch memblock walks
>              into the weak defaults, and serialize crash header
>              preparation against memory hotplug.
> Patches 4-7: NODUMP infrastructure: switch crash_core to
>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP
>              flag, add a dumpable flag to struct reserved_mem, and
>              mark /reserved-memory entries with MEMBLOCK_NODUMP.
> Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
>              ELF header.
> 
> 
> v9 --> v10:
> 1. Rebased on the latest linux-next, which includes the
>    reserved-memory rework.
> 
> 2. Patch 7: fix two issues found by Sashiko [1], by skipping
>    the NODUMP marking entirely when early reservation fail
>    and clamping the marked range to page boundaries.
> 
>    The changes only tighten the conditions for marking NODUMP
>    and the overall logic is unchanged, so the Acked-by and
>    Reviewed-by tags are kept -- Marek, Rob, please let me know
>    if you disagree and I will drop them.
> 
> 3. The remaining x86-specific race in patch 3 found by Sashiko [2]
>    (Xen balloon inserting a System RAM resource outside
>    device_hotplug_lock) is pre-existing, and fixing it depends on
>    resolving other pre-existing issues first, so it will be sent
>    separately.
> 
> [1] https://sashiko.dev/#/message/sashiko-outbox-181183@kernel.org
> [2] https://sashiko.dev/#/message/sashiko-outbox-181179@kernel.org
> 
> An Ack for patch 1 from the riscv maintainers is still pending:
> I have pinged them, but no response yet. The Ack will be added
> once received.
> 
> v8 --> v9:
> 1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
>    memblock resizing before it is allowed. SH supports neither
>    CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when both
>    are disabled.
> 
> v7: https://lore.kernel.org/lkml/20260922084256.1515554-1-chenwandun1@gmail.com/
> v6: https://lore.kernel.org/lkml/20260902073116.802752-1-chenwandun1@gmail.com/
> v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
> v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/
> 
> 
> Wandun Chen (8):
>   riscv: build crash_mem ranges from memblock instead of resource tree
>   crash_core: fold duplicated memblock arch hooks into the weak default
>   crash_core: serialize crash header preparation against hotplug
>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>   memblock: introduce MEMBLOCK_NODUMP flag
>   of: reserved_mem: add dumpable flag to opt-in vmcore
>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>     header
> 
>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>  arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
>  arch/riscv/Kconfig                         |  2 +-
>  arch/riscv/kernel/crash.c                  |  2 +-
>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>  arch/x86/kernel/crash.c                    |  2 +-
>  drivers/of/fdt.c                           |  2 +
>  drivers/of/of_private.h                    |  1 +
>  drivers/of/of_reserved_mem.c               | 30 ++++++++++++
>  include/linux/crash_core.h                 |  2 +
>  include/linux/memblock.h                   |  9 ++++
>  include/linux/of_reserved_mem.h            |  1 +
>  kernel/crash_core.c                        | 53 +++++++++++++++++++++-
>  kernel/dma/contiguous.c                    |  1 +
>  mm/memblock.c                              | 16 +++++++
>  15 files changed, 116 insertions(+), 94 deletions(-)
> 

