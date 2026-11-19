Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051793;
	b=2MB7el4eFYpvASMS0VmQqz5ymUa99xMGydzR1ktft/dhbKwIuM4TGj36q1mVz0vR+5Ly
	 BLLOrNWeoeH8R9qTa74qxjPdHXTJ2py48XCfB4qacFqRk0n+WColpIrurQkCWUj93g5/N
	 x/IsX2WHb60V5bwJAsacj1H5uBwWNkd3jqey3gs3ZDyVAAuAFxO5/7024T3lZ6Y5CN38W
	 XnkXU9ZbdXw9wEzqwCoM040I5hla/aTbhQkuCXbdchlnEv2tWtZSelmki5mkqpoj5Pygg
	 2I0FQxbIihJXR857v50gQi+qjagsthaPjlpM5P/eNxrmE3TvHJtDYPBi9qUhI4A2NIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051793;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EbfhgPTFFCgBhkRG6XV04wYw/cnWBHIe0xJRo0gNQyY=;
	b=nRgD9ZlagO0+YkdmlGk2mFKx/9I4DNOyZH3aW3+WssM0yhyVhVNjkVdaIKxBVC0yvQRu
	 BMyKd0dGAFQVefki0SbPBJqXCN2frdgWp4GP3JHndfiakLI1OVT+FZfnNt82QqatkAFdi
	 ++dYYSUwPzYUrM8Gii9tdxmyjq87Az8IR8b25rbv6NZyQFcGmABTyA+OqKCIVwZldbMil
	 z/3UthtfwYKHTDYuhvlt4btm3gfXb9jmplFRwa5gpPkTJgziRrGNY49ZJCNPoC2SScHng
	 4mLQz24HLA3dAuUYA3TWYTjqH14CvEWLgUKltt7oyslG8VW1FQiNEIVSXKMoK3J812Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOcV8ZRP;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43F606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A43F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOcV8ZRP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051793; x=1826587793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PSfxMbRtp5SghriBVjMcOCJYj/qGbZjDnmBthJkvrbk=;
  b=KOcV8ZRPQfd1EFY5LkC8hvBhhFSFlqr7V/oNhld4qZsviR2c2Vz6m0Sg
   Mx6izkf+Vy3J5oXZoqzZs28A8uG72nXqtVOka7H3may2ulWyQcF0SP0+Q
   UBKD3MJ0IfTXAcNcgm+kqnxSWBeK+jU7Vo/82cs14c1I32aGudCnhFynI
   YaHNbjZAQjun6hT+hKUy8taCQAoGna0iVt8+bsyVuWGCQU0FAE2Fb4zB/
   OkUzBzyYE7P4+zhBNk2nhjpuPeLhBqL+gjXhrEtVWH4/D1xhE1gLBH864
   3cgVXlTajnLohE8sVMZwFkPAC1Nfm2CSd0XKpp1i9t/pPyFO/TPRRn02o
   A==;
X-CSE-ConnectionGUID: y09I7fqiSjOvbI46RBDEZQ==
X-CSE-MsgGUID: Va+SnUE2ReesJJjVqMBo1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3775570"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3775570"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:29:53 -0800
X-CSE-ConnectionGUID: TUvq6+FoS6eVdr+zGQCL3w==
X-CSE-MsgGUID: B9Y2d/QwS6SSzj7nu/u0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10431112"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2026 17:29:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqy8-00000001EjW-3STl;
	Thu, 19 Nov 2026 01:29:44 +0000
Date: Thu, 19 Nov 2026 09:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mark Yacoub <markyacoub@google.com>,
	Sean Paul <seanpaul@google.com>,
	Manasi Navare <navaremanasi@google.com>,
	Drew Davenport <ddavenport@google.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH 8/8] drm: Move DSC capability reading helper out of i915
Message-ID: <202611190948.JPHU15IB-lkp@intel.com>
References: <20261118-feat_move_i915_helper-v1-8-652177f3107a@bootlin.com>
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
In-Reply-To: <20261118-feat_move_i915_helper-v1-8-652177f3107a@bootlin.com>

Hi Kory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d5a6e2921e68b0cc42812376ca6c8095b6c941a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent/drm-dp-Move-max-DPRX-link-rate-helper-out-of-i915/20261118-113628
base:   d5a6e2921e68b0cc42812376ca6c8095b6c941a2
patch link:    https://lore.kernel.org/r/20261118-feat_move_i915_helper-v1-8-652177f3107a%40bootlin.com
patch subject: [PATCH 8/8] drm: Move DSC capability reading helper out of i915
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261119/202611190948.JPHU15IB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190948.JPHU15IB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611190948.JPHU15IB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/display/drm_dp_helper.c:5158 expecting prototype for drm_dp_read_dsc_dpcd(). Prototype was for drm_dp_dsc_read_dpcd() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
