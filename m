Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285317;
	b=KP2J0boEuHlY8Xvlxhyi5Rj7dJoOhh67J/a/33fwR1IRWy87XpfFAir8OTvwV4FfeVDY
	 mFr5dVsvtCeb9e2lGlf6NGL1+8QnuD5kpQhvS8GmBXQY63ZLb++VtelSUpMQWP0kfYTNt
	 G47kq3+N9/SZLUPp8NjJmHtpmBbrPePtXguh8WhWB2U+Jrs42/RAqcPLoxvL3AWZCxlU1
	 WwutXcOqxEoAfAarJaoFiwJamsX+C9i2dEX200ZP/PT1hNnu30V9i8UpAVOu3zErbxJ/3
	 hgyeff1rBKlX1wbM53FvXkIDxChLeO9wxw+m4DB2k7TSXcEABX3dP7oaQswlbiLCapQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7vNWfaVLln/v2ziPNj0C2q1PgOam9oDWGkr2oG8Lnro=;
	b=3Vn+cy0y1qtRSJYQ1kIzzpW5NoOhloYmGgKWlfs/qDHQcz7HEVaDNdajqlyboKMXybi/
	 32z06TsmZymZCASgnp6DJE1ulRTVJCwCYwysQRnaLByPpNqRHsQLyTXQBzVkL5YE6AqD/
	 q3N4PT8wEGAUct45dyDMjzKaAfW/50QQ5xJM/7RUJ0CSByr5wpndGNN3Yfdv6XXXdSApA
	 MTh5uHbyWORbPmS15ql6YgWM3kvqi2F/niLNSfr1h+n5BwzSjdx1BULgYwpT2ew8NwKIP
	 SG/LZjHBjeB+a1NZ/iaHgJg0CiR6d6IBiHg3P/3xLTaPHIs1q4CxVIfvOftE21MaQYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q23mP5na;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA49606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA49606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q23mP5na
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9f6a16afcso28705ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285317; x=1795890117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vNWfaVLln/v2ziPNj0C2q1PgOam9oDWGkr2oG8Lnro=;
        b=Q23mP5naY7SLjkCGQ4gcAbtgpY3pMW5IyWDaUOZP7xTTodDQi1pqvK3NVmyWCxR1SM
         8R91R8gJcltKxvrPQWY5OM4d1GKy388lY3cu/3sWSOwPUbE1x5R14Ve4IaJNQLhmQ/pQ
         QHjLLZALLyszViDCKpWufAxoe3iyvN+wq1sy5ecikJUOPqu5Lw4jk3trRTRVQNRgxtgr
         hpfHKlDhxd9VuiZm/NF0Plc88NTTMXoBLJkpKBkupbmlqhefPkWLTwrC4OXWXaDUZ3xv
         GLmD3hHLUKoN6LLp5rPZlyYTnauTWuFkkRAVEsUz8Q1JXqPds8Lo+Biem31P+pbAelGH
         ez3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285317; x=1795890117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vNWfaVLln/v2ziPNj0C2q1PgOam9oDWGkr2oG8Lnro=;
        b=jkFwt4Z7mlPGKY0W+ER0QiQPnavi16qxGTeasqa614tt57iM0sxV+7yw8NqAR/SYRk
         Y46ThS9HASBUbTbEClbqKMrM5yvOQHGoL+5e3FNFYuY3f7s//19MVhA6CDIwZcJolB2V
         86PrtAoEb2sVZfki5VLidxoGmsI2+D8U/nVJ9pSLr72Lq2CSJfYUdjgWHSpzIu+w4jwq
         Dt6HODs2lLJXsM95WvoxEyrLvEDRHZ+T07iiicX7ZIeQF10TPmtLcJfPp+NoLgG262Iq
         HtbnFthpsaePYbmcM2yEGnk0wKgqZLbCmQ2iH54Yb5MaUKPzR1CkC0ndPzBGeSUcQuxo
         b+dA==
X-Forwarded-Encrypted: i=1; AL+hErEi7vp6SXEh+2is5rNLSTWW2Uw+p4Dh9RRTLs1lM60l4XhojlQcRwZPiWd15NMAwdOUmr9Y6kEy38/Yacc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rQbmh3mnJNUhzdqoZbHzJLkVXmLE5/CMZF60hfVtfINoA5ozt
	kUlPrWRXn9Z02iMXmVgbMsNrPg8AJk9zGbyGWA4+M6mz40vXUARArXferUXU/PKjFA==
