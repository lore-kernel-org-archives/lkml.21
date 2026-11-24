Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540154;
	b=HAdkXUvAyOom0e/hoRz94/dmyjCX5aXF4OEgx9UO3smLLm5z8AuRJ5tw1iBBQfY/QDOl
	 keQ1rYEXEnIafZzHTpr06MsN+Af5h4pulIFHBqKgCakaimnIMgauYwxcTZRd0nC091weX
	 OpUBZUotCaP3FYRhXD0o0GtBtihMcyz1+LclputNogNr558ESviNTB+M1r8m3qoiv1NUv
	 zzKY2RL2g2sEaSxkPobW6Nq8J6TVsDyLg85YMDZAYOywNRmzNP0XdY0MKoa4Mash0C9CK
	 eXgsTi7orY7SRJqzRJlw1ALjvew+m8AACR3dipcEJBmgfJG2FRUxhwegNNOPHGUJh3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
	b=37q+QLyCM5BzYLprHxk9X53QXPIEDPXkcZohG+9NoQTa1Gcomh1Ae3vtwX8jNf3u+gui
	 +f2L8k3xoI4L8dU0lc3y9dPq4jTlTzw0p+O8RIMwgP5vT0pYf5i8Ar11YPO1bCgC2Ezwu
	 5IfGf+umhxPLW7FiPY4vT4cj8ywCWyf9MfxoSeJbj4aBIANCF4oDt+izA6Qi9fJutVNfF
	 uzOdSAaiGHTinvny02NYp2aQzxo9On5ZOEIXnnfqCFYtXBRKNPA5tzZZ3vQMIhU7vSWoW
	 SM7VjJurVPZNcmSL4tZgUI0w+t7KORRD2lN2mO9R+MSbuN02UM0XHMoWvV+A10lUPCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3ofmZ51;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC260A263B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25DC260A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3ofmZ51
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cddc250d815so1868480a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540152; cv=none;
        d=google.com; s=arc-20260327;
        b=ci+nkQE8QMe0+dC9Jc/0HjwDa6nYkmZoy714ILoSwUnTh2XsvfnRccPWByhFQtcPdC
         tQl5gqtPqrfl7JChg8Qn5WUzwIfbkShX3uvLXhwqN+M29yHj2ECDI7OHJGnLqnU6uKfI
         ZYKcPfbn9wAC5G57nx/BOV1s8DmPPVTFsn7DiwaMYsYhNBI98aZ83ks9ioKMjWINwves
         E2iJ4m3GedntFnFmTk2dsf13zVOBQ3zD24baRiW4Od8Mpuh+RQjypqK7ddKe3jnqsq4c
         6F/YdBwN1Tz5iuBni2t3vC7Fs2RWVxCTrVhxhKSEV0JFB0OjJVha4mS+YUyJjtliEBE0
         D4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
        fh=/64r3FtKL0JpfRpqjxVou9cjkfjE0Vmp/011ZL1yZjI=;
        b=CI7fVFqfLOj4YAdgsJhGSbXpF7bdCofEzPz4RoWRTFp4jtxfoDm4GXt+FBEwtsauT7
         jyihkzw3gciRCbwdrmimj5nemliDo8N9wEstAN82FHCgZ/xoRgsSbZVDEvud62smEacX
         MQjoAqC9zwmnJ7QQlc2e9aNewl7nChiOE/+ZA/wyDfeuPtRY3nSvhbUWyZmC60EmMOCb
         lfx23uCgYYaQNtGckwtJUGrWFJtiF+8b69H46mPKtEdHhQLUS8t6ll7Pgdft3MtMRmhK
         SiyJcKTyLKlhmNFjZbJnzbjlDzojYjcvAMXHJQWHUvnZGP8NKHdr0zbW5ixM0FNEZ5YI
         Kxlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540152; x=1796144952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
        b=q3ofmZ51KdDiSe31lFyb1pGcKM2i5v6DnKfzrg+Pky/e9KyGKb1/+AkYl9QZ9sR3du
         rj+nBMjVGvXqgjlFfny2JCQCIRfswUsErqN7P3Yu3Kl4Wr0hHhZg+XxKijd5Q6fAKWR4
         6NVEsE4P3Uib7ty8eOkbDpbZkWkUpOW6Onh7y4dGdlvMtpqtZIWn+8rKO+i/cpPY/HY7
         huQTRNe46nKtyvdSuzaLClrIVBxyPmYoJmfyspB53oTKgr8sZljTPJKBRbXPKmmzlweO
         g+U4obngtO0yjgCUOK3gaB5CYU5lHY96yfGFG2lH32X/OHwq1g9lzqUfrsKqhRLSnGCV
         4GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540152; x=1796144952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9VL+UZGuvvn+L4e88A9yFSdMmbH0iKnEH4T++PwoT0=;
        b=0VvLkYowwinZK/xhznfY3kwvKYZ2b4lpEEX9eD7FfddwWYBrJZ+MZWGVxgRJipaiOO
         xoYFNoohBSukfvnKS0wFy9wFaHzmlYVr+ZLkTfJ4bApf3a4+A+H8Vcu0LpKYz/OPg5s1
         se5v9EbBMCyPtqzeLH1ehRTWO0mrXh+65rukd5XhIyyh3CRPpSiuce8yPZ2u3/y+YUSd
         YDtvaUKaSzqJKeoh/vLVB4fgKjD8N7rPKE9vWJXa1RpBZbXvmMW/QglhsS3KZQTGUl7Q
         vxktk5h0h97ia6aOXEm0JRrkiJYWuljuyA3x+oQGiVPPJIHe3knEfwcB8vJ6KBKPHr2b
         glOA==
