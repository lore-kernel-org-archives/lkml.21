Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285249;
	b=G8x5drZjE+pA5YBIUP/y+1qEmQxmbf0iU/K1zy+0dD1sLw+hmrWinRvQxmSsz2tYoFcx
	 /MaO1Q/0FcbpCG90K6837Thm+K+lMi8Z7SgzvNXkIsRDXK34rF+OIXTzDYiuqLPbzst3a
	 +DJRWLAVgn0Bct7FHzK0oL7cefrl2vbCpItBDpMIu53WEQyl1NTrHvkf3yp+PVeeHgmWt
	 Ud/x630KWAX5c3A0QnGkVtVNJIGjTTxlbcywInAsgVDHXrFZOw08YHzdMrHW5FunsL3xS
	 wTd9nWphZus28Cjsz3++mze4tLCDM6VHWo+KA9Pk2THsnc4ONdCcu87GxQ2RSrWvDVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KI1ORU4gc9du1NZSE0crgGckyJHWnAayP08t9HR4ogg=;
	b=pk+Bs2NE9QzCtX/RF2TmgAIU17Du9PWgMrKzcYPEqEzgFAbqaUfDooVpzcNH4U8HU0ia
	 VizVqnZBrdcYR69o9MCmoY+h9pbiHZzjckbAkIbpDwfXCnZ9k7ij51MnFEYWs9/hcT3Bg
	 WL0M2cpD+kBnU1yNg9MMcNIoE85pYKVfFa/ekcvpf9cxH48IpX6WttPWS2nMhIV+CzvyB
	 3PHcSE1geRtkLgQwvGlm0/pOoiw0wivOT/mYfj3vIIlCtwAflZ2t1Tgff4+EU04aj06UH
	 +j9xB8sK4hLyKEvSI6jgXUUJ8ErodrWNzFLUEon2I4oxgzN52w+69Xa5+071AG+DQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+Fg9iC2;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619A606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C619A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+Fg9iC2
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so2773867a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285248; x=1795890048; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KI1ORU4gc9du1NZSE0crgGckyJHWnAayP08t9HR4ogg=;
        b=Y+Fg9iC2oscQUEyWn6ySF9qUwqJ014h262RlMdXZ3G2FRej4k+dj8/yhEey/eFa6o9
         LNyx7AVBaq92O2RyZ+R1s9EgX4vWQmp2t2+vojj3P7MXhE3yJAep7L2+3lCEEQhk6zd1
         3T2oHM2NGfxU/z8AbZJjhq+eJQZuz4YG1ri91/DMtSo84cBe8Zay2Tf/N8IC4rBEmtff
         TA3kZGy/D2iQ8VgMjNp/2PwKfuB2XonAEOOCAfhyvyiitB03OoPkj65APvuTGxH0Thus
         p4Jf7bx6oHqfqWs6pFdOI6dCRhs3PawrBUTXoDoIJH0MoPpNxUHkDGhAr+7cjxR76Zl+
         ZQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285248; x=1795890048;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KI1ORU4gc9du1NZSE0crgGckyJHWnAayP08t9HR4ogg=;
        b=IU+Afqu1PHLASO10h6SahgAct/1jY5BXqb+TQ5kpIIH5ausqpMRFnpU1UXIUymp7L4
         ILH3WN7IsnrXdNCeDPTcdCOEuhnkmtVcZRzhLFjnlJ2Z1JlwfI23rO7yClIYUiOfUS0p
         y2LgMUB9FTXOL39Xaz8/uUH5DjteGCK/oUEArqL19N9MIDRRJ4x0/Ap8NgiWJb5epuZF
         kpiveno8tstNZFnAT4fibqhiOGRbTDrRCR7n1OopgBHzsY7VZyYz5/4I7iOJpjAsXJ76
         1Tn4RgDtwnnqpvMo6/Eur+dg5xA9/J8MgfiMprLSt2kmahVIqhj8SbKychA3XC9OPNeF
         F7og==
X-Forwarded-Encrypted: i=1; AL+hErFX08wz5ZWOgGni3mXwmIC6sG3jVKDw/ZJHauhlQbvbFACjWUa1AMVzABYJ8ZZjEm2lQrfVL7mF5tX0etY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VcVeD1+18xvQGuiiIHiJv/WYBUmAj2/uRE+eBoajYQU3JU2d+
	MCeWHvAoDX9OgtmZC7uJfs1qpf4QrpuaLwD8J37mYw1RZq6VjHVLojc+MHe5JCmJeyf534MRTz9
	71XglOg==
X-Received: from pjbnd6.prod.google.com ([2002:a17:90b:4cc6:b0:3b4:50ed:c55e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e705:b0:3a0:9640:803a
 with SMTP id 98e67ed59e1d1-3b41c7e118emr6746307a91.5.1795285247861; Sat, 21
 Nov 2026 10:20:47 -0800 (PST)
Date: Sat, 21 Nov 2026 18:20:47 +0000
In-Reply-To: <20261117215554.68071-1-dennylin0707@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117215554.68071-1-dennylin0707@gmail.com>
Message-ID: <awHetU_All3Iydgf@google.com>
Subject: Re: [PATCH net] net/tcp-ao: fix reset key lookup for IPv4 segments on
 IPv6 listeners
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	0x7f454c46@gmail.com, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 17 Nov 2026 21:55:54 +0000, Hungyu Lin wrote:
> tcp_ao_prepare_reset() looks up the key for a reset that is sent on
> behalf of a listener by the address of the peer. It takes that address
> from the IPv6 header whenever the listener is an AF_INET6 socket, also
> when the segment is an IPv4 one that arrived on a dual-stack listener.
> The address is then read from the middle of the IPv4 header, the key of
> the peer is not found and the reset is not sent.
> 
> The v4-mapped check that follows does not help: it looks at
> sk->sk_v6_daddr, which is the unspecified address for a listener, and
> it runs after the address has been picked.
> 
> Use the protocol of the segment to tell the family, like
> tcp_v6_do_rcv() does.
> 
> Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  net/ipv4/tcp_ao.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
> index bb7bbc20ba3f..656dbf805cfc 100644
> --- a/net/ipv4/tcp_ao.c
> +++ b/net/ipv4/tcp_ao.c
> @@ -813,14 +813,12 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
>  			sisn = th->seq;
>  			disn = 0;
>  		}
> +		if (skb->protocol == htons(ETH_P_IP))
> +			family = AF_INET;
>  		if (IS_ENABLED(CONFIG_IPV6) && family == AF_INET6)
>  			addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
>  		else
>  			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
> -#if IS_ENABLED(CONFIG_IPV6)
> -		if (family == AF_INET6 && ipv6_addr_v4mapped(&sk->sk_v6_daddr))
> -			family = AF_INET;
> -#endif

No need to read sk->sk_family.

union tcp_ao_addr *addr;
unsigned int family;
__be32 disn, sisn;
...
if (IS_ENABLED(CONFIG_IPV6) && skb->protocol == htons(ETH_P_IPV6)) {
	family = AF_INET6;
	addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
} else {
	family = AF_INET;
	addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
}