X-Gm-Gg: AZFdTZd+lTAL65i5hSByWVqxMoRybcm33AwyOSEITz7WVtG6Czomei5b9caFIlJ3uNt
	II6b9RAgmRS9BbhDU+9Sz1M2GBlIm66N4FfprLu5hYV5wnPoObSqjJ4UFg8k+KTqpT08QLeKZ0f
	8SnH36ZZZaCSYa0fHKQLLXTODc7y1vBLqzKCvfkAk3VaZkN4ZzT4lzs6nVEjqM1a18XbwEHGHDf
	zZig+JriXXf6LxSRAfTpQ6Kw366ucsBLYGcc1eDlmgumn0SnUb+N2WtmS1Vmwb9q1oqcYzBjO6y
	G6QpEZaW7Ke1eyCreHAK0ko540f7N5cDmGSeBz4HzGC+1eRkUTLasnDXjUmszgFdBi30nD2Md2V
	BDaT2TK6cafbWMRqkdSxUPJzJB1KWuK7aaQdub5TgICjg7T+rX3wG7hIv3xnM5OSJvROFRlhDrC
	1EX9bqm8dh3h1oSS1JuUG5HF3V/XHZKn4ouaKR20F9RQXShR8Oq6zzKW/yKrQYZd+IdEhYLxhcq
	EdiMX4VRxY/aZfMWXABBOdIRQco2OnmfAQveEkZg+xAAPEA4jR2YixtB8LTIZvdPhJHEHNblqes
	mMMB8PDpEUHBR9URT2FTCcl2ie7s22kuMOlopf7II+wzPYXX3cYjx9jxCoe3EpsNYV0kTPFua0W
	8ABbibmZ97HWvS0HyVmcsfSA+fEPU1TrZEeTKS5ovudXlSJnRg66Ieudcimw6SUk2AFPRtTwjSg
	ysinxu+nSbNGwnSSG5cSD+MLgBTAYhSHNEYm+BPQ1iPgmNP1S4BetbodFrs4H3jz8dzvlG
X-Received: by 2002:a17:902:ce01:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2f06242aeb1mr3622715ad.1.1795285316100;
        Sat, 21 Nov 2026 10:21:56 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm28689835ad.43.2026.11.21.10.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:21:54 -0800 (PST)
Date: Sat, 21 Nov 2026 18:21:51 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: disallow binder fd transfers
Message-ID: <awHhP5chY30mzbK6@google.com>
References: <20261117231927.2200674-1-cmllamas@google.com>
 <20261118112933.477541-1-aliceryhl@google.com>
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
In-Reply-To: <20261118112933.477541-1-aliceryhl@google.com>

On Wed, Nov 18, 2026 at 11:29:32AM +0000, Alice Ryhl wrote:
> On Tue, Nov 17, 2026 at 11:19:26PM +0000, Carlos Llamas wrote:
> > @@ -182,6 +182,13 @@ pub(crate) fn info_add_fd(
> >          buffer_offset: usize,
> >          close_on_free: bool,
> >      ) -> Result {
> > +        // SAFETY: `file` is valid; read `f_op` with `READ_ONCE` semantics.
> > +        let f_op = unsafe { (&raw const (*file.as_ptr()).f_op).read_volatile() };
> > +        if core::ptr::eq(f_op, &crate::rust_binder_fops.0) {
> > +            // Binder FD transfers are not allowed.
> > +            return Err(EINVAL);
> > +        }
> 
> We have moved to using atomic_load instead of a volatile read when the C side
> uses READ_ONCE. For example:
> 
> 	// SAFETY: `file` is valid, so `f_op` is valid and aligned, and any
> 	// concurrent writes are atomic under LKMM.
> 	let f_op = unsafe { atomic_load(&raw mut (*file.as_ptr()).f_op, Relaxed) };

I see, ok I'll switch to this for v2.

> 
> however the f_op field isn't read/modified with READ/WRITE_ONCE on the C
> side, so I think we can use a bare access.
> 
> 	let f_op = unsafe { (*file.as_ptr()).f_op };

We don't but there are other fd's in other drivers that do. This was
flagged by my local LLM review. It was in some tty driver and somewhere
else that override the f_ops. It seems pretty far-fetched that a false
rust_binder_fops would trigger from this, but at least it would protect
against KCSAN reports and similar. So probably best to keep it.

--
Carlos Llamas
