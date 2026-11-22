Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347206;
	b=vfqDvOVzybZ5CN9RgrdYM+E22EqJhs7Yipo1rmhXTGBPjXAj8Nv9tsg8Zg1jZQc5NUYl
	 WmOhyt8CoAt8afGTl9Y2CP/GgvUzu+evyErKaCpWZ3aUQdP/f8wJDPr226Dl9DR/EYInv
	 jsodB0pgxvcIpyZo0AOny7KVLh5O7WtawOwiuJbnhSSnI82opzEY5p75Z/rVVEqUG8Af9
	 jb2pc9y1hvL8B9epBeVGTNJJ4WOa6+PsLn6zdYz3Ltv0/mSQ7mvA45Q6w7f5qYmYsBLsV
	 +0Re9K21gjo4LXDB5Hbst9vsms6KxcPELjxDg0ca3jjfisF8amJTNWRueNWfta1CVhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347206;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jliouTDZ8+PFEGO2Q8nDDLY40R/SkjTRZnfA2ZwN4VI=;
	b=3No2XFBvL0tMkfi8RAvUUhKAEos2VVWHCjFmp6tF3hNJH5pqqJzGBLLO48o7aKTbOd+W
	 wC6YjkZhY8opgQHRdTiJiNl7UfGgueua1dg1HQnspGf8PgM+wfcG7WGWMvv1zDf0W/dBN
	 fo5ah40LI0fQE9WqKlfjiY/abCRm+ikFYSwgl8TDXhi/V5PbNOtZvqQZprMcw52nya1Eu
	 Hz1ypB8fE9cvoVNwpvCi19TrOPN/2wCNp7zH4QBzxe7QEtwiXWBNnLm+/x8Baa5QMbAOi
	 Y7McDs5cWLR1jm3w8EYbBf7Ru2hI7t0tvlC9Qt++BuikH9QgORr8KiuuSLbS8v8uj8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djK4CYVN;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0774C606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0774C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djK4CYVN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795347206; x=1826883206;
  h=date:from:to:cc:subject:message-id;
  bh=womgWOK5Ae7o/vEc+UX1HX+19SPkuaFyYvVH6l1HlPQ=;
  b=djK4CYVNKzpAU69aiXK5GOdQ9k7n8mB3apcqenshS941Jn76ivV5DX+6
   I+tlOgTi+qvdudTeXEw3228plEGZxRHS4KOm9/a3q3uy7nW+vIUWK9jmi
   KxvtDfJkwsDXsy1BhoPMEs2+7p/3NMEn95ciX3rNEYLXYM6NCRUMGD5NR
   ban9PW8CPXjOSvUCM1d4/cYc3HSBuWtNzHVeQsz0uGHGiwZQDpncKfyLH
   CmLzJayFfJbJbtHgTll7ajLqpw+rv1YWnjTwKGH41hcUe+2Wryrip/InL
   RBgQ7kYp8C9munod/XKXUbn1BPmZ+ycidFaP+2wOjPZVgG34lsuqI+3NA
   Q==;
X-CSE-ConnectionGUID: /JF7E0jTTUWv85t2FtvSBw==
X-CSE-MsgGUID: VrnuwifVRC+fQlc29HqR9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4153088"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4153088"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:33:25 -0800
X-CSE-ConnectionGUID: d5fCDaVlSnG9CIQfppxYlA==
X-CSE-MsgGUID: i//35VxEQNqm6Ihm9e8BZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12775393"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 22 Nov 2026 03:33:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV5ov-00000001LQM-1tyy;
	Sun, 22 Nov 2026 11:33:21 +0000
Date: Sun, 22 Nov 2026 19:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu:next] BUILD SUCCESS
 393d8a50f7aca1cc5c0ed9d6d7d874dce0572ee8
Message-ID: <20261122193301.ffY7ZwJq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: 393d8a50f7aca1cc5c0ed9d6d7d874dce0572ee8  Merge branches 'hazptr.2026.11.20a' and 'nmi.2026.11.03a' into HEAD

elapsed time: 874m

