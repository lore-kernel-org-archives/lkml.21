Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573297;
	b=YXeOZMA72WLjDZuM32SFbQPHiq+kb6Kp0/ptIxkyCZFGj8LdxVAqeef+bUJWgh8ZJYzf
	 jt6dt3QhyaK/PhZHlomTJ3Vdzai+5hVdAUd+Z9Tr9Wr6j6E1qs/1MMRpj4JTZmHEv2YJB
	 0v4WHwtMHX/91hD8VQoalCFMnNWNBF7Xe+rQi2cuzwgRLq/tuJOnuYzVfpToerlY+bZMS
	 86A3ndxUplegwtpSeBttSfE+vsb5+TBQZRt0NERTzVdbD+7umBpWgCrez8fJI/UoucG7q
	 V1T+LNRZgUd+M1bCpeFGI0dj1H9CIp+cyDsdlsLVUglNRg90vbXjbA+zsYTLd4GENSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573297;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=hXyGjoxmupuH9Uxjyc6eDIpIRfNyYCAFQUdO+AkdUwE=;
	b=HSQMF16MVd24aZVELzJ/0VnwTuEVMW1rW+c/iVX6NLEKF/n7UcRxu6xNA58KcpO85JFv
	 zyZ2eFEWbQ/WIykgHpmZXGyesgH1b74wpi+9YF3Clu2I7wpVMBddE/YT1ujS2cXxuT4Uq
	 Tp8sjGQZNdSRQgPIZnwqw7Sm7ko0YlJAOmxbZEcRvuIVXCYfyIQckvWPrVoExgECCS8NJ
	 ZpPj1jTHrAehByRp6d0/qEtmlADRFA6lZZ4LskLvEopA1kohIs7+an1SHZJihnBUBasSK
	 j5FkwbRwS/62p0o0+pj+QmXBWTCpvM1Sh1Ii2x/hgTUQMSFlN43rgBv9lHEcUmTEkFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yM2krInt;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFED5606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFED5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yM2krInt
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hXyGjoxmupuH9Uxjyc6eDIpIRfNyYCAFQUdO+AkdUwE=;
	b=yM2krIntX4cuWuCww800LKQQaJX8o9jPBHeV2zWhBzk/VF4tTPi5qXB+yHWSIx3TNZh0wC8h+
	7qoj8T/+QYwBWPTRtXcF65J5PB5QJZ5O3DfxvgXMj3HdN+4Bv+q5OSR/NTJ8cmquS7teTGynGeo
	UbVAgd4iwO31Mom/NVrF61w=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jZ3Lf4NsNz12LH0;
	Wed, 25 Nov 2026 10:20:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EB53540538;
	Wed, 25 Nov 2026 10:21:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 10:21:30 +0800
Message-ID: <e5890cea-2bc8-467a-9cd9-cad5d0820c74@huawei.com>
Date: Wed, 25 Nov 2026 10:21:29 +0800
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
Subject: Re: [PATCH 0/2] firmware: arm_sdei: Fix NMI backtrace lockups on idle
 CPUs
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, James Morse <james.morse@arm.com>
CC: Vladimir Murzin <vladimir.murzin@arm.com>, Ada Couprie Diaz
	<ada.coupriediaz@arm.com>, Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Liao Chang <liaochang1@huawei.com>, Ashok Raj
	<ashok.raj@oss.qualcomm.com>, Doug Anderson <dianders@chromium.org>, Yin
 Fengwei <fengwei_yin@linux.alibaba.com>, Pengjie Zhang
	<zhangpengjie2@huawei.com>, Cong Wang <cwang@multikernel.io>,
	<kernel-team@meta.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261124194707.1030653-1-kas@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261124194707.1030653-1-kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/25 3:47, Kiryl Shutsemau (Meta) 写道:
> The SDEI NMI backtrace signals event 0 to every other CPU, including the
> ones in a power-down idle state, where the kernel has SDEI masked. TF-A
> acknowledges the SGI behind event 0 on a masked PE and never ends it,
> and the PE takes no Non-secure interrupt again. Jinjie hit it on a
> 384-CPU HIP12, where one sysrq-l locked up the machine.
> 
> Patch 1 keeps event 0 away from masked PEs. Patch 2 sends the regular
> backtrace IPI to the CPUs that SDEI refused, which wakes them.
> 
> TF-A v2.13 and later refuse to signal a masked PE, but a PE that masks
> right after the check still takes the SGI. The TF-A fix is under review:
> 
>   https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55414
> 
> Tested under QEMU TCG with TF-A built without that check, 4 CPUs. One
> CPU masks and unmasks SDEI in a loop, through cpu_pm, the mask calls and
> CPU hotplug, while another signals it; sysrq-l afterwards. Signalling
> with plain SMCs, as the kernel does now, wedges the target. With the
> series every run passed, lockdep included, and a panic in the middle of
> it completes.
> 
> Jinjie ran an earlier version on HIP12 with the power-down state
> enabled: sysrq-l got 384/384 answers every run. The handshake has
> changed since; Jinjie, could you give this one a run as well?

Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

On HIP12 (SDEI v1.0 firmware), v7.4-rc3 plus the two patches, SDEI
active, acpi_idle with state1 = CorePowerdown enabled: sysrq-l answered
on all 384 CPUs on every run, nine runs total, three of them under load.
 No "still haven't responded", no SDEI_EVENT_SIGNAL failures, no "did
not arrive within 1ms" warnings, no lockups.

State1/usage shows the CPUs really did go through CorePowerdown, so the
handshake and the IPI fallback were exercised.

Thanks,
Jinjie

> 
> Kiryl Shutsemau (Meta) (2):
>   firmware: arm_sdei: Do not signal event 0 to a masked PE
>   firmware: arm_sdei_nmi: Send the backtrace IPI to CPUs with SDEI
>     masked
> 
>  arch/arm64/include/asm/nmi.h    |   7 ++
>  arch/arm64/kernel/smp.c         |   2 +-
>  drivers/firmware/arm_sdei.c     | 130 ++++++++++++++++++++++++++++++--
>  drivers/firmware/arm_sdei_nmi.c |  30 ++++++--
>  include/linux/arm_sdei.h        |   4 +-
>  5 files changed, 157 insertions(+), 16 deletions(-)
> 
> 
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f

