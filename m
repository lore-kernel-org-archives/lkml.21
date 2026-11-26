Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688462;
	b=ONHG4Er1kjOqaF2jK0RdCTmukSMSv/1XqGPUEvvi9eRM3te4bzvjHm+cGkpfE377Bjte
	 aJcCCtXQCmKoCleZISxRcveP8j0xsrbYxV7pKYA27lksL0cnDFK4wQKk46bgwA7z5PJ+x
	 ZCZAuzRmLvdkqapxPERyy6UWivn8KTXEtT9b30y2NH1hxDjjhS02cdDsAeo8lzwNeG9Ta
	 qxQnlELW2NmOZDSj+pwM4RnM/iCkOLAeb0vSErHjuiWKrbKsrMTGtzXrE2jUwpzBlcpF7
	 SnvQdkzKOwEJr8P/ydRIhq3fuZnUy8vKt17HweN/lpfrNMOqAE8/Qm5Ofl+pxM0YCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Dz5Obh5lP0tOLHLiHWSWNzgVimL59XKVdrhzCbJPLAQ=;
	b=Fmhx0or9Mq1U8MFn5NJUIP2v6VhfZ5SR0P/FbsebbS9aV6fX4bJAivc0W4/k/AzoY9dy
	 nXP0O/8J6l3D5pcac2maEee0J7EbmWD0fcWPlSzxdNCGv2Tfzgm2rh+ix8H/wRSx+81de
	 g8KpQX63AEacTzic6o26nysDIWJujBs80qeMVJ6f/xB8IM/sh7Gw5/3yaRsizEfEB+vyw
	 3bzWU8GFAbx/R0/KDPxJzbQwmRy7TQ/reusaufVfQmtTOwnzItj2/JsdRWdRYsp0r1D2W
	 SWSx/CRlv6OLaD7JPwRfkDyvajwTX8U9pWHoIN0aCoVEcugHpP12J6AEZXxZMkz1qlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CD7VT//B";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32687606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32687606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CD7VT//B
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so65112805e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688460; x=1796293260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dz5Obh5lP0tOLHLiHWSWNzgVimL59XKVdrhzCbJPLAQ=;
        b=CD7VT//BnwjcVd/x9W08z4hh0qia6Xph8wF/i4minXZySyXu8zsDolv0LFjazmM/6m
         pIGU6L76Mawk8H2KfnDIrG2oDmO7Tv7sO/LEOBXhymVTUcYfViwFwrXpTpNkkpHs8gl4
         otBJYE9GgyVPV2IUsre2NvaRLOV2zPcBDOjAv1YT/TJrss4Pq0CevX+URUlIVbdF1LB+
         iN55YZDkHNufNljGtkNuEStzk9IaQR+nbcYV+y7g4IE4bHodjC1+Z4Qpfkkd525fXANf
         yjTMIfngYNzhYLbG2HD7dSz7i6QkbKb7sIKmnwYNW0QDrTCnZACMi6z8+NrNv2a+YLfm
         iQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688460; x=1796293260;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz5Obh5lP0tOLHLiHWSWNzgVimL59XKVdrhzCbJPLAQ=;
        b=LsirpH4/PDZeudYkjr9skDfjHr5d1XFJKy/mG6lS5V73MpDRIchA/ze/xUl8QjLMF4
         L55iUXW8OcoqxAEB2cDiVJA0UyPqqAZjenWx/9alW9eSY7iqkMN6ouRJpEsan7P8S6eX
         5jsEtNXCGYO+2HssF0M0mFTOtmlOqGFQnOxKt6vM/ruy5ZQuY4q9dvC7SUQuwxHVW18n
         DU34Zx7H7+RxblRrg7cYr7AzJOqAoucuH+2FHcAY+mqKSCn0Zls2KUgaItG1xu5EY1i8
         /o9OSD3xez/R0B8CC3KD4fWVMPMIMR1YGKkTbZiRJ08zVrc1cGCQajsQKDr/ov7k4dVv
         c+gQ==
X-Forwarded-Encrypted: i=1; AL+hErGNThFmzPMKR7IMqTMotAQsxwaRt/mZ7yHSJShKfUb5FMzsyS+vBMqEXifP4VjsS33mcsIH9uJ3UvnX51s=@vger.kernel.org
X-Gm-Message-State: APuU4Z80nH94TOPiDBr6N/VWbfMSX2UcIXCziyOHWlsg5+6jfWH8MPFR
	W1dc8Meg+I6WNqnhai7UiKMBLG1hUBS30hFQRUNsvLg+SvBlMzBs8EhX
X-Gm-Gg: AZFdTZdz97zgHIgjvPrFvroDuElDcgPX4Wg6mDYrhlzJ5ftXsKbzUiA2OAMd0aYxaIq
	ErOyfb9W32BFgJSwe1+VpDIf4rLuCnbznuJOsbBud1SxcspLOOp0F2Gjq7JPP1xR1pJ9d9E4b1X
	vPMlu8ah6xbSyEOm2hIK6dRIhCGsaUTa0whv4eGIxX0zgWEbP3gFeIoS91aTMleWfws2WHMnNCD
	rS068JHvFif1Y58XHAj4OfzwtLZuK4aymRs79TwmzvKxE1JJJTSI1akYObUWNkIzOjGiUcTgfB5
	TCEQ6wr09LzxOe6TI0pqa3rifezRuwAgkI7YgpvweWN55Tff5y1Nx/ELaMNrYfju8ym9+u06/UH
	HffPWZ0izweP1OMTHJLaJFklOTwMfZ6EmEyHcNafKie94+HSao470Jhvh+UGBAcPq0lMELsbDkq
	mubv0Nmci6V7SE79/Zp02KQkOL9VbI9/zlEJaQxBjXD5TErfqqi4ulf0GNj93FOFf1aHuPSUgof
	RpBqNjnSXHpRcq04r6925obWLZRsqniYNQgE/2+Ab1btoHFFES6mMOjzt6VG21N2+H5h9zzZL2n
	Z2U1TQZS65pEe2F5H6qS9v3Mv0fEHUOrUW48I4e/DVsnfBdp15s4ThIQhaFTyN9LCw==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr432378915e9.3.1795688460499;
        Thu, 26 Nov 2026 02:21:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm581334935e9.5.2026.11.26.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:00 -0800 (PST)
Date: Thu, 26 Nov 2026 10:20:58 +0000
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
Message-ID: <20261126102058.1fecf50f@pumpkin>
In-Reply-To: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
References: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
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

On Tue, 24 Nov 2026 22:06:25 +0900
Xuanqiang Luo <xuanqiang.luo@linux.dev> wrote:

> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> 
> With CONFIG_STACKPROTECTOR_STRONG=y, a function that has a local array or
> passes the address of one of its locals to another function needs a stack
> canary. The canary is set up and checked on every call, also when the
> local is only used on a path that almost never runs.
> 
> This series removes the canary from functions of the TCP/IPv4 fast paths,
> by returning results by value, by using storage that is not on the stack,
> or by not calling a function that has nothing to do.
> 
> Patch 1 returns the two mptcp_space() values in a structure, so that
> __tcp_select_window() no longer needs a canary.

While all (I think) architectures can return a big integer in two
registers (dx:ax on x86), not all ABI do the same for small structures.
For those architectures returning a struct by value is implemented by
passing the address of a hidden on stack structure.
So code generation may be worse than passing the values by reference.
I can't remember the list of architectures, mostly old ones - but not
32bit x86 because the compiler option was set when regparm=3 was added
for 2.6.
(Note that this is different from passing small structures by value.)

David
