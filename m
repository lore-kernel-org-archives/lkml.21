Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795864044;
	b=XZ8v0ljvq8XCs+ca5UcWENpAa9GRNUAlbJ7jfL0OaHd8+tFERE383WgIBjI8Okyqagyu
	 lggoWYUr3WnWqBcFlg24vUKqRyUE1RZ38Pgj3npi8SXBGAlrpA3DYl9s7aCiow5nvEPLQ
	 p30P54vOFe+cy8zkOevzcNIBgCmvbPGa/hT6i1MH8ZKPQObDiwyvorgeS83M0Kb+WMalS
	 mXLwD4faR6oa6MwMJCI8IhLzYopRHPAiGnbBPTOt9Womi2TeEObZWd8+exnR/O1MkvTde
	 zQdj01JMKKpCLnLphX6oYlHBzL1KlLChVuUfgsQuD08Ul4tbz08HbJ11psP2b72bwYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795864044;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1UTKvTNzH8jU0mkZUlp/fSSc9+DNSj/C8DPvhjDwKdk=;
	b=t3AAsaIRND6pSLyILZ3H9soa74QNZnnlunzWqkFO816NaWEB3GUpSSCRNBMKb44IYakv
	 m/AL4t0Gs8qkvL1YEC5VTEospM77L0ijpeI9ANfm+uReubZfb/ge0TPQfBviU2/3w2arV
	 uaZvQv6mdkT18HaLfLDZbEQXBWd2Vss/mCZv/R4WNy/kjIZC2U0CskgOYRy0jJ8nsm8bb
	 PcUXHX4Yt5tx4fX8P79HNZGlqU03WWdPBS4AuaF5CEcoV//6sDUplZlZHa3adLaaq55fL
	 tUckrvp9p1vmYcj6Y/zEniy0+fINO+StuffctNxVOIihYdJ1XmvyK3zLcQir94/oTPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g3OrY+o2;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9706F606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9706F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g3OrY+o2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795864044; x=1827400044;
  h=date:from:to:cc:subject:message-id;
  bh=BzwS4580ttJj3h09y94A8eaAf4HAK6hrBAHNfEzlY74=;
  b=g3OrY+o2U4sQrB0e/nojIj//y0W240O5uTtJFpH2jD04Bz+q4/L7AqRb
   kLMV7Y3Mjycv7YIxKEli92Jca/Pt/bQL2KVzh1Jq8xptD3CikZRzT3GTQ
   6M5swANY7JUVMFEIyp84DYRjIe1wMINIVMjHjD0we+p2wgZYt/SNg7Gez
   6R3l1XPs1wGL+kZ0Kjm5H+JwaEgBZE8nG/pP2PzU/1lZs0goyY8imP7Le
   nmrmbf6grgIZ2qIeRc9Nvm71ZzY5z23mUMh7xrCb+4TYy1iW/Srm+UOTb
   Cizj0zU6XG8JG94He/4QeyVvb0f2yFJJ07dljANCaP9sc//hi2djRGo88
   g==;
X-CSE-ConnectionGUID: uRuVbE6PT8iPM5cImSJI4Q==
X-CSE-MsgGUID: lGDg+j3vQfiDcf2bEcZPXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4771560"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4771560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 03:07:24 -0800
X-CSE-ConnectionGUID: KO6TOssrRT+/PcTqpMuG4g==
X-CSE-MsgGUID: pISKHny6TGOqYJfPrEcRyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12416828"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2026 03:07:22 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXGH1-000000000ZU-0fm5;
	Sat, 28 Nov 2026 11:07:19 +0000
Date: Sat, 28 Nov 2026 12:06:45 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sohil Mehta <sohil.mehta@intel.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used
 against symbol 'virt_phys_offset'; recompile with -fPIC
Message-ID: <20261128115906.0jcqIVz1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046
commit: 238be4ba87605da69de2131e8736be7a0d299e00 x86/microcode: Refactor platform ID enumeration into a helper
date:   9 months ago
config: powerpc-randconfig-r2309-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128115906.0jcqIVz1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128115906.0jcqIVz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 238be4ba8760 ("x86/microcode: Refactor platform ID enumeration into a helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128115906.0jcqIVz1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'virt_phys_offset'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/init_32.o)
   >>> referenced by main.c
   >>>               init/main.o:(virt_to_pfn) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'virt_phys_offset'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/init_32.o)
   >>> referenced by main.c
   >>>               init/main.o:(virt_to_pfn) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