X-Forwarded-Encrypted: i=1; AL+hErF9h9pN7kXPiGmmGKgdjiLiG4EtFBzAix3wqqE6erjm/p65sB/SC30C8iSNHOPqOO3FM049wXk2s/kLygE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ku87DidlhRytDqXigBiPDnkAVzanB4KlIo2tEnXfLziEmYCBk
	Tp9b3IRLtbcheVZGu+TPusvE37pPFdNGyJuB+sM9uY0XcOXPamUXPPF9JAqCPFxyKYPHBaksHVV
	8ymxw4HuSBN1u4RowPs/QxKgd4hvpqp0=
X-Gm-Gg: AZFdTZfz8PHzZ9dHnNkXAAGpjS7g7BhGZzsZ8Ruz33p2k9+uRQOHWi/t4HrwoyjsimZ
	eZRMsJiJajhAPMG1OVC2fjChN499E1cfZxkHyBlZF73lGii2WFk5+y3G0rodAPajaM+jedRmRZT
	5oKqAASTezITnq6XlWslKnAF6rv5fsLeiLZPVWXpo7LWqqCQbSn1kp9G6hcoHinKG3cko9eTa7+
	bTIK5UV1n4b3HpU3rgZuFjN/h5XzvwAIoC/0+sjPygYXiyfUOAD0MR2m0yXu98YS+GS+V9azelY
	My+wEG2EFNAfQceaOzR08sCHHlXuYWtZiAfFhY1NjA/rZbscH9k536kvMld0hT9poFfPsueELfL
	shbXHf0bnwO5Fa3Nb5VE2u+bNpnEX0110dapKLA26OwdwFpgEe+siZR3E8xnVGc3rSV1fRYDq1A
	VVjp+w1es3oGXwqJQ9JFIWqg0OEAJb8m/hj4l3kA==
X-Received: by 2002:a05:6a20:6a06:b0:3f8:443c:4ce1 with SMTP id
 adf61e73a8af0-4014db57950mr17323321637.29.1795540152313; Tue, 24 Nov 2026
 09:09:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179539544818.3016044.13738712075053349592@gmail.com> <179539544818.3016044.18009252996572506068@gmail.com>
In-Reply-To: <179539544818.3016044.18009252996572506068@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 12:09:01 -0500
X-Gm-Features: Aa3M54o3Mm28v-FnGzbOeKj4VXKtMVAJcVd8119mGvZOM1SygJE7tskfr7xggbY
Message-ID: <CADvbK_de1zGLfjvEk-BJYcv5SsEzqC2RwL3R7qt7sWL09aCmow@mail.gmail.com>
Subject: Re: [PATCH net v3 1/1] sctp: fail the association when the INIT-ACK
 cannot be processed
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, Jun Yang <junvyyang@tencent.com>, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:09=E2=80=AFPM Kyuwon Cho <kyuwoncho18@gmail.com>=
 wrote:
>
> sctp_sf_do_5_1C_ack() queues SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.
> If either fails to allocate memory, sctp_cmd_interpreter() stops there,
> but the association stays: with the peer marked AUTH capable and
> asoc->shkey still NULL, a chunk that the peer wants authenticated, such
> as the ABORT built by close() with SO_LINGER {1, 0}, takes a reference
> on the NULL key:
>
>   BUG: KASAN: null-ptr-deref in sctp_auth_shkey_hold (net/sctp/auth.c:113=
)
>   Write of size 4 at addr 0000000000000018
>   Call Trace:
>    sctp_auth_shkey_hold (net/sctp/auth.c:113)
>    sctp_control_set_owner_w (net/sctp/sm_make_chunk.c:112)
>    sctp_make_abort_user (net/sctp/sm_make_chunk.c:1016)
>    sctp_close (net/sctp/socket.c:1564)
>
> Process the INIT-ACK and set up the association key directly in
> sctp_sf_do_5_1C_ack(), and fail the association if either step fails.
> SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY have no other users, so
> remove them.
>
> Fixes: 1b1e0bc99474 ("sctp: add refcnt support for sh_key")
> Suggested-by: Xin Long <lucien.xin@gmail.com>
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
>  include/net/sctp/command.h |  4 ----
>  net/sctp/sm_sideeffect.c   | 40 --------------------------------------
>  net/sctp/sm_statefuns.c    | 15 +++++++++++---
>  3 files changed, 12 insertions(+), 47 deletions(-)
>
> diff --git a/include/net/sctp/command.h b/include/net/sctp/command.h
> index 2058fabffbf6..8596e96c321a 100644
> --- a/include/net/sctp/command.h
> +++ b/include/net/sctp/command.h
> @@ -34,7 +34,6 @@ enum sctp_verb {
>         SCTP_CMD_GEN_SACK,      /* Send a Selective ACK (maybe).  */
>         SCTP_CMD_PROCESS_SACK,  /* Process an inbound SACK.  */
>         SCTP_CMD_GEN_INIT_ACK,  /* Generate an INIT ACK chunk.  */
> -       SCTP_CMD_PEER_INIT,     /* Process a INIT from the peer.  */
>         SCTP_CMD_GEN_COOKIE_ECHO, /* Generate a COOKIE ECHO chunk. */
>         SCTP_CMD_CHUNK_ULP,     /* Send a chunk to the sockets layer.  */
>         SCTP_CMD_EVENT_ULP,     /* Send a notification to the sockets lay=
er. */
> @@ -86,7 +85,6 @@ enum sctp_verb {
>         SCTP_CMD_ASSOC_CHANGE,   /* generate and send assoc_change event =
*/
>         SCTP_CMD_ADAPTATION_IND, /* generate and send adaptation event */
>         SCTP_CMD_PEER_NO_AUTH,   /* generate and send authentication even=
t */
> -       SCTP_CMD_ASSOC_SHKEY,    /* generate the association shared keys =
*/
>         SCTP_CMD_T1_RETRAN,      /* Mark for retransmission after T1 time=
out  */
>         SCTP_CMD_UPDATE_INITTAG, /* Update peer inittag */
>         SCTP_CMD_SEND_MSG,       /* Send the whole use message */
> @@ -117,7 +115,6 @@ union sctp_arg {
>         struct sctp_association *asoc;
>         struct sctp_transport *transport;
>         struct sctp_bind_addr *bp;
> -       struct sctp_init_chunk *init;
>         struct sctp_ulpevent *ulpevent;
>         struct sctp_packet *packet;
>         struct sctp_sackhdr *sackh;
> @@ -158,7 +155,6 @@ SCTP_ARG_CONSTRUCTOR(CHUNK, struct sctp_chunk *, chun=
k)
>  SCTP_ARG_CONSTRUCTOR(ASOC,     struct sctp_association *, asoc)
>  SCTP_ARG_CONSTRUCTOR(TRANSPORT,        struct sctp_transport *, transpor=
t)
>  SCTP_ARG_CONSTRUCTOR(BA,       struct sctp_bind_addr *, bp)
> -SCTP_ARG_CONSTRUCTOR(PEER_INIT,        struct sctp_init_chunk *, init)
>  SCTP_ARG_CONSTRUCTOR(ULPEVENT,  struct sctp_ulpevent *, ulpevent)
>  SCTP_ARG_CONSTRUCTOR(PACKET,   struct sctp_packet *, packet)
>  SCTP_ARG_CONSTRUCTOR(SACKH,    struct sctp_sackhdr *, sackh)
> diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
> index 35f540fb15fc..a95bf10b852b 100644
> --- a/net/sctp/sm_sideeffect.c
> +++ b/net/sctp/sm_sideeffect.c
> @@ -698,32 +698,6 @@ static void sctp_cmd_assoc_failed(struct sctp_cmd_se=
q *commands,
>         sctp_add_cmd_sf(commands, SCTP_CMD_DELETE_TCB, SCTP_NULL());
>  }
>
> -/* Process an init chunk (may be real INIT/INIT-ACK or an embedded INIT
> - * inside the cookie.  In reality, this is only used for INIT-ACK proces=
sing
> - * since all other cases use "temporary" associations and can do all
> - * their work in statefuns directly.
> - */
> -static int sctp_cmd_process_init(struct sctp_cmd_seq *commands,
> -                                struct sctp_association *asoc,
> -                                struct sctp_chunk *chunk,
> -                                struct sctp_init_chunk *peer_init,
> -                                gfp_t gfp)
> -{
> -       int error;
> -
> -       /* We only process the init as a sideeffect in a single
> -        * case.   This is when we process the INIT-ACK.   If we
> -        * fail during INIT processing (due to malloc problems),
> -        * just return the error and stop processing the stack.
> -        */
> -       if (!sctp_process_init(asoc, chunk, sctp_source(chunk), peer_init=
, gfp))
> -               error =3D -ENOMEM;
> -       else
> -               error =3D 0;
> -
> -       return error;
> -}
> -
>  /* Helper function to break out starting up of heartbeat timers.  */
>  static void sctp_cmd_hb_timers_start(struct sctp_cmd_seq *cmds,
>                                      struct sctp_association *asoc)
> @@ -1397,16 +1371,6 @@ static int sctp_cmd_interpreter(enum sctp_event_ty=
pe event_type,
>                                         SCTP_CHUNK(new_obj));
>                         break;
>
> -               case SCTP_CMD_PEER_INIT:
> -                       /* Process a unified INIT from the peer.
> -                        * Note: Only used during INIT-ACK processing.  I=
f
> -                        * there is an error just return to the outter
> -                        * layer which will bail.
> -                        */
> -                       error =3D sctp_cmd_process_init(commands, asoc, c=
hunk,
> -                                                     cmd->obj.init, gfp)=
;
> -                       break;
> -
>                 case SCTP_CMD_GEN_COOKIE_ECHO:
>                         /* Generate a COOKIE ECHO chunk.  */
>                         new_obj =3D sctp_make_cookie_echo(asoc, chunk);
> @@ -1772,10 +1736,6 @@ static int sctp_cmd_interpreter(enum sctp_event_ty=
pe event_type,
>                         sctp_cmd_peer_no_auth(commands, asoc);
>                         break;
>
> -               case SCTP_CMD_ASSOC_SHKEY:
> -                       error =3D sctp_auth_asoc_init_active_key(asoc,
> -                                               GFP_ATOMIC);
> -                       break;
>                 case SCTP_CMD_UPDATE_INITTAG:
>                         asoc->peer.i.init_tag =3D cmd->obj.u32;
>                         break;
> diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
> index 6a4205de0aa6..fd9f94c12d42 100644
> --- a/net/sctp/sm_statefuns.c
> +++ b/net/sctp/sm_statefuns.c
> @@ -603,13 +603,22 @@ enum sctp_disposition sctp_sf_do_5_1C_ack(struct ne=
t *net,
>
>         initchunk =3D (struct sctp_init_chunk *)chunk->chunk_hdr;
>
> -       sctp_add_cmd_sf(commands, SCTP_CMD_PEER_INIT,
> -                       SCTP_PEER_INIT(initchunk));
> +       if (!sctp_process_init((struct sctp_association *)asoc, chunk,
> +                              sctp_source(chunk), initchunk, GFP_ATOMIC)=
) {
> +               sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
> +                               SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
> +               return SCTP_DISPOSITION_CONSUME;
> +       }
>
>         /* SCTP-AUTH: generate the association shared keys so that
>          * we can potentially sign the COOKIE-ECHO.
>          */
> -       sctp_add_cmd_sf(commands, SCTP_CMD_ASSOC_SHKEY, SCTP_NULL());
> +       if (sctp_auth_asoc_init_active_key((struct sctp_association *)aso=
c,
> +                                          GFP_ATOMIC)) {
> +               sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
> +                               SCTP_PERR(SCTP_ERROR_NO_RESOURCE));
> +               return SCTP_DISPOSITION_CONSUME;
> +       }
Please change the error process to:

                if (err_chunk)
                        sctp_chunk_free(err_chunk);
                return sctp_stop_t1_and_abort(net, commands,
                                              SCTP_ERROR_NO_RESOURCE, ENOME=
M,
                                              asoc, chunk->transport);

in the two places above as Clashiko [1] suggested.

You may also want to confirm and address the issue reported in
sctp_assoc_update()
in a separate patch.

Thanks.
>
>         /* Reset init error count upon receipt of INIT-ACK.  */
>         sctp_add_cmd_sf(commands, SCTP_CMD_INIT_COUNTER_RESET, SCTP_NULL(=
));
> --
> 2.43.0
>

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179539544818.301604=
4.18009252996572506068%40gmail.com
