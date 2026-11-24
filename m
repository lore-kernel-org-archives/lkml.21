Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498178;
	b=gfT/LOj0QGYcK/B0OS5dpbtn9ktx0M8uzPUCBFGrO2e8BK4yHXEhCirPoaT8Rqurvb8+
	 M81lxpXH/pozubwO8KMG+85Nenbl2qQqGO6MB2P33gnRsgWyh0UHthjD1mtNIyzOzLXRL
	 gKiCrgMzZnCE3taORd25O8JFqolhFV0Ho4FH5gXmaABED+7Drq+4gWFkH8CcE/HZXbQES
	 DiCmISjegTFfZg//vefZM7jfNAkg77eH8ayjEv1lcDnn0mUVmN1vvbu417OT/aXVcqPA/
	 cjKQpSOUokzfxxcq8lD/yo7JpyO1fIG54gKLQSxFi5vEXpBy1PeVhkqKDGnW2nvKTJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u+dq1BGi9qkABOZs+ZJ6gh85YH3mWvpTA1yuiOtOAks=;
	b=pC08jelFDMC3w5AmmbwKCja5eK/nM21Xeb9oqmr66zO3d6e0YKw66uUluHw/dHcW+FTv
	 9O1dGrmXowpF16t7wcp+mgFejEjGZ2kNnMRf5TJqUOx5fYJpgLUsy2rTpb7g9BQpDf0dx
	 gkt4Ob6nShksMlhEdAk5INiK8mGP4zj+bo+YonklTSVlrI0rJ08Bv0PeVx1XRNFwBbfZh
	 wfgZIt+QVVv7r1ZK97GgZ8gBiP+hXfGELxUSAPQZHlVbMncPWKDbn7h4gy+3iNPKeIfX2
	 xgOfGjFGEC5xWojIrj58m1DNs2dNvZ4Q2jZQPf2UjCi3bY8L67bgDRjcFTZc5Dax+Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i3frLNur;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636B606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C636B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i3frLNur
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795498177; x=1827034177;
  h=date:from:to:cc:subject:message-id;
  bh=TqL2KrbLEqC63tfARxzszVLdVj5nGZldwqT8mQCsVW0=;
  b=i3frLNurWenANgpZ+0MJJ+E9dPoqcr7O0B4peN6HDSiBkKrHAVhBefgz
   UBR6kHALssYHp089zt7CWNojaVaeBpefyta6w1LK0H+Jh4fXSFCxjkr0O
   /b7ceLCnCufqOjB2D810Z30daisWqWegdeJZnwm7Q0ts5GnLA1R0gQzOI
   JraK4BE3TC/4ZLdXp4R3otJEc2vaYe7r4V2JK3UlbEJwM9FbC1QscPT32
   zUZrrcidnPwTqxJ/CkXpVL/PFatjo0YBfr7EpF5owvX9mTvXIP2B9fkCg
   0ualb3fLajp1xSkkVmvVZEgTpMFA43z3h1WOwfRj+f5b6tUiCqins/KKx
   w==;
X-CSE-ConnectionGUID: AWSbzBrdQveOMzoL2n1WbQ==
X-CSE-MsgGUID: 8peUjU4rTUSRm5ktfAe46g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4205035"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4205035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 21:29:27 -0800
X-CSE-ConnectionGUID: jqc4bbMHR7eenMeRW9IQfw==
X-CSE-MsgGUID: kbh2L2fnRUyuRinyOUrQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11807692"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Nov 2026 21:29:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVj5m-00000001OZs-3uUw;
	Tue, 24 Nov 2026 05:29:22 +0000
Date: Tue, 24 Nov 2026 13:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 86d477c009ed7f3a24b420b7f4aa314fabe36be3
Message-ID: <20261124132911.hozDB4dT-lkp@intel.com>
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
branch HEAD: 86d477c009ed7f3a24b420b7f4aa314fabe36be3  x86/entry: Make SafeRET robust also against NMIs

elapsed time: 775m

