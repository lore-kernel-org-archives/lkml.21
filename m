Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886464;
	b=k5yurhUCQKvggu+oakgJtHkQeYCwVsLP0ZPWtRO/PyZjDK4lGZqyHmoDgzeXDCpUViV5
	 KBaffnMo/MYyr/bzWsVgcdNwUIQkkqe4+ud9t/6JbzBk62fMfEyb+jOdQo+05hEuAi+6I
	 e7xMAurmBPcDhmkX+K8m06t/LrCtK1TTzF+WdzHT1o7a3agq32VEqdFlUF96CA9xXiasb
	 H7BHlP4ZaCG2qcxSd1ulrpOrOgXuYlRKETry4QK8pcrQ8cAAdlVv0irfLZawsJ9na61mY
	 DI+egJbM2HTdk3u4rSAnill899J0hFjS24/TlIKhbrZCrLboIXCK4ZO2CcMXkt9bTJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886464;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+6Q9i92wYxoxI6OoSo6nZDRz4bD5HbKGecCDFVdpTtA=;
	b=yMyXdkXTzoVVetVUiA0xZudb2pKGVJz/IJEw+QjHbRau9F24DbwyNgC88DZgTWw7bo27
	 sAz5TuNZzQvq8Fn0xsBuh09N4TgnIjQFWynTmtCs41jH8azaVRYx/+22P5QDEBJJYUCb5
	 Go5jFnRg8PyQsA7dW+MlT9a3ojvLw4fZlcgfgwWUXTaJC/DGoRCmJ/dpS7YzrMidW5leR
	 0p1CsDRULESuQ3iZHENFn4X1RFjePowxAlwwQFOrqnGSh9Nsp59nNuxX/E6iCISV/w7o9
	 Np8hLqqYyP2qHYoJjG8iiLBnslXA3MLCl5lC8S+MYaG+mjk4AvFX43863Da6b1P0vow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AG4bc9Eq;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=H2EN7TLm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3167C606A31C;
	Sat, 28 Nov 2026 17:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3167C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AG4bc9Eq;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=H2EN7TLm
ARC-Seal: i=1; a=rsa-sha256; t=1795886447; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jozdRSCfOyfZXq6AWBDKYIv3lZSE+2lM89soq972PFjxO4jxE69Z3rLUNf/3sz9Ex6
    4zwM2XjGbZ0U03juw35K8HRbBZxmN2HH57iHUMkrTedme7qtwiFcAYlkaS+3IMegcctq
    H3UMhacfyphboDd/DUIM8nr+3ktweoUt0rCM0e59Ht5rTBjdN5OAfs5O0CX4y4NNr0pD
    VjVzEro5OT92pRieo83TcxnRmFL+Nyihu7Mskih/L/6/W6RCUFkpJSl7R1qKIfdjO6Ft
    nRMT4tIDjm0YXoNIDG9ty8oJIkDybfOsxFldGxtD8dbltO5e/kKyvs9iAmQ7B578oGRi
    /XYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886447;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+6Q9i92wYxoxI6OoSo6nZDRz4bD5HbKGecCDFVdpTtA=;
    b=W58i8B7cpatYhHl3N0TkDBrZ9qOW+Lx10Pd0q7GQvfnEE3Bp3Ji/dcjmtQuK3+XyYG
    hYwyS/2N8hakQrzPfMhMTCQ1JyKv4LTevoqQgXYhrfHUimgEEzTz6PuwmhawQuXI1TJ0
    xug2K9nZwVop91AhqIDCMNUMcvSNZRGvly/0Fwhz+UK7yuYd5QAtVkJcVgVl1GZ7N+cS
    jYfrbu5Ja4+e9z6JmcLoPa43esX1+OusrSb7MVz04we09duiYVQti5s3wYp78oJ5jwhY
    dpU7RWymZBwCfOoxnxOrSYs4ncFK5THLQU9ywwv21hP6ufL+SNZKbmjRpkb1A+YVyi3I
    mkIA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886447;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+6Q9i92wYxoxI6OoSo6nZDRz4bD5HbKGecCDFVdpTtA=;
    b=AG4bc9Eq4G+zkBQRyf4QkzOKtcYZFbHKOAzx+dnYqA8T86CYw/7DmIuUEXGMKSmOpr
    JG9Pr6sZUMMGVaKafKUG8oqYlWAmahnkmubeexW6lapO8xb3kr0dtpUInBJZCmT33s7A
    O61a22iN6SL+qhAeYSaG3FOBWdInpybZyiGBWEcSatfOTzD4qgjPN24eXEk3T9zbtioS
    oH2MTlpKy1tor9rSRj73Qu42Y4iaDc7vQ5rGrlCIhYneaa5L57EsjIT5dFCQivsQApvX
    Bls71AS4Q1iYZde0qM9Gg5+1400cc9TVbb48mZlWr0u7ME2U4Uw9EPgWJmXtnbwX9VGg
    uI/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886447;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+6Q9i92wYxoxI6OoSo6nZDRz4bD5HbKGecCDFVdpTtA=;
    b=H2EN7TLmtBtbPL7Yu9QLI3vnrrnXaQ3jl3Dc/GGRncEqha+BL3QmILbHoAb5Poo68e
    A5lY8SQv6z4gFrlwJACw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKkLus
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Nov 2026 18:20:46 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=2C=20Pengpeng=20Hou?= <pengpeng@iscas.ac.cn>, Takashi Iwai <tiwai@suse.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, David Heidelberg <david@ixit.cz>, Paul Boddie <paul@boddie.org.uk>, " Maciej W . Rozycki " <macro@orcam.me.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: [PATCH v3 0/8] MIPS: Ingenic: Add XBurst / XBurst II infrastructure and improve overall Ingenic SoC support
Date: Sat, 28 Nov 2026 18:20:37 +0100
Message-ID: <cover.1795886445.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PATCH V3 2026-11-28 18:20:45:
The series updates the Ingenic platform support to allow clean transitions
between bootloader-provided Device Trees and built-in fallbacks. It provides
the foundational Kconfig, PRID, and CPU-probe blocks required for newer 
Ingenic/Lumissil hardware generations (X1600, X2000, X2600) and adds JZ4730
for completeness.

