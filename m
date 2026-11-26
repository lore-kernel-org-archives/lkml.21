Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690118;
	b=bbIC+70zIaqjlSU9h4TeE7MCKn1pzkI2cgI3jqTexHnQadkV5fsN0tB72X5SF1avOf4K
	 kp3EpY11LP3vpVO1blEpTRKyeEf4Wcqy3OTIL2ml2lLGptcCITpOoT9DNaoJ5kfFNbfA5
	 XeIqqW6SVYDE7/yNWZVkaMRObVze6W42Fy/MYPWJqvkXcbPVmYb9sxCZOW4XBgZK6653/
	 8KQdbyUvYsbe1dG60M1VLPpdj78oSUKy9EEW1/RSwt6uCq1Ki9rtkyVw8nSzgpLBuVOpI
	 9HRIxaRW8xACOsGgTaYW+BNuTglctoJzY8HsOG8zi1Khtb0obilEuMpPyiCv3DuCe1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IDc5wh92OmJd7meydvzforJaRiTSWNIveGrTrgefsIc=;
	b=A+WdhD3lvP5fFtAUNLTg+rmAy/DJOULcRCWo0d/Thqyf9FVsrBADkG/rBTWHnoSOLob4
	 yHuCaUL+C+CDIYDtBJHkP7bfvF3vYyTaHYsXyYZMEEUHFwLlqZWOIUUepksjBb/QHsxnx
	 ZwokoqdU6WvAgveDRWmGLagFzb0Fz+MluiFQ+uDd1xyWX/Dx9c+0SyQaw0fr1jTKzDVQC
	 gFFY4+B3dVt7vg79dLfgr+HufgFk2/yMqZrg0T81Rgzz+2SemJG71SOUwpazZuujwfDf/
	 KctzVq8OzjuCik9wXv5Pu6bJ1V5RCXXFAJPZ3Rf4k6CCTKWcOXdkLlWIJqWRJ8wzJFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GiskcG3A;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A76D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GiskcG3A
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso48793995e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795690117; x=1796294917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDc5wh92OmJd7meydvzforJaRiTSWNIveGrTrgefsIc=;
        b=GiskcG3AZfv4rjQMMRzETIS5nB1O4/GFy7yhqxC3MF2QoeeWhmZRCjM3ZFrZKrhtak
         C23IpujOJZxJqcAqEXtDTG2fqm4O0qmxP5MfVcrjNnqefR1sy5BdprXPutKWvkaCn+ic
         nkAsReAH8xuvt06QXw2gCj/jv1ozsWREpdDp+/ar2xQ9eAsk4QfpPzgdvwnv0J76SXt6
         KlBnKdNDm6OyHdHUBm5RX4XomPyhiwMzjrcVutQGokrv8RCHQGHB9y/vqPVOcKEMwYNA
         u+hqOt4+CUBZaEu7h+hr211HxMbMvcDNPI2sdhIu8yBvrLDXcx+jC6Rya10utr+UE7QR
         yoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690117; x=1796294917;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDc5wh92OmJd7meydvzforJaRiTSWNIveGrTrgefsIc=;
        b=iiVBI9w5mYNzRwWacrboc3PO51SZgfKCNbvs4YQhklbAtPbCrgXl64moWJPtKDYfV8
         v8Lkf7x7/a6l9QYmbxu/0KspiAlEz1ZjHZCHdolRHT24Gc7ZAUKL/e96jop8LFpukiwZ
         ReO+rkWLmgV41r0Upy4fLNq2WBn1cwpZolXZUh5GlcmIS8NgamPfPDoNgWX5SicdX75n
         rw6Qz548wQR4BOYghFFYSLnKzSa8eCjtHFd38MO/B/1KiE+4tcvVTbSjRZLXCTcXjaD8
         IwwELjEpcsCPhPb9sx6nsxuHh6v4Jtv0OUeLQEqa81sb3NJ4/3TZAC9bXEMrzO2RT/9g
         OWSA==
X-Forwarded-Encrypted: i=1; AL+hErHbgyhtwrojlk8j19QqOPItQzITayV7mUVeb1OkYC7kNRKD+9usKu0m0fBe5hJCEmh00yfCFGB0Dvs1hfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SIqb9UB+Kw23q5GMf2x9JsX0pyRvlbDAqRV7f5YFDUqh+edr7
	Y+3tsNVA+ygVoxC6AKSdBM9yyfJsMBNlGoOflG8t7oAhwmXgL59f97ysIle83wHVDks=
