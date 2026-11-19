Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086109;
	b=tqqN67HBt22sFgX9k0dCM1gIhoD9pxtslPnClcXw/7XjQ7h/8B5p71RFWd9jdEuHJP9c
	 hAHGVIQFEUKFtgTYFP1vXIQXx+WknhHuCYFxglRX+2qEWrd5jZBZjx75HLaM/89wCd8mB
	 K1d1213Jo0Cl+PaHPy5JOXfIAovtKSMoVpMKfOhT7FqPtabtMs8GBuAHQ71ssZTZCptNJ
	 wsM3l09GlUyYEGUb4rvwtSUiAjFxUcPAVfvvLeVo5GohuG+6dix9ytMh2XSOZlyBNimjA
	 9QVXxsRtI1D5jPUnC9WPhNe0vxoqMzbwfILqEYzyeNkFsJzjyAw+NYkz22BDgVHdkfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086109;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=yMQ7QTK57UEjsyBnYcf9XHMlwPkPJF2jRI9Bv/bnsn4=;
	b=0dQhY9v61AT5O2xRHNqhHAG2MGzceCZ+R7ypxjNfYGfs/mt+65av2JqtTLJQBVjZ/xgB
	 lIG49vHPlalrENga6xEdxVWjXgCuU0ekfZKin83Ea9/sLrP3DQHTpZAjAQmjBc0U6elND
	 R7ZR/nri5+EhEhMtQm4jrHqhKwp3bLzAV2fTqQW6B5dVwvQ184SxAsXa6FjMfzbfA8OsL
	 1h/6POfUt0atmPJDm6Vzwtb4uF3XMaSIeEPTXwRyiXM8GH1R29S0HPA1sNidr+8iv0BMY
	 9ech8w/dejYzGWNa7GqMiXtAs3Vc7DtrXDCjVpyigrtgA7W/GUcibTfy6xfhG4jgHDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=THSYRLrs;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3202A606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3202A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=THSYRLrs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795086108; x=1826622108;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Y3Ci6AsaVwjwUnXBQoulV7IfbrUN20+dyZkPn2/8vQQ=;
  b=THSYRLrsE0aI7A1ZR8RUy54q8/fPqqpw01oIp79lWaPtwafL2tIaoagD
   QLh2Q4x8Mr/zRdTjOHOPyhTSVH4905Ui0tqesSPGotUVFgnTHMRxzFoir
   JBdCoQT69s/oJtdfT6NCL+5VygOQUaVQIhwoMmUN+huNPlixI7w1iTDB6
   kQH2rlOrRe21YNtU5jiBUSvUtNEjLt6a+uhyO6hGtbHcArlm13yyg4ECm
   vc4ZWOGuzppkCnjUJGKoyvQmBE+XX2ARya8GGV6doJIL31JlEnbBpV1z2
   LoAJBP51BrdERAft/6sEtTnB8gmFxlfiuCPzv8wA+SyhFlAvjMqlOXrmi
   g==;
X-CSE-ConnectionGUID: stX3LwRYTGiQ2UxZ5iQpxQ==
X-CSE-MsgGUID: XwfYXdYbSVSDzun/TrrNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3819787"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3819787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:01:47 -0800
X-CSE-ConnectionGUID: rdKQCKO0R8KocniYC0m7eA==
X-CSE-MsgGUID: DX1Ic3kQTPiZfwrGrGSSkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10758578"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2026 03:01:45 -0800
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 78F0499;
	Thu, 19 Nov 2026 12:01:44 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ojeda@kernel.org, andy@kernel.org, geert@linux-m68k.org, 
 maxextreme@gmail.com, pmarques@grupopie.com, akpm@linux-foundation.org, 
 Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261119093113.3003344-1-haoxiang_li2024@163.com>
References: <20261119093113.3003344-1-haoxiang_li2024@163.com>
Subject: Re: [PATCH v3] auxdisplay: cfag12864bfb: Fix init cleanup and
 simplify error paths
Message-Id: <179508610449.1209487.10175208325121821923.b4-ty@b4>
Date: Thu, 19 Nov 2026 12:01:44 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Thu, 19 Nov 2026 17:31:13 +0800, Haoxiang Li wrote:
> If initialization fails after cfag12864b_enable() succeeds, LCD
> refreshing remains enabled. A subsequent attempt to load the
> framebuffer module can fail because refreshing is still marked
> as in use.
> 
> Use platform_device_register_full() to simplify device registration
> and its error handling. Unregister the platform driver if device
> registration fails, and call cfag12864b_disable() on all failure
> paths after refreshing has been enabled.
> 
> [...]

Applied, thanks!

[1/1] auxdisplay: cfag12864bfb: Fix init cleanup and simplify error paths
      commit: 1c7a2b44a170a73a556c459ee6238ff1e98e69c3

Best regards,
-- 
With Best Regards,
Andy Shevchenko




