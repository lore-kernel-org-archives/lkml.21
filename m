Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954160;
	b=xtxtOHiR4zB7DNZC+EmyevWYgC6AHrcpdDdg03Z3fuoyu8A7K7QoVXTP2NuyKPJk4UwJ
	 NJkD868qSC5IWq1bQDVLKAfLLlxvwpkeHOYQD4kbthoBeT3BhkswetoCIgjcgC5qLdWmb
	 narrQZ1Z6qoizPa9E9bRuIGuTIylq/ps8FkrZXmqGyuixDx0NuoCxt0r8ObxWdoqq7+bN
	 NdhG9XJmYoiW9XfEyVDGVKTnN7sHnVpmgG4NtG+AVlpKgddxac5n/MBFuM62SGmbydZcP
	 +yUJsWqFCyR6NVn+KTm9NXrV748VRcKSpPPNOkuILwZiZ/hAP3iczhLLuKOudRpov+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954160;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P28P/LUBbQO6Sh4CV5K9g8WyTMgI8R9ZDNhFzP9+hV8=;
	b=dMAaRewRKJw99FiPVcrHlxZWSOdf1QqnD6tuXp8eZ99cwYojZuApapWX2JH6Z3kNWmAE
	 EhAef93qu6Cm0aqjLWI5sgdFR4it8OLsVjH85MzhfQ3njpfseBBYwocXBsb0/C1BR2UgN
	 2qLB3lpU8f6Ww8nHgDIvXZ3TUR44an2A7L1yxfanq+LGEZXqgW0b96SY6tdU4wUlYpPrK
	 0KRao9bGfEoDDxmJSCLJcQV2+eAWc8r2PWN+h1QNoV6zgiL3uRrQDwybDFhE/zQcvJgiF
	 djz8v8wGdMuu8uNpp2gYbLiYwU4ef72FENemSB6dos3CCOzOmOfGmusqdP3yupD0bbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUZY2S06;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68AE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUZY2S06
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0371F000C9;
	Tue, 17 Nov 2026 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954159;
	bh=P28P/LUBbQO6Sh4CV5K9g8WyTMgI8R9ZDNhFzP9+hV8=;
	h=From:To:Cc:Subject:Date;
	b=aUZY2S06kYuf4atuTLbZAxbOxwlUE/nJdFcaEmhPaJfVz/IiLF/b0t6tvvUMlTpfU
	 C/hXiA1BPLa/KvzTdLtfje64PZBu0k3slf5MVEZUDKvh4kWkPf0ywcJt1CDSksrGR4
	 zjsGwjj3SGlM5z72YImxH1YHvz5ZZp488EOZvww9XF/t5UrhWsmCsmh0CYcXnkc/tH
	 u6N/SMsgu37a3ENBvjkcJQxKXLeVVFOIF4EscgBxDFvklEjhYjOxlRu4KO6It7yzWm
	 aJXg3D0jMzZAA6hF4fJ759ZzoQNDBkLhCwF+Mx16DHC/NIdaFMtMcs+gBHElzfNwcl
	 xDaYZX9Nu7BdA==
From: Arnd Bergmann <arnd@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] st64bv0 support in iommu-sva
Date: Tue, 17 Nov 2026 23:22:22 +0100
Message-ID: <20261117222224.1465328-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: Arnd Bergmann <arnd@arndb.de>

Hi Siddharth,

Here is a what I came up with for enabling ACCDATA in arm64 Linux,
similar to the earlier patch and rebased on current linux-next.

I hope this works for you, please let me know how it goes.

     Arnd

Arnd Bergmann (2):
  arm64: add HWCAP3_LS64_ACCDATA
  arm64: dynamically enable st64bv0 for SVA

 Documentation/arch/arm64/elf_hwcaps.rst |  7 ++++
 arch/arm64/include/asm/cpufeature.h     |  5 +++
 arch/arm64/include/asm/exception.h      |  1 +
 arch/arm64/include/asm/mmu_context.h    | 17 ++++++++
 arch/arm64/include/uapi/asm/hwcap.h     |  1 +
 arch/arm64/kernel/cpufeature.c          |  1 +
 arch/arm64/kernel/cpuinfo.c             |  1 +
 arch/arm64/kernel/entry-common.c        | 11 ++++++
 arch/arm64/kernel/traps.c               | 52 +++++++++++++++++++++++++
 arch/arm64/tools/sysreg                 |  5 +++
 10 files changed, 101 insertions(+)

-- 
2.53.0


Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
Cc: Catalin Marinas <catalin.marinas@arm.com>,
Cc: Will Deacon <will@kernel.org>,
Cc: Mark Rutland <mark.rutland@arm.com>,
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
Cc: Joey Gouly <joey.gouly@arm.com>,
Cc: Zenghui Yu <yuzenghui@huawei.com>,
Cc: Steffen Eiden <seiden@linux.ibm.com>,
Cc: Yicong Yang <yangyicong@hisilicon.com>,
Cc: Zhou Wang <wangzhou1@hisilicon.com>,
Cc: Navneet Singh <navneetsingh@microsoft.com>,
Cc: apais@microsoft.com, rlmenge@gmail.com,
Cc: hargar@linux.microsoft.com, kvmarm@lists.linux.dev,
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
Cc: linux-kernel@vger.kernel.org,
