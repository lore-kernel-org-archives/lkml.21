Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744785;
	b=is4a/9khBmLA6JKVGQTuVqbeYzN5rh2T2yiXW8PnWkcDyYbpa6u+YUz4Sv2evjQng6KX
	 bN6Hrtjq0T9oW7+xmUJGIGdzFi76B3igEoK1OXvyR5AExwwXc8BwIp9WbsAHyxF1q41ab
	 CSPPCkBRxj16lVyA4C+EcfCPoAIEXJVJHefrE/J4WpcCZ2s7lTUEICfEPmpvvzw5mUmxb
	 fHZEd+c4b3e48OAfolRbDZVVKXfI/xNLcqM6+ntuaONF8/LSZwqlms07bumH7biHA/7Ow
	 F6QrzLG4qd/aE/DSUB8pWC8aPI6pCW2yXclkdfjw/hFsPnhe1LGzPLp3KWdpdcKhM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KvH0hopfpv+dCdNRhn5bg21YimqLr87Kiz9kswyfh3c=;
	b=MaF7mzi7ieGMYWCnyu03ht1GoNrEONzQkpHYjJUx6NZbX/rP5TmOYiiAFy9qm63S04n5
	 v0OGljln8ph38ezDUlQf15NT/FMl7IxeIDxZDm6E4oRkiNbLjadnlEgdeSewRpcndOJpe
	 pDmrGSYkQMcl2QFK3Ejqa0myVMKDb2uKjvSApjQ5lUcq2hoG/ABt2j10Ofz6oNWhVlJAP
	 y+T2BDTt7zaEDDJZtamOaFrA7XQjipY03Llk8CZmwXLI/MVtMyOF8Q0ucaTdpIWILdYQ2
	 j+/VxGIlRraeGNe7OVfJgftSG3fyGURUqzos4SZvHeZyDO+CC9FcCvUbAE/OszwhL/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIcLA6Y5;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0391F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIcLA6Y5
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3679156b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744784; x=1796349584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvH0hopfpv+dCdNRhn5bg21YimqLr87Kiz9kswyfh3c=;
        b=rIcLA6Y5C8JEI2kSPAjOE5IL14hAZfbNi7ckBZnp5flUvv9pDH0u48eal8TTFngLf+
         q0vd0EZBh8Hod+Ugu/CJZRuwfSN7XkFZ9Yv9g8wsDPr1Y+1Y6tosU3ccxfXHoPVQ2oVu
         Ch5s16eo5Vhcgq6KqzyDXkDWglRGaJMuuzSGLjK3ARHCD1pA0E66EodtM50zESI2QHxR
         Sq0Z6P+XBdPjrWo5yHGAGyU1zkHsNJe6v+hrHwh9lRhAc+0vOVFHr4Q9xDcDYsZR3Sci
         Zmn0SasPRZGtmNosGbNLQWPHvQ8sYBjUH6KH25Mh+Ew95QI/bYOyb73YUBHUyflIWtcX
         cVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744784; x=1796349584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvH0hopfpv+dCdNRhn5bg21YimqLr87Kiz9kswyfh3c=;
        b=RFHo/NI2uzPOGLyqFEED4I460XlEwieyrOLwLwkRC6uYtcZk9RnEH16+RfPl3MF35J
         gmIZB/z4zvsxixpJ+9Oaj7FNMuKM4ZGX82M7hB9ss3w4MzOhz5S9F0rHxoRMbdlnL+ib
         RRBajqtuTWz3c194YKkAzGRYEp4eBOWs3ZHm9tPUamRB4okxJCVgy86cCuMmaWOaTe/x
         qnG6vIDFpUIwejZsktko5VZjbDHhoxh61L305rovhoP/a1g04VExzPFAEcVom7/6RDdM
         hBu27p+qr85J3KobL2zVuQTwyLGcwBBbs2rwoL36mx2z7ATZZgTbEJRerBplQgsBT5yi
         uMJA==
X-Forwarded-Encrypted: i=1; AL+hErHpinlQbvwuQLCY39wYmCi1xY6uhFJanO6PDZT+wwKscwyJx2KQZ9JDindhm4VxbX59gjNyLrilBGi4iek=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ly3zDi91VXemz5M9PBNCGObHakTE9uA2voMrbRpCu37zbg4K0
	B7myat2fNQzVdCoPh1yahIisAxgperP6QnGM0ZOkJZ72oFP+O55/LdCZ
