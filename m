Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157841;
	b=2QoGJwoqNYkOiukFBc/v4gOkKI2L+ZjcgU0KToPbrVMF4IBRE9bG323nZxcl0L3eGr41
	 PB4LtRF2U3inXwYfSv/egvFGmOi4CJIXjZucJZg7mOgxZYZa+7RPaY7h9FiRgG+eMPIUP
	 Qv/0e/XtzmABmzVmDeBv43Qd3C82aTih6DcCU95Mxi7Igpbh6JPhBISMH2C+LAZ/xbGMV
	 hJh2w3k42vzzjGvtklcAgepxPVLZtRXYhXhiz8uG42mGEw3oeCb1PJuk+87K3HvFtipIp
	 jGHSfXPkJJ/GTrsnnOQvCscAUrNYlkthJNBwQfEtQxZDt2tJQkxHI8KfPkIF69h9XYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157841;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1eULS++fSxPD0SzJZNJfX2hDOcII9Zw5dnJvULqJzcI=;
	b=kdTTX5LKs8LvVgowDFokZaMgOhTdvmJb88KuPBoWEeLYZTIw3C3kDsaN63WBQEJtiCiY
	 nqbmYqK9Te4ikq1H+ggulQ9/VijRdNDsgZTgHv8u78C/gpLbK0Mukfwf1Mr7ET8YAzr+a
	 xax8s7UruGVquq5JzDcJvUzyuotCaLXNOjlOoi6qVuAtZ757QGcVuGnbGOiuV2BRt0IxK
	 JwGeY7mPeGIHT1Q3KS1esRdtQYrIsf5nvkb6hY44hTwlmM20BcEfOJnPJr+eacZsHEOGH
	 ejV1hGZa/oa/c5Ja8PyDXKi5TKvV1YJylsT0ngMtXsfHGdnr9gXIl2p0ZUl2+hdMLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K4OqZWVw;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885CF606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K4OqZWVw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795157841; x=1826693841;
  h=date:from:to:cc:subject:message-id;
  bh=rsGgQscnJazKfJ6gelgUkeonsS0ecmGUg5Q/5wM/Fg0=;
  b=K4OqZWVwY+Rj9SQbpZeXSdH0i9/ke2LcxtgOlTf70424+0LwjdzehQPe
   BE6+o/0HTKODo+34FrbvGzE5r0mGELPW0lR2K5cqjZzsNeEhP+xcLpdUh
   NAmz8pHUOnAc3/MJz+eYBu5uyy1lqyL6VNbSkx5LNFrisK7P6MlRSEjOk
   bm4TfoanKNe3RcPjSSDz6vKj+P1NzZxxK+YXDLcY1d1N3Ejjx6OZi1p34
   VDMMtlS2YXhqzRNPXNGtOyn9Z2ki6m0IkESG6jHZ9p5ySBUFzftAyHpTR
   DzsFp7mEYHftqc7SStvOSzaQ9UszqjNP4hLhIqALGMIgvNcBDNSa3mbkF
   g==;
X-CSE-ConnectionGUID: QMk9oyVgQiyJaGk2r1AUCw==
X-CSE-MsgGUID: pQ0Tu8MIRgC6t4kWe8Nlig==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3922848"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3922848"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:57:21 -0800
X-CSE-ConnectionGUID: n1saA9s5Q82Nd4I1dVdrFA==
X-CSE-MsgGUID: DBXbo2QwQyCXaUCbyqcS9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10891241"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2026 22:57:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUIYd-00000001HHp-2DHV;
	Fri, 20 Nov 2026 06:57:15 +0000
Date: Fri, 20 Nov 2026 14:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/mediatek/an7581/snd-soc-an7581-afe.o: warning:
 objtool: an7581_afe_pcm_dev_probe(): unexpected end of section
 .text.an7581_afe_pcm_dev_probe
Message-ID: <202611201414.1NBNxorL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63fdb511c27afcebce797e3db580b3534ddfa639
commit: 4974ffa0d6c28dfaba838a29503c3af02080a8a1 ASoC: airoha: Add AFE driver for Airoha AN7581
date:   9 weeks ago
config: x86_64-buildonly-randconfig-1004-20261120 (https://download.01.org/0day-ci/archive/20261120/202611201414.1NBNxorL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201414.1NBNxorL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611201414.1NBNxorL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/an7581/snd-soc-an7581-afe.o: warning: objtool: an7581_afe_pcm_dev_probe(): unexpected end of section .text.an7581_afe_pcm_dev_probe

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
