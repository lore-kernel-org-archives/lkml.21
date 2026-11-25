Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623881;
	b=o0zL4QCC/OHY2LXcCJctk93kdOazqxHnWVJm3/XyIHzMrHQlD7OTfc2QHh7gEaMO1RED
	 RP1yXZGfZoFudEBWLtmIv9KPaDwh/sKW2YGVBe1glmpRdms6e9xIAYfgt8wJ9WKBEl7RL
	 tMYfgttJe387j13A/AcStCKXtjMGbdbVYouj8MkZHnvvhY063yDDdJzrIVVS+R2P/+FFL
	 Gq//bVSdmJzLZDXhr9o7fmKMY8IgHZkumrjh7S9Ht2HBfTnGD+rYqJy394015SpvMp/3Q
	 FxB4tWP/3UIXPxuouSCOKnVvqwqPRoQaAhcYJaXsgnVrDMrMcq+GobeaZ9FCgvIf99Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tWTWibl/ge8Zvl1jOV/aQs16Gnuxj1CxwYu+4cEZa2M=;
	b=lWvQRTOsbFTCflVPTBTTARU0Rr9oCmS1pfXCC9LbKJf6CFPnWzFFf+MOiAonklqBvZVs
	 6VESaF5MyZG1LWMFDtr3rfv3BNfwmdXl9aF15e9pPHpbG9iYZHnnIfsxa3J4Se6SrD7Rj
	 7Ijv5lAW1o5dKy0JNoq+3IUN5gwzYxh9hhqGjvVROTnpUEtimA6Y0lHiA5iYTLztOz0ji
	 5BIABPwcvYu8an0oKCvR+H3mowp7KBL6coZmrxRM2ir8l4ec1kouRtkAfW71NgN3ffCfr
	 9ZbIKCAjPdGaYKlsTX/Yt0hQngGynR4EzVxrZ2YEzFIMxGRUdsZQfg0LiT5jVXCejRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SqH1k478;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982B0606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982B0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SqH1k478
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c516a192844so566494066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795623879; x=1796228679; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWTWibl/ge8Zvl1jOV/aQs16Gnuxj1CxwYu+4cEZa2M=;
        b=SqH1k478HpRZNEF3tXvNYVHkHLWd7V3IHd6koMnIQGjSp2pSLLMRFjpXOvl5t7AkdV
         rFA7btVR6eQIbdHlPt8hTs2Tluxdxp69bVgc3Otn+pcDswb+k7juWOW1XFOkW/FgMfS9
         ZNz+OVAS+mvDqQWnSHJyrFhvNdY8+5iuzWY3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623879; x=1796228679;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tWTWibl/ge8Zvl1jOV/aQs16Gnuxj1CxwYu+4cEZa2M=;
        b=W3Dn8wxV4OP/72pxkU1tsoKiELlusjzfspaFUk9iuklwpaKA+TcshrC7NFhV4F777h
         WrtymK7SQriW6c5JDokdshDJs8uVMnVaTl8gR8nhcS005MFbYWSfAmVu95L9480DRxfk
         yRWS1/4VG59I8RDog5h1+68TXpnkK9Nkl1tD0WyvRoxbWJw+ROHI5ZcZtIRPQDBXm97L
         AR/saosbgbkwFaf7tNVsamB7V54iIuJHborq36U0waX8zhuefWswQpqSC2vMdJRnUeKR
         ioLMn2UJSdpPDutLTNHxLt8DWUBFpRUHsh3b0Whe7xwEKiAF0yrWTH/4CE+2y5g1apT4
         kGjA==
X-Forwarded-Encrypted: i=1; AL+hErE8rYFDAyPSezMG7I7mnIjHXfkLfkC4yepXr7XrzHI7Qpy9mKs9b2cv8E8ZRglq7QmvcrkP2qJ3Efaom78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dVz99Kr0qwQnRPttucfWfYq5YSVW2tK53s2JzhQUae52iX6Ln
	wBkoDQfMeT+E3EsQfL1NWw/jh4szALrFiMvduTXGFHDB5OhOMbk+d9d0cNDFr9x7oimwCCgm0T5
	ZEei1lzDqCg==
