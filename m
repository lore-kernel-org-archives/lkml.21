Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792329;
	b=wif2lxzBWLKT+qmWjRcH6Bcrh0ur7QEkZwNoSTD96T50Rummz6+VK/dDXtS9Zv7IFa7H
	 hJ4oB1Ft4ghClQYpFzxs86Ah3f4ucZ8woBtK9CeOumMdzKoVkzXTx1QFXPRDG0gHaj0jU
	 5UMDQmeel5sX2q5ewh+bDbL4GozPya9Sr8k7it45SxDqP4F07klyyMgEFGKQDLRMjxREq
	 l3dOogv/22D+mUdxBFIxvTyS6raRttXF3c6brY2iO9rPg4FgEHDJw8SV6pFcVsX9VxJTC
	 XjyQoIgOIbS+iUZ7nVhnlbxqjq7JOcdGE73jsp0kU0XPVEggyky6NzhzjX5LcLMCvGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792329;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Wmk/bbWl2jJTk/uL6VSD+8WUqUOpt5GKOa1yjJgQ5Ok=;
	b=1ig3nPTSfE2sh6JZylOe1WIPIFsIOl8dXMqlKq9lHzzW+TN0klLWqO6o37hZ3jY4ygc0
	 uhgSepVAsWd1XcH0ZnIPBSaTYrmrnJefnqG0if0B/i4T6+vHgPdOY/jmA1PF5jyCty+mR
	 NaBK4uMC7wMHho+fbB7qyMwa0cH5w98FTykFkHh+5GvcxBFWXYmhHfn3E2NRatRf9IwCY
	 +jz0QDQoouW4tUVUKno4G5qn7+QRT1J13W01oWlHJqwRN/NUDRvS2jPpLWkd6Mew2IQlS
	 UB14KNl3P0WEVIehsWDxiXGojXzbx35YMO0i+Efaj5blf49ws+BgNmDZ9thiTbJAKlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZtvgWIdi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981DC606A6A6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981DC606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZtvgWIdi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2186D169E;
	Fri, 27 Nov 2026 07:12:05 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974883F632;
	Fri, 27 Nov 2026 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792327; bh=OCMzx+iSsCMpWoW0jv7QNXScSWl4dEocpRUvUxsmCDw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZtvgWIdiu7QUq9fuAca84yswobbzpr01pGNr3Gz71ZCubQNeeklHHRoxn+WH13qxi
	 y6N0Bfjep0gBMQpxjsTU9EDqT/pqMcvIQyJLKP3ZOhNLNakuxLStPqThalXXgUPTsV
	 lnduj/P0dK/2YDvGT0Y4lbOH11p3WjSz/vu1w694=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] BBML3 cleanups and additions
Date: Fri, 27 Nov 2026 15:11:53 +0000
Message-ID: <20261127151157.406111-1-ryan.roberts@arm.com>
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

Hi All,

This series updates the BBML3 allow list following a review of Arm CPU errata
and implementation support. Add a comment to track why 13 CPUs are not in the
BBML3 allow list, and enable BBML3 for Cortex-A320, A520 and A720.

Applies on top of v7.4-rc4.


Changes since v1 [1]
====================

 - First 2 patches of v1 were errata workarounds; they were already merged and
   are in v7.4-rc4, so dropped them here.
 - Documenting which CPUs have errata preventing admission to BBML3 allow list
   using comment instead of the previous Kconfig approach (per Catalin).
 - Dropped C2 Ultra definitions as they are no longer needed.


Thanks,
Ryan

Ryan Roberts (3):
  arm64: cputype: Add Cortex-A320 definitions
  arm64: cpufeature: Document BBML3 exclusions
  arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720

 Documentation/arch/arm64/silicon-errata.rst | 16 +++++++++++++
 arch/arm64/include/asm/cputype.h            |  2 ++
 arch/arm64/kernel/cpufeature.c              | 26 ++++++++++++++++++++-
 3 files changed, 43 insertions(+), 1 deletion(-)

--
2.43.0

