Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795043093;
	b=nMGbRxN3586meGvw3ETyRL9poyu8YQJXWKTLvGj0Jt8e2rWZ8a3LmQUhgaeZjMaudQU8
	 BhC1UHbnKHP3Waha+FJ5kRYFAMcZi8229sxEsx+YgScdGUNpMfV1y9xFsQY29/m5o8M8q
	 Fuf8/iIiUchaSqtOWq0KzQPkBUgPZNAk+PgAGWf2P/Gkv5bhJeG7A7mkGMjc74KXwxfcn
	 FsVzYskk7YRqdMwrfjd47q1MvtuPgDr8yseT6jR2DVI0M39EulSzQlzpZNIa3huX+XUDo
	 /qbFlerL2yDP0kuOroYeM2MgozEsx0ftqcb1/L4tGPUD1MX1i7E9BTMfm+nKGlztIYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KZTFDK7wToVuIFH9xLlz+M7Y14/N8hcRBkBM/5LM+64=;
	b=DdlHytGna+projDjifCwWhC6KFiiWLThBTTjIR3QCYEwLED6u0H4WjTdQNjFR0TJj74n
	 9DQ2/ZYg3edGbcOHJDHbFMdgG5RQZKMxleMvgeyD8LsY9TnVmUv0gDNsZTSNKx/LGKUG8
	 0TdCL1J5jvyAG7ypRQJOH7Veca2q2M5uS/DRZ/H6ttTjPCac2DCKZn+eUd6IKoJiaJHsp
	 xmsgb4eAeXgFa6nCeFU9V0d86NmCn1VGsqGj7i+KHti3j2Qd2wV1uHb+4QoU4hH4UeR69
	 t8Qz4A2UvARfRF6Ye6lgiAwHB6mo9qs/kVoddhm7f/rbDqMxlWp0K0aahbFYDK9jK/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fk7F4CVz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D02606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D02606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fk7F4CVz
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be1e468a8so1331362d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:04:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795043092; cv=none;
        d=google.com; s=arc-20260327;
        b=m4NhnRVTUWWCExGQSBqUfPwTP9dRIOD6MmzI97X9XITRfDT+9hW/6M5rt5ZzlcNOQ7
         KdunzZEtGGpbv4O4mtMdKagdbQwhZG9M6s2L88ZORB9+Dc8PUb5v387l+hJ5wMcPsAyi
         2lPvQVAWqUu1+rYtygt/28vyET7qEDeeFvqrmjZ6QbvFTwjhqjq15N1zrZGMcfDNgPQw
         tnFYPoV/7GqaKnniairCwFY/j9ttnb/cWhZvwMJEsWybTnizVKe0cLaWRtT1RZk+mDiC
         XxveagPq3ymWUBxMvJ+9a0kIx0inrc+zeffy7AaSAFRFEEyMwkVQ8FAdp28N7FJ8Fm4c
         XTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZTFDK7wToVuIFH9xLlz+M7Y14/N8hcRBkBM/5LM+64=;
        fh=ZSFRC3MS3+KnjVLsBTON10Qum2lO9aV83lKDAk8m0P4=;
        b=SD14RQ2FTVfsqwcyLrqibEI68Pi9r6M9lSO9Gb8dRdeLF8ZsnwfqfCJ4OLncS9PyA8
         wCPfuz4cuLViLOniWtZlV8go05oRDlGHD23bmfu5NvLmv9SlM7Q6ui+gllRG7sD/valC
         ZbIUZJKFDbenB3XhazJw64G4188V6ebSohA7nvhmcFMzAgC/oJvPwrPowXEuu0rm1rYj
         QGx6mqx6+NWm9uPyzbNokX2LyNV1hEZEbNnejn3Q6aqU92zQkasM96AqQd7LssUk1gae
         Wy6Ra1DYAnXD3teDkX3s0hl90R7+L9vF9vthJheIg030BTVgABDMeC196Krn+BkC1R5/
         P5uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043092; x=1795647892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZTFDK7wToVuIFH9xLlz+M7Y14/N8hcRBkBM/5LM+64=;
        b=Fk7F4CVzIqTVpBYAzrvf0DhPem4rMGXqFCTAbCqTTl4z67X4xNwlAGDndr5BqH51ft
         LKGecTsrb0y1pnpukSvjvXLetjlRaFkXGUN6avocCGpK2gOYpB9YXYWlWLW/3cawXhca
         fAS6gWBmJujv/mEChv+vsaCONpyijeSbjLLkAykNNop8mwz/9HDKo4fbiklZtb7bBTjc
         IShiTtGpUenlO8tazBgBdu7IR7B7EkNtVTIdCxD8JBasbDAsCiuApqk47LFEbawrjA6a
         NBM//6juStVXcvNpiKZQhz4ToUey9Pcd8WJ9m2UZzSgSBWxT024VsZ3u9FFUCZzlXGfj
         fAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043092; x=1795647892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZTFDK7wToVuIFH9xLlz+M7Y14/N8hcRBkBM/5LM+64=;
        b=ipIl6jl9tEVz9LsbTd3BkvN4Jcn1RnzIsSOm+CIY4UAknrrpd4ErXUaD1K0FGPlxo3
         Y1TIG07FniWQnm1v9p1V+HU+SqrwgiZHBLGDf1WCzReegZv1/Ixl0WmWcKrJlxoC7JXQ
         rKih6Z9YIR6+SGugeVvzxrNxQXygHYdFjSDbTFkqIZLH4dms+ThvJXPsfzxKZqLdAErH
         /CXXnD/ppxYgAg5MrZZqt8ANYs5iv/Jlz7W05ScH3KZgxF7Y2VoeCKEOtN31Hjo3u0H6
         vlYxseU2RfxelnvFp3tAvWkBQxle9Nh0HhzalkVqAx2GXKsEQrM/2dbxHuJZ6pIdskwd
         7tSw==
