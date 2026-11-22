Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346906;
	b=ejgFCk7m2lmvJJFMbqCsYitlN2+gob/V52PtwXoXr7/WeHhwsRh2J//qovGfuFXXVJUq
	 F27Z4kqYDf3xKvoGum50XIEmPMWcr32z7yE2pFGDjtUHrD4DSuDyY0kGJJCBum29CkM+c
	 cdju3S6iIIh2ku96gwzX9jozpl0/bSx4ueesTNkO44Vao35EbVshZMrJGP3N2HaubHxx3
	 MM0p9fK5kuhqLdjohCAAK5YpUsgyNnwBHKcZEUzLhx3fsHJaLQ/YjJQsuHEcPIm8kUNeX
	 7IkdqCfuQxxP1NdlZqb42pauKbOlX1ZznDU/SYv3VBIaxhtTG0AnMa0BHSZIgexVSug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346906;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dQ9k2XyMW531bcwtXS2tqGuO0JNXh16yLgkITKVDbs4=;
	b=ihFesqpsnd4zp8YHkUBbSi5aTGolWmjRpYjwfcP2VSh86bPi7wV9XpI2V9aJ6aDVbx2L
	 tcccolTKWKJ6xGNu3ARpacyqFhVa8rC7BbwBj+4SdYMMZ5Cui2drvTtulWrd7vLaBQ9k3
	 zy9lHyj1kOhbVXuvvmXEOayC4V/UX1d1yRu4LL+WVO4H3qRnHUDEB/dmPAOvQ8y9Cx70v
	 Zzl+WpwtOvWZW0dXB2DsJi0yUElK/2HZVGekMq7s+9LS51ZuQzP7L4o3c13rl/5/oFKr1
	 ry1ABmAF/HGevimHHoP0oa7Fk4UnNGDV+6x5CyTPyBwTEvgwBhqhmJ8YqOtzSfksLpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ElDkHxVZ;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55953606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55953606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ElDkHxVZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795346906; x=1826882906;
  h=date:from:to:cc:subject:message-id;
  bh=8d5rJvt6cPmOSYDGulSDshqf2Vf91UfqdxgZk0xz2g0=;
  b=ElDkHxVZ3R4OFODVyGnKKI9koYGlaI7vA6WZE/fC8C2oSpvwG0wzn4tN
   c5CypFLZWG4usRSF/kLdMCvLkhb8U+deDWo/EdE7tsQ3YhraOKhBTfs/F
   Mzv4hN98ZN1mTLUuL9fh2Lofzo10fAwhkiZb4UaCNZoYHE2v3YKqgk5Uq
   xkg5uSB8IA/GaeUlytqddJqICFUZXGl4Hjfo21AaN2q4MhicwjlSYCwgV
   PjkMUoBLBywSeJGW1zw9lvg6ab2kPJrY7D3el5vFOSaBCnCC4/RVKCQqL
   Z/ZRhFujLPsSFzYE0ByEjsle94A/7St19bSOK6aTGf2EEaTVCnBbRr5pj
   w==;
X-CSE-ConnectionGUID: lGlErU7HQGCzuHssj3a5/g==
X-CSE-MsgGUID: o0tWf284QouxHbtWmR8wPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4061129"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4061129"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:28:25 -0800
X-CSE-ConnectionGUID: +1m4VG4/Tn6rqZTKJCBV7Q==
X-CSE-MsgGUID: Kngm8KiARq+skERP5pmwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11200427"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2026 03:28:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV5k5-00000001LPI-0Gx2;
	Sun, 22 Nov 2026 11:28:21 +0000
Date: Sun, 22 Nov 2026 19:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip:urgent] BUILD SUCCESS
 c1e238a25aeca759e5d424fb4072b944158e8bff
Message-ID: <20261122192749.CQnHWRhR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: c1e238a25aeca759e5d424fb4072b944158e8bff  Merge branch into tip/master: 'x86/mm'

elapsed time: 873m

