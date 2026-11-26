Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653252;
	b=HJaETK4DrsRsDd63ac8aJx9W3jxa5hhPz92HKPOU9ZcHgEgGMau9nUTTeLrr8Y1A2q+Q
	 qiG5q5OxoEdF6lSEfloumb0rFMnfieqmFCWTUtrrmV68xacFIYb17F7m0LA2PrgaoWaEk
	 3LhNMkX/2FuhTe/xASsPubnlhm28pO9lVhvOxRZ3MoB6OC1ev3cAj5pJEHXRXHNLGO8wT
	 6g1/l02nFZi+uLZP7Iz3+Be8AP04+H/6bRR5ey0C9zu9UYhXLBYn80I0XAtaY1Gqsvlzh
	 b2aj7jsqJdaCiYE/HWwbQpVUS2ZZ6xFoZyUTb1gPNKseAva6ccImOP/UCsGvkoqviFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
	b=eZfWFg3a5fBIUMjPU3do2NdyIyBrvQ/ZSfugFonJG/qvoc8FqE/G5A6gOaYLjC44fY8p
	 O9PIKiPeNXpW/6AJ9zUWUXPfh+Eb7j1ufbqlb1geS2BijVEMA9aRc21UYd+BGfZlDpHRG
	 hiyvC/d9qhS+Zo7fnXvgS0uS2Bsjj9UV9YLb9x+UK6JvUY8A6z0HGbzHoc/rNthgmuLs9
	 o38RKocoWcmB0Z5gd/2gDotoOI8jD7aiD9cJtqyaPytQZEeDGXdIMKuUdvwiOFIuGZ5o6
	 wXJzcrXRef7eHkwFv1XQ4VTlw3aeTcdXINl97Aj5LaduRK8NfGtgl0zX+0h7jjFMkBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFK3p5jX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFK3p5jX
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0464dd6b6so39950775ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653251; cv=none;
        d=google.com; s=arc-20260327;
        b=UR2mNy5bvDbThEW8I66irFLrJvIKaba5QedHECfN2Iaohig41cAWzmcJ+mMalwqjcm
         KiR7TFZwMCa6FiksVvcB9hYNf9pc6MC66RPBf0RnhLgR/e647zaLVUOlsXYa4eT1DCOZ
         Y9mR5FrvEPv4Q4/T3KEOnWCJnzkgMVBViezgMqf3aU07x3OhALt+ghq/4Tsf9AcdWdSf
         BkTiXsnBrwum2di6VsjHuKkhcRm4vgL/pOnastdmCItjHkGiHkDKkJ2z0ITTe8ak9ifo
         DfLnpEGzdECxCAr/WPFzbjbBhMv4p1mVhvV8NdfsJ8ypoWlZ4XD1WOCVagTvDyr+LJ5P
         zXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
        fh=FP0MDl0lMTKZClv6c/eRpsUsHh+qEq2njmDT0RrbE38=;
        b=K1LANpMxlcOTj2gdK7hW+ZdbRJ9FeVgdzkNe820W1lJdDR3YMaPqskZat6pBiyalKT
         z9ko2o6+tybbDWi0RYHt0SIg99AW3GMfo5Sf0Hp7Evp/ieO0m3Jnu8IS6KqaAWJq1Wiu
         bUARfYSS8u7+ff9X6SzQZ4qwQQpXlUHCqCZL4UWHp5B33cE247KLxKGXFHRrEyibPGC+
         ekEY+VI08LqCOo+n9vjUR3v6gc48e7tyabBNgSAssZo0PWGuDqyIZEf0qiIMWckHoGjn
         3TuhPqrm7UAWN9kTOht99nNH7BJwG7FPzSq9Bsoim1he7vF+DVpXGajWqwNBo3j/n/ub
         SoZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795653251; x=1796258051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
        b=BFK3p5jXUv6YeG8nVgnndSuyNzUBzepo47YrdeRrPgSYT/bpdp/D9Kz3pOOIyhvZbq
         7wUD9sxhWwX3O6NBYldGrSkH2l+wdvnF0erXnBbqC85Bin4mSccI0ozZo6NyBuL0xaXL
         T8bwjcQgSBY/Tox8DMELTTRWN7Vq2Y57Ecz1xlb94lZqtJyGHw3PAwCbaIWGILvAYScQ
         tXzF5oPXN6dxOO5Y8DyVHL3ZMtOKIjFdlq6EfH8naOh3MGyFtbDpIRryUyJBvz2bltv7
         RjJQVlebqdnba4qGpUaWEdjQ/VoGtSuksTzBXHFpOvmyOzA36BB+tiJQ/TYEuIOiTy9a
         e1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653251; x=1796258051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d6I9qfDDhxE3qwmEK7cNTIsxnZEM41yNcM0rvHlRyTY=;
        b=XeGEYXAJyjnOBaB3np6uiJEgzRv3rfvb6r1rz3OPH/sB93omMYHtObVykmmBilrfMl
         L7yZf34j6jJT0p6ycYo814p2kHnl8j/8FunpNOd6Th8334E5abnT6GB2G21cbvVRfvcy
         9i7zU5ax4YVKcmqIx9nIVqtdgJoHU7TCcZfC61ktgeZUUL5UPhmTm3fOTKWlBF7Bzvsn
         1bHo7NEs3N8wwU4z6ctokwX8+m6PtXujbJTk6uIoSF12E1qUvt7dyICG3Pfs4p/ft/p7
         2NFj9dzFvWMiCjNobn+GC7WEViTk0Ul2SZAP1iIsNUQBGagWXFnOqfbjQNCUHJrWaqy3
         o0lg==
