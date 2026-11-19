Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073684;
	b=esptgbVmxCz5NYdDKpoi/H41Xqxj8W+LhhzsmPi1XfJQLna3jBAVdFo8ZJ2kTpP5XBcm
	 J0X6q7ggrL08w2EP85ZuQ1stW9Ea+VlsrRBV1G3nCfirVfjwS7e64sqdrixUEKLPuy98L
	 XPOI6hb/Fu9YNkyhTOetjRhue5WNu1jiF6+nvU1UTq3e+BCE98zQ2RFqcxCveC1HiGwMO
	 e8JsJZ8J9iEyLE6tMAnlIoVpB0D7VNlaRhmVY+Y6Xmk+DoHChQwwh2/2NopKOfySKQI1Z
	 kK1XvSqBFqDmAL4EtzLdR/b8jR13n52jHMH4TbPq9pgqQzFYFV0I3eb0DIu9+jFuxNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gjusxHLs8BnE8wEfuFeVlYsYGPDDDVtyMEC/lGh7zfI=;
	b=49Rnxh6GR5OT3dgzEpVIB9SRyPHV7zWSQS8rRam4DQ4Fs0GmXeS9waSJrJaUOsrCn6vO
	 tsGJ28KExx/38/Q4ZyIHi9YLdnNSQvWtwePgYTIY4dW6zDumRXcm1YXDdg2GOyIeha1D4
	 i2I4F24EHZyaUM58+Yot2AzHfd7M+nPxZgcDvyYwfR03Cqf9sAqwJqSyBjrpwzbHrF+uP
	 9mFJ4gb7uR2TyWhNQVDfX10fVOxvFmUFYdUwZvsy+Jrrt1eJFt11KEQGOcsDktmHCRdd7
	 pYWERJR0To/ht6/aDP2H0C/0WGOmvg/EA3uk47VhoJrbhkXyvrorVfiA3ZlH2FKexPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="M/lHRTlh";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F45606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F45606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M/lHRTlh
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed00709df0so17752945ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795073683; x=1795678483; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjusxHLs8BnE8wEfuFeVlYsYGPDDDVtyMEC/lGh7zfI=;
        b=M/lHRTlhZoCChYwJ+n2nrsiezOvYh9X65AisaBf+6eCaTvFRCRTo5IssNy1QkTmjHM
         z0l3EvT9OZfA8J/BQ95mvnIEjfyLklJ1leJFbz2NsyiRG3qbRvqyqjcUbu1FTHj13xcW
         /yy5WQGxCtk+/3b5Dc5TZDYnPvoO3pGGDPJDMlimLUiQLYO2hnCL8fFN6UzJV70GfUde
         lAIx4x3hqFNWbw3NSehYyOMm+ZQQGfNxCnmNSUFTrqgNA/S1q1BQJyBsyIUTO2f9U9GJ
         Q2kQ3lsu42dMgSn7o9TwxRK7/Nh3RcgkgHXEn5T8adYjYlqDEo7Qz4fxUyNrs1xsvhZJ
         0qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073683; x=1795678483;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjusxHLs8BnE8wEfuFeVlYsYGPDDDVtyMEC/lGh7zfI=;
        b=jpDb9pa80RbyhVZBC9DC8GzH0C/YlLOzM3cMFXmElFN2y7qDkJUgRfvAXG7FH+oUlR
         SZRS9U0PjO73uYYBlr/tVxzlXdDlD1KOxGqapswShVLsJTY/pcU/eIEsh4+3EjBejeC2
         Pbn8ojwRVUF3K42U5E/f+btSkGvWoD0WJpsO/m0bpGX3kUB5l35LZrydwV43CAtqUZqU
         nmBKLGQi6yCThn1PQRpx3akhkx2UAldiJFjK3D/nRm+64w3ZBmu57QMccs1BkhOhSibK
         Yf0NqSyIAVMxTVI1X7nBuYiOoXMWFoKNF0UMOFT5Edh4sZtvI5X4MTOMYne3/Vj7lF+S
         cVfA==
