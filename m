Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130082;
	b=KgHmpYWcXrCb0g3nFrRttTOfXNUcv+FUTr6QRIN7FwRyo1t0iqYvkdxEL9lHb3XA1Ewv
	 R79jq124VE/DB+uqmDl6/gg9HIYgg9g4KN7YNcWpZnaH9KVVMrod5GbJovsZdSyaAGzMf
	 ASQCq5Vg5pQDJFwdvASF/C6B0F1u59aBRAGIPRZTdJXfniGvTqv7gqHHZCuD03psvjLhJ
	 A2wcGkmMucaK+VMTdwMJoz7xLKDn2Y3TF7qQ1KFNNI1FfeMy9lMP0Ik20J2fykoeS75VN
	 3yIGHVQFzdLlFOuA2O7GuNb0Bw+hkOfQM8xlcK9NLKgaip7oml1jYg/Fnewsfuu1HRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sRGu1MrUeT5PACmsleKRZBq2irRGMrBiW38fyJRkfk8=;
	b=OxJTCq+tQQCQkvE+1IDpP0k3vlxOuSqY5tpNP8YVk7PSrzMgJ9zVmNxn+QucOv0mLe1j
	 5c1oP7uT/iCmQY9UQ6HO8OFGFzmIoqxkxmnjqvLSgm/xqmXv0EutjyqEvTHl49TArKOsm
	 +cdG7d2RZenF/d8Z1ZBDomPGUm3IbxBTvc+ApWeZH4kLYeSENgU4MJZ0hrkYR3E1kaJDb
	 2iVjmyHPhDnxRjalbLhKdufsYLXu0bhNdIgeKGrNDq8X0EjpbXXnmu3NkWjsJB8xkwDLl
	 8RMD7FKZ0ibILOptJHulFcnkJMKOWieE27fgU5RIfWiVp3+2OiH9yHkwdfMcCZX8hXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAtFPkRS;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DED606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAtFPkRS
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso209946f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795130081; x=1795734881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sRGu1MrUeT5PACmsleKRZBq2irRGMrBiW38fyJRkfk8=;
        b=ZAtFPkRSr3Pn6Vp3jnJQj+LhohveoxsysoJFSa2wAoBkF76UNc52K5loQZFtxQ+p59
         EKt7Y5rgX5THUBWwPLph3895p4shYsPU7QXCETCyzroyrCJJWV6G/iP5yFzlTVzrCqE7
         8zeDHOE5KEP8JdzB9zkmEhIoBFVnEPwpDhpP8NTv4FyugPCEkNvPFf5fyMIjT8W+L8eG
         WJvfus+EH5JCbLhXHM9PxC5Xi7p5C9WYk3b4yeSyBzCUu6+uuxVOzef2nde+A0NCx6/p
         DdYlOTEf9LW2Qp9qnMmDanHZ5x7iO3LitksKDzk27BtOGsVtYIbBzFMZSLkFi0jNtkXz
         gOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795130081; x=1795734881;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sRGu1MrUeT5PACmsleKRZBq2irRGMrBiW38fyJRkfk8=;
        b=Op5gHEeBAAVaLcP6HsfoR2WiZ4K1EkhL9//hwqiDymQOCXHM9BsFI0GQ0QIxjQGc20
         aUVJLcgB3DA3f7pQr8oegzEr1ToKTs8G5+22wSfp3wF1qAkE0RzjAxydzDfTCmAw18ha
         u/NYSSdM2DCq5u2QAtTDrFS7vEmf0C7GsaLbNBDlI468sAqBrh7syu9Q52CJDozK0XqK
         dHyPe9Lnlsrqj3LxqoUBWYBVces1WYfERDzMN3a6/nHm44rP8g7L/nuURfpo6jMWBCW6
         OFy8R+U0HJjfUTbslLQJ3u5Tm8zoUDmoK4C1U9F415AsOwuhY7phvpdMrlvH3tam/IWQ
         v81Q==
