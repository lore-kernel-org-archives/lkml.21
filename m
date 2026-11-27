Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801061;
	b=L6D3XngreergvfYPOes8Aysaz4IMDnL43ghsTuZero79jvbs+F8A54riI76iqXdjV8t4
	 GkTLpN7KsWQifeLmbS/KL+T4n17iWEpJAhaC5OEj2///CQfy2d/8b8ny2EBd6RE8nKgYl
	 SSEF8kuh1wincjC50tYn8Rfa5Y6Bfahgx96WjN7ydPkD2hxoMJORV7V5kpHFpMK1qy5Q5
	 Wh0IX6tqFV0oJ3b+cTn0mgrNWPb2y5doCuy1giH4a8dOwXqkUxfjTsuiJZOqtBKmFvEBI
	 JbZonh7/C/SdaHiwXDdm7svLtscNmMGVkYFzEzw8vB3GDooMzcPJ75iaF2hazOxEWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801061;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=7MMwI/XCkhgLv3I5D7Ma6X4mMZvRgbur9YdCd/NKkOc=;
	b=NAZw39cElZllasMMngU+LrA9at7Zd+WJNpS1qpFhCdynNM+pQ9dcJrL26Xt6orT5kWIJ
	 k9TveAF57cwgvbW/FkCkbJSsi3t92jEIj+4pYew0ZPWT6NC3ADYRqccMxg2BKpYmejLU6
	 1bppzutZbtR8TZZIP33jonWWSVqHxbH4eOymQhYIfY2CatJsa5B08J+4Z82y6HIA2S0HI
	 HzJ2F4hcVKnsdfF85aOuEyazD8dsxU9nPyzxzFLsYzDLuvPlocy3XyKPVsGu3VIsqNGoA
	 KNHmuIK8CmFIjsiAiROhjDkUukF8wrvlffW4qTkeafbzQTrRER1gPNs1AGyKNGaUV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UHM3L31O;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2C2606A695
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF2C2606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UHM3L31O
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E06691575;
	Fri, 27 Nov 2026 09:37:34 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F130E3F632;
	Fri, 27 Nov 2026 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795801057; bh=63lXCFqBy4wBOMOzrOjKvAUbnj6KjvHekb4a9IjA5Hc=;
	h=Date:From:To:Cc:Subject:From;
	b=UHM3L31Ol+s7FRr42tI18ChYfnXjIq/fQOEK1utcLPBNTC2jh5mP4XksVgHnQP56S
	 gUsdqfO+gyLSheT8ft7F4HPXxmuWtiivbVjGe7aCQdGy1NVvfD2oepVDHflpTl5A8f
	 pAL3H2p5IkIB9H/gj8m6P3yH7j6xS0g0qVCebXe0=
Date: Fri, 27 Nov 2026 17:37:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc5
Message-ID: <awm_2b5a-TzetyOj@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull the arm64 fixes below. Mostly missing barriers and
break-before-make in kernel page table updates (fixmap, early ID map,
KPTI) plus a livepatch fix for late PLT writes to read-only module text.

Thanks.

The following changes since commit a041bdbe1f3a8efa8a527a89c84d3771232b4942:

  arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h (2026-11-19 00:10:15 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 18817028301de963a3a25f6d7d652d1d3b79f570:

  arm64: fixmap: fix missing break-before-make in __set_fixmap() (2026-11-26 11:08:46 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Fix missing barriers and break-before-make in kernel page table
   updates: ISBs after mapping the FDT in the initial ID map and after
   remapping the KPTI page-table slot; non-deferred barriers for fixmap
   entries in lazy MMU mode; break-before-make when overwriting a
   valid fixmap entry

 - Route late (livepatch) PLT and ADRP veneer writes through the
   text-poke API as the module's .plt section is read-only by then

----------------------------------------------------------------
Fuad Tabba (3):
      arm64: pi: Add an ISB after mapping the FDT in the initial ID map
      arm64: mm: Add an ISB after remapping the KPTI page-table slot
      arm64: mm: Don't defer the barriers when installing a fixmap entry

Rui Qi (1):
      arm64: module: Use text-poke for late PLT/veneer emission

Yadong Qi (1):
      arm64: fixmap: fix missing break-before-make in __set_fixmap()

 arch/arm64/include/asm/module.h   |  3 ++
 arch/arm64/kernel/module-plts.c   | 23 +++++++++++----
 arch/arm64/kernel/module.c        | 59 ++++++++++++++++++++++++++++-----------
 arch/arm64/kernel/pi/map_kernel.c |  1 +
 arch/arm64/mm/fixmap.c            | 17 ++++++++---
 arch/arm64/mm/proc.S              |  1 +
 6 files changed, 77 insertions(+), 27 deletions(-)

-- 
Catalin