configs tested: 342
configs skipped: 210

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261123    gcc-8.5.0
alpha                 randconfig-2001-20261123    gcc-8.5.0
alpha                 randconfig-2200-20261123    gcc-12.5.0 smatch
alpha                randconfig-r2101-20261123    gcc-8.5.0  cocci
alpha                randconfig-r2103-20261123    clang-24   cocci
alpha                randconfig-r2110-20261123    gcc-13.5.0 cocci
alpha                randconfig-r2111-20261123    gcc-8.5.0  cocci
arc                                allnoconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261124    clang-24
arc                   randconfig-1001-20261124    clang-24
arc                   randconfig-2000-20261123    gcc-12.5.0
arc                   randconfig-2001-20261123    gcc-12.5.0
arc                   randconfig-2002-20261123    gcc-12.5.0
arc                   randconfig-2003-20261123    gcc-12.5.0
arc                   randconfig-2004-20261123    gcc-12.5.0
arc                   randconfig-2005-20261123    gcc-12.5.0
arc                   randconfig-2200-20261123    gcc-12.5.0 smatch
arc                  randconfig-r2102-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2111-20261123    clang-17   cocci
arc                  randconfig-r2307-20261123    gcc-10.5.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                          at91_dt_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    clang-24
arm                   randconfig-1000-20261124    clang-24
arm                   randconfig-1001-20261124    clang-24
arm                   randconfig-1002-20261124    clang-24
arm                   randconfig-1003-20261124    clang-24
arm                   randconfig-2000-20261123    gcc-8.5.0
arm                   randconfig-2001-20261123    gcc-8.5.0
arm                   randconfig-2002-20261123    gcc-8.5.0
arm                   randconfig-2200-20261123    gcc-8.5.0  smatch
arm                  randconfig-r2105-20261123    clang-24   cocci
arm                  randconfig-r2106-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261123    gcc-13.5.0 cocci
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261124    gcc-8.5.0
arm64                 randconfig-1001-20261124    gcc-8.5.0
arm64                 randconfig-1002-20261124    gcc-8.5.0
arm64                 randconfig-1003-20261124    gcc-8.5.0
arm64                 randconfig-2000-20261123    gcc-8.5.0
arm64                 randconfig-2001-20261123    gcc-8.5.0
arm64                 randconfig-2002-20261123    gcc-8.5.0
arm64                 randconfig-2200-20261123    clang-17   smatch
arm64                randconfig-r2106-20261123    clang-17   cocci
arm64                randconfig-r2109-20261123    clang-17   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261124    gcc-8.5.0
csky                  randconfig-1001-20261124    gcc-8.5.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2200-20261123    gcc-16.2.0 smatch
csky                 randconfig-r2107-20261123    clang-17   cocci
csky                 randconfig-r2111-20261123    gcc-14     cocci
csky                 randconfig-r2302-20261123    gcc-16.2.0 sparse
csky                 randconfig-r2310-20261123    gcc-10.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261124    gcc-10.5.0
hexagon               randconfig-1001-20261124    gcc-10.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2200-20261123    clang-24   smatch
hexagon              randconfig-r2305-20261123    gcc-16.2.0 sparse
hexagon              randconfig-r2309-20261123    gcc-15.3.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261124    gcc-12
i386        buildonly-randconfig-1001-20261124    gcc-12
i386        buildonly-randconfig-1002-20261124    gcc-12
i386        buildonly-randconfig-1003-20261124    gcc-12
i386        buildonly-randconfig-1004-20261124    gcc-12
i386        buildonly-randconfig-1005-20261124    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261124    gcc-14
i386                  randconfig-1001-20261124    gcc-14
i386                  randconfig-1002-20261124    gcc-14
i386                  randconfig-1003-20261124    gcc-14
i386                  randconfig-1004-20261124    gcc-14
i386                  randconfig-1005-20261124    gcc-14
i386                  randconfig-1006-20261124    gcc-14
i386                  randconfig-2000-20261123    gcc-14
i386                  randconfig-2001-20261123    gcc-14
i386                  randconfig-2002-20261123    gcc-14
i386                  randconfig-2003-20261123    gcc-14
i386                  randconfig-2004-20261123    gcc-14
i386                  randconfig-2005-20261123    gcc-14
i386                  randconfig-2100-20261123    clang-22   cocci
i386                  randconfig-2101-20261123    clang-22   cocci
i386                  randconfig-2102-20261123    clang-22   cocci
i386                  randconfig-2103-20261123    clang-22   cocci
i386                  randconfig-2104-20261123    clang-22   cocci
i386                  randconfig-2105-20261123    clang-22   cocci
i386                  randconfig-2200-20261123    gcc-14     smatch
i386                  randconfig-2300-20261123    gcc-13     sparse
i386                  randconfig-2300-20261123    gcc-14     sparse
i386                  randconfig-2301-20261123    clang-22   sparse
i386                  randconfig-2301-20261123    gcc-14     sparse
i386                  randconfig-2302-20261123    clang-22   sparse
i386                  randconfig-2302-20261123    gcc-14     sparse
i386                 randconfig-r2103-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2106-20261123    gcc-14     cocci
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261124    gcc-10.5.0
loongarch             randconfig-1001-20261124    gcc-10.5.0
loongarch             randconfig-2000-20261123    gcc-16.2.0
loongarch             randconfig-2001-20261123    gcc-16.2.0
loongarch             randconfig-2200-20261123    clang-24   smatch
loongarch            randconfig-r2106-20261123    gcc-13.5.0 cocci
loongarch            randconfig-r2107-20261123    gcc-14     cocci
loongarch            randconfig-r2301-20261123    clang-22   sparse
loongarch            randconfig-r2303-20261123    clang-18   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                           atari_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-24
m68k                        m5235evb_defconfig    clang-24
m68k                       m54418evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261123    gcc-8.5.0
m68k                  randconfig-2001-20261123    gcc-8.5.0
m68k                  randconfig-2200-20261123    gcc-8.5.0  smatch
m68k                 randconfig-r2105-20261123    gcc-8.5.0  cocci
m68k                 randconfig-r2300-20261123    clang-22   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261123    gcc-8.5.0
microblaze            randconfig-2200-20261123    gcc-16.2.0 smatch
microblaze           randconfig-r2103-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2309-20261123    gcc-10.5.0 sparse
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          cobalt_defconfig    clang-24
mips                     maltaup_xpa_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261123    gcc-10.5.0
mips                  randconfig-2001-20261123    gcc-10.5.0
mips                  randconfig-2002-20261123    gcc-10.5.0
mips                  randconfig-2200-20261123    gcc-14.4.0 smatch
mips                 randconfig-r2100-20261123    clang-24   cocci
mips                 randconfig-r2100-20261123    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261123    gcc-13.5.0 cocci
mips                 randconfig-r2300-20261123    clang-18   sparse
mips                 randconfig-r2304-20261123    clang-22   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261124    gcc-10.5.0
nios2                 randconfig-1001-20261124    gcc-10.5.0
nios2                 randconfig-2000-20261123    gcc-16.2.0
nios2                 randconfig-2001-20261123    gcc-16.2.0
nios2                 randconfig-2200-20261123    gcc-8.5.0  smatch
nios2                randconfig-r2108-20261123    clang-17   cocci
nios2                randconfig-r2109-20261123    gcc-8.5.0  cocci
nios2                randconfig-r2110-20261123    clang-17   cocci
nios2                randconfig-r2304-20261123    clang-22   sparse
nios2                randconfig-r2304-20261123    gcc-16.2.0 sparse
nios2                randconfig-r2308-20261123    gcc-15.3.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc              randconfig-2000-20261123    gcc-10.5.0
openrisc              randconfig-2001-20261123    gcc-10.5.0
openrisc              randconfig-2002-20261123    gcc-10.5.0
openrisc              randconfig-2200-20261123    gcc-12.5.0 smatch
openrisc             randconfig-r2100-20261123    gcc-8.5.0  cocci
openrisc             randconfig-r2108-20261123    gcc-13.5.0 cocci
openrisc             randconfig-r2301-20261123    clang-18   sparse
openrisc             randconfig-r2305-20261123    clang-22   sparse
parisc                             allnoconfig    clang-24
parisc                randconfig-1000-20261124    clang-24
parisc                randconfig-1001-20261124    clang-24
parisc                randconfig-2000-20261123    gcc-16.2.0
parisc                randconfig-2001-20261123    gcc-16.2.0
parisc                randconfig-2200-20261123    gcc-14.4.0 smatch
parisc               randconfig-r2109-20261123    gcc-13.5.0 cocci
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc               randconfig-1000-20261124    clang-24
powerpc               randconfig-1001-20261124    clang-24
powerpc               randconfig-2000-20261123    clang-21
powerpc               randconfig-2001-20261123    clang-21
powerpc               randconfig-2002-20261123    clang-21
powerpc               randconfig-2200-20261123    gcc-9.5.0  smatch
powerpc              randconfig-r2102-20261123    gcc-8.5.0  cocci
powerpc              randconfig-r2104-20261123    clang-24   cocci
powerpc              randconfig-r2110-20261123    gcc-8.5.0  cocci
powerpc              randconfig-r2305-20261123    clang-18   sparse
powerpc              randconfig-r2308-20261123    gcc-10.5.0 sparse
powerpc                     socrates_defconfig    gcc-16.2.0
powerpc                      tqm8541_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261124    clang-24
powerpc64             randconfig-1001-20261124    clang-24
powerpc64             randconfig-2000-20261123    clang-21
powerpc64             randconfig-2001-20261123    clang-21
powerpc64             randconfig-2002-20261123    clang-21
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64            randconfig-r2104-20261123    gcc-8.5.0  cocci
powerpc64            randconfig-r2300-20261123    gcc-16.2.0 sparse
powerpc64            randconfig-r2306-20261123    gcc-10.5.0 sparse
riscv                              allnoconfig    clang-24
riscv                 randconfig-1000-20261124    gcc-11.5.0
riscv                 randconfig-1001-20261124    gcc-11.5.0
riscv                 randconfig-2000-20261123    gcc-11.5.0
riscv                 randconfig-2001-20261123    gcc-11.5.0
riscv                 randconfig-2002-20261123    gcc-11.5.0
riscv                 randconfig-2003-20261123    gcc-11.5.0
riscv                 randconfig-2004-20261123    gcc-11.5.0
riscv                 randconfig-2005-20261123    gcc-11.5.0
riscv                 randconfig-2200-20261123    clang-17   smatch
riscv                randconfig-r2101-20261123    clang-24   cocci
riscv                randconfig-r2101-20261123    gcc-8.5.0  cocci
riscv                randconfig-r2301-20261123    gcc-16.2.0 sparse
riscv                randconfig-r2302-20261123    clang-22   sparse
riscv                randconfig-r2306-20261123    gcc-15.3.0 sparse
s390                               allnoconfig    clang-24
s390                  randconfig-1000-20261124    gcc-11.5.0
s390                  randconfig-1001-20261124    gcc-11.5.0
s390                  randconfig-2000-20261123    clang-20
s390                  randconfig-2001-20261123    clang-20
s390                  randconfig-2002-20261123    clang-20
s390                  randconfig-2003-20261123    clang-20
s390                  randconfig-2004-20261123    clang-20
s390                  randconfig-2005-20261123    clang-20
s390                  randconfig-2200-20261123    clang-24   smatch
s390                 randconfig-r2104-20261123    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261123    gcc-14     cocci
s390                 randconfig-r2109-20261123    gcc-14     cocci
s390                 randconfig-r2302-20261123    clang-22   sparse
s390                 randconfig-r2303-20261123    clang-22   sparse
s390                 randconfig-r2303-20261123    gcc-16.2.0 sparse
s390                 randconfig-r2304-20261123    clang-18   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                   defconfig    gcc-14
sh                             migor_defconfig    clang-24
sh                    randconfig-1000-20261124    gcc-11.5.0
sh                    randconfig-1001-20261124    gcc-11.5.0
sh                    randconfig-2000-20261123    gcc-16.2.0
sh                    randconfig-2001-20261123    gcc-16.2.0
sh                    randconfig-2002-20261123    gcc-16.2.0
sh                    randconfig-2003-20261123    gcc-16.2.0
sh                    randconfig-2004-20261123    gcc-16.2.0
sh                    randconfig-2005-20261123    gcc-16.2.0
sh                    randconfig-2200-20261123    gcc-16.2.0 smatch
sh                   randconfig-r2310-20261123    gcc-15.3.0 sparse
sh                   randconfig-r2311-20261123    gcc-10.5.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    clang-24
sh                            se7721_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                 randconfig-2000-20261123    gcc-9.5.0
sparc                 randconfig-2001-20261123    gcc-9.5.0
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                randconfig-r2108-20261123    gcc-8.5.0  cocci
sparc                randconfig-r2307-20261123    gcc-15.3.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-2000-20261123    gcc-9.5.0
sparc64               randconfig-2001-20261123    gcc-9.5.0
sparc64               randconfig-2200-20261123    clang-22   smatch
sparc64              randconfig-r2102-20261123    clang-24   cocci
sparc64              randconfig-r2311-20261123    gcc-15.3.0 sparse
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-2000-20261123    gcc-9.5.0
um                    randconfig-2001-20261123    gcc-9.5.0
um                    randconfig-2200-20261123    clang-21   smatch
um                   randconfig-r2305-20261123    clang-22   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261124    gcc-14
x86_64      buildonly-randconfig-1001-20261124    gcc-14
x86_64      buildonly-randconfig-1002-20261124    gcc-14
x86_64      buildonly-randconfig-1003-20261124    gcc-14
x86_64      buildonly-randconfig-1004-20261124    gcc-14
x86_64      buildonly-randconfig-1005-20261124    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261124    gcc-12
x86_64                randconfig-1001-20261124    gcc-12
x86_64                randconfig-1002-20261124    gcc-12
x86_64                randconfig-1003-20261124    gcc-12
x86_64                randconfig-1004-20261124    gcc-12
x86_64                randconfig-1005-20261124    gcc-12
x86_64                randconfig-2000-20261123    gcc-14
x86_64                randconfig-2001-20261123    gcc-14
x86_64                randconfig-2002-20261123    gcc-14
x86_64                randconfig-2003-20261123    gcc-14
x86_64                randconfig-2004-20261123    gcc-14
x86_64                randconfig-2005-20261123    gcc-14
x86_64                randconfig-2100-20261123    clang-22   cocci
x86_64                randconfig-2100-20261123    gcc-14     cocci
x86_64                randconfig-2101-20261123    clang-22   cocci
x86_64                randconfig-2102-20261123    clang-22   cocci
x86_64                randconfig-2103-20261123    clang-22   cocci
x86_64                randconfig-2104-20261123    clang-22   cocci
x86_64                randconfig-2105-20261123    clang-22   cocci
x86_64                randconfig-2105-20261123    gcc-13     cocci
x86_64                randconfig-2200-20261123    gcc-14     smatch
x86_64                randconfig-2300-20261123    clang-22   sparse
x86_64                randconfig-2300-20261123    gcc-14     sparse
x86_64                randconfig-2301-20261123    gcc-14     sparse
x86_64                randconfig-2302-20261123    gcc-14     sparse
x86_64               randconfig-r2110-20261123    gcc-14     cocci
x86_64               randconfig-r2300-20261123    clang-22   sparse
x86_64               randconfig-r2303-20261123    clang-22   sparse
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
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2200-20261123    gcc-8.5.0  smatch
xtensa               randconfig-r2301-20261123    clang-22   sparse
xtensa               randconfig-r2302-20261123    clang-18   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
