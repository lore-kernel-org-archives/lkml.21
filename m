Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721976;
	b=kfE8wtfDzSK22pyLWW4JbAeULHk2EtEuQwru6UbU1s4iPVGrxK1mcMZxz1XapPY7+pS1
	 cqkyNJCsj8bDmWvKxLzmoVuezUzwZQvhqtbBM575xTXS54P9quK+K7n3ou0VM71XEMAzl
	 9qXHF2iW8gnSKTjRqfH8G+V5TWgT5yZW22qw9bDdRRtmTgBLTzRMPAmH23Bo9JbrgUsn7
	 iqsZz2ym8IYaNRUh6w0fNp9I5p1KdfQT6re5Lv/mPypf6KbGzOfZaOHp389qB8D3kWxZr
	 7TyCIQyrmMj5iZ9Zo6huWOKTMZcSBK6V9r55xq1U0WkYUbo7uNOn0CTh9XqXAiz3SlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
	b=SNcXAwJNDmLA/tKEK1YzY/UP2rWFF2HSRnAdOcKrH5h7E8gxry2WCxIcNbjKpZ9fTLS+
	 qkSaOYGXxwpQCxJuGqdlvGHHlI+WfnBP4E3rcF/fCqSeOcWGIE6h+91u4PcOIlT7nwWl+
	 6BjatZ5v0lS5Hd6hcyg3/I1dwq5rvSV5i7AnNNt5Qh4SpvQtwPfHALT9ClVuhWR8pyQFb
	 ylCh957zqrTNwcoqv5t3m14z1Qg6LPyD5SazplXdjfPeNaNF75kzspCe8wSNZR96gfvAA
	 Bad2rNWK395dnRRn8zHB4Us85gnkm4EqyYNyp+4B16GljTjMCKF9i3No4AmvBP0KaNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXgRsW1s;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCC606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CCC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXgRsW1s
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso4327527a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721976; x=1796326776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
        b=hXgRsW1sPKv9RP/Rm3tgbgYtDYEQxgSCQaaOHYzKOU6WeKrPL0tEZXdrCOOfesO4d7
         6ef3DDJcrWSSVyCl0YrGxi2zUwjfrKy+LOMGYKhs+NNVMhuDRHmfUutq8+BnCh7tW0op
         4tozsnVg+3cuWvAmlRIRUwU5nBDIQvW/TNSpFjo8ox6hq73yf/Vu0LF33FKcg1qh87fM
         gU3n0wUiysK+NH7OUb/0R4nj/xT64OZLLUsgE0/uhaFXj12lzsDa5qFgMtixmo3BEH5l
         3SfHLg8VDGAGWpxcMegXrYRb9FKAftlF9h1QiTBT8W8acFT5TA/wBfxOze7TFUn555Xj
         VoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721976; x=1796326776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JyQHuNi3zirNTL3+DOhmQ/6X/ugkLPIWASz+EFn6GQ=;
        b=IX4hxxPPiGPeCY1fbS9bh6Ib2s9wdMNFhuNqOU/Wrtuv6hhzTuwAOX8AftLQ5pVUSV
         7QC0Zv1vS24gks2bNCw6wOq5dtrg7Lynw/uzsr8zltRdgrFMuX7cgJ9juLoyghQPzRbK
         q22vtjGmJfDQ5vfz6gjsSzcgAUd2M3+VinzGlhlstoaUEj53eU/nSO7rUlCpSqVutDrf
         Oi1qGX+u4DH5jBr9c8eTm9klQ/T54+yABlXA9OHvtacLk7MjHmK1GyoKnHmNZQpLwM+z
         E8ipHQlScDq4/6h1FdLjTy72YoQYAF9bjuRRu0hIlz88G9fxQH5b/YjPvGycwxcetSSZ
         DIYg==
X-Forwarded-Encrypted: i=1; AL+hErEI4vqMxqFQvRubXbpY+ycmA7y/SjjOc4MlvyM8gBODvWdx8JcokaFm8OpEhv0KJnNUBwh/jNhFdkeiCOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nXue3NHaM/SKqG7DTzKBgNU+up9mD8nCgvTUczqe501czENgI
	KTJ2XfNN/h3nEi3hcuQSW2zrNJOu9v0sDxWunDhgxczcv6+Vfxqzjcp3
X-Gm-Gg: AZFdTZch7HaO3TlAuIG/0NWzusA7X/SSJy0CgQNU5ObplqrXfd1xzanlQNMkJluRMbC
	QV+Ub1nPaO2OlNbcjICP1xvzcj7+JI71ZC61Bq4XkZxeuWCYGW+s4RDrAZEKLgRqRN/7w+nfa/N
	3TVttNVvl8I/XajBeelgci2gpXGNA6DdWkCrBIxsVs/grGcBk4ZvPm8EHFTRjhC5XSqZ724cyNM
	uX4eUCwqjzUV7ro0fSKBY517cLz3KBY/PZuT2PlQst2HEmqEQZpEeTLEdo1XV3zj+UsPUolvYW/
	6NE6FIDaflU9kGQ82enefPVCFqK2VM5wOWoB0rPkvq5qG/Er/CnVAqWzin4hX6R4MiU5xIb/xty
	BRQhmEfx/iU8KFP9H2qK/fdsrA8Wmi3u/QxNZ3Wtvr6q9tj5w8Mu0dhRKreYEboqpQPO2akijXD
	bzRTwB3IwtGoKgyp+8c69xNjCJdFYm3vJ9YMGvY18pbIPeJWTXfAHB2NNvfqii82BUIOz+7CMtm
	MyPosd7R4AFsY9n5bIHhEE2Mzu0Z4lgXrqoEkyaKVAPLljEKm43LryCB33IMLkW0ho6qIm6g3FB
	5vtEQHDel1VdWDqEgC9O3kteNEUZ7Q==
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr20338360a91.19.1795721975723;
        Thu, 26 Nov 2026 11:39:35 -0800 (PST)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b53479b149sm37761a91.6.2026.11.26.11.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:39:34 -0800 (PST)
Date: Fri, 27 Nov 2026 03:39:27 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, geert@linux-m68k.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, gerg@linux-m68k.org, skhan@linuxfoundation.org,
	rdunlap@infradead.org, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, marscheng@google.com, eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org, daniel@thingy.jp, martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH v12] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <awiK1SMNCNxNipjQ@google.com>
References: <20261126170538.3471057-1-visitorckw@gmail.com>
 <0eb06d3a00f2e4d56c2f25db16eb8b02160387281fe455b0e0e5d7466492657e@mail.kernel.org>
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
In-Reply-To: <0eb06d3a00f2e4d56c2f25db16eb8b02160387281fe455b0e0e5d7466492657e@mail.kernel.org>

On Thu, Nov 26, 2026 at 05:45:05PM +0000, bot+bpf-ci@kernel.org wrote:
> > m68k, bpf: Add initial BPF JIT compiler support
> 
> TL;DR: Nits only, no bug found: the m68k JIT hardcodes the tail-call limit
> (0x7021) and the 44/48-byte prologue jump offset; suggests named constants and
> a check so later edits don't quietly break tail calls.

I'll hold off on respinning just for these nits and fold them in if a
v13 is needed.

Regards,
Kuan-Wei
