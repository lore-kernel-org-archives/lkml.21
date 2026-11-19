Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128261;
	b=V8XtVPKtjX/ViX8XJ2LFvNooMuHEb9bTzbOx36CyBNLaoVWZJpwkaJQGnf9jc8r1UCHZ
	 DUycvJ60e4KMNRhclIUV7BMXI+NAZUhAejlqUdr1cYNk76bdgsTbSZq55OFSMm4yY2jK4
	 qIAagSflfFcaJN+a1liN+XoLpihd7t2w9PYWBXg4cpczEIhWuSeaynyrlno8xBrKpDPZ0
	 jlRstUeCpLMaE0DR8FSaDqjKfQsrutzSUepbqSUYOWqHafI1oUKIh6Z0D5i2ls5RTrJe1
	 GwXkwuJug2O+wpu9simBAu+QPud3AOmPRIXHVMwcxkXsU1vprM++Ik4yU7zjt5zMKPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128261;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VzfXBV9cjYugieoU44UZj3QwuphI4isiiO8hpUE4+Ds=;
	b=UQ59ALaH503FdunoontEXyp0l4bW3wnnZrd+LrvX7z9EMeSy+05A9S2vgAZ7v1Up8I7J
	 RBmzVYZ/ObRBGYywOup3SLBkU5cVy22iY3Ce3v893X42jNvuQdbVwcfhSTfZp5Cn6UZi7
	 TdQ7zf7e52NLavngO2QlVr0OLZG82S9QPxxIL3JhcQz4KplNroSfQGa8XxJVodoPbM9b6
	 qj4kqhAnKYqtR6Iqk9P/fte22Y2ZexdMpUd55BK7nj3pHDL7qRRPp+2oGhRmo2KSLBISW
	 BuYP5PTk0dj501a5Zo03lb9DmIAvmby+mHvXPAyFOEOKUSk7rlveRByM6KAzfBXPcww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UteqnA1y;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3A606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD3A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UteqnA1y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795128261; x=1826664261;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iKtRMbD3ilu2fhbVPZycrkhg8OxvwR7lP8jPR/fCaoE=;
  b=UteqnA1yT75JqJbyNklH4MbcBfJNVykqeg0ZINrFJbjUb2LfxG6cy2qq
   nsjGflZ0TR4xnEusIYg4hydfTRPIdsNhPKrY2uRzV+4cpDO+/HJjep1CT
   e1r1II2W96hCXI0j6BSxbXQJ9I4qZoCwlCbyJTQUbo8RCb5m138/BMnfu
   DnGt9jhH4XWik8u+yZQG5MmiljAKAQX8uNtRmTBWCVh/iqzaTE5G071Zl
   51yOlawi0VNJ7sr1TSm76PW1pVRpniYmyAqiDorKLS/EgwzfH3jL3U0QD
   7z2TfVASXlx19RnL3bzpmVdbFbjkVBFwuIxXBj3TuBS4JifpGcJTjC/Zn
   Q==;
X-CSE-ConnectionGUID: ZXXjWGRBSM6TGG08PClFUA==
X-CSE-MsgGUID: h+rme4jyRdegWeOrJkPlmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3844420"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3844420"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:44:21 -0800
X-CSE-ConnectionGUID: C+HNI5bOQZSBW3lO31DYcg==
X-CSE-MsgGUID: m76SwQcwQnm2frDmD8QcDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10550814"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO [10.125.109.68]) ([10.125.109.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:44:20 -0800
Message-ID: <19fd45ea-4566-43d1-aee0-6d22c8026f79@intel.com>
Date: Thu, 19 Nov 2026 14:44:15 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hpet: Mark boot-time variables as __ro_after_init
To: =?UTF-8?Q?Habil_Eren_T=C3=BCrker?= <habilerenturker@hotmail.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "daniel@quora.org" <daniel@quora.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "jwiesner@suse.de" <jwiesner@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
References: <55cf7d7a-b16b-4d7f-b455-d239f8d80363@intel.com>
 <20261119203747.80853-1-habilerenturker@hotmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20261119203747.80853-1-habilerenturker@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/19/26 12:37, Habil Eren Türker wrote:
> Marking these as __ro_after_init hardens the kernel by placing them in the 
> read-only data section post-init. This prevents accidental or malicious 
> runtime modifications (e.g., via a memory corruption exploit) that could 
> silently corrupt HPET frequencies or block IDs, causing severe timing
> issues or system hangs.

Heh, I'm familiar with the concept of __ro_after_init.

Maybe it's a sign of the times, but I'm doubting the veracity of the
claim that this was found through a random human audit of the HPET code.

I mean, if you're using an LLM to find these, generate the patches, and
respond to my emails, that *fine*. Just please be transparent about it
when I ask.
