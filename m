Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192669;
	b=VOeBA70Dq4UxHUuv7XA3uAbWFMDkcbDY/9RQZ7bU4RUKarDsE/PTu4M3GGOxLLwPm29J
	 Jq4l4AZqF/DtvqFCCLY88NmDJzAxmQwTsQIhyau0LHS9l/UUc6jvjecc3a5joqxWKfoNm
	 NEbjyG27NCGl8retmtWalgGyw8LPBciapXD5DA6lYml6P1mkLObRt29rplIQItNQzZ5mr
	 F3Lp4ZlsfWNvhwQdEWkPBxTjqKZhcwUIKtaB1mpO36EpMzasaEbVjMojjkSSkGoiLjk6/
	 K4eiTgeR++GhAR4Wnbxbed1fHUxg1m8/2MJCMQJ141AenVu2USDLWQnv2gWmMy+ccfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
	b=a3BNZQDEKtLTK19wyUlglLLycD4P0Z8yDN8Smk4JNYMG9zF3CiXjxJoC2lN2gLoxJ5cC
	 SpBwmSamwUXUsG399is7g9CFbAB+L/nEfKqv/3A/4aKCzLGQeJOsckeKWzWuO2lOPyoTn
	 PXixgDdcOfsRTOfaS8hFj+C08pn1hJ2tXLl0uEh2LEN/CHfOGWCvZ2iQc1ZBnmuwnDND3
	 6v3om6dhK7Y3Im6thkWws23q9gJv09YQSoDACxRKDIcLrOHZZIAiwqaOnaqqbbReWl+3Q
	 8VFQJFD8QRlWXrN62lp2vD/G+tSKgTw//yXBXZAlJbgHMcXY9LZYDBwoBM1xleaAIBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOiu824+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC8606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CC8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOiu824+
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso850058b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192667; cv=none;
        d=google.com; s=arc-20260327;
        b=XCOot2riaebqS8LY5egCKAxxGcmESDOvn6iiTUPEr7wjgGgcWAKdmJzWQ6nTNUR4Mr
         xKTqlNAQNaeKIiYJK92OHITnvWT2k2SrcL9VbYmpoAxa77HOm2Of+Gk5cvJwGAElE3nb
         +vaVZu7mrdD3PP5tW+ZGT+puXRQ3kWh+mAEULoF11RpreSIcYlvdclC9dJHkB+7X+ekH
         xIVrx1O/cfD1biZWY/dpW3eEFcBWw3DmpaUyhh4zsWMX4Wbgo0FWwCePM1HFV7DWp66A
         FRRkF/Ym6cB1mROa0zXI+ww/4K52yNcbeXG16LJn65jh8DU9HqxbC/U8Y6I0RbM2nedH
         +asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
        fh=x8j+D/KAqGwwXxlMQdthogtITfAVxKdzKhmobs6RrlM=;
        b=pXMCPURrbqIgPosbsO0Hapym6cdacb2Mk8EJANtth9me4XiyZJ247bPrURI+emQbt7
         e8pk+IaUVW8m9YQhYNiPub/gWWOrbw3sx2DwEBoRJAVbOQo2bQY5HgPwwOCyTnVBVcJ7
         HMtzJecctQ7k2c7peI2d08M1WCGfRjvMhADYoyBB9e4J0j7xvPOISCnNveSvQFe+YQHc
         K56mGl9cXRZve7GJE6t3rSXaP8ZFSF+sTX+6WwMC+QbxnASQ06B5D01B+5aVnmJlOKmW
         9aM5iSBE7LTW6PolQrslFurVvMeHwtLPtbhheRhsCa4mQ7X0MzmaXzZTEprLX2HDE3iR
         esUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192667; x=1795797467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
        b=ZOiu824+Qzybi4tCeLzrG2HfbR7LqOAvhjxtrLtycpDDlq5EvcJyn4toRCyBscyObG
         2F3FyeyAse5cYOzzflbdnEcBAXNCHUklhH0M3CNUJAJBrGiheGthMtGLB+4AzMK7voLO
         3PNSaKexaTcyBJ9ErwP0nWqVCqJK9Ai9tuRUpEKVZ3UGeYWKQsG/09x3la4TqHdesoHm
         N+BqgDqothmocsIqqDFAcl0OcZpKk9P6XH99DiiPzydVWtUDABK982SCGULWGF/s6B5C
         VPAUJhGNRfpKZg8aLC3X87wtQ7eL1lmIEUl50SFmUp+DbAGAyoKjf/abnBqXwUaKPuZD
         srEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192667; x=1795797467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
        b=RUUGEQqxPiG4CYWuPp5zrF99l3FmPSoPfZwQckhISXul/c40QV2NW88Beeo4RrZm/K
         cRI7ZGki+2+K0nkazmUx7kEdkDt6LpjUs29UuRFoJBJcwLDBvl+qmqLPMP0G4cv2pa/y
         KOKz7hQJSOfki4sLLTkLaSDhKzBrpohaPpSkHkXQ9AAzyBaLQHZpmUKVLg3VTDkQ0xor
         Ag/CZHF7VS6LG2JP/3UTYkURSX+nu7WLsCkULc18Kgfy+C6SZ4E2hebDVFxioPwq9vT9
         BqUOs3KcvcE03anLdeZjVbxYjsFYdGCC4qFXHTsyt83+db3H87MLmEWW92gSzLwMl+nS
         az2Q==
