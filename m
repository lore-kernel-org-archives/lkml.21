Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868570;
	b=yV/BHNQKr4FPaou0ylQZ6XraBZkACmr0H6yCW3jJCKMoWECKgHbd3HVp3IWOryhZATIu
	 +v0gBuDvCwC7aTHd2u9R8hptnPP+YW3YKISvOgAUbJbDVNO5MKwQ2u2vU8zwf+JXviqsQ
	 IlGOZFbM0zcN26j0EBKPBia7xdl1MFaMp/o6I5+O1aXLkVf42pu5fyTvorIWK7P2EPv/n
	 kq7S/0yJuKcQnOzybvuIEEW0434OE6R8LSbDcaoCsi4pD+0vZSxBGCKYbhyqMlOeIOk7x
	 oMg4ISD+uqAP6dwywKjc9Km0cIC6Z9EonYMN17nqaP9N/kWaopzrAfsDc5fk6t+3WOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Pytd2qM93SatepYn5uV6DgRmuGaakkeBiisPKQReLYY=;
	b=cjfoWB/QZfqUytZBs0f1kMup912sEcNmOiCa2Wt/Mmo80dnEl9stNpdGm5D0MId+gOI2
	 2xh/rrseFTyLFqko/6As9304kJh+wK4IG6ur2BpeXG/B8nlI04QaFaXILD9JgEaye0TP7
	 E4Lo1KR+fDYdlSIQ2cd6Zwz55C5v72mjd5+9kv+InueBfbiZU6JiodJPyfLQMPlSnzbIW
	 QtHtmA+OUbSmvgMLJsvEeZzl/8SuJDViH5OKvpkMQpC2zRm2m0hIWQ3tnnE9fOKpvjl54
	 xjoe47nZaqVmG9Xc+MaMh9slVcO313/5xxWLyHYMHX2C4OEm/HWG0e+4jjPMeL5iqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=UXWqS8Ef;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39671606A31F;
	Sat, 28 Nov 2026 12:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39671606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=UXWqS8Ef
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 8504AE838C3;
	Sat, 28 Nov 2026 13:22:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795868566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pytd2qM93SatepYn5uV6DgRmuGaakkeBiisPKQReLYY=;
	b=UXWqS8Efo9GuED7M7CImvTbco2Fl8KGvS6URK2AHLfRtFmc4lGg9WVt81e2VLkoiOaVSae
	g1Iqi9zzgGJCbuIJkgF9AJ8LO66DQCCHpqrDhPsM20JEXkS0hQY2ev8isVx3veSjjKr4QY
	c7kncpPbQuwtXTVV4l4tU86sBIkel189zQPhW4LpsA/ZUfi5Mz9INSECWpVHGNmrq4r+rM
	oZqnWFBzwZ3OAEoiSI3tJs/EHapOFrhTnx2I5gY298Ph5RgWifD4sp2jCVqwk66QZ2WySL
	h5vMYwP+f8J/Rz0vTrPyd8T+rnGKLrwqc0KpxgnGFd2gQuq6Ec9nBX3oScfybA==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id I0FTezySSKXh; Sat, 28 Nov 2026 13:22:46 +0100 (CET)
Received: from p14sgen5.lan (unknown [86.103.60.175])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 28 Nov 2026 13:22:46 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: netdev-bot+sinfo@kernel.org
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: pse-pd: tps23881: fix the disconnect event decode
Date: Sat, 28 Nov 2026 13:22:40 +0100
Message-ID: <20261128122240.3914765-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179586056937.3294.14660533366618098643@kernel.org>
References: <179586056937.3294.14660533366618098643@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 28 Nov 2026 10:09:29 +0000, netdev-bot+sinfo@kernel.org wrote:
> - How the issue was discovered

By code inspection, with help from an LLM assistant, while I was
reading the tps23881 IRQ path for another PSE series. I checked the
register layout against the TPS23881 datasheet: the fault event
register is at 06h/07h, the DISF bits are 7-4, and 07h is clear on
read.

It is build-tested only, as said below the --- of the patch.

Carlo