configs tested: 478
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261121    gcc-14.4.0
alpha                 randconfig-2001-20261121    gcc-14.4.0
alpha                 randconfig-2200-20261121    gcc-10.5.0 smatch
alpha                randconfig-r2100-20261121    gcc-16.2.0 cocci
alpha                randconfig-r2101-20261121    gcc-8.5.0  cocci
alpha                randconfig-r2111-20261121    gcc-13.5.0 cocci
alpha                randconfig-r2302-20261121    gcc-8.5.0  sparse
alpha                randconfig-r2309-20261121    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261122    clang-17
arc                   randconfig-1001-20261122    clang-17
arc                   randconfig-2000-20261121    gcc-8.5.0
arc                   randconfig-2001-20261121    gcc-8.5.0
arc                   randconfig-2002-20261121    gcc-8.5.0
arc                   randconfig-2003-20261121    gcc-8.5.0
arc                   randconfig-2004-20261121    gcc-8.5.0
arc                   randconfig-2005-20261121    gcc-8.5.0
arc                   randconfig-2200-20261121    gcc-14.4.0 smatch
arc                  randconfig-r2302-20261121    gcc-13.5.0 sparse
arc                  randconfig-r2303-20261121    gcc-13.5.0 sparse
arc                  randconfig-r2306-20261121    clang-18   sparse
arc                  randconfig-r2307-20261121    clang-22   sparse
arc                  randconfig-r2310-20261121    gcc-10.5.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-17
arm                        multi_v4t_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261122    clang-17
arm                   randconfig-1001-20261122    clang-17
arm                   randconfig-1002-20261122    clang-17
arm                   randconfig-1003-20261122    clang-17
arm                   randconfig-2000-20261121    clang-17
arm                   randconfig-2000-20261121    clang-24
arm                   randconfig-2001-20261121    clang-24
arm                   randconfig-2002-20261121    clang-24
arm                   randconfig-2200-20261121    clang-19   smatch
arm                  randconfig-r2103-20261121    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261121    gcc-11.5.0 cocci
arm                  randconfig-r2108-20261121    clang-18   cocci
arm                  randconfig-r2108-20261121    clang-20   cocci
arm                  randconfig-r2108-20261121    gcc-16.2.0 cocci
arm                  randconfig-r2300-20261121    clang-24   sparse
arm                  randconfig-r2304-20261121    gcc-8.5.0  sparse
arm                  randconfig-r2305-20261121    gcc-8.5.0  sparse
arm                         shmobile_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261122    gcc-8.5.0
arm64                 randconfig-1001-20261122    gcc-8.5.0
arm64                 randconfig-1002-20261122    gcc-8.5.0
arm64                 randconfig-1003-20261122    gcc-8.5.0
arm64                 randconfig-2000-20261121    clang-24
arm64                 randconfig-2000-20261121    gcc-15.3.0
arm64                 randconfig-2001-20261121    clang-24
arm64                 randconfig-2001-20261121    gcc-13.5.0
arm64                 randconfig-2002-20261121    clang-24
arm64                 randconfig-2200-20261121    clang-22   smatch
arm64                randconfig-r2100-20261121    gcc-15.3.0 cocci
arm64                randconfig-r2104-20261121    gcc-15.3.0 cocci
arm64                randconfig-r2105-20261121    gcc-16.2.0 cocci
arm64                randconfig-r2105-20261121    gcc-8.5.0  cocci
arm64                randconfig-r2110-20261121    clang-17   cocci
arm64                randconfig-r2111-20261121    clang-24   cocci
arm64                randconfig-r2300-20261121    gcc-14.4.0 sparse
arm64                randconfig-r2301-20261121    clang-24   sparse
arm64                randconfig-r2301-20261121    gcc-11.5.0 sparse
arm64                randconfig-r2307-20261121    gcc-10.5.0 sparse
arm64                randconfig-r2308-20261121    gcc-11.5.0 sparse
arm64                randconfig-r2310-20261121    clang-22   sparse
arm64                randconfig-r2310-20261121    gcc-14     sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261122    gcc-8.5.0
csky                  randconfig-1001-20261122    gcc-8.5.0
csky                  randconfig-2000-20261121    gcc-16.2.0
csky                  randconfig-2001-20261121    gcc-16.2.0
csky                  randconfig-2200-20261121    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261121    gcc-16.2.0 cocci
csky                 randconfig-r2101-20261121    gcc-8.5.0  cocci
csky                 randconfig-r2105-20261121    gcc-16.2.0 cocci
csky                 randconfig-r2109-20261121    gcc-13.5.0 cocci
csky                 randconfig-r2306-20261121    clang-22   sparse
csky                 randconfig-r2306-20261121    gcc-10.5.0 sparse
csky                 randconfig-r2311-20261121    clang-18   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261122    gcc-8.5.0
hexagon               randconfig-1001-20261122    gcc-8.5.0
hexagon               randconfig-2000-20261121    gcc-16.2.0
hexagon               randconfig-2001-20261121    gcc-16.2.0
hexagon               randconfig-2200-20261121    clang-24   smatch
hexagon              randconfig-r2102-20261121    gcc-15.3.0 cocci
hexagon              randconfig-r2102-20261121    gcc-16.2.0 cocci
hexagon              randconfig-r2102-20261121    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261121    gcc-15.3.0 cocci
hexagon              randconfig-r2104-20261121    gcc-16.2.0 cocci
hexagon              randconfig-r2305-20261121    clang-24   sparse
hexagon              randconfig-r2305-20261121    gcc-14.4.0 sparse
hexagon              randconfig-r2308-20261121    clang-22   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261122    gcc-14
i386        buildonly-randconfig-1001-20261122    gcc-14
i386        buildonly-randconfig-1002-20261122    gcc-14
i386        buildonly-randconfig-1003-20261122    gcc-14
i386        buildonly-randconfig-1004-20261122    gcc-14
i386        buildonly-randconfig-1005-20261122    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261122    gcc-14
i386                  randconfig-1001-20261122    gcc-14
i386                  randconfig-1002-20261122    gcc-14
i386                  randconfig-1003-20261122    gcc-14
i386                  randconfig-1004-20261122    gcc-14
i386                  randconfig-1005-20261122    gcc-14
i386                  randconfig-1006-20261122    gcc-14
i386                  randconfig-1007-20261122    gcc-14
i386                  randconfig-1008-20261122    gcc-14
i386                  randconfig-1009-20261122    gcc-14
i386                  randconfig-1010-20261122    gcc-14
i386                  randconfig-1011-20261122    gcc-14
i386                  randconfig-1012-20261122    gcc-14
i386                  randconfig-1013-20261122    gcc-14
i386                  randconfig-2000-20261121    gcc-14
i386                  randconfig-2001-20261121    gcc-14
i386                  randconfig-2002-20261121    gcc-14
i386                  randconfig-2003-20261121    gcc-14
i386                  randconfig-2004-20261121    gcc-14
i386                  randconfig-2005-20261121    gcc-14
i386                  randconfig-2100-20261121    clang-22   cocci
i386                  randconfig-2101-20261121    clang-22   cocci
i386                  randconfig-2102-20261121    clang-22   cocci
i386                  randconfig-2103-20261121    clang-22   cocci
i386                  randconfig-2104-20261121    clang-22   cocci
i386                  randconfig-2105-20261121    clang-22   cocci
i386                  randconfig-2200-20261121    clang-22   smatch
i386                  randconfig-2300-20261121    gcc-14     sparse
i386                  randconfig-2301-20261121    gcc-14     sparse
i386                  randconfig-2302-20261121    gcc-14     sparse
i386                 randconfig-r2110-20261121    clang-22   cocci
i386                 randconfig-r2111-20261121    clang-20   cocci
i386                 randconfig-r2300-20261121    gcc-8.5.0  sparse
i386                 randconfig-r2311-20261121    gcc-10.5.0 sparse
i386                 randconfig-r2311-20261121    gcc-11.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261122    gcc-8.5.0
loongarch             randconfig-1001-20261122    gcc-8.5.0
loongarch             randconfig-2000-20261121    clang-22
loongarch             randconfig-2001-20261121    clang-22
loongarch             randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch            randconfig-r2100-20261121    gcc-8.5.0  cocci
loongarch            randconfig-r2102-20261121    gcc-16.2.0 cocci
loongarch            randconfig-r2111-20261121    gcc-16.2.0 cocci
loongarch            randconfig-r2301-20261121    gcc-14.4.0 sparse
loongarch            randconfig-r2311-20261121    clang-22   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    clang-17
m68k                  randconfig-2000-20261121    gcc-14.4.0
m68k                  randconfig-2001-20261121    gcc-14.4.0
m68k                  randconfig-2200-20261121    gcc-8.5.0  smatch
m68k                 randconfig-r2105-20261121    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261121    gcc-8.5.0  cocci
m68k                 randconfig-r2301-20261121    gcc-12.5.0 sparse
m68k                 randconfig-r2303-20261121    gcc-14.4.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261121    gcc-14.4.0
microblaze            randconfig-2001-20261121    gcc-14.4.0
microblaze            randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze           randconfig-r2101-20261121    gcc-16.2.0 cocci
microblaze           randconfig-r2105-20261121    gcc-15.3.0 cocci
microblaze           randconfig-r2106-20261121    clang-20   cocci
microblaze           randconfig-r2106-20261121    gcc-16.2.0 cocci
microblaze           randconfig-r2107-20261121    clang-17   cocci
microblaze           randconfig-r2107-20261121    gcc-16.2.0 cocci
microblaze           randconfig-r2304-20261121    gcc-13.5.0 sparse
microblaze           randconfig-r2304-20261121    gcc-14.4.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                            mtx1_defconfig    clang-17
mips                  randconfig-2000-20261121    clang-24
mips                  randconfig-2000-20261121    gcc-16.2.0
mips                  randconfig-2001-20261121    gcc-16.2.0
mips                  randconfig-2001-20261121    gcc-8.5.0
mips                  randconfig-2002-20261121    clang-24
mips                  randconfig-2002-20261121    gcc-16.2.0
mips                  randconfig-2200-20261121    clang-21   smatch
mips                 randconfig-r2100-20261121    gcc-8.5.0  cocci
mips                 randconfig-r2109-20261121    clang-17   cocci
mips                 randconfig-r2109-20261121    clang-18   cocci
mips                 randconfig-r2110-20261121    gcc-16.2.0 cocci
mips                 randconfig-r2111-20261121    gcc-8.5.0  cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261122    gcc-8.5.0
nios2                 randconfig-1001-20261122    gcc-8.5.0
nios2                 randconfig-2000-20261121    clang-22
nios2                 randconfig-2001-20261121    clang-22
nios2                 randconfig-2200-20261121    gcc-10.5.0 smatch
nios2                randconfig-r2100-20261121    gcc-9.5.0  cocci
nios2                randconfig-r2106-20261121    clang-17   cocci
nios2                randconfig-r2106-20261121    gcc-13.5.0 cocci
nios2                randconfig-r2111-20261121    clang-17   cocci
nios2                randconfig-r2303-20261121    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261121    gcc-12.5.0
openrisc              randconfig-2000-20261121    gcc-16.2.0
openrisc              randconfig-2001-20261121    gcc-14.4.0
openrisc              randconfig-2001-20261121    gcc-16.2.0
openrisc              randconfig-2002-20261121    gcc-16.2.0
openrisc              randconfig-2200-20261121    gcc-14.4.0 smatch
openrisc             randconfig-r2102-20261121    gcc-8.5.0  cocci
openrisc             randconfig-r2104-20261121    gcc-8.5.0  cocci
openrisc             randconfig-r2106-20261121    clang-18   cocci
openrisc             randconfig-r2106-20261121    gcc-8.5.0  cocci
openrisc             randconfig-r2109-20261121    gcc-16.2.0 cocci
openrisc             randconfig-r2111-20261121    clang-18   cocci
openrisc             randconfig-r2302-20261121    gcc-11.5.0 sparse
openrisc             randconfig-r2303-20261121    gcc-11.5.0 sparse
openrisc             randconfig-r2304-20261121    gcc-13.5.0 sparse
openrisc             randconfig-r2306-20261121    clang-22   sparse
openrisc             randconfig-r2308-20261121    gcc-10.5.0 sparse
openrisc             randconfig-r2309-20261121    gcc-14     sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261122    clang-24
parisc                randconfig-1001-20261122    clang-24
parisc                randconfig-2000-20261121    clang-22
parisc                randconfig-2001-20261121    clang-22
parisc                randconfig-2200-20261121    gcc-16.2.0 smatch
parisc               randconfig-r2103-20261121    gcc-16.2.0 cocci
parisc               randconfig-r2107-20261121    clang-18   cocci
parisc               randconfig-r2107-20261121    gcc-13.5.0 cocci
parisc               randconfig-r2300-20261121    gcc-11.5.0 sparse
parisc               randconfig-r2304-20261121    clang-24   sparse
parisc               randconfig-r2309-20261121    clang-22   sparse
parisc               randconfig-r2311-20261121    gcc-14     sparse
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                    bluestone_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc               randconfig-1000-20261122    clang-24
powerpc               randconfig-1001-20261122    clang-24
powerpc               randconfig-2000-20261121    clang-24
powerpc               randconfig-2001-20261121    clang-24
powerpc               randconfig-2002-20261121    clang-24
powerpc               randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc              randconfig-r2103-20261121    clang-17   cocci
powerpc              randconfig-r2103-20261121    gcc-8.5.0  cocci
powerpc              randconfig-r2109-20261121    clang-24   cocci
powerpc              randconfig-r2305-20261121    gcc-11.5.0 sparse
powerpc              randconfig-r2309-20261121    clang-18   sparse
powerpc              randconfig-r2309-20261121    gcc-10.5.0 sparse
powerpc              randconfig-r2310-20261121    clang-18   sparse
powerpc              randconfig-r2310-20261121    gcc-11.5.0 sparse
powerpc                      sequoia_defconfig    clang-17
powerpc64             randconfig-1000-20261122    clang-24
powerpc64             randconfig-1001-20261122    clang-24
powerpc64             randconfig-2000-20261121    clang-24
powerpc64             randconfig-2001-20261121    clang-24
powerpc64             randconfig-2002-20261121    clang-24
powerpc64             randconfig-2200-20261121    gcc-10.5.0 smatch
powerpc64            randconfig-r2106-20261121    gcc-16.2.0 cocci
powerpc64            randconfig-r2303-20261121    gcc-8.5.0  sparse
powerpc64            randconfig-r2304-20261121    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261122    gcc-9.5.0
riscv                 randconfig-1001-20261122    gcc-9.5.0
riscv                 randconfig-2000-20261121    gcc-9.5.0
riscv                 randconfig-2001-20261121    gcc-11.5.0
riscv                 randconfig-2001-20261121    gcc-9.5.0
riscv                 randconfig-2002-20261121    clang-17
riscv                 randconfig-2002-20261121    gcc-9.5.0
riscv                 randconfig-2003-20261121    gcc-11.5.0
riscv                 randconfig-2003-20261121    gcc-9.5.0
riscv                 randconfig-2004-20261121    gcc-8.5.0
riscv                 randconfig-2004-20261121    gcc-9.5.0
riscv                 randconfig-2005-20261121    clang-17
riscv                 randconfig-2005-20261121    gcc-9.5.0
riscv                 randconfig-2200-20261121    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261122    gcc-9.5.0
s390                  randconfig-1001-20261122    gcc-9.5.0
s390                  randconfig-2000-20261121    clang-22
s390                  randconfig-2001-20261121    clang-22
s390                  randconfig-2002-20261121    clang-22
s390                  randconfig-2003-20261121    clang-22
s390                  randconfig-2004-20261121    clang-22
s390                  randconfig-2005-20261121    clang-22
s390                  randconfig-2200-20261121    gcc-8.5.0  smatch
s390                 randconfig-r2101-20261121    gcc-15.3.0 cocci
s390                 randconfig-r2107-20261121    clang-20   cocci
s390                 randconfig-r2108-20261121    clang-17   cocci
s390                 randconfig-r2110-20261121    clang-20   cocci
s390                 randconfig-r2110-20261121    gcc-13.5.0 cocci
s390                 randconfig-r2302-20261121    gcc-14.4.0 sparse
s390                 randconfig-r2306-20261121    gcc-11.5.0 sparse
s390                 randconfig-r2307-20261121    clang-18   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261122    gcc-9.5.0
sh                    randconfig-1001-20261122    gcc-9.5.0
sh                    randconfig-2000-20261121    gcc-12.5.0
sh                    randconfig-2000-20261121    gcc-16.2.0
sh                    randconfig-2001-20261121    gcc-10.5.0
sh                    randconfig-2001-20261121    gcc-16.2.0
sh                    randconfig-2002-20261121    gcc-16.2.0
sh                    randconfig-2003-20261121    gcc-16.2.0
sh                    randconfig-2004-20261121    gcc-16.2.0
sh                    randconfig-2005-20261121    gcc-10.5.0
sh                    randconfig-2005-20261121    gcc-16.2.0
sh                    randconfig-2200-20261121    gcc-10.5.0 smatch
sh                   randconfig-r2101-20261121    gcc-8.5.0  cocci
sh                   randconfig-r2104-20261121    gcc-8.5.0  cocci
sh                   randconfig-r2107-20261121    gcc-16.2.0 cocci
sh                   randconfig-r2306-20261121    gcc-14     sparse
sh                   randconfig-r2307-20261121    gcc-11.5.0 sparse
sh                   randconfig-r2308-20261121    clang-22   sparse
sh                           rsk7203_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261122    clang-24
sparc                 randconfig-1001-20261122    clang-24
sparc                 randconfig-2000-20261121    gcc-8.5.0
sparc                 randconfig-2001-20261121    gcc-8.5.0
sparc                 randconfig-2200-20261121    gcc-8.5.0  smatch
sparc                randconfig-r2100-20261121    gcc-16.2.0 cocci
sparc                randconfig-r2109-20261121    gcc-8.5.0  cocci
sparc                randconfig-r2110-20261121    clang-18   cocci
sparc                randconfig-r2301-20261121    gcc-11.5.0 sparse
sparc                randconfig-r2305-20261121    gcc-13.5.0 sparse
sparc                randconfig-r2308-20261121    clang-18   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261122    clang-24
sparc64               randconfig-1001-20261122    clang-24
sparc64               randconfig-2000-20261121    gcc-8.5.0
sparc64               randconfig-2001-20261121    gcc-8.5.0
sparc64               randconfig-2200-20261121    clang-20   smatch
sparc64              randconfig-r2108-20261121    clang-20   cocci
sparc64              randconfig-r2108-20261121    gcc-8.5.0  cocci
sparc64              randconfig-r2109-20261121    clang-20   cocci
sparc64              randconfig-r2301-20261121    gcc-8.5.0  sparse
sparc64              randconfig-r2302-20261121    clang-24   sparse
sparc64              randconfig-r2302-20261121    gcc-11.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261122    clang-24
um                    randconfig-1001-20261122    clang-24
um                    randconfig-2000-20261121    gcc-8.5.0
um                    randconfig-2001-20261121    gcc-8.5.0
um                    randconfig-2200-20261121    gcc-14     smatch
um                   randconfig-r2108-20261121    gcc-13.5.0 cocci
um                   randconfig-r2300-20261121    clang-24   sparse
um                   randconfig-r2307-20261121    clang-22   sparse
um                   randconfig-r2307-20261121    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261122    gcc-14
x86_64                randconfig-1001-20261122    gcc-14
x86_64                randconfig-1002-20261122    gcc-14
x86_64                randconfig-1003-20261122    gcc-14
x86_64                randconfig-1004-20261122    gcc-14
x86_64                randconfig-1005-20261122    gcc-14
x86_64                randconfig-1006-20261122    gcc-14
x86_64                randconfig-1007-20261122    gcc-14
x86_64                randconfig-1008-20261122    gcc-14
x86_64                randconfig-1009-20261122    gcc-14
x86_64                randconfig-1010-20261122    gcc-14
x86_64                randconfig-1011-20261122    gcc-14
x86_64                randconfig-1012-20261122    clang-22
x86_64                randconfig-1013-20261122    clang-22
x86_64                randconfig-1014-20261122    clang-22
x86_64                randconfig-1015-20261122    clang-22
x86_64                randconfig-1016-20261122    clang-22
x86_64                randconfig-1017-20261122    clang-22
x86_64                randconfig-2000-20261121    clang-22
x86_64                randconfig-2000-20261121    gcc-14
x86_64                randconfig-2001-20261121    clang-22
x86_64                randconfig-2001-20261121    gcc-14
x86_64                randconfig-2002-20261121    clang-22
x86_64                randconfig-2002-20261121    gcc-14
x86_64                randconfig-2003-20261121    gcc-14
x86_64                randconfig-2004-20261121    gcc-14
x86_64                randconfig-2005-20261121    clang-22
x86_64                randconfig-2005-20261121    gcc-14
x86_64                randconfig-2100-20261121    clang-22   cocci
x86_64                randconfig-2100-20261121    gcc-14     cocci
x86_64                randconfig-2101-20261121    gcc-14     cocci
x86_64                randconfig-2102-20261121    gcc-14     cocci
x86_64                randconfig-2103-20261121    clang-22   cocci
x86_64                randconfig-2103-20261121    gcc-14     cocci
x86_64                randconfig-2104-20261121    clang-22   cocci
x86_64                randconfig-2104-20261121    gcc-14     cocci
x86_64                randconfig-2105-20261121    gcc-14     cocci
x86_64                randconfig-2200-20261121    gcc-14     smatch
x86_64                randconfig-2300-20261121    gcc-14     sparse
x86_64                randconfig-2301-20261121    gcc-14     sparse
x86_64                randconfig-2302-20261121    gcc-14     sparse
x86_64               randconfig-r2102-20261121    gcc-14     cocci
x86_64               randconfig-r2103-20261121    gcc-16.2.0 cocci
x86_64               randconfig-r2110-20261121    gcc-8.5.0  cocci
x86_64               randconfig-r2300-20261121    gcc-11.5.0 sparse
x86_64               randconfig-r2303-20261121    clang-24   sparse
x86_64               randconfig-r2305-20261121    gcc-14     sparse
x86_64               randconfig-r2308-20261121    gcc-14     sparse
x86_64               randconfig-r2309-20261121    clang-22   sparse
x86_64               randconfig-r2310-20261121    clang-22   sparse
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
xtensa                   nommu_kc705_defconfig    clang-17
xtensa                randconfig-1000-20261122    clang-24
xtensa                randconfig-1001-20261122    clang-24
xtensa                randconfig-2000-20261121    gcc-16.2.0
xtensa                randconfig-2001-20261121    gcc-16.2.0
xtensa                randconfig-2200-20261121    gcc-12.5.0 smatch
xtensa               randconfig-r2300-20261121    gcc-13.5.0 sparse
xtensa               randconfig-r2301-20261121    gcc-13.5.0 sparse
xtensa               randconfig-r2302-20261121    gcc-9.5.0  sparse
xtensa               randconfig-r2304-20261121    gcc-11.5.0 sparse
xtensa               randconfig-r2305-20261121    gcc-11.5.0 sparse
xtensa               randconfig-r2311-20261121    clang-22   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