X-Forwarded-Encrypted: i=1; AL+hErF8lz0eXDbqv/5glNPgF/udiFOIJa2K/3/0VGyy4Dhfb7tGPsLPpZJLKOjgZoAC7RglAj76EF3hyVJPldw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6JqSsfGx8lqTP7JUQKUYBkjIILCnEap32z6EZPA/ws20JyoaK
	VRy/WnUFSL4G3sI0OMTvIOSPafKRsthYJRfAs/0RoIVlr3R7CB4rL3D5HqfuYAaS+hlM/3gB9nz
	X/mIl1A==
X-Received: from plpj2.prod.google.com ([2002:a17:903:3d82:b0:2e3:1b6e:33bb])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64e:b0:2ed:12a1:c4a9
 with SMTP id d9443c01a7336-2eff752924cmr51702555ad.11.1795073683031; Wed, 18
 Nov 2026 23:34:43 -0800 (PST)
Date: Thu, 19 Nov 2026 07:34:42 +0000
In-Reply-To: <20261115161820.941166-1-zihengw03@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115161820.941166-1-zihengw03@163.com>
Message-ID: <av6mbcM5wdGnmdM4@google.com>
Subject: Re: [PATCH net-next] net: do not use SOCK_INODE() in sock_init_data_uid()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 16 Nov 2026 00:18:20 +0800, Ziheng Wei wrote:
> Since commit 5d6b58c932ec ("net: lockless sock_i_ino()"),
> sk_set_socket() reads i_uid and i_ino through SOCK_INODE(sock).
> sock_init_data_uid() calls sk_set_socket(), but its only direct users
> are tun and tap, which pass &tfile->socket and &q->sock. Those sockets
> are embedded in struct tun_file and struct tap_queue, not in a struct
> socket_alloc, so SOCK_INODE() points at whatever follows the socket in
> those structures and both reads return unrelated data.
> 
> sk_uid is overwritten a few lines later with the uid passed in, and
> nothing reads sk_ino of a tun or tap socket today, so the result is
> not used. The reads themselves are still out of type, and with
> CONFIG_RANDSTRUCT the inode fields can land beyond the end of struct
> tap_queue.
> 
> sock_init_data_uid() was added so that tun and tap would not use
> SOCK_INODE() on these sockets. Set sk_socket directly there, clear
> sk_ino, and let sock_init_data(), whose sockets always come from
> sockfs, fill in sk_ino.
> 
> Found by LLM-assisted source review and confirmed by code inspection
> only; the out-of-type reads were not triggered at runtime. The fix was
> build tested only; it was not run against selftests.
> 
> Fixes: 5d6b58c932ec ("net: lockless sock_i_ino()")
> Signed-off-by: Ziheng Wei <zihengw03@163.com>
> ---
> 
> Notes:
>     The changelog was drafted with an AI assistant from my analysis;
>     I have reviewed the code, the fix and the text.
> 
>  net/core/sock.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/sock.c b/net/core/sock.c
> index ad414878d..b4499be84 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -3831,7 +3831,11 @@ void sock_init_data_uid(struct socket *sock, struct sock *sk, kuid_t uid)
>  	sk->sk_sndbuf		=	READ_ONCE(sysctl_wmem_default);
>  	sk->sk_state		=	TCP_CLOSE;
>  	sk->sk_use_task_frag	=	true;
> -	sk_set_socket(sk, sock);
> +	/* tun and tap pass a socket that is not part of a socket_alloc, so
> +	 * SOCK_INODE() must not be used here. sock_init_data() sets sk_ino.
> +	 */
> +	WRITE_ONCE(sk->sk_socket, sock);
> +	WRITE_ONCE(sk->sk_ino, 0);

WRITE_ONCE() is not needed.


>  
>  	sock_set_flag(sk, SOCK_ZAPPED);
>  
> @@ -3897,6 +3901,8 @@ void sock_init_data(struct socket *sock, struct sock *sk)
>  		make_kuid(sock_net(sk)->user_ns, 0);
>  
>  	sock_init_data_uid(sock, sk, uid);
> +	if (sock)
> +		WRITE_ONCE(sk->sk_ino, SOCK_INODE(sock)->i_ino);

Same here.


>  }
>  EXPORT_SYMBOL(sock_init_data);
>  
> 
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
> -- 
> 2.43.0
> 