X-Forwarded-Encrypted: i=1; AL+hErFVUnuAm9kX0Hgc6eufETV7tFhEj/plyCWrZwThM4Bz3BC9PpOs4FndG3BwtNPw9zB72J3xWfboZhf0o/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B7aA3a7GxeJUeYkqVbdvswQIa5LUQi//5amQYErKONyW8YTar
	h06IvHaq8hZUeF7Z5XjRk+N8yrdd6zBK79ReRBGMqBXw0biG6W5WWtntdXPc7SVa+71f6K0RxpG
	iaIX3i0wbfxVfpaYHd5RftB7VzmPuW04=
X-Gm-Gg: AZFdTZdZnuHUsyMpn1tN1d2GrBGT0GH4D7w5tLo1BQvjsDQjWmsbSWwGwu4kjrLSYoh
	uX1oqojyKlC1Bk67P7tuOjo08NpDIn+3wNVOUDYprCOmCP/y/8hhts68rUkan2hkSvmwTUdqSe4
	c0DhC3W3skJUnIZ+0yL8GBTN+hfsFs/E95tbGgZGQqB9JbpVlNRqBRpzBqiKhDjWSNbr7F8xKtV
	VBq9Cduex/YxZoRS+WnAl2otRWAZqiPQ0TvkSGjo7Hogw0GII3Vi57jysxFi0OtgsHymBfMI/2q
	S3evfFprlH6+r1u5HUDaPIQBBR5LsIgxlgkZvgXfZS8VZ70m+nMwBRfa8SN56maWwu21LUQHr+G
	x1UuXyuHU+FCP3Hl8m4X9HpXi8/PjIftqwv9T+YU3887iAuWSQUk5fYu1Dh3I9UbuWphaCVynad
	hNMvDhALDD/Wl4JM5WFkTJO7zdfgtmxWBLn36ergtggHEy+KPgxP/jDtE4
X-Received: by 2002:a05:690e:408d:b0:67d:b472:88a8 with SMTP id
 956f58d0204a3-67dd4025a14mr2161968d50.82.1795043091673; Wed, 18 Nov 2026
 15:04:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118213322.60067-1-mohammed.saad.alquraini@gmail.com>
In-Reply-To: <20261118213322.60067-1-mohammed.saad.alquraini@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 18 Nov 2026 18:04:39 -0500
X-Gm-Features: AclHuK-21xvoF1R7FRBUL1DF35OsNzAIO8RSAqbqE4KfBM5RlmzDAc_5P9bd6dI
Message-ID: <CABBYNZJvzYd98m9rosF2m+nP50tTUf1MwHBPThpcUYHNoUxKzw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: L2CAP: check security before completing a
 deferred BR/EDR accept
To: Mohammed Alquraini <mohammed.saad.alquraini@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mohammed,

On Wed, Nov 18, 2026 at 4:34=E2=80=AFPM Mohammed Alquraini
<mohammed.saad.alquraini@gmail.com> wrote:
>
> A BR/EDR L2CAP service that listens with BT_DEFER_SETUP asks the kernel t=
o
> enforce its BT_SECURITY level and only decides which peer to admit. The
> deferred-accept completion path does not honour that.
>
> The child channel is placed on the parent's accept queue at CONN_REQ time=
 and