X-Forwarded-Encrypted: i=1; AL+hErGrE4r4xGvbjh4lnBVI5GXTDZKmgwKJ0pAlZmJUCeUG9So6pUv+1Z01DWL61gE7Vxz4vF0nyydErn5d7u0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FI78l7p8n/a+eO3sRrjJBFoxoxVbThEd9gYVbGNfxoo1ygPT+
	cjc5hiirNxTKRVWdRkAYfzg1T0sv83t/ErDSf1NMlWmLDMXV+TcCSizF6pxpW8N4Ang8Vit8wFS
	hMxTg5Zf8rVYC0JwL5R117RXdX3sZvPY=
X-Gm-Gg: AZFdTZe7WDRUDqZ6cABdESWLx0ZSbLrLjtGkP73FneDBbNS8b5CLDNDjTGlrs1CTX+M
	Cf8GuxWYT7i0k4bFtqK5f/S/etadZq7qWregW3Utjn8xg4dyw4/15xgkuGNn0NEVn9brMDAJRM3
	KUSgNpA78gLhoi5kiPcjSVwx4i2iG8bzWGCArL1T+J+WlJSoC+0/K/FSRoJ88sVzo+OJirKDGTG
	0pAstJHnavys55MMlJV60ILD4U+2MqIxL26UthYZWIOflkXmlTmwv30+6tKBDLTxMDTvy2PUb4k
	05o4GFx0oLgv79V3s1qZrSe+f5QIp+sVVzsEZ02n5fkbOPDAtHx/42CDA32LPkiobHoE6zFr1P1
	z7XoZf7zS7XHPFe1MXjITNPIwQcYj9nr5wjg/Xd4F0fsmgwnQo7XPeyqkXwf2L/h1Mo/ryBcSSz
	1KLDkK/RDx5tW0KLlU2IrTQcMLrtcjNg==
X-Received: by 2002:a17:903:2f87:b0:2ef:e285:7085 with SMTP id
 d9443c01a7336-2f03f1b1946mr190849675ad.44.1795653250879; Wed, 25 Nov 2026
 16:34:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
 <179565312892.3294.7644425039287858356@kernel.org>
In-Reply-To: <179565312892.3294.7644425039287858356@kernel.org>
From: Tom <tomasbortoli@gmail.com>
Date: Thu, 26 Nov 2026 01:33:59 +0100
X-Gm-Features: Aa3M54qD5FyaWdtuVokZHy_lZB3X7QDUh9rblmh5PsTmuj8sNj9upDDnBunSuGA
Message-ID: <CAAHj5qirck7vmD3ugQXA-TgaYp_Az4RbiRDw9ogqeYDy=+NJ+g@mail.gmail.com>
Subject: Re: [PATCH net] udp: don't apply socketless ICMP PMTU/redirect
 updates on end hosts
To: netdev-bot+sinfo@kernel.org
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, dsahern@kernel.org, 
	eric.dumazet@gmail.com, kuba@kernel.org, willemdebruijn.kernel@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

manual code inspection + runtime validated

Il giorno gio 26 nov 2026 alle ore 01:32 <netdev-bot+sinfo@kernel.org>
ha scritto:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
