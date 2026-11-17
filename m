Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937704;
	b=d7lNlaBLwRbvaiZVc7uELoKwwiCYuEelG5lsNQ4gqe+WFrQ8d8l3gccBjq4ckD40GRTs
	 c6QCxD0mE4NVDXbA+0w7tzwbdciHSfgw4eplaiSMhOdJS2B5aZQ71WQQz79p0hAbWlJB2
	 MELF8UTEn9OjHtzbp4EPWprAdKacGn61IGwHwT90ZQres/Zw5rGrXGKIAJ90BguZer2n5
	 6D78euYrRB9ijVQDSECqhReiCGmJdl3agGrWx2Kf5MQ44omDtNofTjHX/c1HrRgWnrkev
	 HHQfnLvxaKjg+7AIZNh/AxOwDN7fvniipX6+tYOPQuD50QIH2b4+/iQc2E3gP4RVOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937704;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=W1XUrXb0Axy6Uwz0DDSqe48SEQbs+/1sUxhzTtuVo/k=;
	b=0p9EsQpWRjtuAKYHW9bQ5c0jruAwJ9ybYMzEn8FtEdjPVePDrvb/h3getw6fZ7+t50Gg
	 HRX+h04M1gxWpBK2kcEmgzN9YVcYJE5QexFfaQrRZi2uqdY65g8EdtUk3eotWHETuPvcl
	 9Lp4/HShHI10ouC+UoDwiS9WFekrjjXlWwl67crZnUZK+lDmXYIb/hAOBUBO6o9h7bsPl
	 GJLnjKSgfxzRT0OVzDsqfurosVceTRs1DG8dV4NajWL8VGZkE/+SO0AOUwa5WlUk0tmCp
	 QmLIRbJwsg19e7jo+gBTar2StJ2nCqzXX64z1a1bZgjAV+7hpQQuUHMbXz3BVSD0O3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e5akOanX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093F9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e5akOanX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E581A00;
	Tue, 17 Nov 2026 09:48:20 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 599043F632;
	Tue, 17 Nov 2026 09:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794937703; bh=DW3UobvvF0aF2F6eNdFyHOGPEMTX8V9/vx7ipryBXiQ=;
	h=From:To:Cc:Subject:Date:From;
	b=e5akOanXACtuTU4lhmdefCKfJWb1oSpNYfwd/eLcypSPjyRuUq3xdLIyUOON14LrZ
	 Kb/wJFKqw6Rz2pK2b+M5ZRLWC/OdZGewgx9kG/6qQkV4DkHnOl9QO++Yns6xyyvGTw
	 NgbydoI9pYvn4YRtXOwFIYTljtdAlLdzzmseGUm0=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
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
Subject: [PATCH 0/3] arm64: sdei: fix entry edge cases, pseudo-NMI
Date: Tue, 17 Nov 2026 17:48:11 +0000
Message-ID: <20261117174814.95936-1-ada.coupriediaz@arm.com>
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

As discussed in [0], SDEI entry has a number of remaining issues.
This small series aims to fix the biggest potential issues :
 - Patch 1 : with KVM in VHE, VBAR_EL1 might not be correct
 - Patch 2 : PMR was not handled at all when using pseudo-NMI
 - Patch 3 : very early SDEI interrupt might end up with `current == NULL`

I have booted the patches, but I don't have an SDEI test setup yet,
so I would really appreciate real-world testing that nothing breaks while
I set up something, /especially/ with `CONFIG_ARM64_PSEUDO_NMI=y` and
`irqchip.gicv3_pseudo_nmi=1` given the new PMR handling !


Contrary to what I said in [0], patch 1 and 2 fix things in C rather than
in entry.S. SDEI is already a special case and very edge-case-y, so
as we cannot really hope to share code with the regular entry path,
we might as well handle the edge cases that we can in C.

I think everything should be easily backportable if needed, though patch 3
depends on commit 3d8c1a013d78 ("arm64: smp: initialize cpu offset
earlier") which I don't think is in the 5.10 tree.


There are a couple of possible un-addressed issues still:
 - SWPAN is not handled on SDEI entry, but users of both SDEI and SWPAN
   are quite unlikely. Given that SDEI can interrupt anything at any time,
   and SWPAN is already very fiddly because of non-atomic register
   accesses, we might disallow the combination if it causes issues ;
 - Pointer Authentication is not handled either, but is not covered here as
   it does not present an immediate functionnal issue.


Thanks in advance
Ada

Based on v7.4-rc3
[0]: https://lore.kernel.org/r/20261105120835.3321912-1-kirill@shutemov.name 

Ada Couprie Diaz (3):
  arm64: entry: sdei: always set VBAR_EL1 on SDEI entry
  arm64: entry: sdei: save and restore PMR for pseudo-NMI
  arm64: head: set __entry_task along with task setup

 arch/arm64/kernel/entry-common.c | 40 ++++++++++++++++++++++----------
 arch/arm64/kernel/head.S         |  3 +++
 arch/arm64/kernel/process.c      |  3 ---
 3 files changed, 31 insertions(+), 15 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

