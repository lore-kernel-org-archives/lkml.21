Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425221;
	b=ugioRR65GvBXM9odI4UuBHJQDhrnpR5x9cVkTMHpRq2bKSCNkBKqnV/+znD44jzlshvn
	 GPUxw5NU1F7BvGyar1saIyYi6gymVpm1QmUyK6q31PJ/wIKrCjDcxYkK4Gv4yJfGqCsHf
	 AegreugrJNpSybsBKGGULI/+0BMzUNn1/TB1klOM4Gq6mMRoe88ki1aWq3LJW2DcpB9Qf
	 okRJPa2RIvl85MrOMjhpxfiDVztC28LTANcDqOHYd2HI/FML7JbocSt0znLEvPLfkAQhB
	 V5FmAgedWa4FrHcgh2icocR/XPxOwLt9Le25i8PD9K7AG/C7+gdL1hucQnQ0GKgG3tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qHd9Q1Vxjc/p1hB44GhQVmKwkwxaargGG27nsVY3ArI=;
	b=AeRxB/p1hEPoEotTxJzyv0sQcGpOHAhpqC9ZDpwHgzBdBju/r64KiKKfTc7UqSzY1Q6U
	 wnU8tMKLOab1eGgHLavrjb5Y6HzK8yqthNwZAoJKtaX9I5SR/YHMjA89GjqAYjWNZxG0L
	 SWSQCKxL52/P0UidUP8Zd81516UzAZFA6VRgpxstV1+6xhIdh81dg0iYLw3UdqTKR4od7
	 gFEmWD6C9hzTO72m/8EOy15OYWQGnI1BB0IkxyQCC3IJ2ppOSo4qstIlOIMBIqfRvjf4U
	 sjWlrN3hU4H/2PC7k8njc06dwA8AQCQoenks0EhvffutlswKwhjmIfLV3EyltjBs1GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R6hPfClT;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236E0606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236E0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R6hPfClT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795425221; x=1826961221;
  h=date:from:to:cc:subject:message-id;
  bh=8pO3iNEDwQQvC+OcQJIrXS3tUmwLPOukWU0GLGrD5RM=;
  b=R6hPfClTueBbQemrmlmOjmp6oU7xvVUphvShUXIBdiPFkWCyNfBBZLcT
   xM0cCipgiv90be0dpdQGOPvr0BHZggG4rc/N31KeQZDLiVdI5La3gq+W8
   r2QKnHjicIAqIfPpniB69/4+FW3ZGXemzO0sN9Kqrqk2Y+ojK5DR3ZJWf
   /SKYxwcfFt9MS3OpQFeNh3YukYU2/YB/WWRwbnL/gG59eliG9s7Eiwo0s
   v5IbPkJZYoYURMfCf9FvI8U6n+GhCe2+pds2EOO97l6i+/RL3Umx8YqYr
   V1AP13E9zsxfBVD0IoHbCjOucnfMd+f5gcf4oGMb2slYI6duksLZVaRRF
   A==;
X-CSE-ConnectionGUID: O7R5crRlQYeuu4L3u3L2Ww==
X-CSE-MsgGUID: hZ8sItZVR7qJSnit39mI6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4097662"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4097662"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:13:40 -0800
X-CSE-ConnectionGUID: 753s7W4KTom/JnLr0KFqYQ==
X-CSE-MsgGUID: 8kd7GvZGTZeNFy9h8246kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11456094"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Nov 2026 01:13:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVQ7D-00000001MuY-2hmh;
	Mon, 23 Nov 2026 09:13:35 +0000
Date: Mon, 23 Nov 2026 17:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 6de8747b04ff8ab5e1dd465acd1d5d4733332f1d
Message-ID: <20261123171244.26gdHk9r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 6de8747b04ff8ab5e1dd465acd1d5d4733332f1d  Merge branch into tip/master: 'x86/sev'

elapsed time: 951m

