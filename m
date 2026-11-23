Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795471366;
	b=FfTJJCEThlO+pp4+cwBB1yov2UxO6gzg6fFQYmaEaqwoUeb8nLiET7kLZKHoaf5RcB8N
	 DEeyoip04x7UO38xz0J8Kp0REo5RS9Kq47x3/yCtBr/Gc2p2qUwicI9bGRxR9OCSoZx96
	 4nR1R80lGXtxMsuZ1TvEauMVJkzi8fNH2DplSDKwJJAhMAA/kfZAGpVNavcyJE8q2aeCi
	 LNT6GMkDc4u1aDbBmymAzhMluk99xvGukS9PJ2/TVPhABwsx4q52LOn7DkVjX+7zHUlgM
	 cRhI2XvmpiYLK9anmTt/xzSKPE4xGcMHWgdoBKscODqEImAwzYiXh+9ue4AZ/6RgvkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Gb6DgtVLri6HlWCnlbeYURxMYIY8vv9BF07dIcJu0Vk=;
	b=lqVSK/wC6VPCpK396Z5luDbELKnwpOZlE69853sdvDQlJgdCe4s9D+JyFAKLY/NnqFth
	 WjPuLXNgVZTH5oN/zgefFpi5dPZveIc0RZmFncZp/30K1VSm/IUzAx6FM8x/OfeDSu3Yj
	 wzNDDGRT816ovYwXhAh0SRmEij6Xlm/BcZMH8Kpa30fzJfsPuEJsGarpWQMXG9LDBxHke
	 nBE5jfw9+YhQZQ+XUoegNp63jv287r3iiPNRAPUqdD0c8FbP7OSOq1x5O56FKPpUq3Khb
	 9R9NKozNzu+t3TftxfO/9KnAOuaUANIk5cYyGiGLNJMQBNk3qeO7nSLuT+KJB4clwww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=Aq7LSwXK;
	arc=fail smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95199606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95199606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=Aq7LSwXK
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67da69e7c31so4001992d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795471364; cv=none;
        d=google.com; s=arc-20260327;
        b=q9LSuXkguvtEGfzhAt294hRWxC9JbbRIKLVF+hM/XAOaQ51J60bZ1x4547mLNqllBx
         7B0bkHUnmWNa+P0rKqgQoXdWffKBGXcaBziKrtODazSLFVuP5eGTq5aShh8bhkngUpzX
         wZM5zGhfV8SfuUG4epnDA4+BVAOYoPrvBroFFUxV76WC4FEyvFo9DGljkkgKODnZ/ydS
         9q4F0PybxdCBIwQnJ0zZBfQ7yy+8Eb1thLFUGHiaeQtIduOAiukWWGenwQs3MAm8/0Sd
         QU/vfdaRztZFZ2hD7fA0rGCOXG0nm2UTdQk/0Tsq0swSgcNgI8biIdgyFYM/LsYZ9bsp
         VeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gb6DgtVLri6HlWCnlbeYURxMYIY8vv9BF07dIcJu0Vk=;
        fh=zMJch2hVwhBR/AWhimZzitrJyd2xCGfnq0JCr7Re0pk=;
        b=pkhfwgXyzgpqEmYiuCmolDNSc+iJAUfYRxoTlsU+8MDSE6qGOXpy4WBteQZwvClCn5
         Xz/a2MMVQs4as2kuQzEzTAS1E5DGQ0ktmbzZodCmsHrzdXpSG8aZGh4T9EvivqEkUBzk
         4awO39u3ObyPZIJ7Z98hLszAFQnA0oEI9Khh8ShlMdR0doEykbbM/xFCh3mNIvtymxKE
         b0UrrR58IXDDG5fEUTWJUQH6HEsqhitwlTO2/eQgeTmSVMWZ0rSV8D8B1KbrIS7Utk7v
         VV8IAuZR3oymg1aXQw0jjxJpNFRnNUR79SOfkskKDR0WfFsxTdAi+9QinKSyVmUJ4hAo
         b8Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1795471364; x=1796076164; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb6DgtVLri6HlWCnlbeYURxMYIY8vv9BF07dIcJu0Vk=;
        b=Aq7LSwXKnvPIjD3S9K9/sDCkT/6V+pI1a7gOvu+yRWHo7envAwTFuWLheVohEdlHaz
         tdKZJ8OfAOu7rcEmQVkWb1T8o/qc7K7gOpARViQzY4tXtmcvjlvGKgcziFmcMVdWBl7P
         jDnK5QnYsvuauy7mSHsI399nxeFeOjp5TI4S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471364; x=1796076164;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gb6DgtVLri6HlWCnlbeYURxMYIY8vv9BF07dIcJu0Vk=;
        b=VTLEGEtPfSo5QdNaiTmvc3aC664F/iVOEUgJRFmroZ6bu1o+Nll90L0CyLI/xYZD9v
         i9/AoWxhlocZSg6aZOIk438GXGwVsDNjmYtOh32U+StfpwCNrhqvjeNIM0KglzePFYzi
         32cFwa3WNqmWe75tXLYfaH9NbTx1km5O/liPBicH4ww533FMQ/sZRFyI8z33F5sVCIx2
         1xKolMGEH78UNJz1B7epVIkIEADH/AgYgiXvOgBGSDY0FapdqCV5+A/tTNwocR1lPM3r
         ShNNdvTSEZP4U+Cq1DNwd7Sbvh2eAM1RCq4FZBcxeC5gPau0ifwYotz03Duy1xvryDok
         SQ4w==
