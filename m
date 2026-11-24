Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795529805;
	b=D22aI3/kGzWc3cfulXM3+nXCp4sNRqzE1T+WcoxBJTgvE4eEwN1YBNkzOM4o1enws1b/
	 TnrnSBd1gEGMrbZg66o2sQx44bP9keoHeEMT6efJKhpDeJDBVMv0s+mQnP5OqVwJ7Sk1Y
	 EaOW8cgKw2q1YwbGTePaNMNxsQowynr58LTbrzE2PAPpBIBMf1nPbhVTrtjkU+Z0qaUYK
	 IMv0W44JpoSJp7HabGnfSskV2dMkS+uLIK43/ibQp+JzwEQSAuYQlWjV4zJpsabBa7oB5
	 ioT3e+WsKnkQZfRwtnnProNROH+ujSFCy5S/Ae0IlVrb7mfw4OhEzPRltuoXQe3J9ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
	b=uP83QN+cXb0FTstzPYpjfPaR7qmw8fykm3dblxDw7dAVRieG6ZB/3iAUYtxqgUuxsMRp
	 LD+sBQ2vhMMBjnXIpQmLRxStX7aO0Q47qX4UexZfM1Pk6iVkaVYU4N/kt6aQjR8pdeyDQ
	 OuK55dqbtecoBJ6dzZGbXq2/q4LWzzwKvejNkmUaCkBkGR60loCOmfhVFpVcFE8m3DC4V
	 Ob0fHjXGSv/r2h0QLCEh65BHKrkfRDPiQE3gffDpmakHuFpn1vZMqDmj+wcg5tUyWeSBS
	 ilysIku/kMxqAgjf2YTDQXQOQ3bHj2HFNSLZr4dIqhN36TKQ4i/JHwR3Yu1mU7YuMLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weQ92RIT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A59606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weQ92RIT
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so3251158b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795529804; cv=none;
        d=google.com; s=arc-20260327;
        b=BLBA1RGTOo9P/3LD4FPedVhUIFtaW6dSEIexdczE5ouHsRQMYEOK+e+tWLfpT53stB
         Cv1aVUY1TZjo4U0PbJcqnCqjS+sLW62ewHmQ2ASIrOuCtRMNNazo+/zxYncCNzEKX1IJ
         PdIfIiNPQYzRL36wmTnH3s+UfOJ9q/G/1ksYRqDfLpK7NLNyX1Cnmz7QOc4YkUpR+Fj7
         DmaWb7t1tTQXNwMAm60cXLj2yiZ1cHfhRyrY2egFXJeJ0guhYmaeCosnhV2NT/NDMiJ0
         xG3ivppmu/XfNQT0UjmLnWt4v6fu6oycCLkEBwVwLMKEBSMdAMIYGLKX4jGAXzPYFQ4Q
         t9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
        fh=GjEve0xBcbxJ7A/ZZkR26MHaIyxdgjg2WBwwUEKM9uw=;
        b=WP8BnyVMvOtBN9anofQg1/g51kfMl6RE9hlsCR8IKL9gZ2NKS3dBA38KBQ04b7nOaI
         IKfs5uYMCPBhPXpcIzgLl/G11tgKhBLkR1twxerQq5KJrF7A2Np+Ct4AH4ddfqKvXJSa
         niznzdxMkCYr3b32Q2V+mtdVIUzwN9iMeGdB6wEpViDCRuLqzb/t+KtkBaayY/Ix+6bF
         zp7hGHms016bkjcWYvMotmR1LD6Ew0kgafIw6pigWp5DsHlZ+ZeWgzXYY1N2L38/3IuT
         dlU5z5xiVF65Vsmw/epaJ1zvVh27hc4MkT362gPmLAmfSBdwFmS4Vm98WzZa++1tPEKN
         yARw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529804; x=1796134604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
        b=weQ92RITyg7JmS1ykhrmtx4rlzxrZ8f1H1jsn5wV5Al9jkvd8yL1HAtKWhLsplTmtP
         4UL7LauOKi3Ccq5BbdE6mSY6U0Cgxi/paZI+iqEv8X3XOgQGITF6ixm9aJOwWDfx3fg3
         wxWYuWesUJnEGfgEsDueZuPB0LjIq1kjRtkgyleFN1mJa/Mh3rX6cfYN7QSyvNYvClDL
         q3D97ZPX6erhS4ivNSE2ZS+2pr2eZledrjKcBQDPZf+3L9QFotwb/INCmvCBb/Z2WGhL
         3H2xdE71U3IjonoBsdTPjvPsax2cfwPIM4XfNArI18KPUkycKWNcgdxeDyFlWU6n9/ZW
         A9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529804; x=1796134604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/y4bV9sg4YOxw1y8ENYHV1fp3m5L4dzAun12g4rsko=;
        b=ad3OPri6m9+oR2+XPOL3xUBM/g5w2OXkJxSF5Pk3o/01S0cOvSL2Zan7fMvVOYfgto
         rSz93KlwpQbhjmJTZCrRIOEYFt+h1oR47EwXyoZeLVB7VA/ZwDkxHwjH3MGRsVUM2Xfa
         r7pa59kyo/Uoy8dcw96px958JCANF3e4LhQFqoGwfD2yuXu1+b1RnN04GC+HSTYtIA34
         r4x4rf8rWfpX9Fa92tq3Oxi+JO31NKh08Bb7XaLy5yeHYDOOjlL6JpQdmyIcFgxIqHD9
         NnYb0IKRg4MH+gU+f8eGlnPQUefylBv17Hqftny8fUi8JmHEuCJaDX6crxJFIGBD4lpc
         Zc7g==