configs tested: 437
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261122    gcc-8.5.0  smatch
alpha                randconfig-r2100-20261122    gcc-15.3.0 cocci
alpha                randconfig-r2102-20261122    gcc-15.3.0 cocci
alpha                randconfig-r2104-20261122    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                         nsim_700_defconfig    clang-24
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261123    clang-17
arc                   randconfig-1001-20261123    clang-17
arc                   randconfig-2000-20261122    gcc-9.5.0
arc                   randconfig-2001-20261122    gcc-9.5.0
arc                   randconfig-2002-20261122    gcc-9.5.0
arc                   randconfig-2003-20261122    gcc-9.5.0
arc                   randconfig-2004-20261122    gcc-9.5.0
arc                   randconfig-2005-20261122    gcc-9.5.0
arc                   randconfig-2200-20261122    gcc-9.5.0  smatch
arc                  randconfig-r2105-20261122    gcc-14.4.0 cocci
arc                  randconfig-r2106-20261122    clang-22   cocci
arc                  randconfig-r2111-20261122    clang-22   cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.2.0
arm                          at91_dt_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-24
arm                       jornada720_defconfig    clang-24
arm                             mmp2_defconfig    clang-24
arm                        multi_v4t_defconfig    clang-24
arm                         mvebu_v5_defconfig    clang-24
arm                   randconfig-1000-20261123    clang-17
arm                   randconfig-1001-20261123    clang-17
arm                   randconfig-1002-20261123    clang-17
arm                   randconfig-1003-20261123    clang-17
arm                   randconfig-2000-20261122    gcc-15.3.0
arm                   randconfig-2001-20261122    gcc-15.3.0
arm                   randconfig-2002-20261122    gcc-15.3.0
arm                   randconfig-2200-20261122    clang-19   smatch
arm                  randconfig-r2100-20261122    gcc-16.2.0 cocci
arm                  randconfig-r2105-20261122    gcc-15.3.0 cocci
arm                  randconfig-r2303-20261122    clang-24   sparse
arm                  randconfig-r2311-20261122    gcc-15.3.0 sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                            stm32_defconfig    clang-24
arm                          wpcm450_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261123    clang-17
arm64                 randconfig-1001-20261123    clang-17
arm64                 randconfig-1002-20261123    clang-17
arm64                 randconfig-1003-20261123    clang-17
arm64                 randconfig-2000-20261122    gcc-15.3.0
arm64                 randconfig-2001-20261122    gcc-15.3.0
arm64                 randconfig-2002-20261122    gcc-15.3.0
arm64                 randconfig-2200-20261122    gcc-10.5.0 smatch
arm64                randconfig-r2102-20261122    gcc-8.5.0  cocci
arm64                randconfig-r2303-20261122    clang-24   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261123    clang-17
csky                  randconfig-1001-20261123    clang-17
csky                  randconfig-2000-20261122    gcc-9.5.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2001-20261122    gcc-9.5.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2200-20261122    gcc-9.5.0  smatch
csky                 randconfig-r2101-20261122    gcc-8.5.0  cocci
csky                 randconfig-r2307-20261122    gcc-11.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261123    gcc-8.5.0
hexagon               randconfig-1001-20261123    gcc-8.5.0
hexagon               randconfig-2000-20261122    gcc-9.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261122    gcc-9.5.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2200-20261122    clang-24   smatch
hexagon              randconfig-r2103-20261122    gcc-8.5.0  cocci
hexagon              randconfig-r2300-20261122    clang-24   sparse
hexagon              randconfig-r2311-20261122    gcc-12.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261123    clang-22
i386        buildonly-randconfig-1001-20261123    clang-22
i386        buildonly-randconfig-1002-20261123    clang-22
i386        buildonly-randconfig-1003-20261123    clang-22
i386        buildonly-randconfig-1004-20261123    clang-22
i386        buildonly-randconfig-1005-20261123    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261123    clang-22
i386                  randconfig-1001-20261123    clang-22
i386                  randconfig-1002-20261123    clang-22
i386                  randconfig-1003-20261123    clang-22
i386                  randconfig-1004-20261123    clang-22
i386                  randconfig-1005-20261123    clang-22
i386                  randconfig-1006-20261123    clang-22
i386                  randconfig-1007-20261123    clang-22
i386                  randconfig-1008-20261123    clang-22
i386                  randconfig-1009-20261123    clang-22
i386                  randconfig-1010-20261123    clang-22
i386                  randconfig-1011-20261123    clang-22
i386                  randconfig-1012-20261123    clang-22
i386                  randconfig-1013-20261123    clang-22
i386                  randconfig-2000-20261122    clang-22
i386                  randconfig-2001-20261122    clang-22
i386                  randconfig-2002-20261122    clang-22
i386                  randconfig-2003-20261122    clang-22
i386                  randconfig-2004-20261122    clang-22
i386                  randconfig-2005-20261122    clang-22
i386                  randconfig-2100-20261122    clang-22   cocci
i386                  randconfig-2101-20261122    clang-22   cocci
i386                  randconfig-2102-20261122    clang-22   cocci
i386                  randconfig-2103-20261122    clang-22   cocci
i386                  randconfig-2104-20261122    clang-22   cocci
i386                  randconfig-2105-20261122    clang-22   cocci
i386                  randconfig-2200-20261122    gcc-14     smatch
i386                  randconfig-2300-20261122    clang-22   sparse
i386                  randconfig-2301-20261122    clang-22   sparse
i386                  randconfig-2302-20261122    clang-22   sparse
i386                 randconfig-r2100-20261122    gcc-8.5.0  cocci
i386                 randconfig-r2101-20261122    gcc-16.2.0 cocci
i386                 randconfig-r2105-20261122    gcc-16.2.0 cocci
i386                 randconfig-r2109-20261122    clang-22   cocci
i386                 randconfig-r2302-20261122    clang-24   sparse
i386                 randconfig-r2308-20261122    gcc-15.3.0 sparse
i386                 randconfig-r2310-20261122    gcc-12.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261123    gcc-8.5.0
loongarch             randconfig-1001-20261123    gcc-8.5.0
loongarch             randconfig-2000-20261122    clang-24
loongarch             randconfig-2001-20261122    clang-24
loongarch             randconfig-2200-20261122    clang-24   smatch
loongarch            randconfig-r2109-20261122    gcc-16.2.0 cocci
loongarch            randconfig-r2111-20261122    gcc-8.5.0  cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261122    gcc-12.5.0 smatch
m68k                 randconfig-r2107-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2110-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2111-20261122    gcc-16.2.0 cocci
m68k                 randconfig-r2305-20261122    clang-24   sparse
m68k                            sun3_defconfig    clang-24
m68k                            virt_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261122    gcc-8.5.0  smatch
microblaze           randconfig-r2101-20261122    gcc-8.5.0  cocci
microblaze           randconfig-r2309-20261122    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath25_defconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    clang-24
mips                  randconfig-2000-20261122    clang-24
mips                  randconfig-2000-20261122    gcc-15.3.0
mips                  randconfig-2001-20261122    gcc-15.3.0
mips                  randconfig-2002-20261122    clang-24
mips                  randconfig-2002-20261122    gcc-15.3.0
mips                  randconfig-2200-20261122    gcc-11.5.0 smatch
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261123    gcc-8.5.0
nios2                 randconfig-1001-20261123    gcc-8.5.0
nios2                 randconfig-2000-20261122    clang-24
nios2                 randconfig-2000-20261122    gcc-8.5.0
nios2                 randconfig-2001-20261122    clang-24
nios2                 randconfig-2001-20261122    gcc-11.5.0
nios2                 randconfig-2200-20261122    gcc-11.5.0 smatch
nios2                randconfig-r2102-20261122    gcc-8.5.0  cocci
nios2                randconfig-r2105-20261122    gcc-8.5.0  cocci
nios2                randconfig-r2108-20261122    gcc-16.2.0 cocci
nios2                randconfig-r2304-20261122    clang-24   sparse
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261122    gcc-15.3.0
openrisc              randconfig-2001-20261122    gcc-15.3.0
openrisc              randconfig-2001-20261122    gcc-9.5.0
openrisc              randconfig-2002-20261122    gcc-15.3.0
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc             randconfig-r2100-20261122    gcc-8.5.0  cocci
openrisc             randconfig-r2101-20261122    gcc-14.4.0 cocci
openrisc             randconfig-r2103-20261122    gcc-8.5.0  cocci
openrisc             randconfig-r2104-20261122    gcc-16.2.0 cocci
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261123    clang-24
parisc                randconfig-1001-20261123    clang-24
parisc                randconfig-2000-20261122    clang-24
parisc                randconfig-2000-20261122    gcc-9.5.0
parisc                randconfig-2001-20261122    clang-24
parisc                randconfig-2001-20261122    gcc-11.5.0
parisc                randconfig-2200-20261122    gcc-8.5.0  smatch
parisc               randconfig-r2101-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2103-20261122    gcc-14.4.0 cocci
parisc               randconfig-r2103-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2104-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2108-20261122    gcc-8.5.0  cocci
parisc               randconfig-r2304-20261122    clang-24   sparse
parisc               randconfig-r2306-20261122    gcc-11.5.0 sparse
parisc               randconfig-r2311-20261122    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                    motionpro_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    clang-24
powerpc               randconfig-1000-20261123    clang-24
powerpc               randconfig-1001-20261123    clang-24
powerpc               randconfig-2000-20261122    clang-24
powerpc               randconfig-2000-20261122    gcc-14.4.0
powerpc               randconfig-2001-20261122    clang-24
powerpc               randconfig-2002-20261122    clang-24
powerpc               randconfig-2200-20261122    gcc-16.2.0 smatch
powerpc                     sam440ep_defconfig    clang-24
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261123    clang-24
powerpc64             randconfig-1001-20261123    clang-24
powerpc64             randconfig-2000-20261122    clang-24
powerpc64             randconfig-2001-20261122    clang-24
powerpc64             randconfig-2001-20261122    gcc-14.4.0
powerpc64             randconfig-2002-20261122    clang-24
powerpc64             randconfig-2002-20261122    gcc-8.5.0
powerpc64             randconfig-2200-20261122    clang-24   smatch
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64            randconfig-r2100-20261122    gcc-14.4.0 cocci
powerpc64            randconfig-r2102-20261122    gcc-14.4.0 cocci
powerpc64            randconfig-r2301-20261122    clang-24   sparse
powerpc64            randconfig-r2305-20261122    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261123    clang-17
riscv                 randconfig-1001-20261123    clang-17
riscv                 randconfig-2000-20261122    gcc-14.4.0
riscv                 randconfig-2001-20261122    gcc-14.4.0
riscv                 randconfig-2001-20261122    gcc-8.5.0
riscv                 randconfig-2002-20261122    gcc-14.4.0
riscv                 randconfig-2002-20261122    gcc-8.5.0
riscv                 randconfig-2003-20261122    gcc-14.4.0
riscv                 randconfig-2003-20261122    gcc-8.5.0
riscv                 randconfig-2004-20261122    clang-18
riscv                 randconfig-2004-20261122    gcc-14.4.0
riscv                 randconfig-2005-20261122    gcc-14.4.0
riscv                 randconfig-2005-20261122    gcc-8.5.0
riscv                 randconfig-2200-20261122    gcc-8.5.0  smatch
riscv                randconfig-r2106-20261122    gcc-8.5.0  cocci
riscv                randconfig-r2108-20261122    clang-22   cocci
riscv                randconfig-r2307-20261122    gcc-15.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261123    clang-17
s390                  randconfig-1001-20261123    clang-17
s390                  randconfig-2000-20261122    clang-17
s390                  randconfig-2000-20261122    clang-24
s390                  randconfig-2001-20261122    clang-17
s390                  randconfig-2001-20261122    clang-18
s390                  randconfig-2002-20261122    clang-17
s390                  randconfig-2003-20261122    clang-17
s390                  randconfig-2003-20261122    gcc-8.5.0
s390                  randconfig-2004-20261122    clang-17
s390                  randconfig-2004-20261122    gcc-14.4.0
s390                  randconfig-2005-20261122    clang-17
s390                  randconfig-2005-20261122    clang-24
s390                  randconfig-2200-20261122    gcc-8.5.0  smatch
s390                 randconfig-r2110-20261122    clang-22   cocci
s390                 randconfig-r2302-20261122    clang-24   sparse
s390                 randconfig-r2308-20261122    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261123    clang-17
sh                    randconfig-1001-20261123    clang-17
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2200-20261122    gcc-13.5.0 smatch
sh                   randconfig-r2102-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2104-20261122    gcc-14.4.0 cocci
sh                   randconfig-r2106-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2109-20261122    gcc-8.5.0  cocci
sh                   randconfig-r2301-20261122    clang-24   sparse
sh                   randconfig-r2309-20261122    gcc-11.5.0 sparse
sh                           rsk7269_defconfig    clang-24
sh                            sh2007_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261123    gcc-14
sparc                 randconfig-1001-20261123    gcc-14
sparc                 randconfig-2000-20261122    clang-21
sparc                 randconfig-2001-20261122    clang-21
sparc                 randconfig-2200-20261122    gcc-16.2.0 smatch
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                randconfig-r2103-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2107-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2306-20261122    gcc-12.5.0 sparse
sparc                randconfig-r2306-20261122    gcc-15.3.0 sparse
sparc                randconfig-r2308-20261122    gcc-12.5.0 sparse
sparc                randconfig-r2310-20261122    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261123    gcc-14
sparc64               randconfig-1001-20261123    gcc-14
sparc64               randconfig-2000-20261122    clang-21
sparc64               randconfig-2001-20261122    clang-21
sparc64               randconfig-2200-20261122    clang-20   smatch
sparc64              randconfig-r2107-20261122    clang-22   cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261123    gcc-14
um                    randconfig-1001-20261123    gcc-14
um                    randconfig-2000-20261122    clang-21
um                    randconfig-2001-20261122    clang-21
um                    randconfig-2200-20261122    gcc-14     smatch
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261123    clang-22
x86_64      buildonly-randconfig-1001-20261123    clang-22
x86_64      buildonly-randconfig-1002-20261123    clang-22
x86_64      buildonly-randconfig-1003-20261123    clang-22
x86_64      buildonly-randconfig-1004-20261123    clang-22
x86_64      buildonly-randconfig-1005-20261123    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261123    gcc-14
x86_64                randconfig-1001-20261123    gcc-14
x86_64                randconfig-1002-20261123    gcc-14
x86_64                randconfig-1003-20261123    gcc-14
x86_64                randconfig-1004-20261123    gcc-14
x86_64                randconfig-1005-20261123    gcc-14
x86_64                randconfig-1006-20261123    gcc-14
x86_64                randconfig-1007-20261123    gcc-14
x86_64                randconfig-1008-20261123    gcc-14
x86_64                randconfig-1009-20261123    gcc-14
x86_64                randconfig-1010-20261123    gcc-14
x86_64                randconfig-1011-20261123    gcc-14
x86_64                randconfig-1012-20261123    gcc-14
x86_64                randconfig-1013-20261123    gcc-14
x86_64                randconfig-1014-20261123    gcc-14
x86_64                randconfig-1015-20261123    gcc-14
x86_64                randconfig-1016-20261123    gcc-14
x86_64                randconfig-1017-20261123    gcc-14
x86_64                randconfig-2000-20261122    clang-22
x86_64                randconfig-2001-20261122    clang-22
x86_64                randconfig-2002-20261122    clang-22
x86_64                randconfig-2003-20261122    clang-22
x86_64                randconfig-2004-20261122    clang-22
x86_64                randconfig-2005-20261122    clang-22
x86_64                randconfig-2100-20261122    clang-22   cocci
x86_64                randconfig-2100-20261122    gcc-14     cocci
x86_64                randconfig-2101-20261122    gcc-14     cocci
x86_64                randconfig-2102-20261122    gcc-14     cocci
x86_64                randconfig-2103-20261122    clang-22   cocci
x86_64                randconfig-2103-20261122    gcc-14     cocci
x86_64                randconfig-2104-20261122    gcc-14     cocci
x86_64                randconfig-2105-20261122    clang-22   cocci
x86_64                randconfig-2105-20261122    gcc-14     cocci
x86_64                randconfig-2200-20261122    clang-22   smatch
x86_64                randconfig-2300-20261122    clang-22   sparse
x86_64                randconfig-2301-20261122    clang-22   sparse
x86_64                randconfig-2302-20261122    clang-22   sparse
x86_64               randconfig-r2309-20261122    gcc-12.5.0 sparse
x86_64               randconfig-r2310-20261122    gcc-15.3.0 sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    clang-24
xtensa                randconfig-1000-20261123    gcc-14
xtensa                randconfig-1001-20261123    gcc-14
xtensa                randconfig-2000-20261122    gcc-9.5.0
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261122    gcc-9.5.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa               randconfig-r2110-20261122    gcc-16.2.0 cocci
xtensa               randconfig-r2300-20261122    clang-24   sparse
xtensa               randconfig-r2307-20261122    gcc-12.5.0 sparse
xtensa                     smp_lx200_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