X-Forwarded-Encrypted: i=1; AL+hErG0F0Pm5F3BbjKiJ6Po6m7eAxQm3nmPnkGFn5YA2Hi9Ovm35xhmz5gb9gyE9KUmt/ch7w1n+LTq68EmWb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c4R8lc5BXKaMx96ns0I/nyqer3JswlBbJBDd4hrQFN/PKGDh3
	uKtOdltsdbsSQOndCqaKSJDNi8Dm70Kq3CTviPhoTyup3Bnt1iEiZpN5yLAI53GlwusYdcr52gQ
	uLfZVciJKwIsoGXx8Mflfhov3fd9VGn8=
X-Gm-Gg: AZFdTZcwx4d+0tnJS9rlbOHZTiXSW2WebnY6c2dIGErKO5Benr2G8schXdJgPXvYAMh
	tyfWUSVafQg2cxq4/6bs4JwEgHEOVRtimJ7uYFE8N2rzAytoNbHQAoOL6roME2MDMo0nNKX9J0K
	pUMPN2Tbo9T9I4u/9VHdPlPMnzB8OWSMeSVPwp/1lhyqu6/vO5ZqdY4uytxWNDChxxz5XC0GOfA
	QaCgre51rRJwTEex70YRhbsSxh9xfnpmrd5dkuRJYq2n/xBZD51JrxX44fWmLlCkm9v7PZTYIom
	AT46OALxjrpcd2R3wFhcj6Oh1OmvxElAceGCxKJxVbaaLlpy54P13iwj8pujXsVikcIyb8q585N
	D+2ffnrkkyyp+D4fYy7Eyp8v3lKOuerBOreW00yvQsHiiq2tCDvuFVH/6u+aRo0nMPwk2VrQj/8
	P+o2YdIa+szcuIci0VV/3OkqdU05ASHf6z+0nVzQ==
X-Received: by 2002:a05:6a00:2987:b0:8b6:3e44:8aaf with SMTP id
 d2e1a72fcca58-8c87b4ee9c0mr3361079b3a.20.1795192666568; Fri, 20 Nov 2026
 08:37:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120050108.426545-1-xuehaolin@uniontech.com>
