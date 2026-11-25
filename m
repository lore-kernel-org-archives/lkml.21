Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648633;
	b=r/mdBntaagYtSbqLYSXpV9GfdoVbKMKYDxWePuIq+kAArLYKGBigyazBlw2SL/bpF6cP
	 FXMvFpt4UPCbWpG1ebtlo7ulN0EthgLSvTcbhOgzGDbBalqLPz01WzFCT3YtLDXOmkTV8
	 6oz1m4ArauSX+9aj0CnwOQ7W2y+/9ugQP17567LCzvvmfPw6k2GjFzWr7XSHFev7vY3ZV
	 CnotXMxkPtlaCVWFNXaVCAFcVXFlaHJJcmdn94/K6plSA3NZ3s96ww9Gjbehi8rPRV+Io
	 HlzY8EU1l9Rmh3yoi1wItajkHgHmtkhIk3IJyfge/RxBOwZ6lmqe9s6XnrT+YXyBm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fB66r+RmtclwuoJkRq22iMu7bQUDw+29XRRh1BvFsls=;
	b=5MJCFbLptpJahd3KlROFIsaNNSd3B6UEKrzkA5vLKOnDdT/C4tfbDVRHPbVO4ckvn5jP
	 F/IkQMUxw6O0Vg5Jo40m96G4dD3CKkYuW3e4blIxbOuGGOTVrM3as/d8eM5cDHihXvPGU
	 5NbnWMpfCXTgiLpxiz5vIvzzDkUUACBR0UJQ/mkVpUKem+DqhD64mheJ+vaQYctfgIRpR
	 z8qpLuKcHY69wLU9oaxePg/PVjo9FnqzmExd9CHzG5fvO3U27pFg77oLJcyXRUjyr1FAH
	 8oA4nWQGkqdEy3qvr/g76pIpVAYd1aE4Nt+O+bbOYXIWLm7fRorJgIBExdfGE+19sCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nJ9Bbj63;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E1606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nJ9Bbj63
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso3324534a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795648632; x=1796253432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fB66r+RmtclwuoJkRq22iMu7bQUDw+29XRRh1BvFsls=;
        b=nJ9Bbj63zsgWN5c0pucRTQGaqsxYGqVFbiEu54isfe25Aa4ZhpQclXxzUQOFzVzzjn
         AV5Dt2/KxYiC2cqC5N0xPpL218CBcw419aWStzqgQjKQM5bGs39uZAnXBJZeYNepRROO
         pHzOwslBLW+sG6drs79vSbWX0cxSWu3OJybZMYILiu/PxXhgxEigLLV3Z+ctx5BWpG+X
         mDgZjw11vtGg87BO2C2Xk1bOcytQL7GgH4lI10/BKSzrsRjXWfu5wBnBt8h0ew2+mdTq
         sK7mTpHa3TroUGnuWJ5y2l1xK+BBQFXozp7EW3eliuo8eysrIGYfjihMqCjLyQxcMtFF
         8MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648632; x=1796253432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fB66r+RmtclwuoJkRq22iMu7bQUDw+29XRRh1BvFsls=;
        b=biSLzxcbsS4HxJN8IsU1UXq9Vc+piv2YG83jiShvqQKt7015pH4TJm5VHu9Uej6qyk
         7xPAbabDhe56dn8pToxadDCgB+hYsMC4olPV4tft40CIF+mOEgvXQdi4RE9Rw6wLzNOU
         aX/nZ8EobnuNkquS/shpdOr2S4WCMCsNtddvCAN5Zv0Oexsdi8c4Sfn0zDRdgRJ2EQ84
         9qzd7fsWZHwTv/Rs4X3Q7Ew0GE/WaYchASle4x/+yUOI08ar2/kB86rijGq0POjgXtbI
         SZKwtQ8GSEe6vVICRs3aMHQjOJMYALgNO4WFPaEk75o8q1dbe+Ie5HUoCRC1m0e4ldEz
         7TFw==