configs tested: 533
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261121    gcc-14.4.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261121    gcc-14.4.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261121    gcc-10.5.0 smatch
alpha                randconfig-r2100-20261121    gcc-8.5.0  cocci
alpha                randconfig-r2106-20261121    clang-22   cocci
alpha                randconfig-r2106-20261121    gcc-11.5.0 cocci
alpha                randconfig-r2110-20261121    gcc-11.5.0 cocci
alpha                randconfig-r2111-20261121    gcc-13.5.0 cocci
alpha                randconfig-r2301-20261121    gcc-14     sparse
alpha                randconfig-r2304-20261122    clang-24   sparse
alpha                randconfig-r2308-20261121    gcc-8.5.0  sparse
alpha                randconfig-r2308-20261122    gcc-13.5.0 sparse
alpha                randconfig-r2309-20261121    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
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
arc                  randconfig-r2101-20261121    gcc-9.5.0  cocci
arc                  randconfig-r2103-20261121    clang-24   cocci
arc                  randconfig-r2109-20261121    gcc-8.5.0  cocci
arc                  randconfig-r2110-20261121    clang-22   cocci
arc                  randconfig-r2111-20261121    clang-22   cocci
arc                  randconfig-r2111-20261121    gcc-14.4.0 cocci
arc                  randconfig-r2300-20261121    clang-24   sparse
arc                  randconfig-r2303-20261121    clang-24   sparse
arc                  randconfig-r2310-20261121    clang-22   sparse
arc                  randconfig-r2310-20261121    gcc-10.5.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-17
arm                   randconfig-1000-20261122    clang-17
arm                   randconfig-1001-20261122    clang-17
arm                   randconfig-1002-20261122    clang-17
arm                   randconfig-1003-20261122    clang-17
arm                   randconfig-2000-20261121    clang-24
arm                   randconfig-2001-20261121    clang-24
arm                   randconfig-2002-20261121    clang-24
arm                   randconfig-2200-20261121    clang-19   smatch
arm                  randconfig-r2100-20261121    clang-24   cocci
arm                  randconfig-r2106-20261121    clang-22   cocci
arm                  randconfig-r2106-20261121    clang-24   cocci
arm                  randconfig-r2106-20261121    gcc-11.5.0 cocci
arm                  randconfig-r2300-20261121    gcc-14     sparse
arm                  randconfig-r2307-20261121    clang-22   sparse
arm                  randconfig-r2308-20261121    gcc-8.5.0  sparse
arm                         shmobile_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261122    gcc-8.5.0
arm64                 randconfig-1001-20261122    gcc-8.5.0
arm64                 randconfig-1002-20261122    gcc-8.5.0
arm64                 randconfig-1003-20261122    gcc-8.5.0
arm64                 randconfig-2000-20261121    clang-24
arm64                 randconfig-2001-20261121    clang-24
arm64                 randconfig-2002-20261121    clang-24
arm64                 randconfig-2200-20261121    clang-22   smatch
arm64                randconfig-r2102-20261121    gcc-9.5.0  cocci
arm64                randconfig-r2104-20261121    gcc-9.5.0  cocci
arm64                randconfig-r2105-20261121    gcc-16.2.0 cocci
arm64                randconfig-r2111-20261121    clang-24   cocci
arm64                randconfig-r2301-20261121    gcc-11.5.0 sparse
arm64                randconfig-r2301-20261121    gcc-16.2.0 sparse
arm64                randconfig-r2304-20261121    gcc-16.2.0 sparse
arm64                randconfig-r2305-20261121    clang-24   sparse
arm64                randconfig-r2307-20261121    gcc-10.5.0 sparse
arm64                randconfig-r2309-20261121    gcc-16.2.0 sparse
arm64                randconfig-r2310-20261121    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261122    gcc-8.5.0
csky                  randconfig-1001-20261122    gcc-8.5.0
csky                  randconfig-2000-20261121    gcc-16.2.0
csky                  randconfig-2001-20261121    gcc-16.2.0
csky                  randconfig-2200-20261121    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261121    gcc-10.5.0 cocci
csky                 randconfig-r2101-20261121    gcc-16.2.0 cocci
csky                 randconfig-r2101-20261122    gcc-14     cocci
csky                 randconfig-r2103-20261121    clang-24   cocci
csky                 randconfig-r2105-20261122    gcc-14     cocci
csky                 randconfig-r2109-20261121    gcc-11.5.0 cocci
csky                 randconfig-r2109-20261121    gcc-13.5.0 cocci
csky                 randconfig-r2111-20261121    clang-24   cocci
csky                 randconfig-r2300-20261121    clang-24   sparse
csky                 randconfig-r2303-20261121    gcc-14     sparse
csky                 randconfig-r2306-20261121    gcc-10.5.0 sparse
csky                 randconfig-r2307-20261121    gcc-11.5.0 sparse
csky                 randconfig-r2308-20261121    gcc-13.5.0 sparse
csky                 randconfig-r2309-20261122    gcc-13.5.0 sparse
csky                 randconfig-r2310-20261121    gcc-12.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261122    gcc-8.5.0
hexagon               randconfig-1001-20261122    gcc-8.5.0
hexagon               randconfig-2000-20261121    gcc-16.2.0
hexagon               randconfig-2001-20261121    gcc-16.2.0
hexagon               randconfig-2200-20261121    clang-24   smatch
hexagon              randconfig-r2102-20261122    gcc-14     cocci
hexagon              randconfig-r2104-20261121    gcc-16.2.0 cocci
hexagon              randconfig-r2107-20261121    clang-22   cocci
hexagon              randconfig-r2107-20261121    gcc-16.2.0 cocci
hexagon              randconfig-r2108-20261121    gcc-14.4.0 cocci
hexagon              randconfig-r2300-20261121    clang-24   sparse
hexagon              randconfig-r2303-20261121    clang-24   sparse
hexagon              randconfig-r2304-20261121    gcc-14     sparse
hexagon              randconfig-r2305-20261121    gcc-16.2.0 sparse
hexagon              randconfig-r2306-20261121    gcc-13.5.0 sparse
hexagon              randconfig-r2309-20261121    clang-20   sparse
hexagon              randconfig-r2309-20261121    gcc-8.5.0  sparse
hexagon              randconfig-r2310-20261121    gcc-8.5.0  sparse
hexagon              randconfig-r2311-20261121    gcc-8.5.0  sparse
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
i386                 randconfig-r2103-20261121    gcc-10.5.0 cocci
i386                 randconfig-r2104-20261122    gcc-14     cocci
i386                 randconfig-r2107-20261121    clang-22   cocci
i386                 randconfig-r2109-20261121    clang-22   cocci
i386                 randconfig-r2111-20261121    clang-22   cocci
i386                 randconfig-r2300-20261121    gcc-16.2.0 sparse
i386                 randconfig-r2304-20261121    clang-24   sparse
i386                 randconfig-r2306-20261122    gcc-13.5.0 sparse
i386                 randconfig-r2311-20261121    gcc-10.5.0 sparse
i386                 randconfig-r2311-20261122    gcc-13.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261122    gcc-8.5.0
loongarch             randconfig-1001-20261122    gcc-8.5.0
loongarch             randconfig-2000-20261121    clang-22
loongarch             randconfig-2001-20261121    clang-22
loongarch             randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch            randconfig-r2101-20261121    gcc-16.2.0 cocci
loongarch            randconfig-r2102-20261121    gcc-16.2.0 cocci
loongarch            randconfig-r2103-20261121    gcc-9.5.0  cocci
loongarch            randconfig-r2110-20261121    clang-22   cocci
loongarch            randconfig-r2111-20261121    gcc-11.5.0 cocci
loongarch            randconfig-r2302-20261121    clang-24   sparse
loongarch            randconfig-r2303-20261121    clang-21   sparse
loongarch            randconfig-r2306-20261121    clang-20   sparse
loongarch            randconfig-r2306-20261121    clang-22   sparse
loongarch            randconfig-r2307-20261122    gcc-13.5.0 sparse
loongarch            randconfig-r2309-20261121    gcc-13.5.0 sparse
loongarch            randconfig-r2311-20261121    gcc-13.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    clang-17
m68k                  randconfig-2000-20261121    gcc-14.4.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261121    gcc-14.4.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261121    gcc-8.5.0  smatch
m68k                 randconfig-r2103-20261121    gcc-9.5.0  cocci
m68k                 randconfig-r2106-20261121    gcc-16.2.0 cocci
m68k                 randconfig-r2107-20261121    clang-24   cocci
m68k                 randconfig-r2111-20261121    gcc-11.5.0 cocci
m68k                 randconfig-r2303-20261121    gcc-16.2.0 sparse
m68k                 randconfig-r2310-20261122    gcc-13.5.0 sparse
m68k                 randconfig-r2311-20261121    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261121    gcc-14.4.0
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261121    gcc-14.4.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze           randconfig-r2102-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2105-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2109-20261121    clang-24   cocci
microblaze           randconfig-r2109-20261121    gcc-11.5.0 cocci
microblaze           randconfig-r2307-20261121    gcc-16.2.0 sparse
microblaze           randconfig-r2309-20261121    gcc-8.5.0  sparse
microblaze           randconfig-r2310-20261121    gcc-16.2.0 sparse
microblaze           randconfig-r2311-20261121    clang-20   sparse
microblaze           randconfig-r2311-20261121    clang-22   sparse
microblaze           randconfig-r2311-20261121    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                            mtx1_defconfig    clang-17
mips                  randconfig-2000-20261121    gcc-16.2.0
mips                  randconfig-2001-20261121    gcc-16.2.0
mips                  randconfig-2002-20261121    gcc-16.2.0
mips                  randconfig-2200-20261121    clang-21   smatch
mips                 randconfig-r2105-20261121    clang-24   cocci
mips                 randconfig-r2109-20261121    clang-24   cocci
mips                 randconfig-r2110-20261121    gcc-14.4.0 cocci
mips                 randconfig-r2301-20261121    clang-24   sparse
mips                 randconfig-r2304-20261121    clang-24   sparse
mips                 randconfig-r2305-20261121    clang-24   sparse
mips                 randconfig-r2306-20261121    gcc-16.2.0 sparse
mips                 randconfig-r2308-20261121    clang-20   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261122    gcc-8.5.0
nios2                 randconfig-1001-20261122    gcc-8.5.0
nios2                 randconfig-2000-20261121    clang-22
nios2                 randconfig-2001-20261121    clang-22
nios2                 randconfig-2200-20261121    gcc-10.5.0 smatch
nios2                randconfig-r2101-20261121    gcc-8.5.0  cocci
nios2                randconfig-r2104-20261121    gcc-10.5.0 cocci
nios2                randconfig-r2104-20261121    gcc-16.2.0 cocci
nios2                randconfig-r2106-20261121    gcc-13.5.0 cocci
nios2                randconfig-r2107-20261121    gcc-11.5.0 cocci
nios2                randconfig-r2108-20261121    gcc-11.5.0 cocci
nios2                randconfig-r2305-20261121    clang-21   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261121    gcc-16.2.0
openrisc              randconfig-2001-20261121    gcc-16.2.0
openrisc              randconfig-2002-20261121    gcc-16.2.0
openrisc              randconfig-2200-20261121    gcc-14.4.0 smatch
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc             randconfig-r2104-20261121    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261121    gcc-9.5.0  cocci
openrisc             randconfig-r2110-20261121    clang-24   cocci
openrisc             randconfig-r2302-20261122    clang-24   sparse
openrisc             randconfig-r2303-20261121    gcc-11.5.0 sparse
openrisc             randconfig-r2304-20261121    clang-24   sparse
openrisc             randconfig-r2306-20261121    gcc-8.5.0  sparse
openrisc             randconfig-r2308-20261121    gcc-10.5.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261122    clang-24
parisc                randconfig-1001-20261122    clang-24
parisc                randconfig-2000-20261121    clang-22
parisc                randconfig-2001-20261121    clang-22
parisc                randconfig-2200-20261121    gcc-16.2.0 smatch
parisc               randconfig-r2101-20261121    gcc-10.5.0 cocci
parisc               randconfig-r2102-20261121    gcc-16.2.0 cocci
parisc               randconfig-r2103-20261121    gcc-16.2.0 cocci
parisc               randconfig-r2103-20261121    gcc-8.5.0  cocci
parisc               randconfig-r2107-20261121    gcc-13.5.0 cocci
parisc               randconfig-r2108-20261121    clang-22   cocci
parisc               randconfig-r2108-20261121    gcc-11.5.0 cocci
parisc               randconfig-r2108-20261121    gcc-8.5.0  cocci
parisc               randconfig-r2109-20261121    clang-22   cocci
parisc               randconfig-r2110-20261121    clang-22   cocci
parisc               randconfig-r2301-20261121    clang-21   sparse
parisc               randconfig-r2303-20261121    clang-24   sparse
parisc               randconfig-r2306-20261121    gcc-11.5.0 sparse
parisc               randconfig-r2307-20261121    gcc-13.5.0 sparse
parisc               randconfig-r2308-20261121    gcc-12.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                   mpc866_ads_defconfig    clang-17
powerpc               randconfig-1000-20261122    clang-24
powerpc               randconfig-1001-20261122    clang-24
powerpc               randconfig-2000-20261121    clang-24
powerpc               randconfig-2001-20261121    clang-24
powerpc               randconfig-2002-20261121    clang-24
powerpc               randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc              randconfig-r2101-20261121    clang-24   cocci
powerpc              randconfig-r2102-20261121    gcc-9.5.0  cocci
powerpc              randconfig-r2107-20261121    gcc-11.5.0 cocci
powerpc              randconfig-r2301-20261121    clang-24   sparse
powerpc              randconfig-r2301-20261122    clang-24   sparse
powerpc              randconfig-r2303-20261122    clang-24   sparse
powerpc              randconfig-r2305-20261122    clang-24   sparse
powerpc              randconfig-r2308-20261121    gcc-16.2.0 sparse
powerpc              randconfig-r2309-20261121    gcc-10.5.0 sparse
powerpc                      sequoia_defconfig    clang-17
powerpc64             randconfig-1000-20261122    clang-24
powerpc64             randconfig-1001-20261122    clang-24
powerpc64             randconfig-2000-20261121    clang-24
powerpc64             randconfig-2001-20261121    clang-24
powerpc64             randconfig-2002-20261121    clang-24
powerpc64             randconfig-2200-20261121    gcc-10.5.0 smatch
powerpc64            randconfig-r2102-20261121    gcc-8.5.0  cocci
powerpc64            randconfig-r2109-20261121    gcc-14.4.0 cocci
powerpc64            randconfig-r2304-20261121    gcc-11.5.0 sparse
powerpc64            randconfig-r2306-20261121    gcc-8.5.0  sparse
powerpc64            randconfig-r2307-20261121    gcc-12.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261122    gcc-9.5.0
riscv                 randconfig-1001-20261122    gcc-9.5.0
riscv                 randconfig-2000-20261121    gcc-9.5.0
riscv                 randconfig-2001-20261121    gcc-9.5.0
riscv                 randconfig-2002-20261121    gcc-9.5.0
riscv                 randconfig-2003-20261121    gcc-9.5.0
riscv                 randconfig-2004-20261121    gcc-9.5.0
riscv                 randconfig-2005-20261121    gcc-9.5.0
riscv                 randconfig-2200-20261121    clang-24   smatch
riscv                randconfig-r2101-20261121    clang-24   cocci
riscv                randconfig-r2102-20261121    clang-24   cocci
riscv                randconfig-r2107-20261121    clang-24   cocci
riscv                randconfig-r2107-20261121    gcc-8.5.0  cocci
riscv                randconfig-r2108-20261121    clang-24   cocci
riscv                randconfig-r2310-20261121    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
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
s390                 randconfig-r2100-20261121    clang-24   cocci
s390                 randconfig-r2100-20261121    gcc-9.5.0  cocci
s390                 randconfig-r2101-20261121    gcc-9.5.0  cocci
s390                 randconfig-r2102-20261121    clang-24   cocci
s390                 randconfig-r2104-20261121    clang-24   cocci
s390                 randconfig-r2105-20261121    gcc-9.5.0  cocci
s390                 randconfig-r2106-20261121    clang-22   cocci
s390                 randconfig-r2106-20261121    gcc-14.4.0 cocci
s390                 randconfig-r2108-20261121    clang-24   cocci
s390                 randconfig-r2110-20261121    gcc-11.5.0 cocci
s390                 randconfig-r2110-20261121    gcc-13.5.0 cocci
s390                 randconfig-r2111-20261121    gcc-16.2.0 cocci
s390                 randconfig-r2301-20261121    clang-24   sparse
s390                 randconfig-r2303-20261121    clang-24   sparse
s390                 randconfig-r2305-20261121    clang-24   sparse
s390                 randconfig-r2307-20261121    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261122    gcc-9.5.0
sh                    randconfig-1001-20261122    gcc-9.5.0
sh                    randconfig-2000-20261121    gcc-16.2.0
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2001-20261121    gcc-16.2.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2002-20261121    gcc-16.2.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2003-20261121    gcc-16.2.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2004-20261121    gcc-16.2.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2005-20261121    gcc-16.2.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2200-20261121    gcc-10.5.0 smatch
sh                   randconfig-r2110-20261121    clang-24   cocci
sh                   randconfig-r2110-20261121    gcc-8.5.0  cocci
sh                   randconfig-r2300-20261121    clang-21   sparse
sh                   randconfig-r2311-20261121    gcc-16.2.0 sparse
sh                      sh7710voipgw_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261122    clang-24
sparc                 randconfig-1001-20261122    clang-24
sparc                 randconfig-2000-20261121    gcc-8.5.0
sparc                 randconfig-2001-20261121    gcc-8.5.0
sparc                 randconfig-2200-20261121    gcc-8.5.0  smatch
sparc                randconfig-r2100-20261121    gcc-16.2.0 cocci
sparc                randconfig-r2105-20261121    gcc-8.5.0  cocci
sparc                randconfig-r2107-20261121    gcc-14.4.0 cocci
sparc                randconfig-r2108-20261121    clang-22   cocci
sparc                randconfig-r2304-20261121    clang-24   sparse
sparc                randconfig-r2310-20261121    clang-20   sparse
sparc                randconfig-r2310-20261121    gcc-11.5.0 sparse
sparc                randconfig-r2311-20261121    gcc-12.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261122    clang-24
sparc64               randconfig-1001-20261122    clang-24
sparc64               randconfig-2000-20261121    gcc-8.5.0
sparc64               randconfig-2001-20261121    gcc-8.5.0
sparc64               randconfig-2200-20261121    clang-20   smatch
sparc64              randconfig-r2104-20261121    clang-24   cocci
sparc64              randconfig-r2106-20261121    clang-24   cocci
sparc64              randconfig-r2108-20261121    gcc-16.2.0 cocci
sparc64              randconfig-r2110-20261121    gcc-16.2.0 cocci
sparc64              randconfig-r2300-20261122    clang-24   sparse
sparc64              randconfig-r2302-20261121    clang-24   sparse
sparc64              randconfig-r2302-20261121    gcc-11.5.0 sparse
sparc64              randconfig-r2307-20261121    gcc-8.5.0  sparse
sparc64              randconfig-r2308-20261121    clang-22   sparse
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
um                   randconfig-r2104-20261121    gcc-9.5.0  cocci
um                   randconfig-r2106-20261121    gcc-8.5.0  cocci
um                   randconfig-r2108-20261121    gcc-13.5.0 cocci
um                   randconfig-r2302-20261121    clang-21   sparse
um                   randconfig-r2302-20261121    clang-24   sparse
um                   randconfig-r2304-20261121    clang-21   sparse
um                   randconfig-r2308-20261121    gcc-11.5.0 sparse
um                   randconfig-r2309-20261121    gcc-12.5.0 sparse
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
x86_64                randconfig-2000-20261121    gcc-14
x86_64                randconfig-2001-20261121    gcc-14
x86_64                randconfig-2002-20261121    gcc-14
x86_64                randconfig-2003-20261121    gcc-14
x86_64                randconfig-2004-20261121    gcc-14
x86_64                randconfig-2005-20261121    gcc-14
x86_64                randconfig-2100-20261121    gcc-14     cocci
x86_64                randconfig-2101-20261121    gcc-14     cocci
x86_64                randconfig-2102-20261121    gcc-14     cocci
x86_64                randconfig-2103-20261121    gcc-14     cocci
x86_64                randconfig-2104-20261121    gcc-14     cocci
x86_64                randconfig-2105-20261121    gcc-14     cocci
x86_64                randconfig-2200-20261121    gcc-14     smatch
x86_64                randconfig-2300-20261121    gcc-14     sparse
x86_64                randconfig-2301-20261121    gcc-14     sparse
x86_64                randconfig-2302-20261121    gcc-14     sparse
x86_64               randconfig-r2103-20261122    gcc-14     cocci
x86_64               randconfig-r2107-20261121    clang-22   cocci
x86_64               randconfig-r2109-20261121    gcc-16.2.0 cocci
x86_64               randconfig-r2300-20261121    gcc-11.5.0 sparse
x86_64               randconfig-r2302-20261121    gcc-16.2.0 sparse
x86_64               randconfig-r2305-20261121    gcc-14     sparse
x86_64               randconfig-r2306-20261121    gcc-12.5.0 sparse
x86_64               randconfig-r2307-20261121    clang-20   sparse
x86_64               randconfig-r2309-20261121    clang-22   sparse
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
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261121    gcc-9.5.0  cocci
xtensa               randconfig-r2100-20261122    gcc-14     cocci
xtensa               randconfig-r2105-20261121    gcc-16.2.0 cocci
xtensa               randconfig-r2108-20261121    clang-22   cocci
xtensa               randconfig-r2111-20261121    clang-22   cocci
xtensa               randconfig-r2111-20261121    gcc-8.5.0  cocci
xtensa               randconfig-r2302-20261121    gcc-14     sparse
xtensa               randconfig-r2305-20261121    gcc-11.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
