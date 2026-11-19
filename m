Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113717;
	b=jBIMNQIpeWzoZLTyZmZAaqXf75kI5FzNCzn1se0yHsPwSCVsorVcE7+AqP+9D7bSxJLr
	 WXwBWYT/7pfVbutCGIzCTw319QMJtXwYWO2UyV2SztstQvfxVFgMYqgnQ+Xc9iqKfADQU
	 LDZsrlAHN8ar4E1VTv6LpRMZcih4hNB26q9DpS9x4NMQ1lJFPxG94H2Ce8SZJdKZLFdp7
	 qRcaYZijolc2+X//qzsXmLdxLWHkmZhAgIZW+lVDEbdTgWhkxoXhpz690Dx4xqgU4Xvr+
	 skUdokmQI3mDDsI4fF/FVzQ8Le3akqgwQ6WJmiR0t/YVX+XW6LR469Fm4eXV43CfSFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113717;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ef6m2NmXuoN8B+zj6ZlcXVdQYuVjSXsN1Go4Wl9InqY=;
	b=Jw2gwnJqJFBqIwIht62p5XHZagXVHPwMKfD1+lSe2LEFOBGFeKuEaKLxSw9PD/RRD0HN
	 fK44lrlA2o2HrlIve3q2ppI3JfbpKoz8qXWCq38TetXCZV4QSRUFSAOYhDwcfwmRvSF5S
	 NQ7iPSEFBAbgWdHyT3G4VbEmy3l/G8lbarehAeRbySz3Ze/Dtlqgu1+SFcmnsYQcVS0cy
	 K+5lhFTdY1okJd0HxG8eC7O1a2Z1t5UJxWVGDfv8gvNE0C7z2hIZXfbD/QlIyteytMAUn
	 8mliSTNXQ2J0GlFNxaMbcwuBsKbq/zMatap1X+kA/hVbFnDF3M937gT2kszVEYRVU3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGmBsXVq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800C4606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGmBsXVq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1112F1F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113717;
	bh=Ef6m2NmXuoN8B+zj6ZlcXVdQYuVjSXsN1Go4Wl9InqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lGmBsXVqc8N451x920V9aiRw4ttXg92AWJpYBN7bVKlmi5+I8OtmWFsk53CpCKTya
	 j8UqPPxblH38B3HNkqI9plOpHePyEW/GSVYQA0pdPRTFyvYj2KBm8BZs+Rfy+nJAbL
	 +Xv1ZnfDlESDyldR9tHuNLXWp94XQTR6GboaERJ8NvzHrXtvVpKKxQQ/UyZBD/+Xiq
	 fY+x2awqlziywOPftzPOFoousvkams6cD597UcXb8IaqXmwSSPlfGvFJcEZOUczFFS
	 4xMSo+Mlw8kuHEFiwW306QqE03QqX28ql7MTCoFvi2byhGJcd2QHt72SL3l8DTSACl
	 0J43DJyvU3O2w==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-705cb6ceebaso37767eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:41:57 -0800 (PST)
X-Gm-Message-State: APuU4Z+9m1yqfTiJpzDTHNLBvEK7b7Nha67FzF1PPq08hv1RZU9OJlkA
	9U/mntCiwkEa+3IzyFEKsCsG8A0nCg6Laws/ApAG91ihqcsD1Z0sKvJpqsaSsnnw8JPae6LMsCW
	tp4pa6oTw4By85DA1pNzLQLJHgZYq1kE=
X-Received: by 2002:a05:6820:1686:b0:713:9556:56b with SMTP id
 006d021491bc7-71b39291ae6mr548725eaf.6.1795113716282; Thu, 19 Nov 2026
 10:41:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:41:43 +0100
X-Gmail-Original-Message-ID: <CAL4WiipvtvgLbWk7TmLe_O08Bw7GeHK-C4Zengin6QgpdqTVTw@mail.gmail.com>
X-Gm-Features: AclHuK-O_0hz__GFcg0N35N_TvxPji7Xriol3sP2aoslRjCyZUMPvUHSw0P4mUo
Message-ID: <CAL4WiipvtvgLbWk7TmLe_O08Bw7GeHK-C4Zengin6QgpdqTVTw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] TCP Prague preparation series
To: chia-yu.chang@nokia-bell-labs.com
Cc: linux-kernel@vger.kernel.org, kuba@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, davem@davemloft.net, kuniyu@google.com, ij@kernel.org, 
	ncardwell@google.com, koen0607@gmail.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com, 
	srichard@netapp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 19:01, <chia-yu.chang@nokia-bell-labs.com> a =
=C3=A9crit :
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Hello,
>
> Please find the v3 TCP Prague preparation series, and TCP Prague will
> be submitted after this series.

This is v4, and I could not find what changed since v3 : all the
changelogs stop at v3.

Also, the changelogs are placed after a "--" line instead of "---",
so they would end up in the commit messages.

This series does not apply to net-next. Patch 1 fails on
net/ipv4/tcp_input.c, because it expects tcp_accecn_process() to
have a prior_bytes_acked argument. I do not see this in net-next,
net or Linus tree. What is the base of this series ?

More generally, this adds a new tcp_congestion_ops method, a new
ecn_flags bit, and two exports, without any in-tree user.
It is hard to review these in isolation. I would prefer to see them
in the same series as the congestion control module using them.

More comments on individual patches.


>
> This patch includes the following additions:
> (1) Export CE count in rate_sample as acked_sacked_ce;
> (2) Rename existing rename ECN transmit helper function;
> (3) Add TCP_ECN_SEND_ECT_1 to use ECT_1 after negotiation;
> (4) Add MSS ceiling callback for congestion control to limit MSS.
>
> Best regards,
> Chia-Yu
>
> ---
> Chia-Yu Chang (3):
>   tcp: rename ECN transmit helper function
>   tcp: add TCP_ECN_SEND_ECT_1 flag for congestion control
>   tcp: add MSS ceiling callback for congestion control
>
> Ilpo J=C3=A4rvinen (1):
>   tcp: export CE count in rate_sample
>
>  include/net/tcp.h     |  6 ++++++
>  include/net/tcp_ecn.h | 12 +++++++++---
>  net/ipv4/tcp_cong.c   |  8 +++++---
>  net/ipv4/tcp_input.c  | 40 +++++++++++++++++++---------------------
>  net/ipv4/tcp_output.c | 18 +++++++++++++++++-
>  5 files changed, 56 insertions(+), 28 deletions(-)
>
> --
> 2.34.1
>
