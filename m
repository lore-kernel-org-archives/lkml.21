Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430113;
	b=X1N0xgvXV/T0JDM3IXEDzooSBBlFqPPPAPJLqHE1pc5A8J4VBlA+buCtrR+QxbzeVjZ1
	 V6uS+Ebk9ZakOA2RFjsMjGJOw+DdANnWoL2RUDOh7NLQQtZDxtkoM0o1wD1iVhXnakid9
	 07q5FtW8zMXQIKKwmN/QcrV6VQ+TayIwLiNoAKlapX6BNXbAbK60dNKPhboO+1mXGWaIs
	 uvOujUQiQMRNSOBCbCR1IAKIKm+YBSNNY8YPzvluMEuO/QF7HdAD2dJeBL3fyOsNN5VOH
	 NK5gHi+yFfD1VmCo4viWQu1ilYXTJ5bsd/bNAl7jI1s/7GNaRhKeWz3aRovzPv8EyJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430113;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JNegrRp/NUexDN4FEoZ14wbn4iQ1tVQRQNeyZoOBH0s=;
	b=FYOwO1QQ54b6gDFDp6WvsB38/gDZWatOmoa0mGa3rRdkY402nvYDA7wmVTAPoFp5SVvi
	 /njuFHWX3Rv/7r4GDNWPmFEcvxMvxtDgnkNrivW4iYe0mOCfHUSElFp69mPX3eSUHOD1L
	 gFrP6ODIMKUtsiqCMDbVGPunXCT7oyMFkdpqaqDVU53rgh8Z5uaiRblz2stsK7pKLSrJO
	 pVMuolTkh9zGq6EHfwgSQ9SYDTdUWwqygVEBcp28ViO0ZhJGuPt+vgD6wsjUCm/xmNm2j
	 Jj3K2nwi32OGRRSx7xzuoPDJ6Bw2cYbRRniODELznOUEEDeAGQJ1HPl2CYKpPnEOLAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWfhXSM2;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3713C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWfhXSM2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=e7GMFbIO7ODomw2VAv04MqAxjpRjG/NYtGRnw2lyuKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430108; v=1; x=1796034908;
 b=xWfhXSM27ELGPggwdUiw9YbpsPUnExY7Y5Xk5r8Y8wed35kWjr36YcmXC1Ftx2QhChXgsdNP
 SF4Xq7aADZBFk5dwl4C1z9wF3CYrYGTLMCgL2SVVFBAegQAAAJzjAfR0B7IUbBgfEIS/PF/d9kq
 28o+GyIfDdkWPaSOnHaVuNAI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b19a606ff982d8d;
	Mon, 23 Nov 2026 10:35:06 +0000
X-Mizu-Trace-ID: 1b19a606ff982d8d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/2] KVM: arm64: Fix stage-2 THP mapping on hosts with 2-level page tables
Date: Mon, 23 Nov 2026 10:35:03 +0000
Message-ID: <20261123103505.1006067-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
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

Hi folks,

A fix for how KVM maps a THP at stage-2 on a host with 2-level page
tables (64K pages with a 42-bit VA, or 16K pages with a 36-bit VA).
There, KVM also maps the host memory that follows a THP into the guest
if the guest's first access to the THP isn't to its first page.

transparent_hugepage_adjust() is meant to round the faulting pfn down to
the start of the THP, but its mask is a no-op when the PMD level is
folded, and has been since THP support was added. Before 6f745f1bb5bf2
("KVM: arm64: Convert user_mem_abort() to generic page-table API"), KVM
mapped only the THP anyway, which is why the Fixes: tag is on that
commit. Kernels before f583a53c2b8a ("KVM: arm64: Make fault_ipa
immutable") round the IPA with PMD_MASK, so only the pfn line of the fix
applies there.

Tested on QEMU with a 64K, 42-bit VA host kernel, where the new
selftest scenario fails without the fix and passes with it.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

Fuad Tabba (2):
  KVM: arm64: Fix THP block mapping when the PMD level is folded
  KVM: arm64: selftests: Test a THP whose first fault is on a tail page

 arch/arm64/kvm/mmu.c                          |  4 +-
 .../kvm/arm64/stage2_block_transitions.c      | 56 ++++++++++++++++++-
 2 files changed, 55 insertions(+), 5 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

