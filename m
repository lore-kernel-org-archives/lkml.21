Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171342;
	b=uX1sxAQ4L1DcRwfkkGMe13yvvTx6EsavkOYNKnPe/xaduLiUfRacEYmcpMZ82EVOn1hr
	 TeP13PloJPxnGiyhEobGm29ttN1+mwdpKucKdMHTKYCBkFuDLcfYhhOzNLu78lSb+b65w
	 3bEyeRuExtZX63vnWYXGB4nuzGMsdHnFX2DlTnViiUTipARMyuYe1gJpOm1C/EafFRoWC
	 +3VU3bS98YStIZCVezdEMSlHEhuxA5G8pUagWL56h3JxBb/HxT/7K1dWmZtnrMlZAZ0L7
	 0HPEKl0cOe1i3v+nirjyI7a5DHe343DdaxuUSD3L+1XxoV2vFwzldorxx9cJ173fWng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171342;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=GA+rgY4utwY9kf5LrkartVA8tfESwwP7tCFlkDbq27U=;
	b=hdP8DIutKua2jpr0sZiGqIcjEKSMC7PUG17ZwRNTxmcTqLL0tUvnO2sORLevM6pwltUB
	 lxnPVJvS9AG1HnSNitLrHBoQz3UFQm0Yro/VmH8fZsI+dNNpPJy7imTRpGstD9zH+el1O
	 xAKdEnhpUpWXqoNdGq/mjZfjjGSy34V7P2mJbGEskyvokEbJhY3u6vIclmke1AVAcytog
	 0ehEuCO54jHzzB3HVdJhEs9PCyJwgusOMn/z5MZr3WNosNmsCD5BZTnP7/WptM3AHue20
	 wifuVImvl3f3/nqG0aFSl6h7cP9QeTd4UzAMh6WdDh/+9RXszyEr9TDs6ljiUqm3I5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W9dfn1oh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF98606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W9dfn1oh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 430201477;
	Fri, 20 Nov 2026 02:42:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402D33F632;
	Fri, 20 Nov 2026 02:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795171341; bh=KZjE07y4SmOyc71lJCM0v3KfRKAEC8tpOiHDkICt3Nc=;
	h=Date:From:To:Cc:Subject:From;
	b=W9dfn1oh5FlzZ73WblhD+zWKPJ7uT5LolA/jic0JijGNPiGabqk6eYLevYw1FHokE
	 LvueUommEyQ/clmqLH0a663hprd6eMCuR+huVn+B/4ytt7i3IFpfCJ73wRkmHQ3nzZ
	 zaEugB1c7WMtqdqvYsVIaTSiHYV1gaMzmAE5nx0E=
Date: Fri, 20 Nov 2026 10:42:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [GIT PULL] arm64 fixes for 7.4-rc4
Message-ID: <awAkCf3K4x8CtoKf@arm.com>
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

Please pull the arm64 fixes below: BBML3 allow-list corrections for
Cortex-X4 and Neoverse-V3/V3AE following updated errata, a kCFI oops
during kexec relocation and NEON intrinsics type mismatches causing
CRC64 and XOR build failures with tip-of-tree Clang.

Thanks.

The following changes since commit ad3fc05c7e65009355effeea06aa629a687acef2:

  arm64: suspend: Only track cpuidle context for idle tasks (2026-11-13 17:12:34 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to a041bdbe1f3a8efa8a527a89c84d3771232b4942:

  arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h (2026-11-19 00:10:15 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Remove Cortex-X4 and Neoverse-V3/V3AE from the BBML3 allow list.
   Updated errata documents show that revisions previously reported as
   fixed remain affected by load/store livelocks when changing mapping
   sizes without break-before-make

 - Fix a kCFI oops during kexec image relocation. Give the relocation
   routine a type hash and enter the copied code at the correct offset

 - Fix the build with recent Clang versions by removing the stdint.h
   type overrides for NEON intrinsics. The CRC64 and XOR intrinsics code
   no longer includes the kernel's type headers

----------------------------------------------------------------
Ard Biesheuvel (3):
      lib/crc: Don't include <linux/types.h> in NEON intrinsics code
      xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
      arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h

Ben Cressey (1):
      arm64: kexec: use a typed entry to fix kCFI oops

Ryan Roberts (2):
      arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
      arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list

 Documentation/arch/arm64/silicon-errata.rst |  6 ++++++
 arch/arm64/include/asm/kexec.h              |  2 ++
 arch/arm64/include/asm/neon-intrinsics.h    | 24 +++++-----------------
 arch/arm64/kernel/cpufeature.c              |  3 ---
 arch/arm64/kernel/machine_kexec.c           |  7 +++++--
 arch/arm64/kernel/relocate_kernel.S         | 11 ++++++----
 arch/arm64/kernel/vmlinux.lds.S             |  5 +++--
 lib/crc/crc64-neon.c                        | 10 +++++-----
 lib/raid/xor/arm/xor-neon-glue.c            |  3 +++
 lib/raid/xor/arm/xor-neon.h                 | 16 +++++++++++++--
 lib/raid/xor/arm64/xor-eor3.c               | 15 +++-----------
 lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++++
 lib/raid/xor/arm64/xor-neon.h               | 31 +++++++++++++++++++++++++----
 lib/raid/xor/xor-neon.c                     | 16 ++++-----------
 14 files changed, 89 insertions(+), 65 deletions(-)

-- 
Catalin