X-Gm-Gg: AZFdTZeJ+iEbsc9Zj7ONw+LraEw+eAH4G36dpp02DWy9qc1rAsw2e9ELd1ez2vvQxS8
	Y9/HC0FBhtodTzLX3iAz98JMGG3FFR7HhK5Q6Wa1Tplk0l8k0hff40riDOmZIqBkaBF9hgCGwbt
	iKJcvfsq1GqLtwBzSMHzD6jsKKIMuhbQ1Hl39CmdiW/yBkurREbQ5Obei4Ze8snzcUth7BL5bAF
	BXagcMmTFEmWJnxqCty29gvcrfM9zYdBsmtNhYqVGd1QZZz2+F0JdBLILbm7b8g23rMbHXYUR63
	Ye3XYDX7r18EFIlJsE/wQo3htvgbnReq/lPM59b7eocq0YWuobREkwuqweFbaxvCpdyW0/R1HkE
	0flFfLl5zu6mTWY+fRF/opwviQQ4SiQVAlwSDiDC2wt64jjEz+CIkY08wJWPwCgeyxFHE/O9jZ7
	mwzsAIvb1fEeCZFbjkkR2/N17sYSrcgCliHBRRVadXtlk1emSYTjlO0T+hksqAK/BvX1vF/Jb8S
	AQTNrYenK3yGQEnoPYu02VqluZaNIjH53hlkm3a5krEVXXKq0FnFtcIoD2PJhVuCF+GrmlA+2vt
	IFZjYEBCksnlDr9kek1FsKc8hKt/4Lweu/z2vmydlbIAChqZ4xHUsGMFTV/t1bAwak8xJ6iHQl7
	SI+o=
X-Received: by 2002:a17:907:8e88:b0:c40:80eb:c543 with SMTP id a640c23a62f3a-c513a4347famr1589320866b.4.1795623879000;
        Wed, 25 Nov 2026 08:24:39 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae698ccsm661891866b.26.2026.11.25.08.24.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:24:38 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c516a192844so566490466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHTRaQoYIina/eBy/MiwCOdP9RBQ+/40LaQ8v63LOHYxCoV5gQBEg+vy63WlicKaLjaAiJRyYMI424tsl8=@vger.kernel.org
X-Received: by 2002:a17:906:c114:b0:c51:baf0:f9a with SMTP id
 a640c23a62f3a-c51baf010eemr106603566b.15.1795623878197; Wed, 25 Nov 2026
 08:24:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awbpOaMZRkKXbq1H@sirena.org.uk>
In-Reply-To: <awbpOaMZRkKXbq1H@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Nov 2026 08:24:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
X-Gm-Features: Aa3M54rd7iTQvFsCUx1md6xHhDjfLba_zVZmBSC0Vk8dcbzllZr6KQgYCqdGNds
Message-ID: <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
Subject: Re: linux-next: test failure in the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 05:57, Mark Brown <broonie@kernel.org> wrote:
>
> This is happening repeatedly on actual hardware (ie, -accel kvm is
> operative).  This will have been caused by some aspect of the ext4 merge
> that's tip of tree, the new tests were added in 3ca8192f79504 (ext4:
> expand KUnit tests for fs/ext4/inode.c) but I'm not sure if they're
> identifying actual issues.  These were in -next yesterday and did not
> cause any issues there so it seems likely they're flagging a real issue
> that's fixed somewhere like the vfs-brauner fixes tree which would have
> been merged first.

Well, it could be me having messed up the merge itself. There were a
few conflicts - but I was being careful and they did look quite
straightforward despite my annoyance at the timing of seeing those
kinds of conflicts.

So I _think_ the merge is fine, and judging by the actual failure
reports (eg inode_test_write_and_sync_metadata()) it is because the
tests are testing things that were fixed by commit d25c14b2d79e
("ext4: use sb_find_get_block_nonatomic() in
ext4_get_inode_loc_noio()")

                  Linus
