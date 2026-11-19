Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123145;
	b=NN4LpluR2woVVdhLZAn5goJ5FbX022+TAYz4r0T3cpk0DPNslJL8cO6eZv18UIaSb8go
	 xJ8Bc9lmDHs2wbi35QhlBPQKDYVJ3B7E2XP4tM/8phFLAssiAiUea6RJ4ar0uh7GFXEPE
	 9MAWNqmupmD7DCHxh+nzY8C4cUdU+QtbADCmG1Zb1x1Kg2OhJRJim6wr/TcnrcmGP/V8W
	 9tB62obZ0gN8z+lUhVu3BDddL1H0JUacYWKFkymatHn8IHF7bxu+8GgpbbkgVfAWivreT
	 1owvVN7VGhl8VbvNFyHHJhR6Jw2KgvtG+r8VWd3144aeu5pbEJnQe/7Dquh84O3oLAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123145;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=f1xc6QKYWxzMdEDsaK55KwIygScu9T598+Hsd69AjTM=;
	b=0CQ09qIdWoEdJyaNJLdP/RW+39cvKyof5BdyEbUCg3JXgL+zT60ORqMkfpSf3DtliZd3
	 O/FeJtqL02f2Kc/7YWqTYGpBJGu5oTeo2ls7D3brrutW2qSk80YXIlvveYRuodk5f0zzv
	 AXLQsmUK8UUux+HYTDRvcxL0V3SslDSXxcATUyzOHGc+yAqTWdYrIfB6/0u1feNgRFlbq
	 rp6Xtvcsi/FYh/50DCCs/aQEWe4JZ1/o5oJffsUnUqZn0lb3NqK27y2zUm16DBsZoPmx2
	 LqWIDi3AIwfm3EKT9Eoe37qPOpNEkzJ0VTEbmVHfZj5Cn4ID8DzAxh6akrISyYy4v0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FFCKhUI3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cpy2EaXC;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE5E606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE5E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FFCKhUI3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cpy2EaXC
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 41884EC08B6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:19:03 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 16:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795123140;
	 x=1795209540; bh=f1xc6QKYWxzMdEDsaK55KwIygScu9T598+Hsd69AjTM=; b=
	FFCKhUI3bYNr/Ellq5LvnWTplxrarVjHuV6AFsiy8VEHhqfK1QUk5N3oSN/q1SB0
	jgURT3xL5vd2A1pRMaYUiHKxSzIFx+v3Riy35ZpMGnPhFX+bF8cBxcdObyL4J5uP
	Qf42cvVbI8dK8mItyIxoovdfwSF+7LMYQX21ZFNSc5SlBTOy+v36IDcf9ejdGUbw
	z3JnKi33dWbqIJvuku3f7Ct7Z4IqZJtmFutOZPOx9RNtSVolmK05Z9lZcAWU6j9e
	h2EoazHvaZnQNSlKKcjOU2POsBCqvM3aZAXLgF5M8tjrN8pmR1kozAuPNnZvCr0v
	DfP+kaaBnsc6ojUGBBtR4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795123140; x=
	1795209540; bh=f1xc6QKYWxzMdEDsaK55KwIygScu9T598+Hsd69AjTM=; b=C
	py2EaXCoAfxoGVzkAIU4f3381bL7pF+Qk2gOP3OxFyfC+o5ZOAgJ6WYElDBje6tV
	pCNpmrqbtUhkji8hCRoZIrDZkPoFUZFMAyIjn2VWvbdhFTfJFugnw1FqbZqE6qaS
	OYbNS2oAqw2IORSHv0DG5fZp7CgB6IhzLX3y3MfH3/mUtmMMD6YsDH3GBZyIOot2
	JCc3trq0pmZhK/pAhXde7zVIoLZcthtXV3jKfZWZ2rxtvA/aRTvZi+CeilLHt9qn
	fqenIpQPh8C6jyQrcD8mUnkVsb2GfAcfLcutsqSVDAi+II0Noc9fbFaLMyNTZc47
	aMjVFVAib/8r5+sSDiBdQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795123140; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:mj60MQTJuWiN9xekYxCiTeej3M4LDk5NEiw2C/EU+OsN/m+
	p5IbFBVp7gjqL5XV75e8dRYkDqC+NNyKp5cVYjLbrQdUnDocH17PtDt+ruqokG8/
	dwE66qF7rBENMJBEpcxXDXNfzwhTRqYE+n5/c3m8wkXZTBUP6b35G/cyldzo3ON5
	lxT8XtSLekFbaWBNjsCJ4474Z4ropq8bCDkxGqF/oKYfzYYdCK695djl4UZajgJE
	CNqOdk3WjII0QIbI1/cuZ0sSDtz2WPRYIEpYjoAnh8VIA294lb1gsKwh53Mz/yPx
	JZ6zbjRNmX+mV0q9FMqDDc3gQitq5lJjGH5KtrQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yZtsF58g/AwmNRbGZGaRDUC+Flth2dqWGKAO1SGxHAk=:KIVDHBoDulu/CO+epFvrUh/8/iSmmRURFWtec+Vn3PU=;