X-Forwarded-Encrypted: i=1; AL+hErHddw1R1i8KxMPvZ/bplFRlWay50jDz03cbOc0Wyp6sWEwYTgBzn8tYU+B7f6OBiBNFDeJYsOMcHvLVB9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zd4F+Ct0fB6cJJl1x5uHxUFkwNQGNkwTRsNMn2/JxMiN8dpl3
	sYw3eCJmLYxJHdm21JlHiDUlyYWpBCV1hfx3b60sUfumsH/3fjVneGV3OcL9u6BWO0swHfiHMOX
	udFXoNRvH6VmR/3CgfrqAES41AffU6Pk=
X-Gm-Gg: AZFdTZd/2eP4AJ0B+6PImVzEl52ivkpr2H1NDutv5I7AOns+WAAM8FBmHjEq23hEktl
	KzhV8S4cWnvJO4TYX7ctIe2mIprU91TcCPKMGBUK32fipjfplyASxcmKYwwyAcWeIzWSnxbreEB
	F6rITXt0Wv7OSGEioLIeKk4zRWdcKtRthj6x37D0nslwMjTnzasKswIcRoGSI9KmWX2j38LX/iX
	gf1KZ28AGDsnOCPZ4yYjTSo7faVT35W632rinwxO/DwypzAgnviyC4xfm3pdXrq0ZXGIH+s3Dt6
	6U6BQm2Nc+IPm+J/njDWjzkhucHaUbt186s8eZ4u3GsIlbBwNzlMpk9WZnKB6P2h+AHs0Wq9eT3
	nUZhdXkVFsPAtldIFiLMRkoDmKNXZv+/n+0SXJBuj1VdFqPQ1hA/Ms6Sbx4Y0MGbzEgttQuNtNO
	JM8HJXFENp8H8edEPko5cqEblBJiN15FhswThLzrfQjNZxhe++j5gKBCLXqNdl
X-Received: by 2002:a05:6a00:1382:b0:882:7bed:3b3b with SMTP id
 d2e1a72fcca58-8c87c481e1cmr12587650b3a.36.1795529803877; Tue, 24 Nov 2026
 06:16:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179542222978.3276016.1235014191109840927@gmail.com>
