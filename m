Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454167;
	b=H8w5SsuiVxSMqZRUaEm2ePi7c7kpUUpoJ2RSfb2k6eCnUJ50bAauYmd+1C+4rLYZYOK1
	 yz/kqIn2G1SLDKmCLCA9aHqIsHLWUTr7v/heNNracyDjuT1ku5Ld/Kkd2Dwk9H4x3xIoe
	 oi9N+ZsJYiYnWigmQSYR+A+S2Iy/gOBlvnBUBqvCL21v5tR9lijKWcevslNktUI0bROhn
	 cIjPSQSb7IHD013wrjUyWbzuTv+6XY8XfdR3m/I0YITeiC1XGb20JJZ2jvqy5hkKrZ2Os
	 ZGgOYhVMF+qN2yoynX+yFneJgqsDQmXv236R4JBwXM6DVgthnQceEMy7yTrX5/WC0aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454167;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=n9Vi6fXV2kLrma4jnlJMeItulhA2U5CH2EzMknqFkBM=;
	b=IlpsCaVs14qa/3Z3cRuRCFwXli04wXX9fieZTjKX0yNu3ch1S9l7hID59wHmxPFvf3sS
	 pgM6Hl+1PkuXZ7OSealqkhjat1Ofgbeos7CwPiFGiXBmVJbn7EccFKJGLFwExCtOplP6g
	 rsfcxDdeVatwBHqhUeQjCslQskTSWjYYKmIv7MYDL5vCPAnD64rgnzLE0dP28BIUTLfXU
	 l/vhSGeJJDvkw4G1WUbReP6V0DtwrK5r4uRUkQFXVGx1sOPeqUAJqASqs5KCwOK/sSBLv
	 QwRF1FcfYPlQZWAMGA0eTx+Y57pCxqhn3FLDEtVj17g/HmLyly0TjFDfSgk+25S7Kzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pb2lYs+Y;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E84606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pb2lYs+Y
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5621F143D;
	Mon, 23 Nov 2026 09:16:02 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8EF43F763;
	Mon, 23 Nov 2026 09:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795454165; bh=PLmix3wUMZznq30E+gdl5v2UeGWepbJeohyBg07iSZo=;
	h=From:To:Cc:Subject:Date:From;
	b=Pb2lYs+YvRXVt6HKquDn6jX9yH3snAt20GK6LCJEq2uxGmYmUBH6R18hrUssoeJdW
	 ApZLc4tGLYO9IoUhWBlje3ir8as4A5LPUMxaMwcmLfS9BDni3XN8bLdYv0tMjXbCq3
	 Ag6srrcD4KOh/Qqu6injoweRNZIj80v7R/deJnTc=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	James Morse <james.morse@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Doug Anderson <dianders@chromium.org>,
	Linus Walleij <linusw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Huth <thuth@redhat.com>,
	Dawei Li <dawei.li@linux.dev>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Subject: [PATCH v3 0/3] arm64: sdei: fix entry edge cases, pseudo-NMI
Date: Mon, 23 Nov 2026 17:15:54 +0000
Message-ID: <20261123171557.140944-1-ada.coupriediaz@arm.com>
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

Hi,

This v3 has a few small fixes and commit message clarifications.
More details in the [v1] cover.

As discussed in [0], SDEI entry has a number of remaining issues.
This small series aims to fix the biggest potential issues :
 - Patch 1 : with KVM in VHE, VBAR_EL1 might not be correct
 - Patch 2 : PMR was not handled at all when using pseudo-NMI
 - Patch 3 : very early SDEI interrupt on non-boot hotplugged CPU
     might end up with `current == NULL`

I spent most of my time digging into the details of boot and
CPU bringup so I still do not have an SDEI test setup, so any testing
especially with `CONFIG_ARM64_PSEUDO_NMI=y` and
`irqchip.gicv3_pseudo_nmi=1` would be appreciated !

After some discussion and digging in the code, it looks like the issue
patch 3 fixes should be incredibly rare, so we might be OK without pulling
this patch at all. (Though the comment change for `__entry_task`
remains a relevant clarification.)

Thanks in advance
Ada

Changes in v3:
 - Clean up comment that an SDEI interrupt during KVM world switch
   would always hyp panic as patch 1 should avoid it (Kiryl)
 - Reword the commit message to detail the specifics in which the SDEI
   handler might get a NULL `__entry_task`
Changes in [v2] (patch 2 only):
 - Properly use pt_regs to save/restore the PMR in `__sdei_handler()`
   (Vladimir)
 - Update commit message accordingly

[0]: https://lore.kernel.org/r/20261105120835.3321912-1-kirill@shutemov.name
[v2]: https://lore.kernel.org/r/20261118154233.83599-1-ada.coupriediaz@arm.com
[v1]: https://lore.kernel.org/r/20261117174814.95936-1-ada.coupriediaz@arm.com

Ada Couprie Diaz (3):
  arm64: entry: sdei: always set VBAR_EL1 on SDEI entry
  arm64: entry: sdei: save and restore PMR for pseudo-NMI
  arm64: head: set __entry_task along with task setup

 arch/arm64/kernel/entry-common.c | 38 +++++++++++++++++++++++---------
 arch/arm64/kernel/head.S         |  3 +++
 arch/arm64/kernel/process.c      |  3 ---
 arch/arm64/kernel/sdei.c         |  3 ---
 4 files changed, 30 insertions(+), 17 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.43.0

