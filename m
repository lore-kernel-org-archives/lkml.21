Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776064;
	b=Gsm721HDzAQydtPgQ0658ozNrYmqUS7Rr556YZPbz3EIvR4lgzg4MIZ3ZfY7CIu3xp7D
	 /QfeCvw1Ay3l1e6QdkTD8SlN0dsbKb/EyewFlCnvtxbvejLuasUlgLJCDF6ZPmOua4KRJ
	 f1U0+YcHjl79kwB9HyzJdVy5xlYjLGS82sb3pPxiPjgnkVfhDGpsJBdbouoMKR6V7TxGL
	 K8wQ1ga1pxBPttemhNojKeCGkM2rW5ZuN+Ml4BeolbX+PfNXbwwHfZkDxEKHvp5KqlmkH
	 sEkr23sLWCFeabuDXYqFskb56TjHz52+C38JPAYLDKK0vRkGpd6sWNroDT8BKtVYpZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=46jt2PFBd8rULQ4Nt62VZapADm8oEY8BfGTGabREOUM=;
	b=j1f5rqsI+DJboF1S75+i6gnwDMfjVrezDP5kuf2q5Y9OMyRvHIfo6+yRykm1zUw3uzC+
	 N4KSB14EX821+0axLc4fCeOSWvNVa+MPgHkBsfyuOVV/eg18h5PiCt81kZlVrQxgZZYNI
	 P9pv5WxQaDK78yUwta7Nf/viON2TYU4OMTyQ0VgTTpHC+ZzYQ9L53qWGvBzjgFRJmVdxc
	 p3vsB0Otd4/ujFtZVR5053vSyOhksSziytJoJa9L+vDi2Y6mAh9egXgLh3BMe0laYE/x2
	 +GpkMq9cgBMuK3fbknBLdmyXFiCUAXZ5Bxb8WRNphsyG3HZ95oAs5XOr/oFC+1pvDhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDuPgHaR;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D88606A6A6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D88606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDuPgHaR
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso3639218f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776063; x=1796380863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46jt2PFBd8rULQ4Nt62VZapADm8oEY8BfGTGabREOUM=;
        b=eDuPgHaRC2KPGtaz+A22NSuvwSL5c0S2/zFOdQyD6aCjOhVgcuVtQjzSvQec+NBskO
         GFILsA7kxm2ho56P/w+E23h/xEs5Bem7Wa9d4t0P1GDu20HTExFjtSOd1tJGxqBAFBaO
         d3L+OTKO/C+IgE/s+bt2WgS1WLbycp27c+LeGecVVa44T/RJWT0vWgzhEgwHJS1d562p
         DGdJBkklROvvU8d8szblYMFAHpd/Wl1fSOK+1NkwhzPYY7haLhZraKOtRm5ar0keWauF
         k6LnC66mvpVU018A014jCvDM4f8SusXUeDf/IQwGlUpr/Oh9R/TlCUeFQdOt6gadcfak
         q22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776063; x=1796380863;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46jt2PFBd8rULQ4Nt62VZapADm8oEY8BfGTGabREOUM=;
        b=F2BXQlY+gFUmsQNODaDfq56nTOYHVurpivNjducMFc9cYGtuZqjTDOR8e3m/4P/+HA
         jXRTrCJ/Be51qU1iSgQ+hbfPcpbWUm3GMWpRHio4tnBsiTJVVarmdZjgB24CqbscEcyl
         CPq77T587RENoOA4bejy+Kr6t/JZgpYQ8ywJuDp8xRQphESJaDKFFZ02mso/pevZUvoN
         UE/esPxn6WSJnmBQPSzP37m8uo+zCw7N5yUYI/Z16e/FSjCPvPjZ6XCTVQrRRyT9M7MJ
         diUrg8km6vwcxvoHwhmrwNHoy+CG4TkS5NSBk2+SxI+l1YVpTtcyV6ljLEvvGifW8Z0m
         I4aA==
X-Forwarded-Encrypted: i=1; AL+hErFQxjNKjzuTpr2FKIEmcgJOFrqpH52KAAQ5mpiGb43ElFdbj8/7Jsu5f8j7hAPrKO2myJ2MKgdwTg36IgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fLwXRpshopOoIehMl/DJDnX4Wxrn3kkAD28f8ssrxbfHXtzxd
	JfUW9yFAA7ua9H9hsCceBX1m/wSusewFgeUaziNSaIUtexzX7nCAd7/v
