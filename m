Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778471;
	b=2vVPvBGmJvGq7z2UmEQiJfB+POsjecZTQdc+/fk2SO94GNZRe2rPJYWHxGyICBk0HFvZ
	 dmd7bmLH5EUIXi9pLEmTm8wdpsbRI89XA/BAq1YsTfIJmn8KFM790Q9VpWHuqHgYzB7Z+
	 h5VIrphJogHQZ90p4tcDNWU97LJKB9zY0beN2kGKclGXHrZBpc7lVCvz9P4qloEIA+LUL
	 /yo2MCpIjRvOvi9MGKv5D2HjA8Epdzb6o38qguAK9oebiyKp4XlZZVEfcnZH1INJcxFoH
	 96dowIvfh5EWxEowT4/sTP2xFrY8UsUN2KEcrzsfRtVgYkeJ3bxiuBl366RgW8mRDZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778471;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=aaeUhKeDrrSBo/Rz/J3qjYEHU3boFvMweLYZrhK4Ugo=;
	b=QhX8ZtI0IDAqGVO+7F+deNWiw2WVJx4M8xedO9AB59vIsfX8wpigUFBcauEgDFWmlRkH
	 9MEH74lSRHktixXx9KrNIvsuaKnUdtNO+Y/HkO632+MikxN15wd9pZ1f0RprDXuHxexf6
	 ywclM9zXjdKKUzSqvU1ZbJWRXy2UUNQynEy7N4zT3l1JxvZ6c9QUzhFiqElVQPvvcGuYu
	 LFmqGJGZpc1DAt/0MrccApZss46voLbQ3Px02WHgKo+0OXXnChCjUjQvx9DGASEUes+MD
	 tHHYRoBx5xNp3m9ArCwy5ZcsSUe8WbZx/AVFIydT1lvyZdBq89WReXjexnndPmOxuTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=none smtp.mailfrom=linux-m68k.org;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YKkXEDlR;
	arc=none smtp.remote-ip=202.12.124.138
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C662606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C662606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YKkXEDlR
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 0325E130332A;
	Fri, 27 Nov 2026 06:21:08 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Fri, 27 Nov 2026 06:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795778468; x=
	1795782068; bh=aaeUhKeDrrSBo/Rz/J3qjYEHU3boFvMweLYZrhK4Ugo=; b=Y
	KkXEDlRo6tKNuDRhR2h/KtTxsT1UpDoYMhQ8VLNet8DvUTZ+6Ps8VAPVIimYi6uA
	Yr67xiWqBfIDm4MWDxPRzuaJdd1YoTdLWoqstsFlcKn2e/XqlALHPjKI8sLty4Sb
	mlyIaXMZbAhoe63jic4XicF5aLUhCSJljAT69EGTAyp9M01cI4L2dGbHrtgPqHrN
	8bPHah6V178IsVumQg0u/967iVGIqPZ1t4WyKyXBmKE9MdD8E+ykb79J40k3jGBQ
	eK0IuSZ8xSzblXUhbinRUQz2o/Ni4ONjAp+6RDj3h5vID9u3JcLEJTS1Z85rQWQJ
	EaTJkKUmPzBmwy/jB5NpQ==
X-ME-Sender: <xms:nmcJa4-10tpsk3mHCuQcnHUUJdj7qx1vxe4b_Of24pYCwmd2yFhrQg>
    <xme:nmcJa7ibOLiRQuBkd5aE5G7CTF1oV8pHbW8wor7Wz1Tu0bRehvS_n3MMY-ic5JDqk
    nSFmmaQHv-PuYI1ldiNm_b_SY9f3IR_mFdEaj34ZKvaHsM9cr39lic>