X-Forwarded-Encrypted: i=1; AL+hErFljNtXhj0oWX/UGIfI547cCFa46PXoCA4HFfaV0LrAF0W5f2RcXJZEW1UcuxmWpxnbki4wyvjZ574hGlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l+Sk/PDOBytSVAYR8QsfC1E3fGYMChCcLE2yV2vijF6AgZF17
	2FGIy/YB7EynUZCmumNvoqnmK/PoemJVW/oOjkS1I9abkIztHUHOWrWZ
X-Gm-Gg: AZFdTZdxMm5wu2XH+wUeqw1VGs+8+tVu9OCBNKWl2PsylQkFdCSGPB+qQKOG6tqLOlr
	IvkNyByWxFL4m5hTNotVVvr4fvmqsyYXNs+U9MlJrTnVqroCPxKT3HlwjzCIUWnNxrk3D/xLFwh
	KD+c5MsKDzw64B1WAvu8cuwtb3IhVsUaWlW1/nEESAHUOTMM+T1w7hpjb8kOtghWBci1M2X9ofa
	oHR2a74usfCFdf7acK86tRZWc871UHGMmHVWICN9bNXGlsivplr5Q9I9CImNi/pn2aKhc7hw5QI
	FQlxinZbcbkp5zQAlku5BY7aQPAWbjG5PLoOhwWRkDLzqyrf5ZqBJ3v2qNSCgwlCRdU15sQ6saj
	60szMxsC7oiF9sLVukxtTSUbqGWs8gFNIEpIHoPpGt8UaK7zOtmkVglm3UKkaIdglUcXzD7rMmK
	rpeuv8UWqS56tgO5EnBDmsmtgLIwgfMCf023F2Hf6Wqhh+NXPtQ3g1bLJGqZUwJGmNmWkk3jhVq
	j/pyV86oBnERdy4CoSIMwZb6mTC4YK/GSprmm+2Luue+waU5PIpHy092f5DgNqfWCYcZ0E/VCbT
	6qqTpBeRyBjkwJFcnikyAYCz36EQN1euDJCT1x/fPVhMTjnAH+6ldcrN8roOtd9eog==
X-Received: by 2002:a05:6000:1861:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-4abb8f8bfaamr1944661f8f.46.1795130080678;
        Thu, 19 Nov 2026 15:14:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm1926563f8f.42.2026.11.19.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:14:40 -0800 (PST)
Date: Thu, 19 Nov 2026 23:14:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Steven Rostedt
 <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, Christoph Hellwig
 <hch@lst.de>
Subject: Re: [PATCH] compiler.h: Support 64-bit bitwise types in
 is_signed_type()
Message-ID: <20261119231439.64cc05af@pumpkin>
In-Reply-To: <CAHk-=wg_njGtSQ3qCmPW1P2OWOc-74zt7G0BxOB2s1+4SnAgTQ@mail.gmail.com>
References: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
	<20261117080621.7ca022dd@pumpkin>
	<fb66a344-b688-4660-90e2-018d31c2a482@acm.org>
	<20261118121338.51792d61@pumpkin>
	<CAHk-=wg_njGtSQ3qCmPW1P2OWOc-74zt7G0BxOB2s1+4SnAgTQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 10:27:38 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 18 Nov 2026 at 04:13, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > The fields ought to be u64 - since that is how they are printed.  
> 
> ... but then the actual tracing side would be worse and either require
> a stupid and incorrect cast, or actual work to turn it into host byte
> order.
> 
> So clearly the printing side doesn't understand about byte order, but
> that's a printing side issue (that nobody really cares abnout:
> big-endian is dead, and good riddance).
> 
> That said: I think the right fix might actually be to just allow sign
> extension of the constants 0/-1 inside sparse for bitwise types.
> 
> So the sparse warning "cast to restricted __le64" should just be
> suppressed for the values that bitwise types already accept (all ones
> and all zeroes).

I guess if sparse is going to allow the cast at all, it should sign
extend the -1 first - the same as the compiler does.

David

> Because all ones and all zeroes are by definition fine in bitwise
> types. Bit orderign and meaning doesn't matter when all bits are
> equal.
> 
>              Linus

