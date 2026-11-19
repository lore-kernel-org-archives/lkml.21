Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795118530;
	b=S4DI6z9p1vGFcoRif5RlpXJZMjUkU8lSFze2BVmQnAmAogmLlpyBs6Skwi/A8uBzG4W8
	 hKZxkwmkZaHwSEJ9Tzyj7A3FpJAfRq2O7JXGyBG3uvfVq0ZaKSH4sS1a2fp7G/a+v3Dz8
	 iQsJYpXLTBMukpneK6Pi7BUGheAYIUf6sCUIwNJOdh+G09D/UJHifknZcK0UD+6ltKGc8
	 Dc2hf8vaQIzIIWX79jm/4ha54Eqsn1uCOdgQSY7fzwtlFb1IKxNUiYDNbFQR4sNlG1Wm1
	 mnel4WmLat3oOg7F/aNPXfbHQr6lg3lFQ9E1qgNeVTcC8/BZ94VBoanay3tx5nfigqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
	b=N+c2KtQsAz39DGCPw9+6i9dmxKedNkk5nmqb2tlJ3xbBhocHyLH1n9yUYsCnTiLwVx7P
	 EU1oyTvtyssZ3RXcNIHq2Pd2H020FwW1DTFhy6TtN0hhnZ/Ag4cZb3PdFeKPDqztK7YkT
	 3Lz9MrTVUC8Y7rVMwmfdvQiApE89pSibmtsHmnXMCpDMvKq7RFqZicdzETdsEe+6jKI9Z
	 Y3rCUkD1AM8WUz+z/IPJngoankiE1eGbApv8fdQjZnnWr+a9ArTswZB+9d3oZ0tOhxP0x
	 1PSvzwnEviM/Xmt6JIk0YjQg6OOegp8dIOvnl9/rFJ3XT5u1qNvaC5us4NnrYiW/3ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3fG1mGz;
	arc=fail smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48CD606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48CD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3fG1mGz
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso102302a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795118529; cv=none;
        d=google.com; s=arc-20260327;
        b=sDXLjCglQgBV+Pg04PeaNMkbLu/g1ZC14z5EjSMQH1femQZsBbBcPeeTZ6pHfOiY6R
         t7esLPLEtF6OBEDHsFimI7H2+Txfor8SdlPSKMPjfkDrMK2KJqIOXaZ9ElCNAenofjOP
         GQ8gcgmWZBGghZS063K6LYYJsp9fwKkXHEXLvl0ZVgcS4FHadCn37B1STrEU1DseXQqN
         4Xqwa9u9Oa+jjI/17GckQESVDGC5k1nWC2XdP9Cu6HVc1f+NivLcEvbknCf4XPBBIYRT
         kf123vMixGxyYeX1qmT1ZSdooPxt8VGwjEppmH048bg4we6QKpmvRCTQz9qsz3HW8z2v
         pIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
        fh=8dweoQJJLYBr5e9Lk+3oTIpp2TCNfRu370ag6wBH3qk=;
        b=ALpC2CCx97fVHArYO5u78GBRob7RZtyuDlqKdjK5rKhDEkYZovS2zMLht7r4jj8ugT
         pSGl9CcH7lIrfe/PtNzKGfLzLHg6gViHMSmN/KdraEO/5LcY8L9BI2PC61EIHWwzhxmh
         PVh3gpvmSZMZwby7pdh9I3CiUWM7wh55O7zr/XP9a8yQbg2yIPWufO3UjMde17C/4u1x
         /aSZLTbls/Fg2F1EwMxAOR3eu2m2yl/lsIT7VjTotg42FDH2Cv06D+fOD5wQk1qtxikB
         iG47fBjyLYXPIA+wlKsd49vVJ7nzmLHOn6YrmsS3eqU/gB7MdLUxm07rZ09l089yboMh
         Nj8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118529; x=1795723329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
        b=M3fG1mGzEEkK5g7tak26ZQNGKd7qs9NXAy1TMsB82Nwso+Aptx1qWQVgo8Cp4FYXXs
         6dCdZfyEfFsjkmQzyIuP7py7yWf2sUr3E6zbpY0UbPMVVG/hCDp7r6OCU8QhY92fP7fb
         2BqvEu/y6MWxscIWT87NLch2a0NRJyfbRYUnUyakxrpco96/Lry3rD4NxzZQp6WgsEqW
         6EXSmFiiNb0vnfAp0ORPXQvFq4wc1uzM3C6wIfKmNqdXm4M+9ATW+r8ixkXprK4ca8O1
         +neYtapyEwGRaPSkmGUrNeA60ooaZI3OXnu1kMT9lxs1esQY/mR+a+fbDyqa8IppPFly
         gcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118529; x=1795723329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
        b=CN+/yrHq5tVpVUVdoh5KMBlYL7lnSuwbkYcYWORqldFb9Xu7DQYePlyOkuh8RyifNi
         kGwt3eq4520R8eLUZnHDm3Kwo7P2vJyqPSAJ+r4KRcAW7MXpugaDEuz6baEQrlBA8Y52
         mlYnqy9A9QVr6G5LWSacqv2emFq2lj1VPAXf85BEzyJFpKBqOkeYrBqiznuwftKSfrmI
         kzJ95yL9md+QCEC7sYVYEu6jLkIvEI0bY0HX12LKNBNiPeLVeAHj6/T+d8MXkR/e4SDa
         XtHs6HVcvbKkMBpQ5qiwn+hBaz4bK+uPX+DvjL8iTfOw099/Hrdps5QFnf5hQn96QcbD
         goVw==
