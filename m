Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999914;
	b=GrGMh4w/KkK9qESaqluh/gptu0AFbCEmVTs/dO22+FfgEUx0BnExr4dg8e6yJWQeT/sH
	 fAudzQJ0X1UUDcZN21c2LHmb8OMO5eIln9iykVcexy1Rmuz/INkL/FAaqsBMgArLqraYI
	 oY66I4ZkLBJuIgf+pcz79mCDE4prCJF2KdKzj487jpWqhq15zF30Gyt3QdoYCf8n/5jmX
	 7M0zHNTs4GhattGnRmM7eRw1R54uJnaX+U0lePmIRFQ8qCxqlTosGuchrQAxcWZOKFZl1
	 dsd99Mmq9ieP5QO1U0Z+Rb1VPCUM+qlmSbzn/rvwSv34HRp7BffXUJwGgk9vNLNEqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999914;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wkNqj/Ri/DMG3jz7yivagroyPuLoigFqxoANJ+MiNn8=;
	b=TaJZ1x7cQ7pRMC99o2uRrv/j6sn8U3pS1+q6ST3bdEEqhi3KUzDW5tEnkcP4I99cRH6o
	 3taf0pJySl7y5JzXSIim/NlWAqUmJXN99tfCipp77DwM4jKXkBdJhEIsnVqi7iRF9KEC8
	 b5lyhlxq8pQq/bNq3+ZfM/t8fVHTK6uXy2en8jF0+JDax6c/Qj6+/hSd+WK/ld5yHdOvv
	 Gp6ct1HGm7yulFCwl4RGIst9EMxRavrJv1LadItw0sels6pIsyYCjM9BBRkAxtFCPcEN0
	 Gjy1qRRaHkiaE7L/6+Lhg3FFMuJpEbhlY6iNsDJgonumaiCq0sI5mMeMmmuz693xtuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/0s5lGD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D260606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/0s5lGD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AFA1F000C8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999913;
	bh=wkNqj/Ri/DMG3jz7yivagroyPuLoigFqxoANJ+MiNn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A/0s5lGD3drPiYEQ+MclkPga66UkhVReitMXeEUP4eCvJDQvJb5tiOJA9IuXO8ZlE
	 zUWmyaAcuYrt3ZTcId5b3AgG2K4HB6RYJto+HbhBGOubpzVC9guNVB60kg7wnri7et
	 QuRfmWaLmZVovt8gMT82EWCC/nHevSfzB2FU+pgvgRFRa0tyPkTaSKrUbg/pRtQHHC
	 k+BYSR1q0aGPKz2JO86BuiIx820aALcgVCk5q2FgT8kqRRdjZuT72ZfPGSitzsw6WB
	 VpQm8SUjNDI6CheO0nweOT7qUph+tKyL/Wvsqyz0vYxsyuZBkO86iqOCAqty16ftwI
	 nkZJo4E6Ap48Q==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4ad881b6517so509611fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:05:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFicIqDRX/uIWuw3HT/CVonaCKZpQJsczZQTXRyEuzD/5JfzYWtC2ZnYVSbEuJlCo43NirlE6ZvvSCxFeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F+qjxCE4O2O4D+/gvGjrv5Alhak9UDy0N/nANakjd3UDEbTo7
	XkfM1V9QvMUPNpbcMI/Ir5azxCFko1zSR4EgUWOUOdwIbrr8LqBJAV9IfwvAIMCpi+rFc6eRwAH
	QEHU5XepcyCB4hzP+K3FrE/1+6ITh6Zk=
X-Received: by 2002:a05:6871:a1e3:b0:47b:7709:5568 with SMTP id
 586e51a60fabf-4b75fb23c32mr1749736fac.10.1794999912304; Wed, 18 Nov 2026
 03:05:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 12:05:01 +0100
X-Gmail-Original-Message-ID: <CAL4Wiir7GS+-0tSH6D49f+xZv6njk+sbc-_E45_qnqgHe6V4TQ@mail.gmail.com>
X-Gm-Features: AclHuK8EU7ooUYtzQK1pnm1__Qtfk6vzERe7RCmUjC-TOgvb6EadwPUWX31HIog
Message-ID: <CAL4Wiir7GS+-0tSH6D49f+xZv6njk+sbc-_E45_qnqgHe6V4TQ@mail.gmail.com>
Subject: Re: [PATCH] nfc: llcp: walk the accept queue under the socket lock
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 09:38, Henry Martin <bsdhenrymartin@gmail.com> =
a =C3=A9crit :
>
> llcp_accept_poll() walks parent->accept_queue and reads each child's
> sk_state without holding the socket lock.  nfc_llcp_accept_dequeue()
> unlinks closed children and drops their creation reference under that
> lock, and the last sock_put() frees the child.
>
> A poll() racing with accept() therefore reads a freed child:
>
>   BUG: KASAN: slab-use-after-free in llcp_sock_poll+0x440/0x4e0
>   Read of size 1 at addr ffff888112387812 by task poc.bin/528
>   Allocated by task 198:
>    nfc_llcp_sock_alloc
>    nfc_llcp_rx_skb
>   Freed by task 529:
>    __sk_destruct
>    nfc_llcp_accept_dequeue
>
> Take the listener lock around the accept queue walk.
>
> This issue was discovered by Tencent CodeBuddy Security.
>
> Fixes: d646960f7986 ("NFC: Initial LLCP support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  net/nfc/llcp_sock.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>

Next time, please specify the target tree in the subject ([PATCH net]).

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Also, make sure to wait a least 24 hours between versions (
Documentation/process/maintainer-netdev.rst )