X-Forwarded-Encrypted: i=1; AL+hErFR8xDeWiT2SWr8UOvmwXvXpALw45R15tMdKneD+NplpDnvoF2geAn8ZLGJFefrTy1HdaZVeWlobBt/vYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LdrC4GdfqKhhUYHrvYqedtuqWkx8kZ3/Plj5zQe8LPc5yTp/1
	VDCqAv3fHdcY3QrcYJahZzHpeWqF5OxceUGvbZMAJTaBvOHEnqjIZyKIvQRIy3hxDHM=
X-Gm-Gg: AZFdTZczoQaw7EF0eGVjDI7CnLeGbyTcwyKSFZlEmUU25ymi7r994HAIEpPOaBJUkh4
	+4LBBm1gTcYgjf/NQ5ELg6eigGuH/YA6Nm8zwhubfajMKvRnGMQL433QAqO+WjU0AgBEEHVaX4E
	+xgOX4wUeGa3jiGeyDCrerl7NcUHZPOu6ffuWPdxy62LKfmLMhGmTzknYJxJCFCgUzWyn6W/qD1
	S23hU77giY4wf3CtFike0fN+klDmHaRUjvjCwgqATFVJinSZeumQjKfjH3RG9Ok4GV9sJXSMsPn
	coF2F15mnDH6X7RzhJfBVn0vH0YRGNQnhip78Q1SCJDMCjnl7keeuRdVeBqDbLLJEBM7TAARz8+
	tVE1s5W9nmCwI7zqA+7e0DSxhaGJYKA5haTVTwsmm1HZGU1y4+zoNcUMG9wW3EovLURZXjgro8H
	Fh6thXNL1xSQqimnmB68vlyGdIjD4vlTUuPBsQPBaCvvFX61Laipg7+gTBRIhjzq84uv5tlV0k+
	r2JtJNzpW2AAh8mYKzdw42ctjiUh24TFTPL/YoaJwQ0IdzlfjqKsWcneNEz+vL7zqERJmdY8DME
	uzfwbZKgEGEqvCrSfZbpZQDwzWTJvidA4aoVCV+D8Mg=
X-Received: by 2002:a17:90b:4d11:b0:3b4:d00b:d0b3 with SMTP id 98e67ed59e1d1-3b4d00bd2cemr7778086a91.51.1795648632220;
        Wed, 25 Nov 2026 15:17:12 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8c2fcesm10811396a91.4.2026.11.25.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:17:11 -0800 (PST)
Date: Wed, 25 Nov 2026 15:17:09 -0800
From: Joe Damato <joe@dama.to>
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: page_pool: Drop fast and slow from the params
 kernel-doc
Message-ID: <awdsddjX8STuJ4WR@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
References: <20261125184640.2407270-1-takano32@gmail.com>
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
In-Reply-To: <20261125184640.2407270-1-takano32@gmail.com>

On Wed, Nov 25, 2026 at 06:46:40PM +0000, TAKANO Mitsuhiro wrote:
> struct page_pool_params groups its members with struct_group_tagged(),
> so fast and slow are group names, not members.  kernel-doc does not
> expand the group, and reports both as excess:
> 
>   Warning: include/net/page_pool/types.h:105 Excess struct member 'fast'
>   description in 'page_pool_params' (did you mean one of: 'flags',
>   'offset')
>   Warning: include/net/page_pool/types.h:105 Excess struct member 'slow'
>   description in 'page_pool_params'
> 
> Each one is reported twice.  Drop the two @-lines and say in the
> description which members are read on the hotpath, where a reader of
> the rendered page looks for it.
> 
> Verification: kernel-doc -none include/net/page_pool/types.h prints the
> four warnings before the change and nothing after it.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>  include/net/page_pool/types.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Not sure I fully understand all the docs tooling. Would this [1] solve the
problem? If so, it seems like it might be better to wait for that to land ?

[1]: https://lore.kernel.org/all/20260916214357.22573-1-emmaonana18@gmail.com/