Changes since V2:
- Simplify BUILTIN_DTB help text.
- Keep the verified single Fixes trailer and stable Cc in patch 3.
- Set CPU_XBURST2 in the XBurst II CPU probe case.
- Drop the undefined MACH_X1500 and MACH_X2100 selections.
- Clarify the origin of X2000 Kconfig definitions without attributing
  unsupported co-development.
- Drop the platform load-address patch from v2; the addresses are not
  established as universal for the different bootloader setups.

Testing of v3:
The updated series has been successfully merged into the Letux kernel
based on v7.4-rc4 and compile-tested.
Runtime testing on JZ4780 (CI20), X1600 (LX16) and X2000 (LX20)
showed no observed regressions.
The X2600 (LX26) boots into userspace but still exhibits stability
issues. These are being investigated separately and are outside the
intended scope of this series. Regression-free operation on X2600
has not yet been established.
Testing focused on a universal Ingenic kernel using a bootloader-provided
Device Tree, with the following configuration:

    CONFIG_MIPS_GENERIC=y
    CONFIG_MACH_GENERIC_CORE=y
    # CONFIG_MIPS_GENERIC_KERNEL is not set
    # CONFIG_BMIPS_GENERIC is not set
    CONFIG_MACH_INGENIC_GENERIC=y
    CONFIG_INGENIC_GENERIC_BOARD=y
    # CONFIG_BUILTIN_DTB is not set
    CONFIG_MIPS_NO_APPENDED_DTB=y
    # CONFIG_MIPS_ELF_APPENDED_DTB is not set
    # CONFIG_MIPS_RAW_APPENDED_DTB is not set
    # CONFIG_MIPS_CMDLINE_FROM_DTB is not set
    CONFIG_MIPS_CMDLINE_DTB_EXTEND=y

Not all combinations of built-in DTB, appended DTB and generic kernel
configuration have been tested.

Review acknowledgments:
- Paul Cercueil suggested making BUILTIN_DTB selectable and reviewed
  the Fixes trailers, DT bindings, Kconfig selections and attribution.
- Olivier Louvignes contributed more analysis of XBurst PRID values
  and raised the X1600 writecombine configuration question.