In-Reply-To: <20261120050108.426545-1-xuehaolin@uniontech.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 20 Nov 2026 11:37:34 -0500
X-Gm-Features: Aa3M54qNypMyBmyBYevUfk0cK2R-oXwezfsszARlwdxXW7NeEApwkkiP6N3Sz0g
Message-ID: <CADvbK_fKB1P4c3KkZobQwGc84snyZG-b7NYXi7xPwN04ojcW9g@mail.gmail.com>
Subject: Re: [PATCH net] sctp: fix race between sctp_sendmsg free path and peeloff
To: Xue Haolin <xuehaolin@uniontech.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:01=E2=80=AFAM Xue Haolin <xuehaolin@uniontech.co=
m> wrote:
>
> From: Haolin Xue <xuehaolin@uniontech.com>
>
> sctp_sendmsg_to_asoc() may release the socket lock while waiting for
> sndbuf space (sctp_wait_for_sndbuf) or connection establishment
> (sctp_wait_for_connect).  During this window, another thread can peel
> off the association to a new socket via getsockopt(SCTP_SOCKOPT_PEELOFF),
> which migrates the association by setting asoc->base.sk to the new
> socket and moving it to the new endpoint's association list.
>
> When the waiting thread resumes, sctp_wait_for_sndbuf() detects the
> migration (sk !=3D asoc->base.sk) and returns -EPIPE.  However,
> sctp_sendmsg() still calls sctp_association_free() on the migrated
> association when err < 0 && err !=3D -ESRCH && new.  This frees an
> association that is now owned by the new socket, leading to a
> use-after-free or double-free.
>
> The connect-wait variant was fixed in commit f14fe6395a8b ("sctp: fix
> race between sctp_wait_for_connect and peeloff") by adding the same
> sk !=3D asoc->base.sk check that sctp_wait_for_sndbuf already has.  This
> patch applies the analogous fix on the caller side: guard the
> sctp_association_free() call with asoc->base.sk =3D=3D sk, and hold an
> extra reference across the guard check so the association memory
> remains valid even if the new socket is closed concurrently.
>
> Note that the sndbuf variant of this window predates the connect
> variant: the unguarded sctp_association_free() in the sendmsg error
> path existed before the sctp_sendmsg_to_asoc() refactor, and the
> sctp_wait_for_sndbuf() sk revalidation check was already present in
> v4.14.  The Fixes tag targets the refactor commit because that is
> where the current code structure (sendmsg calling sendmsg_to_asoc
> which sleeps) was introduced; earlier kernels have the same race in
> a slightly different code layout.
>
> Discovered by manual code inspection, following the public report of
> the SCTP local privilege escalation (Xint "NGINX2Root", 2026-11-18).
> The issue was not triggered here and the fix has not been tested
> against a reproducer; compile-tested only (make M=3Dnet/sctp).
>
> Fixes: f84af33138a8 ("sctp: factor out sctp_sendmsg_to_asoc from sctp_sen=
dmsg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haolin Xue <xuehaolin@uniontech.com>
> ---
>  net/sctp/socket.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index b5a57f61ee6d..0039c54a55d6 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -2082,10 +2082,29 @@ static int sctp_sendmsg(struct sock *sk, struct m=
sghdr *msg, size_t msg_len)
>         /* Update snd_info with the asoc */
>         sctp_sendmsg_update_sinfo(asoc, sinfo, &cmsgs);
>
> -       /* Send msg to the asoc */
> +       /* Send msg to the asoc.
> +        * Hold an extra reference for newly created associations so the
> +        * memory stays alive across the migration check below; see comme=
nt.
> +        */
> +       if (new)
> +               sctp_association_hold(asoc);
>         err =3D sctp_sendmsg_to_asoc(asoc, msg, msg_len, transport, sinfo=
);
> -       if (err < 0 && err !=3D -ESRCH && new)
> -               sctp_association_free(asoc);
> +       if (err < 0 && err !=3D -ESRCH && new) {
> +               /* sctp_sendmsg_to_asoc() may have released the socket lo=
ck
> +                * while waiting for sndbuf or connect, during which the =
newly
> +                * created association could have been peeled off to anot=
her
> +                * socket.  The hold above keeps the association memory a=
live
> +                * across this check.  If the association was migrated,
> +                * asoc->base.sk no longer matches @sk and the associatio=
n is
> +                * now owned by the new socket; freeing it here would lea=
ve
> +                * the new socket referencing freed memory (use-after-fre=
e /
> +                * double-free).
> +                */
> +               if (asoc->base.sk =3D=3D sk)
> +                       sctp_association_free(asoc);
> +       }
> +       if (new)
> +               sctp_association_put(asoc);
>
>  out_unlock:
>         release_sock(sk);
> --
> 2.43.0
>

I think this is a dup of
https://lore.kernel.org/netdev/20261112172149.27355-1-yves.bieri@theori.io/

Thanks.
