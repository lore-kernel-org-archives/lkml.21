Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880058;
	b=pClCSj+08oPdtYwOG6vuLF4D65uOrMO3e0NR3O8Fz3QwcBBJP5RDcbCyDte7ZYxlWTzM
	 jJWbYzFfFLwjlYVGCl3R5WpVw9/aYrB7ibE9SecyyDJJYO1ITHhHwlqWhQU+JoLVL8FOt
	 3qRHqvcp+cfj96aTN3LTLogxKap4ygSoYJ7Ei5i1Lmp4g0Y+XY5Yy3KCOHNgLlY0XH4A5
	 SCmIyXsZvOT5OyaXiuMRgKNfM8jgM21/+zkrQ+0RIASzhlr5CAF3AlfUeM0cOav8a5XSr
	 j2DJM7ngTQ6adQRxyPO5zbU7jxPUSbeAEzEC2wM6S6POf4FnQcReq5AyJGAOec1qyog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GmSg7R0D9xIUjpa+ccYfOfzpoIQuxDUqKzGCsbudGIg=;
	b=jupnGPQvxDQBRdvDaGuLqgmeM+xB9PzSOxn6ZMg9UH2LVSnnZpYe7dtIvfz9BI6jJpfL
	 WtoxDsyXpN9j2yW0chyWzaYxxFCEe3zTKCxGQy0UxafPpEAhFALQQiwHRlVow4ifPW4tK
	 BJHuSDIo1M+r4t7Nv+8JtVcC7DYCfhuwa2zqSs/onXMq6UrGJh7YuF8ugdq0Bxo6wswDN
	 k53YlAbMGZAwrQqbteviTZ5rGYlj4l4cSGGn9QLhF2Fa2Ju+TOOhqpo0JWdfyaj1Q4T57
	 OacdXmVuTKgtoOEDqD4ltfiZxF29Gr8miazJ+v9jkoIqdVzF0vvPCs/iuI5tk9NkkJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DKRe/2JO";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47786606A31F;
	Sat, 28 Nov 2026 15:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47786606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DKRe/2JO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795880058; x=1827416058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bsU0f/VL2gEG6aQcs49GWUtyAf0DYF8KNEsYWHRq5gc=;
  b=DKRe/2JOvNdEptVFGWyRjdmPJSpVEf/ajKAwf9XOJs+z7SZdsWMTrkds
   +gQQcAKEvu1a3IyTYXw2Q7yQiWH9AT5ttbgb2AojoIUJfzyoKvHXhPSAS
   s9DU7yBAdLsM2kqu75Dy/PQFJTHpF2skzbiGLtkGigAApQduw/le/NsBT
   WN4rzmc7vOQEIlXT4dsHpR3q8HexOdA8wW+YkjbxrxK2XDq17RP3u1vI+
   83xcAmapBBe1pkhYbmtsF2kan83FVE7taTX48NoNVIRjeoLAzEVHRQir0
   OmMgkn8FK9YJCn0PWpDXY7/Hgq02xfOsN7koa8EscMSrx1VtdpUp7Xd59
   Q==;
X-CSE-ConnectionGUID: TslWYTOpT8SbFH/UsW0afg==
X-CSE-MsgGUID: gry2mJRXSoSb4Gpq2WERZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11980"; a="4780202"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4780202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 07:34:17 -0800
X-CSE-ConnectionGUID: RJSXaigGTyuFXLvePdYB7Q==
X-CSE-MsgGUID: Re3XFAozQI+K7Xh2ZTrqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12735796"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2026 07:34:13 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXKRE-00000001XZ0-3ctG;
	Sat, 28 Nov 2026 15:34:09 +0000
Date: Sat, 28 Nov 2026 23:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Chris Diamand <chris.diamand@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Mihail Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v8 1/3] drm/panthor: Add perf setup and session management
Message-ID: <20261128232712.EoUTx6tg-lkp@intel.com>
References: <20261126-panthor-performance-counters-v8-1-6e7db0ec33f5@arm.com>
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
In-Reply-To: <20261126-panthor-performance-counters-v8-1-6e7db0ec33f5@arm.com>

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 97429bac371273886238bfcf63d78e7405cacb46]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-perf-setup-and-session-management/20261126-205737
base:   97429bac371273886238bfcf63d78e7405cacb46
patch link:    https://lore.kernel.org/r/20261126-panthor-performance-counters-v8-1-6e7db0ec33f5%40arm.com
patch subject: [PATCH v8 1/3] drm/panthor: Add perf setup and session management
config: arm-randconfig-1000-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128232712.EoUTx6tg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a9b3c3f36e3a7aa55863319fc716f9665aa13fd1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128232712.EoUTx6tg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128232712.EoUTx6tg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_perf.c:256:4: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     255 |                         "Perf BO expected min size %lu, passed BO with size %lu\n",
         |                                                    ~~~
         |                                                    %zu
     256 |                         min_size, obj->size);
         |                         ^~~~~~~~
   include/drm/drm_print.h:628:46: note: expanded from macro 'drm_err'
     628 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |                                              ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:615:55: note: expanded from macro '__drm_printk'
     615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
         |                                                       ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_perf.c:256:14: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     255 |                         "Perf BO expected min size %lu, passed BO with size %lu\n",
         |                                                                             ~~~
         |                                                                             %zu
     256 |                         min_size, obj->size);
         |                                   ^~~~~~~~~
   include/drm/drm_print.h:628:46: note: expanded from macro 'drm_err'
     628 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |                                              ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:615:55: note: expanded from macro '__drm_printk'
     615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
         |                                                       ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +256 drivers/gpu/drm/panthor/panthor_perf.c

   234	
   235	static int
   236	panthor_perf_bo_get(struct drm_file *file, u32 handle, size_t min_size,
   237			    struct panthor_perf_bo *bo)
   238	{
   239		struct drm_device *ddev = file->minor->dev;
   240		struct drm_gem_object *obj;
   241		struct iosys_map map;
   242		int ret;
   243	
   244		if (WARN_ON_ONCE(!bo))
   245			return -EINVAL;
   246	
   247		obj = drm_gem_object_lookup(file, handle);
   248		if (!obj) {
   249			drm_err(ddev, "Could not find handle %d!\n", handle);
   250			return -EINVAL;
   251		}
   252	
   253		if (obj->size < min_size) {
   254			drm_err(ddev,
   255				"Perf BO expected min size %lu, passed BO with size %lu\n",
 > 256				min_size, obj->size);
   257			ret = -ENOMEM;
   258			goto err_put;
   259		}
   260	
   261		ret = drm_gem_vmap(obj, &map);
   262		if (ret)
   263			goto err_put;
   264	
   265		bo->obj = obj;
   266		bo->vaddr = map.vaddr;
   267	
   268		return 0;
   269	
   270	err_put:
   271		drm_gem_object_put(obj);
   272		return ret;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