X-Forwarded-Encrypted: i=1; AL+hErH4roqiDFqmX530wKHNdyJNCTvEWA/gr285rrir7RIyhksxIoDhWNUtKxsjD/15Chi/Ush1PH3CZUHbXm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MqFRKYe9lC9IpWuT+M4FBSVTFDpJvvH/bYnilHQ9ElSJhUBTy
	wNCbkfRENnK/aRHwp8g6Tr14U0PABiFXUx7tG8BZE5LGsHAjB4qiCbxfz9pBbwyPkIc4XXoyUwa
	HoefWE0NL5i+vLdng43WyBT/3uN8K//Y/U2qWGjnjCWsKGJpADz5ALgijEQ==
X-Gm-Gg: AZFdTZclEm1vlt+wgwEyBw6B2MD5Z08QimmDZkPvaTq4O4k/QhPpBf0plHQOVKfqLuf
	t3SISooU8DJtOFCP/XpZZ61E//1HERm0N6VRZp46EFaHi6C+9kMeRk90TsiaDq8dd37eswzOB6T
	D3K9Z/Q3HpfSwKJK6XyL64WkHBV/FRdzOvB3k7/cuockwzJOn1ompEgqOAxd+0zmv+KBcI4mv+H
	e1uNGexQx1aMs3T77HaOpzXirff81SC97mj4CYYQR4lYL+R1Af5F64K7mIxSNlLxhQBdBVB3/Gp
	SfyaoQCXFKPeE1cdE1gMMhJg7McbANdKy9cZ34gFQp9C4wLngnvud92a4QeTQm2j6IjloVKegNU
	obJpkDyGZZ6pTSzuxQ+xE/VnuO/wC3nyiP1plUvMnPRpAW/4fQf7sX3Hbs8R8lsa6tfSj2A==
X-Received: by 2002:a05:690e:439b:b0:679:ab08:5285 with SMTP id
 956f58d0204a3-67df44c2868mr3252522d50.82.1795471364202; Mon, 23 Nov 2026
 14:02:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-perf-symbol-memory-send-v8-0-370561cbb5a7@uber.com>
 <20261121-perf-symbol-memory-send-v8-4-370561cbb5a7@uber.com> <awOMG8xqEUl39vcW@google.com>
In-Reply-To: <awOMG8xqEUl39vcW@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Mon, 23 Nov 2026 14:02:26 -0800
X-Gm-Features: Aa3M54pc7Xydk8ofTh5z-KGnCz3jUEqSJZceW0b9awRn205kGZe7a87z8EONDZk
Message-ID: <CA+w=M=RewiYMRHjVX-y13tPShSz5cmCeMg5UZ-KU1JReq3n7XA@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] perf symbols: Check the file before reading lazy
 symbol names
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Namhyung,

On Sun, Nov 22, 2026 at 4:43 PM Namhyung Kim <namhyung@kernel.org> wrote:
> I think it's extremely rare that the symbol file is being modified while
> perf is running.

Agreed, and I think this patch is too much code for such a rare case.

> Is ctime really needed?  I think dev/inode will catch new file creation
> and mtime is for in-place modifications.

ctime only matters when a file is overwritten in place with its mtime
kept, as with `cp -p`. But I'd rather drop the whole check than tune
it, so I suggest this for v9:

 - Drop this patch and its tests.
 - Document that --lazy-load-symbols gives the same names as eager
   loading as long as the files are not changed while perf runs.
 - Keep showing "[unknown]" when the file cannot be opened or read.

I measured v8 with and without the check on seven workloads. The time
and memory were the same within noise, since the check only adds one
fstat() per lookup. So dropping it makes the series about 190 lines
smaller (plus about 390 lines of tests) and saves nothing.


Thanks,
Alireza