X-Gm-Gg: AZFdTZdghRGGJLZII+XsCCHXTYEDARsu/fqu0K+YiaQ7m89AqC/qXpVYl7sQuPNb0iQ
	TB9BDgP3ht7sTt3g3cI+2XOKYQjch2H912LqepSSm3W+7mz728cxxOhFI5wxnoGP67DEakhwsR8
	LpDM+ciCr6SMBKFxFcp0LOcBpIPuqbEKpJg4fNEgpfeXzJ3oI9KYSGgQHt5LuUJmLDflEb3Yji4
	jFRw1OGxHXALaqrQV7Dtx6EzqqwFUDw9yi8cU2EnvTpc9d1Ei9y+6tuDuwinUDeaMdj2i0xjfGl
	a9KhKhcp1HZ8QzLr+ERlXLigtAVfMBgpcHtls6xflYEtPIQl00ifHFd4nW37gzmw8EsTFsMEXcY
	PmL7zD2mzdQL3qMaGBUFDnxClbUiuT/7fLbfWXer/01zNyctnHaunr8bIqfq3bU30hxRGbMdP6u
	/4kNZTvKfBpUp+KMuOyhveSm83UOfWeO1hEdHV/WqfVgt68V4CM49w7fnY8Jfve07m5iWlC9WXe
	iiP8M1Ce0VYtF1rZkOGDPdTHlZzL2wfLUl5n5G/Bqgme7DExIBnXGI2enprHDXFo/HHDiKZaXZZ
	uLEvyapcnkOOBazNX6Ftxqi4fLMDcsCaB99HSD6cNxCwospgaR+feQIvTbVXG5DzSA==
X-Received: by 2002:a05:6000:470c:b0:4a7:593a:f421 with SMTP id ffacd0b85a97d-4abb73b557amr44307973f8f.47.1795776062532;
        Fri, 27 Nov 2026 02:41:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm47910577f8f.31.2026.11.27.02.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:02 -0800 (PST)
Date: Fri, 27 Nov 2026 10:41:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John
 Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Matthieu Baerts <matttbe@kernel.org>, Mat
 Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, David
 Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Neal Cardwell <ncardwell@google.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Xuanqiang Luo
 <luoxuanqiang@kylinos.cn>
Subject: Re: [PATCH net-next v1 0/6] net: avoid stack canaries in TCP/IPv4
 fast paths
Message-ID: <20261127104100.3c915088@pumpkin>
In-Reply-To: <bffee809-2992-40eb-97c7-72d919de0aed@linux.dev>
References: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
	<20261126102058.1fecf50f@pumpkin>
	<bffee809-2992-40eb-97c7-72d919de0aed@linux.dev>
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

On Fri, 27 Nov 2026 15:33:15 +0900
Xuanqiang Luo <xuanqiang.luo@linux.dev> wrote:

> On 2026/11/26 at 19:20 David Laight wrote:
> > On Tue, 24 Nov 2026 22:06:25 +0900
> > Xuanqiang Luo <xuanqiang.luo@linux.dev> wrote:
> >   
> >> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> >>
> >> With CONFIG_STACKPROTECTOR_STRONG=y, a function that has a local array or
> >> passes the address of one of its locals to another function needs a stack
> >> canary. The canary is set up and checked on every call, also when the
> >> local is only used on a path that almost never runs.
> >>
> >> This series removes the canary from functions of the TCP/IPv4 fast paths,
> >> by returning results by value, by using storage that is not on the stack,
> >> or by not calling a function that has nothing to do.
> >>
> >> Patch 1 returns the two mptcp_space() values in a structure, so that
> >> __tcp_select_window() no longer needs a canary.  
> > 
> > While all (I think) architectures can return a big integer in two
> > registers (dx:ax on x86), not all ABI do the same for small structures.
> > For those architectures returning a struct by value is implemented by
> > passing the address of a hidden on stack structure.
> > So code generation may be worse than passing the values by reference.
> > I can't remember the list of architectures, mostly old ones - but not
> > 32bit x86 because the compiler option was set when regparm=3 was added
> > for 2.6.
> > (Note that this is different from passing small structures by value.)
> > 
> > David  
> 
> Hi David,
> 
> Good point! thanks for bringing that up.
> 
> The small-struct-by-value pattern in patches 1 and 4 follows the same
> approach Eric used in commit 7a4cd71fa451 ("net: add
> vlan_get_protocol_offset_inline() helper"), which returns a 2-field
> struct vlan_type_depth to avoid stack canaries in callers.
> 
> I did note the 8-byte struct ABI distinction you mentioned:
> - On the main 64-bit targets (x86_64, arm64, riscv64, ppc64le, loongarch64)
>    as well as 32-bit x86 (with -mregparm=3 / reg-struct-return), both
>    8-byte structs (struct mptcp_space_info and struct skb_coalesce_res) are
>    returned in registers and the stack canaries are dropped cleanly.
> - On ABIs that return structs (> 4 bytes on 32-bit ARM EABI, or any struct
>    on s390x) via a hidden stack buffer, it indeed falls back to a hidden
>    pointer. Even there, the callers previously passed *two* pointers to
>    locals (&space/&full_space in patch 1, &fragstolen/&delta_truesize in
>    patch 4), so passing one hidden 8-byte return slot should not be worse
>    than before, while keeping the code cleaner and type-safe.

There might be a subtle difference in the function itself.
I think the result structure gets allocated on stack and then a memcpy()
used to copy that to the caller's buffer during the function return.
That may, or may not, be faster.

> 
> That said, if maintainers prefer packing the two fields into a u64 so that
> even 32-bit ARM / s390x return them in registers, I'd be happy to change
> patches 1 and 4 to do that in v2.

That is horrid ... and you'd need to use a u128 on 64bit.
It really is a shame that C doesn't have a syntax for returning 2 integers
even though pretty much all ABI have always supported it.

	David

> 
> Thanks,
> Xuanqiang

