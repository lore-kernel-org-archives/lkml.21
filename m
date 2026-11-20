Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218015;
	b=xNzpNQKNTn2IHVmbTXg2cqd3ACQe/2fXd2aaFg3irFjI6RoZpB7CKoks9ppCQGjT2Eko
	 D9xGdTmOZNaXpM5b+q0OvFDvmmACwEigcvhyBidOnsaBhowJT4lLKCIFsYr9WHm4d+eIR
	 iW+pANlRYDYivB3itZVvKoBzc/B9EO9BTohtdtio8PoOQbJXwms++MjMnoA0Z1nOzP9Xd
	 AGb6q4gxO72SgPOYKyBcHNDMGnOBeVSUAwkBo2PNapITf5PZ2pAWHb60Y/Az21e3syVC+
	 Tem6xdnLwHzRpIla9y43QOGwJCNNDT51I8MgS5s/y8qFzx72iU4pfgLPQWmt8+/x+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218015;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=f9+ODrOG4ybNg37qBUYLCegnI00Kim2Efk2hH8gvgjQ=;
	b=NjlHd/+0jjROwzMqLHLoM9tPBErnOzcUGeUXt3XHd/u0LKRTj+QyXwiIK0wuoBgm3QgK
	 u0sHjhBobVvR0TtxOqIfmls2dysnEz3urZrPSJ023nwuTLUxttCVwWhWxJ7QWvrr/5UxC
	 jnv3YBD9EVc5yOhVWljuxMEGLl22fLUrJLUKCGwQTtIiq8dy5N1pzn1D5aW01lAalfi8g
	 i6U3kBFTnD+3MSby/a3LzN9g4RKBY99DSHwDjLHC3RvcAcjU4hqngZxa6RxZ96H7XdaPa
	 cZhEZiY2V8FrlAqu1mMQcZ58NKz9ov4VtHuYXmf5cQFNBWv4EKcaxdGAKTJFfSWSR3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVTnNFdp;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E7606A6A1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918E7606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVTnNFdp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795218011; x=1826754011;
  h=date:from:to:cc:subject:message-id;
  bh=MbWnaFffxFBk2PeUDRz4NtdbZ2pTVZZIUpPxNz+RCB8=;
  b=GVTnNFdpx/hl+5SRDlUYjxJa8Ik7+sK2ZuHjk5bpHXo9Pbu5Vf0aA8eX
   P35UyzqbEMqB3SmTaaZTDhFUb4iySd0lf9NzOpQn2iYBY4s7STwPE0w4R
   fp2i7Os1eVH3YtgR6znMB3sF182MEC8JQ9y2joNWHzXJDmPtdZGhnHQ2U
   /2HwzbvBU1Gmdq1vK4Qqd4MpJQJmA9Ftu0kHfzvQjdagPJsPDQJF/6Wjg
   TaT1/fTLXXHIAEBrNdJq9xDuXcwsK0qq6ZbTTX13yJRjxJ8KjKSqYNpIS
   2iCjUuy4Ks0ftNY2ZOQ6XGE0ohQzhrXK33quNIbfs6Ev02DxPmriVqt5h
   A==;
X-CSE-ConnectionGUID: 1LXzwZVQSPKbJ9hA+DL3Xg==
X-CSE-MsgGUID: dhmnuUEGSAyyqFZwkeiL+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4001398"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4001398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:40:11 -0800
X-CSE-ConnectionGUID: 8+8FNZgaSo+ptuqgdV2EKg==
X-CSE-MsgGUID: qYuGrH1gSkqAtVQxt6GAaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10706829"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2026 15:40:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUYDA-00000001IzI-2NQu;
	Fri, 20 Nov 2026 23:40:08 +0000
Date: Sat, 21 Nov 2026 07:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 29b74cf57f432d60da2b79c827f1379125409611
Message-ID: <20261121073947.XV8lPwas-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 29b74cf57f432d60da2b79c827f1379125409611  x86/mce: Do not treat cache hierarchy errors as memory errors