X-Gm-Gg: AZFdTZcYCMYuh4O1Q4QqAg6CuO+dNKPfektQ81ZHN22zaxgfjDhANwSp/EgJ0PoduCn
	phSl9BxOCdhqYNy0FLlTYTWJCG+pb1oycXrZ2AzLhIjOAMWShUdp9XtaS6jmW9qZgFNdSpAG2oH
	8G24g9rvNl/m0KKmtfSQqgW0FBp5zgzWKN1DG0pPYBqtnJr2YTbMG0vB35zSJQYW+nWttBP+2he
	nTDXxqSeNchtvi6ENRUw4cID0geSvbJegw56/TH4KhGghMRw0eSWzaUPYjbj/+U2wJRAd1ueAAG
	Dukw0bL1iWkCCZ53mrEVhH/Uu75emPydwFRLOdjIFH51eWe7FH0uBgaoZCjga5xwVP8Aqdw/kc7
	PYzmzizACl86HOXyzCx0CJx/ADMz6M67d0EIdfmDmXTl0uNYaluxQObzGlByzAB7ZK5I7PbKf4M
	vhukGAA5FUonIPXtLtYPqyTshaBbaN9UqUj+w54Den4YeJGyaYcr849V/fXuBblJ/888b/Z3dL2
	dvcOfRYdDSx7gElj0YB8+taDCI8pvUQv+GJCJu8i97KvSc9mRGsGGdWxxTPz/9FS9Jp4uGTD4Tw
	uswaK/BQXfsSYlivTqUnxLYz0cD+20bH238caYizZGwx4D6Xr5+XKc63J3mN+P5Z3Qxc1+gVdx4
	LksyasEiGfqvkwJAT3Yo34jURwotB+14=
X-Received: by 2002:a17:90b:2585:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b41c9cd182mr20276785a91.23.1795744784296;
        Thu, 26 Nov 2026 17:59:44 -0800 (PST)
Received: from [192.168.29.169] ([49.43.113.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm35008632a91.0.2026.11.26.17.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 17:59:43 -0800 (PST)
Message-ID: <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Date: Fri, 27 Nov 2026 01:59:38 +0000
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
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Julian Braha <julianbraha@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
Content-Language: en-US
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
In-Reply-To: <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julian,

Thanks for the review!

On 11/25/26 23:30, Julian Braha wrote:
> > Switch to strtoull(..., 0) and consume trailing whitespace so
> > whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
> > explicitly so C11 and C23 builds behave identically.
>
> C23 builds aren't supported yet.
>
> > Emit a warning whenever KCONFIG_SEED deviates from a canonical unsigned
> > 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, retain
>
> Yes, it would be good to improve the input validation for KCONFIG_SEED,
> especially to reject negative values.
>
> In a v2, could you make this part more explicit (add it to your bullet
> list of changes above?)

Sure, I will add negative values to the bullet list in v2.

One quick clarification on negative values before I send v2:
Documentation/kbuild/kconfig.rst currently only states "You can set this
to the integer value used to seed the RNG" and does not explicitly
forbid negative integers. When KCONFIG_WERROR is unset, is emitting the
malformed-format warning while preserving modulo 2^32 truncation (and
exiting 1 under KCONFIG_WERROR) acceptable for backward compatibility,
or would you prefer negative values to fall back to the clock seed even
without KCONFIG_WERROR (along with updating kconfig.rst)?

> > Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconfig")
>
> Improvements in input validation are good, but 'Fixes' is for bugs.

Agreed that input validation improvements shouldn't carry a Fixes tag.
However, on 32-bit hosts signed strtol() clamps seeds in
[0x80000000, 0xFFFFFFFF] to LONG_MAX (0x7FFFFFFF), so half of the seeds
printed by randconfig itself cannot be replayed on 32-bit hosts.

should i split v2 into a 2-patch series?
- Patch 1 (with Fixes:): switch strtol() to strtoull() to fix 32-bit
  replay of [0x80000000, 0xFFFFFFFF] seeds.
- Patch 2 (without Fixes:): add malformed input warnings (negative values,
  whitespace, >UINT_MAX, garbage), KCONFIG_WERROR handling, trimmed
  regression tests, and any Documentation/kbuild/kconfig.rst update.

> In a v2, you can remove the changes for binary 0b/0B handling.

Makes sense, I will drop the 0b/0B handling in conf.c along with the
corresponding test cases and C23 mentions in v2.

> > +				seed = (unsigned int)val;
>
> This cast is unnecessary, you can just do 'seed = val;'

Will remove in v2.

> This is *a lot* of test code for input validation of just 1 var. Could
> this be simplified at all?
>
> Is every test here absolutely necessary?

Definitely not, I will cut it by half or more in v2.

Thanks,
Priyanshu