X-ME-Sender: <xms:wWf_ahdXLNichf4BPW-orZ2X3Ba-kdT9bboSL4JeIjPUMY9DYh6W8g>
    <xme:wWf_aqCS4vcgB63MZbZsNv-0PAOjJRZ1G25mzXmhfh_gnjapWTNk4ngJzyIIBPJ6J
    o-lzOUNimumvxrZ1eG0-e5vna1JU5Eqpirok-tOIatRRjyFDcZmrwU>
X-ME-Proxy-Cause: dmFkZTGjssvH/KnefxLUC5DdWFJHOIQQq7yFLnoTwtQolQcaSMAtfZX9TfiIsfz0kn2oZS
    xMEDG6K39cOEF/aJOvCLdhCMB3hkXGhknSByDHWrUQ6N1lF1HSOSSaOYo02/MMSBDSbzrl
    Vns3pIP0XhlmR/YwpwXDjsV8hHm66qzzejNvgON19OxTlPeJeNHYjdmahR+d+4gJRdvUm4
    L0ISqwZgvk4mnOH8QHF+jRzcfnmEMedtorgbzcheoj4JiBwxxxZYRr14Ueenvuqz8v3LK4
    NpwfBHXqOQtA5hRSNfHE8g42pJuoJaojZdsKz9N0F2gF3He/lrbZJu9KC6Ml4v+kh4q6lD
    rX8J1uDKa6fY/TsA5SOaxxR4mb1c+NcU3rdb0FyRvRYpncvCEupoSvLZc0D9seFmQulPQk
    +CWqjUFJEObNjCV3uCPg+VwXiQXnQalYbi2eL3CBO+EZv6dUkyLXD8wGnNIhh/xW0kUnoV
    1Rk4P2EdoklS2czwWkiqv/Ww1Zz1uIQ1JiZToxBk5tbdIhXK1nHrhuXwmb1MykzyJKfbO4
    Zh0flpHlzvozLBOmOWj+I4hRJqF3PBDgiAM3mAlsjGDLA/cDEeDKjl+K0EoV//EdGGQZ5F
    pY9jJuHcAoAO3lQyzRHaOnG1TkUfwPzyrlZ/+6NHJC+XGVW/OQMblSu7Jj0w
X-ME-Proxy: <xmx:wmf_anoCshz6tR_7dnEpE1dx_N9W1waSGMsjVxHzrmM6piqfm20Cpg>
    <xmx:wmf_aqkDeT7S0sUbdsX39P9W2GuHUNG4MyM6h8OicP1ELjZRmUAaqg>
    <xmx:wmf_avys1ZYYK32t8QChF2bFwd2Fbpr30lKNcpZujKVPkObsilXMVQ>
    <xmx:wmf_aq9QJip6w-tlJaB-hsQFX_Np3kFiaWE6-cyaUoMX_IJmfdu09A>
    <xmx:xGf_amVrR8m7k-UQzN-1s2BO0CeARV4vuKDAkoiTcu_mTUeZxHn7tbQ9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4048332A0099; Thu, 19 Nov 2026 16:18:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A5k84M8y1DL-
Date: Thu, 19 Nov 2026 22:16:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Habil_Eren_T=C3=BCrker?= <habilerenturker@hotmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Clemens Ladisch" <clemens@ladisch.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com" <syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com>
Message-Id: <0efc7469-55fd-4295-bea2-04881f2758a2@app.fastmail.com>
In-Reply-To: <20261119182822.60160-1-habilerenturker@hotmail.com>
References: <2026111926-finisher-captivity-64ce@gregkh>
 <20261119182822.60160-1-habilerenturker@hotmail.com>
Subject: Re: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before put_user() in
 hpet_read()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026, at 19:28, Habil Eren T=C3=BCrker wrote:
> On Thu, Nov 19, 2026 at 03:02:07PM +0000, Greg Kroah-Hartman wrote:

>> And why hasn't this ever been noticed before, what changed to cause it
>> to show up now?  And because of that, why is there not a Fixes: tag?
>
> My initial clone was shallow, so I fetched the full history and repeat=
ed
> the investigation. I traced the history of hpet_read().
> The TASK_INTERRUPTIBLE state handling followed by the put_user() call =
is=20
> already present in the earliest available Git history, in the initial =
Git
> import (1da177e4c3f4). I couldn't identify a later commit that introdu=
ced
> this behavior.
>
> The 2010 (54066a57c584) and 2024 (4e60131d0d36) changes I examined do =
not
> appear to have introduced the issue. I couldn't identify a suitable co=
mmit
> for a `Fixes:` tag.

I think the warning came from 8eb23b9f35aa ("sched: Debug nested sleeps"=
),
the behavior seems to be older. Maybe by that time user had moved
on from /dev/hpet to posix timers?

     Arnd
