Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780796;
	b=IxXjy++WHvUpVbcymWGMu9rrwDxExT/n93z8/iquBkDCJvCoGGw01oqTnu0770yFrSj7
	 5Pxt28qbjVBCZGYaVosVlIm3nxGT3s6IofRQDL3oiIjgPN1VLd/53QTTNzhtzFZ7iMF02
	 a6oOYbGxNaT0/8OUHuUKYJlYM7Iatd4QEBTCtwQBsV1lDgTvhnFCA+784DfbgbbzWhUO7
	 UFcm6ejeYVfYcLosov003tJFINB/CF1kvUhwGhkOPpzsH5t8VtDhqpx+cbKB42ep+qWM0
	 fCx0ezaM75l7zzQy+G2Llim7bGP5+/luU1v9ouSYDqz7O0w8TVNa7FiXVh4C2YMHEEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780796;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=db1zdY9UY/+WtH+lXFMRjspf83oaMdKzi34nwB44lfQ=;
	b=wiv4FSSbHwI+JheSVRmzZWJP7X6z6YoE7tCWyTs+zNIiDgmmL8GppQruF0ym3oruJ3/D
	 4DSyBnXh0VEnhbqfA/5W7PHheFjGqUEvLZzqIBzhph5/9ed9p8PL9a8lmkUCGSE4jgsWs
	 fKpCp+WiFJrwtwnePvFU+EsMRHWjM4bg1/tMsuzaFF0zyqEGW83yCGrlPgqzAh7E8fvyS
	 pKy+P1qzjtlJaxqsK0ujvwkqAT1H4qiVXzr+jMw6UDeceet1mdSjymCl17m/FaqdsQnF1
	 A3wCnXhEjIsWeyBFj/zuT6UJDMhlaqGRmGNRvY2zRl6LS00cjO4T8wDa0eRt465ovKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=guj+vAqu;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B63F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=guj+vAqu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795780795; x=1827316795;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=aQXz2yUI0rNRGSKXfg6JaefV9P0uOMbS7diD3qU2WLQ=;
  b=guj+vAquw9M72kFhfzYS7ZPZeevvuy8P75oJiU3kkNK/EoJK6LqRifSC
   BSVKvnb8Et8ErbN1tk6mJAVXbWG0d66XVnJWA/zDSFfF4G8GajaG9eSiJ
   waCgZQ27GKiPxiI9j7hxQpIKGkZx8LSJeCtfbFK/P14h2Nl2Rytpnkojo
   15TTo0scetmhAiCd/2kk+OY5U9lzbA28T/DjbIEShuXN/R2Y0Spqn4rcb
   F4v6pjDnZVXQSoO8vc5ynhPl/z3Lmmx5NnUouBW1pePW0lN4Ua/f3h1HW
   0VBlW1N3NXRUIisvSnWUzaGlHS425Eng7PJ+b70WwSGqSfG+FfWlHqwDn
   g==;
X-CSE-ConnectionGUID: pkPOX9OfQIKc9PcUKxf78g==
X-CSE-MsgGUID: Wys3Vsh4TeegSIF1nxaSWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4703953"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4703953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 03:59:55 -0800
X-CSE-ConnectionGUID: HtD8Rk4AQy+vB52tSI7A2g==
X-CSE-MsgGUID: bIQxVOzMRaCz3FYx6HuQqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12901796"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2026 03:59:53 -0800
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 8D97180;
	Fri, 27 Nov 2026 12:59:51 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Robin van der Gracht <robin@protonic.nl>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Randy Dunlap <rdunlap@infradead.org>, Wang Jun <1742789905@qq.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Kees Cook <kees+treewide@kernel.org>, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <45e66776a1cb0fa54d1606b856887abe7e826ae6.1795776138.git.u.kleine-koenig@baylibre.com>
References: <45e66776a1cb0fa54d1606b856887abe7e826ae6.1795776138.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] auxdisplay: Use designated initializers for arrays
 of i2c_device_data
Message-Id: <179578079156.1720750.8568824666942151699.b4-ty@b4>
Date: Fri, 27 Nov 2026 12:59:51 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0


On Fri, 27 Nov 2026 11:45:51 +0100, Uwe Kleine-König wrote:
> While being less compact, using designated initializers allows to more
> easily see which members of the structs are assigned which value without
> having to lookup the declaration of the struct. And it's also more
> robust against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> [...]

Applied, thanks!

[1/1] auxdisplay: Use designated initializers for arrays of i2c_device_data
      commit: ae50e64cd87a9a285f2b40c59c89ade0d2b57833

Best regards,
-- 
With Best Regards,
Andy Shevchenko