> is reported pollable (bt_accept_poll() returns EPOLLIN for a BT_CONNECT2 =
child
> on a BT_DEFER_SETUP listener) before the link security procedure resolves=
.
> When userspace recvmsg()s the deferred child in that window, l2cap_sock_d=
efer()
> moves the channel to BT_CONFIG and __l2cap_connect_rsp_defer() replies
> L2CAP_CR_SUCCESS with no security check. If the security procedure then f=
ails,
> l2cap_security_cfm() has no branch that matches a failed result on a BT_C=
ONFIG
> channel, so the channel is never torn down: a peer that failed the servic=
e's
> required security level keeps a connected, data-passing channel.
>
> The sibling setsockopt(BT_SECURITY) path already rechecks with
> l2cap_chan_check_security(), and the non-deferred incoming path denies wi=
th
> L2CAP_CR_SEC_BLOCK; only the BR/EDR basic/ERTM deferred-accept path was
> missed. This is the BR/EDR counterpart of commit 522e9ed157e3 ("Bluetooth=
:
> l2cap: Check encryption key size on incoming connection").

That is encryption key size, not security level, and why is it
mentioned here and doesn't have a Fixes tag if that was missed?

> Gate the deferred completion on the security state. In l2cap_sock_defer()=
,
> before completing a BR/EDR deferred accept, call l2cap_chan_check_securit=
y();
> if the level is not yet met, mark the socket BT_SK_ACCEPTED, leave the ch=
annel
> in BT_CONNECT2 and send nothing. l2cap_security_cfm() then resolves it: o=
n
> failure the existing BT_CONNECT2 branch denies with L2CAP_CR_SEC_BLOCK; o=
n
> success, a channel the daemon already accepted is completed through the s=
ame
> path a non-deferred accept takes (state -> BT_CONFIG, CONN_RSP SUCCESS +
> CONF_REQ) rather than re-signalling an accept already made, so exactly on=
e
> CONN_RSP is sent per channel and the on-air sequence stays strictly monot=
onic
> (AUTHEN_PEND, then AUTHOR_PEND for a not-yet-accepted channel, then SUCCE=
SS).
>
> Validated on an arm64 QEMU rig with a BR/EDR peer emulated over /dev/vhci=
:
> with the patch, an early accept followed by a genuine Authentication_Comp=
lete
> failure is answered with CONN_RSP result=3D3 (SEC_BLOCK) and no data is e=
ver
> delivered, identical to the non-deferred control; an early accept followe=
d by
> a successful (keyless) auth completes only after the security chain finis=
hes,
> with exactly one CONN_RSP SUCCESS and no trailing PEND; a deferred listen=
er
> that accepts only after the security resolves goes through the designed
> CR_PEND -> recvmsg -> SUCCESS path with the link at the required level.
>
> AI assistance was used in finding and preparing this patch.
>
> Fixes: f66dc81f44d9 ("Bluetooth: Add support for deferring L2CAP connecti=
on setup")
> Signed-off-by: Mohammed Alquraini <mohammed.saad.alquraini@gmail.com>
> ---
>  include/net/bluetooth/bluetooth.h |  1 +
>  net/bluetooth/l2cap_core.c        | 10 +++++++++-
>  net/bluetooth/l2cap_sock.c        |  7 +++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bl=
uetooth.h
> --- a/include/net/bluetooth/bluetooth.h
> +++ b/include/net/bluetooth/bluetooth.h
> @@ -407,6 +407,7 @@
>         BT_SK_SUSPEND,
>         BT_SK_PKT_STATUS,
>         BT_SK_PKT_SEQNUM,
> +       BT_SK_ACCEPTED,
>  };
>
>  struct bt_sock_list {
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -8011,7 +8011,15 @@
>                         __u16 res, stat;
>
>                         if (!status && l2cap_check_enc_key_size(hcon, cha=
n)) {
> -                               if (test_bit(FLAG_DEFER_SETUP, &chan->fla=
gs)) {
> +                               bool deferred =3D test_bit(FLAG_DEFER_SET=
UP, &chan->flags);
> +                               struct sock *sk =3D chan->data;
> +
> +                               /* Complete inline if the daemon accepted=
 early. */
> +                               if (deferred && sk &&
> +                                   test_and_clear_bit(BT_SK_ACCEPTED, &b=
t_sk(sk)->flags))
> +                                       deferred =3D false;

I read this thru a couple of times and I still don't get how can you
get !status when security hasn't completed? Are you perhaps forcing
invalid behavior from the controller or something similar?

> +                               if (deferred) {
>                                         res =3D L2CAP_CR_PEND;
>                                         stat =3D L2CAP_CS_AUTHOR_PEND;
>                                         chan->ops->defer(chan);
> diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
> --- a/net/bluetooth/l2cap_sock.c
> +++ b/net/bluetooth/l2cap_sock.c
> @@ -1274,6 +1274,13 @@
>                         release_sock(sk);
>                         __l2cap_le_connect_rsp_defer(chan);
>                 } else {
> +                       /* Defer completion until security resolves. */
> +                       if (!l2cap_chan_check_security(chan, false)) {
> +                               set_bit(BT_SK_ACCEPTED, &bt_sk(sk)->flags=
);
> +                               release_sock(sk);
> +                               l2cap_chan_unlock_conn(chan, have_conn);
> +                               return err;
> +                       }

Why wouldn't we do it earlier? This is too late, the userspace has
been awaken by the likes of l2cap_sock_defer_cb when the client socket
should really have been rejected not accepted.

>                         sk->sk_state =3D BT_CONFIG;
>                         chan->state =3D BT_CONFIG;
>                         release_sock(sk);
> --
> 2.43.0



--=20
Luiz Augusto von Dentz