- Hunter Laux suggested checking Config1.C2 for MXU support and
  reported a separate X2600 eretnc issue which is not covered here
  because it is not directly related.
- The kernel test robot reported the build issue addressed by the
  CPU_XBURST2 type patch.
- The series was reviewed for consistency and commit messages/notes
  improved using ChatGPT.

PATCH V2 2026-11-12 09:10:31:
Changes to V1
- allow user selection of BUILTIN_DTB (suggested by Paul Cercueil <paul@crapouillou.net>)
- added the CPU_XBURTS2 type here to solve an issue reported by kernel test robot
- removed PRID_IMP_XBURST2_R2 and merged into single commit
- reviewed all PRID_IMP with data sheets and programming manuals
- added full x2600 and jz4730 definition for completeness
- added platform makefile and load address for X1600, X2000, X2600

PATCH V1 2026-10-25 20:20:55:
The series updates the Ingenic platform support to allow clean transitions
between bootloader-provided Device Trees and built-in fallbacks. It provides
the foundational Kconfig, PRID, and CPU-probe blocks required for newer 
Ingenic/Lumissil hardware generations (X1600, X2000, X2600).

The first patch corrects an inverted Kconfig condition regarding appended 
and built-in DTBs. This fix is necessary to allow configurations where 
the kernel relies entirely on a Device Tree provided dynamically by the 
bootloader instead of forcing a built-in fallback.

The remaining patches implement CPU-probe initialization, correct PRID 
mappings (including vendor-kernel values for the Ingenic A1 SoC), 
platform load addresses, Kconfig updates, and generic board match updates.

Structure of the series:
1. MIPS: Ingenic: Fix inverted MIPS_NO_APPENDED_DTB logic in Kconfig
2. MIPS: Ingenic: Add and update PRIDs for XBurst II R0 and R2
3. MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
4. MIPS: Ingenic: Add cpu-probe setup for XBurst and XBurst II R2
5. MIPS: generic: Add MACH_INGENIC type and compatible for X1600
6. MIPS: Ingenic: Add Platform makefile for X1600 and X2000

Testing:
The series has been compile-tested for generic Ingenic targets. PRID 
values for jz4780, x1600, X2000, X2600 were verified on real hardware 
(CI20, LX16, LX20 and LX26 boards respectively).

Please review and consider for inclusion.


H. Nikolaus Schaller (7):
  MIPS: Kconfig: Allow user selection of BUILTIN_DTB with description
  MIPS: Ingenic: Configure CONFIG_BUILTIN_DTB=y for Ingenic based
    devices
  MIPS: Ingenic: Do not force BUILTIN_DTB in Kconfig
  MIPS: Ingenic: Update Ingenic XBurst implementation IDs
  MIPS: generic: Add MACH_INGENIC type and compatible for X1600 and
    X2600
  MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
  MIPS: Ingenic: Expand Kconfig by MACH_JZ4730

周琰杰 (Zhou Yanjie) (1):
  MIPS: Ingenic: Add a new CPU_XBURST2 type

 arch/mips/Kconfig                      | 16 ++++++++--
 arch/mips/configs/ci20_defconfig       |  1 +
 arch/mips/configs/cu1000-neo_defconfig |  1 +
 arch/mips/configs/cu1830-neo_defconfig |  1 +
 arch/mips/configs/qi_lb60_defconfig    |  1 +
 arch/mips/configs/rs90_defconfig       |  1 +
 arch/mips/generic/board-ingenic.c      |  8 ++++-
 arch/mips/include/asm/bootinfo.h       |  2 ++
 arch/mips/include/asm/cpu-type.h       |  1 +
 arch/mips/include/asm/cpu.h            | 13 ++++----
 arch/mips/ingenic/Kconfig              | 41 ++++++++++++++++++++++++++
 arch/mips/kernel/cpu-probe.c           |  9 +++++-
 arch/mips/kernel/idle.c                |  1 +
 arch/mips/mm/dma-noncoherent.c         |  1 +
 arch/mips/mm/tlbex.c                   |  1 +
 15 files changed, 88 insertions(+), 10 deletions(-)

-- 
2.56.0

