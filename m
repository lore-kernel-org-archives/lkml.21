Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777584;
	b=qahqrdyYV9Ul/jrQbFTep/eN4Yx8anegP6GcEFZcTYJoBLNSGSeTQ25ddukF6UED156f
	 5dhRVFBdx4I0FCNNAl6mNQJei+yiP/WlD/pa5xQXmI/Cw+EZyDZoFtdSLt/ziTJA0MSO2
	 JbdP20LBq0WCmiARWqxbkDU7+Ku2YqLKQt+bdvJnAcxtfDJ8ka8G//VfWCwiph+WqeOPd
	 sNZJjE2Dstw0ILIAOEMvJKN/1t1qG9HSPhf9S9q8ZfBdjbTx1eYTnAnagXS/tEiKt5HKg
	 UeqQVKRP7kcEZBvYJkx9cNnH55DM0SGJg7xRdHGIGaAYPumlF/6zGcjcDGr7GWnmqpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=Dui+vEEV/G41k6/mg1mi5KVhdsPiSj4G83/EQMbYYmw=;
	b=OvtB2soxBKsg3qSWVjove+I9zYQ5i7RaAtouOOVYGMMGYW1NILEMbYSbUnqrbPqgscrW
	 rXCFfHcNobZ/AKeBgAsiNSWopr51E6yhM+VB1oICxgVGF9W3suZDBE7ZRZScGXAk0EIlU
	 VXCg6nIclia2dtAE3Z3wJ0J/I8jXfBSP5uuGruG/Ze67au8HTtK3SjOhnZ9fzdAXWjoAA
	 ++Sr90l0dz50FJEHmFMNlFqeDT0hb3/FyUTIzcTz9Nt+H7U9a3Skq8O/I9ZVdoBylHH1f
	 as31QUmp+19HA4JtgyyTMnJwgG99oUomT9pJGsTAkC2ouoxx4+5OiAJ+K64GBc2yC5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="m/MusV3H";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3E7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m/MusV3H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795777584; x=1827313584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+FWnBspwhXj+rxtsZj26r/KKxe2xn7l/3OKbJUy0rQI=;
  b=m/MusV3HPOL9Wpy8/jccqKc/RzvKC4f7R5t23qAUoY+UlrEmFmF5XhsF
   tcL8UTzNkXLpNQNdfuZLsBtS1sSOyYbRpvJl4pPKFsgdE3o/9vmuknpVV
   hyE9kxr1YL0CAwR5Lb3FTVal9O6mcYFSiYmY47zZIw2OgAvhKCZJ7E2nr
   0PUBnPWzJ5e2ANh8INAWawMXpU98vqFpHEuyMKY5YlEnPkyy5ZZph/fcs
   +hjoGMf2vfjSinlgrcsKsGYY+ZaPzE/IhRhmdc+Mpt3jwJvFvITMSW0Of
   oP6V3EuEX4VR7LgTUsGG9UWx9qEOY4wz2Z2XtyQx1bEq0/H5GRIPNzIed
   g==;
X-CSE-ConnectionGUID: nmSZWAs3QCuHmxJhn5FVxw==
X-CSE-MsgGUID: IjSFb4C4R7yInfROq6hshQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4738267"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4738267"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 03:06:23 -0800
X-CSE-ConnectionGUID: tnL6Brd3Qvip37xsLlXyCA==
X-CSE-MsgGUID: S50pukh3Q4KT0j1VUM82Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12629370"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 03:06:19 -0800
Date: Fri, 27 Nov 2026 13:06:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Randy Dunlap <rdunlap@infradead.org>, Wang Jun <1742789905@qq.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] auxdisplay: Use designated initializers for arrays of
 i2c_device_data
Message-ID: <awlkKRdcMGSTTeQb@ashevche-desk.local>
References: <45e66776a1cb0fa54d1606b856887abe7e826ae6.1795776138.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45e66776a1cb0fa54d1606b856887abe7e826ae6.1795776138.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 27, 2026 at 11:45:51AM +0100, Uwe Kleine-König wrote:
> While being less compact, using designated initializers allows to more
> easily see which members of the structs are assigned which value without
> having to lookup the declaration of the struct. And it's also more
> robust against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.

I'm fine with this. Geert, do you have a chance to look at and give a tag?

-- 
With Best Regards,
Andy Shevchenko