elapsed time: 1030m

configs tested: 408
configs skipped: 196

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261120    gcc-15.3.0
alpha                 randconfig-2001-20261120    gcc-15.3.0
alpha                 randconfig-2200-20261120    gcc-15.3.0 smatch
alpha                randconfig-r2307-20261120    gcc-16.2.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261120    clang-17
arc                   randconfig-1000-20261121    clang-24
arc                   randconfig-1001-20261120    clang-17
arc                   randconfig-1001-20261121    clang-24
arc                   randconfig-2000-20261120    gcc-11.5.0
arc                   randconfig-2001-20261120    gcc-11.5.0
arc                   randconfig-2002-20261120    gcc-11.5.0
arc                   randconfig-2003-20261120    gcc-11.5.0
arc                   randconfig-2004-20261120    gcc-11.5.0
arc                   randconfig-2005-20261120    gcc-11.5.0
arc                   randconfig-2200-20261120    gcc-15.3.0 smatch
arc                  randconfig-r2103-20261120    gcc-16.2.0 cocci
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                           collie_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                           pxa168_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261120    clang-17
arm                   randconfig-1000-20261121    clang-24
arm                   randconfig-1001-20261120    clang-17
arm                   randconfig-1001-20261121    clang-24
arm                   randconfig-1002-20261120    clang-17
arm                   randconfig-1002-20261121    clang-24
arm                   randconfig-1003-20261120    clang-17
arm                   randconfig-1003-20261121    clang-24
arm                   randconfig-2000-20261120    gcc-8.5.0
arm                   randconfig-2001-20261120    gcc-8.5.0
arm                   randconfig-2002-20261120    gcc-8.5.0
arm                   randconfig-2200-20261120    clang-17   smatch
arm                  randconfig-r2100-20261120    gcc-16.2.0 cocci
arm                  randconfig-r2101-20261120    gcc-16.2.0 cocci
arm                              rpc_defconfig    gcc-16.2.0
arm                            sama7_defconfig    gcc-16.2.0
arm                         shmobile_defconfig    gcc-16.2.0
arm                         spear3xx_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261120    clang-18
arm64                 randconfig-1000-20261121    gcc-8.5.0
arm64                 randconfig-1001-20261120    clang-18
arm64                 randconfig-1001-20261121    gcc-8.5.0
arm64                 randconfig-1002-20261120    clang-18
arm64                 randconfig-1002-20261121    gcc-8.5.0
arm64                 randconfig-1003-20261120    clang-18
arm64                 randconfig-1003-20261121    gcc-8.5.0
arm64                 randconfig-2000-20261120    gcc-8.5.0
arm64                 randconfig-2001-20261120    gcc-8.5.0
arm64                 randconfig-2002-20261120    gcc-8.5.0
arm64                 randconfig-2200-20261120    clang-17   smatch
arm64                randconfig-r2102-20261120    gcc-16.2.0 cocci
arm64                randconfig-r2103-20261120    clang-24   cocci
arm64                randconfig-r2109-20261120    clang-24   cocci
arm64                randconfig-r2111-20261120    clang-24   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261120    clang-18
csky                  randconfig-1000-20261121    gcc-8.5.0
csky                  randconfig-1001-20261120    clang-18
csky                  randconfig-1001-20261121    gcc-8.5.0
csky                  randconfig-2200-20261120    gcc-15.3.0 smatch
csky                 randconfig-r2110-20261120    clang-24   cocci
csky                 randconfig-r2311-20261120    clang-24   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261120    gcc-10.5.0
hexagon               randconfig-1000-20261121    gcc-11.5.0
hexagon               randconfig-1001-20261120    gcc-10.5.0
hexagon               randconfig-1001-20261121    gcc-11.5.0
hexagon               randconfig-2200-20261120    clang-17   smatch
hexagon              randconfig-r2310-20261120    gcc-16.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261120    clang-22
i386        buildonly-randconfig-1000-20261121    gcc-13
i386        buildonly-randconfig-1001-20261120    clang-22
i386        buildonly-randconfig-1001-20261121    gcc-13
i386        buildonly-randconfig-1002-20261120    clang-22
i386        buildonly-randconfig-1002-20261121    gcc-13
i386        buildonly-randconfig-1003-20261120    clang-22
i386        buildonly-randconfig-1003-20261121    gcc-13
i386        buildonly-randconfig-1004-20261120    clang-22
i386        buildonly-randconfig-1004-20261121    gcc-13
i386        buildonly-randconfig-1005-20261120    clang-22
i386        buildonly-randconfig-1005-20261121    gcc-13
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261120    clang-22
i386                  randconfig-1001-20261120    clang-22
i386                  randconfig-1002-20261120    clang-22
i386                  randconfig-1003-20261120    clang-22
i386                  randconfig-1004-20261120    clang-22
i386                  randconfig-1005-20261120    clang-22
i386                  randconfig-1006-20261120    clang-22
i386                  randconfig-1007-20261120    clang-22
i386                  randconfig-1007-20261121    gcc-14
i386                  randconfig-1008-20261120    clang-22
i386                  randconfig-1008-20261121    gcc-14
i386                  randconfig-1009-20261120    clang-22
i386                  randconfig-1009-20261121    gcc-14
i386                  randconfig-1010-20261120    clang-22
i386                  randconfig-1010-20261121    gcc-14
i386                  randconfig-1011-20261120    clang-22
i386                  randconfig-1011-20261121    gcc-14
i386                  randconfig-1012-20261120    clang-22
i386                  randconfig-1012-20261121    gcc-14
i386                  randconfig-1013-20261120    clang-22
i386                  randconfig-1013-20261121    gcc-14
i386                  randconfig-2000-20261120    clang-22
i386                  randconfig-2001-20261120    clang-22
i386                  randconfig-2002-20261120    clang-22
i386                  randconfig-2003-20261120    clang-22
i386                  randconfig-2004-20261120    clang-22
i386                  randconfig-2005-20261120    clang-22
i386                  randconfig-2200-20261120    clang-22   smatch
i386                 randconfig-r2303-20261120    clang-22   sparse
i386                 randconfig-r2311-20261120    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261120    gcc-10.5.0
loongarch             randconfig-1000-20261121    gcc-11.5.0
loongarch             randconfig-1001-20261120    gcc-10.5.0
loongarch             randconfig-1001-20261121    gcc-11.5.0
loongarch             randconfig-2000-20261120    clang-24
loongarch             randconfig-2001-20261120    clang-24
loongarch             randconfig-2200-20261120    clang-18   smatch
loongarch            randconfig-r2308-20261120    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5275evb_defconfig    clang-24
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
m68k                         mvme16x_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261120    gcc-15.3.0
m68k                  randconfig-2001-20261120    gcc-15.3.0
m68k                  randconfig-2200-20261120    gcc-14.4.0 smatch
m68k                 randconfig-r2300-20261120    clang-22   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261120    gcc-15.3.0
microblaze            randconfig-2001-20261120    gcc-15.3.0
microblaze            randconfig-2200-20261120    gcc-11.5.0 smatch
microblaze           randconfig-r2105-20261120    clang-24   cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          db1xxx_defconfig    clang-24
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip30_defconfig    clang-24
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                         qi_lb60_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261120    gcc-9.5.0
mips                  randconfig-2001-20261120    gcc-9.5.0
mips                  randconfig-2002-20261120    gcc-9.5.0
mips                  randconfig-2200-20261120    clang-24   smatch
mips                 randconfig-r2106-20261120    clang-24   cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261120    gcc-10.5.0
nios2                 randconfig-1000-20261121    gcc-11.5.0
nios2                 randconfig-1001-20261120    gcc-10.5.0
nios2                 randconfig-1001-20261121    gcc-11.5.0
nios2                 randconfig-2000-20261120    clang-24
nios2                 randconfig-2001-20261120    clang-24
nios2                 randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261120    gcc-9.5.0
openrisc              randconfig-2001-20261120    gcc-9.5.0
openrisc              randconfig-2002-20261120    gcc-9.5.0
openrisc              randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc             randconfig-r2304-20261120    clang-22   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    gcc-16.2.0
parisc                randconfig-1000-20261121    gcc-10.5.0
parisc                randconfig-1001-20261121    gcc-10.5.0
parisc                randconfig-2000-20261120    clang-24
parisc                randconfig-2001-20261120    clang-24
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc               randconfig-r2104-20261120    clang-24   cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                       chrp32_defconfig    gcc-16.2.0
powerpc                       ep88xc_defconfig    gcc-16.2.0
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      ppa8548_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261121    gcc-10.5.0
powerpc               randconfig-1001-20261121    gcc-10.5.0
powerpc               randconfig-2200-20261120    clang-17   smatch
powerpc              randconfig-r2305-20261120    clang-22   sparse
powerpc              randconfig-r2306-20261120    gcc-16.2.0 sparse
powerpc                      skiroot_defconfig    clang-24
powerpc                      taishan_defconfig    gcc-16.2.0
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261121    gcc-10.5.0
powerpc64             randconfig-1001-20261121    gcc-10.5.0
powerpc64             randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64            randconfig-r2306-20261120    clang-24   sparse
powerpc64            randconfig-r2309-20261120    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261120    gcc-11.5.0
riscv                 randconfig-1000-20261121    clang-17
riscv                 randconfig-1001-20261120    gcc-11.5.0
riscv                 randconfig-1001-20261121    clang-17
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2001-20261120    clang-24
riscv                 randconfig-2002-20261120    clang-24
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2004-20261120    clang-24
riscv                 randconfig-2005-20261120    clang-24
riscv                 randconfig-2200-20261120    gcc-8.5.0  smatch
riscv                randconfig-r2302-20261120    clang-22   sparse
riscv                randconfig-r2307-20261120    clang-24   sparse
riscv                randconfig-r2310-20261120    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261120    gcc-11.5.0
s390                  randconfig-1000-20261121    clang-17
s390                  randconfig-1001-20261120    gcc-11.5.0
s390                  randconfig-1001-20261121    clang-17
s390                  randconfig-2200-20261120    clang-17   smatch
s390                 randconfig-r2102-20261120    clang-24   cocci
s390                 randconfig-r2108-20261120    clang-24   cocci
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261120    gcc-11.5.0
sh                    randconfig-1000-20261121    clang-17
sh                    randconfig-1001-20261120    gcc-11.5.0
sh                    randconfig-1001-20261121    clang-17
sh                    randconfig-2000-20261120    gcc-11.5.0
sh                    randconfig-2001-20261120    gcc-11.5.0
sh                    randconfig-2002-20261120    gcc-11.5.0
sh                    randconfig-2003-20261120    gcc-11.5.0
sh                    randconfig-2004-20261120    gcc-11.5.0
sh                    randconfig-2005-20261120    gcc-11.5.0
sh                    randconfig-2200-20261120    gcc-11.5.0 smatch
sh                   randconfig-r2104-20261120    gcc-16.2.0 cocci
sh                   randconfig-r2309-20261120    gcc-16.2.0 sparse
sh                            se7712_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261120    clang-24
sparc                 randconfig-1000-20261121    gcc-14
sparc                 randconfig-1001-20261120    clang-24
sparc                 randconfig-1001-20261121    gcc-14
sparc                 randconfig-2000-20261120    gcc-8.5.0
sparc                 randconfig-2001-20261120    gcc-8.5.0
sparc                 randconfig-2200-20261120    gcc-11.5.0 smatch
sparc                randconfig-r2100-20261120    clang-24   cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261120    clang-24
sparc64               randconfig-1000-20261121    gcc-14
sparc64               randconfig-1001-20261120    clang-24
sparc64               randconfig-1001-20261121    gcc-14
sparc64               randconfig-2000-20261120    gcc-8.5.0
sparc64               randconfig-2001-20261120    gcc-8.5.0
sparc64               randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64              randconfig-r2301-20261120    clang-22   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261120    clang-24
um                    randconfig-1000-20261121    gcc-14
um                    randconfig-1001-20261120    clang-24
um                    randconfig-1001-20261121    gcc-14
um                    randconfig-2000-20261120    gcc-8.5.0
um                    randconfig-2001-20261120    gcc-8.5.0
um                    randconfig-2200-20261120    clang-24   smatch
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261120    clang-22
x86_64      buildonly-randconfig-1000-20261121    clang-22
x86_64      buildonly-randconfig-1001-20261120    clang-22
x86_64      buildonly-randconfig-1001-20261121    clang-22
x86_64      buildonly-randconfig-1002-20261120    clang-22
x86_64      buildonly-randconfig-1002-20261121    clang-22
x86_64      buildonly-randconfig-1003-20261120    clang-22
x86_64      buildonly-randconfig-1003-20261121    clang-22
x86_64      buildonly-randconfig-1004-20261120    clang-22
x86_64      buildonly-randconfig-1004-20261121    clang-22
x86_64      buildonly-randconfig-1005-20261120    clang-22
x86_64      buildonly-randconfig-1005-20261121    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261120    clang-22
x86_64                randconfig-1000-20261121    clang-22
x86_64                randconfig-1001-20261120    clang-22
x86_64                randconfig-1001-20261121    clang-22
x86_64                randconfig-1002-20261120    clang-22
x86_64                randconfig-1002-20261121    clang-22
x86_64                randconfig-1003-20261120    clang-22
x86_64                randconfig-1003-20261121    clang-22
x86_64                randconfig-1004-20261120    clang-22
x86_64                randconfig-1004-20261121    clang-22
x86_64                randconfig-1005-20261120    clang-22
x86_64                randconfig-1005-20261121    clang-22
x86_64                randconfig-1006-20261120    clang-22
x86_64                randconfig-1006-20261121    gcc-14
x86_64                randconfig-1007-20261120    clang-22
x86_64                randconfig-1007-20261121    gcc-14
x86_64                randconfig-1008-20261120    clang-22
x86_64                randconfig-1008-20261121    gcc-14
x86_64                randconfig-1009-20261120    clang-22
x86_64                randconfig-1009-20261121    gcc-14
x86_64                randconfig-1010-20261120    clang-22
x86_64                randconfig-1010-20261121    gcc-14
x86_64                randconfig-1011-20261120    clang-22
x86_64                randconfig-1011-20261121    gcc-14
x86_64                randconfig-1012-20261120    clang-22
x86_64                randconfig-1013-20261120    clang-22
x86_64                randconfig-1014-20261120    clang-22
x86_64                randconfig-1015-20261120    clang-22
x86_64                randconfig-1016-20261120    clang-22
x86_64                randconfig-1017-20261120    clang-22
x86_64                randconfig-2100-20261120    gcc-14     cocci
x86_64                randconfig-2101-20261120    gcc-14     cocci
x86_64                randconfig-2102-20261120    gcc-14     cocci
x86_64                randconfig-2103-20261120    gcc-14     cocci
x86_64                randconfig-2104-20261120    gcc-14     cocci
x86_64                randconfig-2105-20261120    gcc-14     cocci
x86_64                randconfig-2200-20261120    clang-22   smatch
x86_64               randconfig-r2101-20261120    clang-24   cocci
x86_64               randconfig-r2107-20261120    clang-24   cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   cadence_csp_defconfig    gcc-16.2.0
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261120    clang-24
xtensa                randconfig-1000-20261121    gcc-14
xtensa                randconfig-1001-20261120    clang-24
xtensa                randconfig-1001-20261121    gcc-14
xtensa                randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa               randconfig-r2105-20261120    gcc-16.2.0 cocci
xtensa               randconfig-r2308-20261120    clang-24   sparse
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
