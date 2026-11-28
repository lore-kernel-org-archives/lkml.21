Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830770;
	b=gt++WVNZ0lC2XldrlXNzqV9T8zyUXE4Lzetf2MdlA2eu4XYQrULza+gwHP122ylNbzxi
	 BpNz/owkWD7Rr/SuC2jvStIS52mbNx43gCQLDtCqd4xlx5SYKDQEL65jcH0GVSPVrz1zV
	 0+AlsBbt2I+D1mFetaLlu24RNA49v9eKgna2Ss1ksiL0S73tBlPYmX1HJmRXtIPezyIuE
	 uFZGAyc7UwPtzpz38VvyuQg8jQHvBppCHmsKK5VzOBb6XsP0Lx6R/brJkiHHjE89iI6hC
	 BbmNwdTmjCTCXRTRE/rJQxm6F1oZO3U/mJAscSLnztt8ST4MEaluIANub6u7yQAhY1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830770;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type;
	bh=ItpSYm3LDNGOHmZ8RzVdWkrksC2W3PRAR2OvtqthQhA=;
	b=MI3XLBYziPYGKaEjEeiJeTwuuB2fsOgGe7qHeG2TlbWiNtmNhuCStAJMS1WWTnvwWdOq
	 OYn7WfrtgMr4Fuaj0+IbUd8rorw0dWey+gNDBmTOxjxlxqE9ZaK9frK1yVpYTMDj45+qk
	 hEi3SzlKtxt0B47SAVUumvFDDyIXj6l5uwzq8NMoGtHcXZ3sux62dGkXTICdfBu/KNRI0
	 3nCYvEl3P8+WC43JYJ5SjnZ9KmreizQ9T1cawOXMLwVtbT0pYugUHcxut555LSe5vpSFB
	 rUtr51QtGZVpGCaxiHFpVmmNHajoelVG/x+G1vKgqDM9p6fhG7Dh5s0TGci9TKoUJyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=UY19EKkZ;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2350B606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2350B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=UY19EKkZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItpSYm3LDNGOHmZ8RzVdWkrksC2W3PRAR2OvtqthQhA=;
  b=UY19EKkZ04ohjEbpq6JV0FXh/qH4XfSOFYoaZ4uO6ZSbQKQ9jlfA1jZA
   yNEsEbdqrTmmF64eM/tEEat3HjXNT84oIu8s0m6LRScrS1+k8Eb+GkqyW
   2wk+fUDNfiVvVhSQbhU5OEiXE9nuXUglFPfHZbFq81FJHwwwnB+e3MamC
   c=;
X-CSE-ConnectionGUID: g6jwhO/ASQK1UZYxJUF+Og==
X-CSE-MsgGUID: xiSce6qcTLeajENAtDcr/g==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,237,1787004000"; 
   d="scan'208";a="307803380"
Received: from 122.11.163-183.unknown.starhub.net.sg (HELO hadrien) ([122.11.163.183])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 02:52:40 +0100
Date: Sat, 28 Nov 2026 09:52:35 +0800 (+08)
From: Julia Lawall <julia.lawall@inria.fr>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
    Alex Deucher <alexander.deucher@amd.com>
cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22: WARNING
 opportunity for min() (fwd)
Message-ID: <64fec5eb-9ac3-344-5cb4-37a39a48e64@inria.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sat, 28 Nov 2026 02:24:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22: WARNING
    opportunity for min()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4585067150b85e33f60876149a6e742928da75e
commit: 4bbba79a7f1d0c7296bf8c935d65a9ff633f6917 drm/amdgpu: move devcoredump generation to a worker
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r2100-20261126 (https://download.01.org/0day-ci/archive/20261128/20261128022015.2gG87g2J-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4bbba79a7f1d ("drm/amdgpu: move devcoredump generation to a worker")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261128022015.2gG87g2J-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22: WARNING opportunity for min()

vim +343 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

9022f01b970933 Sunil Khatri               2024-03-21  326
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  327  static ssize_t
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  328  amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  329  			void *data, size_t datalen)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  330  {
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  331  	struct amdgpu_coredump_info *coredump = data;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  332  	ssize_t byte_copied;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  333
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  334  	if (!coredump)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  335  		return -ENODEV;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  336
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  337  	if (!coredump->formatted)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  338  		return -ENODEV;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  339
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  340  	if (offset >= coredump->formatted_size)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  341  		return 0;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  342
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21 @343  	byte_copied = count < coredump->formatted_size - offset ? count :
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  344  		coredump->formatted_size - offset;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  345  	memcpy(buffer, coredump->formatted + offset, byte_copied);
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  346
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  347  	return byte_copied;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  348  }
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  349

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