X-Gm-Gg: AZFdTZcLqiYG1uYTV+KRpk469Q0WNf51s6wKoVWbGTvy0fbxxtTzur20qSJIPXagsQX
	y2NxdgER8Gdp54YwW9aguGFObsNEzf43nBZX0muHu6tlQDKX7VfubXKZzP1b3uKFdcBoZzn19nt
	iV2LSodt0zzycFq5u1Lde4Oj6XqaiWUaY5p4uhHcqL/A/cVkAmheFrfG1poXry7Pe58tKpTvi57
	6SjUAt+gBAF9S1MfqYC/lV/tOWthdX9pypP5k9nJs3GqF6P94ESaGp+dPQbkIF1PSJl8MHVAj6A
	+EYsPviZrngOhn7eFOgGJuDL+B+v5UkQConKIL2Wh+hzWKn7/gLI18okMW0Aef3Hchwl9HiVge1
	4R2kZ1NrgYL7ZahwZeuVLxr/xT42vk9b4NMEmbecSlLVTIybEsaEqRMJWpOB/qaamy2xE6OF5w/
	EBkfl3ya+9myGXdYdxNcngirZYDdvywQqt/HEG81vB54h5z+12ZYdvHc3Jdz26BmTO2aJbuWkfi
	QLMfxBHRNNFhBth+rNA7/xa9V4pgb4PW6au6FXqgXxkXTmFYUHkeqaaj/QguNJV+9biLD0gZJ3X
	X3VLSOdjnHZ9dCdg+A4mxC9iRAe0IuIS
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb887c3ae7mr413006755e9.1.1795690116672;
        Thu, 26 Nov 2026 02:48:36 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm45905764f8f.14.2026.11.26.02.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:48:36 -0800 (PST)
Message-ID: <5e0136bc-43c9-4f7d-8689-b58515a55992@suse.com>
Date: Thu, 26 Nov 2026 12:48:35 +0200
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
Subject: Re: [PATCH] x86/virt/tdx: Add command line param for DPAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, bp@alien8.de,
 dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, tglx@kernel.org,
 x86@kernel.org, chao.gao@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com
References: <20261126005417.976523-1-rick.p.edgecombe@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261126005417.976523-1-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.11.26 г. 2:54 ч., Rick Edgecombe wrote:
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization. Dynamic PAMT (DPAMT) is a TDX module feature that can
> reduce this memory use by allocating part of the PAMT dynamically.
> 
> In order to work with DPAMT, the kernel needs to perform upkeep on the
> DPAMT for each page that it gives to the TDX module. Late during the
> upstreaming of DPAMT, an optimization patch that avoided taking a global
> lock for each maintenance operation was dropped. The plan was to follow up
> the initial upstreaming with optimization work, however priority for this
> work has yet to materialize.
> 
> Separately from the wrinkle of the global lock, TDX continues to struggle
> with large patchsets to enable new features. Doing DPAMT maintenance for
> the new types of memory these features require, further grows the initial
> patchsets.
> 
> Adding a kernel parameter for DPAMT can help these two separate problems.
> Having DPAMT be default off can make the offensive global lock the rare
> case, while still giving some big memory conscious users the option to use
> DPAMT. Having DPAMT capable of being off means that the upcoming TDX
> features can be merged in smaller pieces by ignoring DPAMT to start.
> 
> So add a parameter and make DPAMT default off.
> 
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Dave, feel free to ignore.
> 
> TDX developers, this is small, but can I get a round of review on the
> patch? One consideration I had was if tdx_supports_dynamic_pamt() should
> be renamed, but I thought it wasn't worth the churn.
> 
> Another idea is to ignore the impact of the global lock until someone
> complains. And for the new features, to make them mutually exclusive with
> Dynamic PAMT support by simply keying off module support, rather than
> allowing Dynamic PAMT to be disabled. But since Dynamic PAMT is available
> on all newer modules, this would only appear to make the new features
> enabled. In practice they would be dead code. And default off is arguably
> the best default option in DPAMT's current state. So prefer the kernel
> param.
> 
> Also, I cherry-picked this from the last DPAMT patchset and didn't retest
> it on upstream yet. Will do, but I'm not expecting problems.


To me all this seems like "DPAMT upstream was rushed because it is 
helpful for some few big players", and because 99% of the other people 
aren't going to use it let's make it optional. And we end up with 
conditionals sprinkled in the code, 99% of the time those conditionals 
evaluating to false.

Wouldn't it be better if Intel gets it act together, upstreams the 
optimisation work, making DPAMT a first-class citizen and just get rid 
of the optional and ensure that DPAMT is used in 99% of the cases? 
Otherwise it just feels that upstream work starts with one statement and 
commitments, later those are revised and/or never materialize.