X-ME-Proxy-Cause: dmFkZTF2U5AMYftZOt8Vglhe2SxtmTOOCyjK4LdLtv9+sbLaQnXA31oCqLj50ya8iaVp3E
    dcBL1UjTo8PQqRZx1+ljzg3Jl1CVQDP/ZoC84r6Mb3cvYsqvzHMGbHRznsW5BYlr7AwfbM
    V1++REkcA0/eaTGOHmmfFuR2yPltM2s0WGpTnjkZAvLJrCuNrgkh5axnsx79yuKcddyHeU
    OhcZLugqggeywcMGthFhHue0nr8mCnPciQuv3fdLpshDOKCvhWxT1I8TtmZVP/kPZ776Qp
    xnENCvF9zN+nVhbk46G6Fuau8m/jQdpWOuVUrysC5GX/yq0zHrkqUfFFNsIoPaVbf+ZHpD
    eGVGV1wTL7wiQayuba+YT7uD8MPs/46Sgyr04wwfVKLS1W4zJMFnnNNAKTFEwQ0+AUPPM0
    PDlCkn4eKhsGHaEvHLvPz3ZY4Ltug8rMjiIH3834Mi2XVXWXGfkpCe+RZW3s2Ukj0EW25p
    egPfc976RHU5afShL1zxcxZGSAmZVeQSKKalRTJC+bhgzgKyWERGBBgmy50lUwz9J45MzA
    XiCy0DvfaE9sW8qS6NFAuTLcd7RP5SjR1XpSVKI97RaQTjAuHMl4q/QigtekjrbkXjU4Ai
    oWiWawGP37LnPQxK8fEBg74D1TDhkt7Q9xbxNlqbUjopENte6L9jR8AtLW7g
X-ME-Proxy: <xmx:oWcJa9U_sadOa1t-inhe6uMYTdBHTF2LTpBsew6wYeinWOHzow8sPQ>
    <xmx:oWcJa1tdLF9dsyPVjxwd4IcKg3nJQvkdgkUB65jwda8cOGe70Htbig>
    <xmx:oWcJa46PQCWPDBZPSwYViMTKz-DQxV5aCzmX-uQwYBzh4a5LYtJ2og>
    <xmx:oWcJawQyyapqNb3sLMUiuwJjCYv_WCMsip-oe4QOYiuLwghNEE33uA>
    <xmx:pGcJa7lKTtVBt7vl6i0iEBOAsZEktPsyZSi6AsCM00AgV1ORccb5ylfy>
Feedback-ID: i59e84a84:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 782D0F8009E; Fri, 27 Nov 2026 06:21:02 -0500 (EST)
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
X-ThreadId: APurPCBPjMZg
Date: Fri, 27 Nov 2026 12:20:42 +0100
From: "Geert Uytterhoeven" <geert@linux-m68k.org>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: "Robin van der Gracht" <robin@protonic.nl>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Takashi Sakamoto" <o-takashi@sakamocchi.jp>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Wang Jun" <1742789905@qq.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "Kees Cook" <kees+treewide@kernel.org>,
 "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>,
 linux-kernel@vger.kernel.org, "Andy Shevchenko" <andy@kernel.org>
Message-Id: <8ed51f54-ed79-4b1d-913f-2b6ddad9e568@app.fastmail.com>
In-Reply-To: 
 <45e66776a1cb0fa54d1606b856887abe7e826ae6.1795776138.git.u.kleine-koenig@baylibre.com>
References: 
 <45e66776a1cb0fa54d1606b856887abe7e826ae6.1795776138.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] auxdisplay: Use designated initializers for arrays of
 i2c_device_data
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026, at 11:45, Uwe Kleine-K=C3=B6nig wrote:
> While being less compact, using designated initializers allows to more
> easily see which members of the structs are assigned which value witho=
ut
> having to lookup the declaration of the struct. And it's also more
> robust against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>
> This patch doesn't modify the compiled arrays, only their representati=
on
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org

In personal conversations with technical people, I call myself a hacker.=
 But
when I'm talking to journalists I just say "programmer" or something lik=
e that.
                                                            -- Linus Tor=
valds