In-Reply-To: <179542222978.3276016.1235014191109840927@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:16:32 -0500
X-Gm-Features: Aa3M54qTcW6bjqprusjNBKAhplLWpxLKJ9CCK3e-KLDt8tRi922IzPjzhVFOK78
Message-ID: <CADvbK_d1QSJ3sDjLY1G4etCgsnrdzu-nXnxJoDvGR7gTot95iA@mail.gmail.com>
Subject: Re: [PATCH net] sctp: pick the AUTH key by the data chunk type that
 is sent
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Neil Horman <nhorman@tuxdriver.com>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:26=E2=80=AFAM Kyuwon Cho <kyuwoncho18@gmail.com> =
wrote:
>
> sctp_datamsg_from_user() takes the chunk key only when the peer asked
> to authenticate DATA, but with stream interleaving the message is sent
> as I-DATA chunks, and _sctp_make_chunk() marks those for AUTH when the
> peer asked for I-DATA. If the peer lists I-DATA but not DATA, the chunk
> has auth set and no key, and bundling the AUTH chunk dereferences it:
>
>   KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
>   RIP: 0010:sctp_packet_append_chunk (net/sctp/output.c:264)
>   Call Trace:
>    <TASK>
>    sctp_packet_transmit_chunk (net/sctp/output.c:189)
>    sctp_outq_flush (net/sctp/outqueue.c:1112 net/sctp/outqueue.c:1218)
>    sctp_do_sm (net/sctp/sm_sideeffect.c:1826)
>    sctp_primitive_SEND (net/sctp/primitive.c:163)
>    sctp_sendmsg_to_asoc (net/sctp/socket.c:1919)
>    sctp_sendmsg (net/sctp/socket.c:2086)
>    __sys_sendto (net/socket.c:2283)
>
> In the opposite case, DATA listed and I-DATA not, the chunks carry a
> key but no AUTH, and room for an AUTH chunk is reserved for nothing.
>
> Ask about the chunk type that will actually be built.
>
> Fixes: 0c3f6f655487 ("sctp: implement make_datafrag for sctp_stream_inter=
leave")
> Reported-by: Sashiko AI review <netdev-bot+sashiko@kernel.org>
> Closes: https://lore.kernel.org/netdev/179540440300.3135.8565987128928534=
228@kernel.org/
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
> The Sashiko review of our earlier SCTP report pointed this out. We
> reproduced it with a test that enables AUTH and interleaving on both
> ends of a loopback association and has the listener ask for AUTH on
> I-DATA only: the first send() oopses. The test also works as an
> unprivileged user in its own user and network namespace, where
> net.sctp.auth_enable and net.sctp.intl_enable can be set.
>
> The patch was written with LLM assistance; we reviewed and tested it.
> With it, the test runs clean.
>
>  net/sctp/chunk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/sctp/chunk.c b/net/sctp/chunk.c
> index 5b889e89e9f2..0ed251421cda 100644
> --- a/net/sctp/chunk.c
> +++ b/net/sctp/chunk.c
> @@ -183,7 +183,8 @@ struct sctp_datamsg *sctp_datamsg_from_user(struct sc=
tp_association *asoc,
>          * we need to account for bundling of the AUTH chunks along with
>          * DATA.
>          */
> -       if (sctp_auth_send_cid(SCTP_CID_DATA, asoc)) {
> +       if (sctp_auth_send_cid(asoc->peer.intl_capable ? SCTP_CID_I_DATA =
:
> +                                                        SCTP_CID_DATA, a=
soc)) {
>                 const struct sctp_hmac *hmac_desc =3D
>                         sctp_auth_asoc_get_hmac(asoc);
>
> --
> 2.43.0
>

Acked-by: Xin Long <lucien.xin@gmail.com>