X-Forwarded-Encrypted: i=1; AL+hErH0zmlpnVPw4oZTlLfkdl+JWqL1WOKeyQY/0Hc4n5br4Hxm24i6sUQx4hnBAFEoC2xI/yPfuIs1rCVUjpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6AdjI+wQGufzGKQ2HMR01uip9lBLGbzbnOOohJA5996VueJEa
	oQBJufZinhJ9k3Flz4ewrv7R6yOWL4OrbwAWDP8hlh0xu/LCsJJnmofxPjBPFjHWCFemA6dKw+U
	BoGRrShYInYB6t8QfRkBQZqh4VC/xbJQ=
X-Gm-Gg: AYBFou1VRpzQ1J5LO9PHA/hwsOb5DxkamywYRhBv8/15wF3vOpenFi17KL6aDa0qPKs
	aQisLyYsmX199RzJhU3IlV/aB4zxNRrDWHRHBRNzXw2qbCywjfmD8hg2jttxAgvSLfBvlSLqRfa
	Zp+m4TUg24yErDr3Z5dbnE2L/hIiw7LLUKey50tPn0NgqEWI6UAa1Wf7wzdkHzFjnVEHpMk5JqZ
	+63/kZezAwXJEuKN/4YjZTQW3ZDHX+6oH8lIzF5t/XWq07v6cygCpUAYA/YWfqae6X9/+RNeJRQ
	Ef5bqNxrDLSla1/1CZFZUbikBxa/+6QABJ/SUJP/gBLLtaTPQWhzI173X9Yp4EEndICnsGKqsrr
	cTuMibMQxW6PzOhuaoq3PTEtNqD7DiEXHXh2tcEJDGF5Kq5P5mT2xesjw5QW9GVLmu7A4nyqVNQ
	gYS2Q+oNCf5ZmygEaOMN9pM4PaLaBtwUGrGQ8=
X-Received: by 2002:a05:6a21:39a:b0:3e2:aab8:4eb6 with SMTP id
 adf61e73a8af0-4014db602b4mr721063637.47.1795118528518; Thu, 19 Nov 2026
 12:02:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179505710266.3511678.14017674052424733262@gmail.com>
In-Reply-To: <179505710266.3511678.14017674052424733262@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 19 Nov 2026 15:01:57 -0500
X-Gm-Features: AclHuK_QNEvmBX1MCKcJp6gFprpzU6I8eQIOW2c22-DHXFZThro3p5SjaiyInMM
Message-ID: <CADvbK_citvtZ4eumLcx_szUvth7sQMP1oKu0mLbo0a3bD-eSxQ@mail.gmail.com>
Subject: Re: [BUG] sctp: auth: NULL asoc->shkey after a failed
 SCTP_CMD_ASSOC_SHKEY makes close() oops
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jun Yang <junvyyang@tencent.com>, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 10:04=E2=80=AFPM Kyuwon Cho <kyuwoncho18@gmail.com>=
 wrote:
>
> Hi Marcelo, Xin,
>
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that an SCTP association
> whose shared key could not be set up still builds authenticated chunks,
> with a NULL key. Closing such a socket with SO_LINGER {1, 0} then
> oopses in sctp_auth_shkey_hold(); here as an unprivileged user:
>
>   BUG: KASAN: null-ptr-deref in sctp_auth_shkey_hold (include/linux/refco=
unt.h:366 net/sctp/auth.c:113)
>   Write of size 4 at addr 0000000000000018 by task test/115
>   CPU: 1 UID: 65534 PID: 115 Comm: test Not tainted 7.4.0-rc3 #1 PREEMPT(=
lazy)
>   Call Trace:
>    <TASK>
>    sctp_auth_shkey_hold (include/linux/refcount.h:366 net/sctp/auth.c:113=
)
>    sctp_control_set_owner_w (net/sctp/sm_make_chunk.c:112)
>    sctp_make_abort_user (net/sctp/sm_make_chunk.c:1492 net/sctp/sm_make_c=
hunk.c:953 net/sctp/sm_make_chunk.c:1016)
>    sctp_close (net/sctp/socket.c:1564)
>    inet_release (net/ipv4/af_inet.c:443)
>    __sock_release (net/socket.c:735)
>    sock_close (net/socket.c:1529)
>    __fput (fs/file_table.c:512)
>    fput_close_sync (fs/file_table.c:618)
>    __x64_sys_close (fs/open.c:1574 fs/open.c:1597 fs/open.c:1584)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_6=
4.c:89)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    </TASK>
>
> When the INIT-ACK arrives, sctp_sf_do_5_1C_ack() queues
> SCTP_CMD_PEER_INIT, which records that the peer supports AUTH and which
> chunks it wants authenticated, and then SCTP_CMD_ASSOC_SHKEY:
>
>         case SCTP_CMD_ASSOC_SHKEY:
>                 error =3D sctp_auth_asoc_init_active_key(asoc,
>                                         GFP_ATOMIC);
>                 break;
>
> sctp_auth_asoc_init_active_key() returns -ENOMEM before it sets
> asoc->shkey when the secret cannot be allocated:
>
>         secret =3D sctp_auth_asoc_create_secret(asoc, ep_key, gfp);
>         if (!secret)
>                 return -ENOMEM;
>         ...
>         asoc->shkey =3D ep_key;
>
> sctp_cmd_interpreter() then drops the remaining commands, but the
> association stays, with peer.auth_capable set and asoc->shkey NULL. If

The association should NOT stay with a broken state, but be deleted in such
cases. But it seems we can't do it in the loop of sctp_cmd_interpreter().

Can you please try fixing it by directly calling sctp_process_init() and
sctp_auth_asoc_init_active_key() in sctp_sf_do_5_1C_ack()? like:

        if (!sctp_process_init((struct sctp_association *)asoc, chunk,
                               sctp_source(chunk), initchunk, GFP_ATOMIC)) =
{
                sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
                                SCTP_U16(SCTP_ERROR_NO_RESOURCE));
                return SCTP_DISPOSITION_CONSUME;
        }

        /* SCTP-AUTH: generate the association shared keys so that
         * we can potentially sign the COOKIE-ECHO.
         */
        if (sctp_auth_asoc_init_active_key((struct sctp_association *)asoc,
                                           GFP_ATOMIC)) {
                sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
                                SCTP_U16(SCTP_ERROR_NO_RESOURCE));
                return SCTP_DISPOSITION_CONSUME;
        }

instead of using SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.

Then you can delete SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY commands
from sctp code, as they're no longer used.

Also, please use git-send-email to send your patch, not send it as an
attachment.

Thanks.
