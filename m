Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883380;
	b=nmS0TL+ft3iNe37iLV14XlD1NW3OgWBe+5NPvWQs/s17uUMokhe6m9au3U2i3NAY1qde
	 NNHhD7ZNoIXCyKNrM517wGlB7pcb+Y2o6J+8OuNuOqZgVAiPDuhfMatv2D39RMHTTjWIN
	 aj/2lx1YP9I/asLaS4mRYE2GSzvR49cgRd0oHlFuj7f8o7SIeJfCOALnzeEw5bEmznTn6
	 JmxQHYVI+kF2YBwnELuzAjAXkeydg1mvanoIJU1Jvognn168sUhbFHu666JGP5emGW7Iu
	 i7M142WxNeDY2PQ0aWkqJJtTyCQYCkzM1o+FLe9KwhE0TpDiyV1zNAH2bAViMmR8GwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883380;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Ckch6OVMf8q7qHMTqGmd5lgswKpqiPv96PWurCPzmHE=;
	b=dVm0qGlbp2CF0NDtlwtRsUJ0j9fetUF8vk4vUQFRnRPX+eOUL5dv2Y3JUveN4d/hI/GE
	 GIYOtEtJIzstf/OMnNy/Eq1e5Ys2R3nxKJNnyDLciZpHK1Zkl+PpvqnFYZd/30C9ZUTqQ
	 tQfRqkK4rZAqah06BjgCdGNdpZdYIZ4oSo4fVn+Uqv7O5JCHN3qITb6N9i+8Hk+ZMJPHd
	 CRa+HKNkJsg4RWpJdTz+iMU+f9OUd3PjsoaAfXdZ0M9FQa9ZE+gWe5lTrWwpiJNQE5HvW
	 3oQuE3pB67x4venXjlv2V4ax8+BcdFtKMiYFnHIy/VHnx/XLIK7sYWALGqcEt0LsFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSDtCKQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA00606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSDtCKQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06761F0089A;
	Sat, 28 Nov 2026 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795883379;
	bh=Ckch6OVMf8q7qHMTqGmd5lgswKpqiPv96PWurCPzmHE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=eSDtCKQ0q3ypKsb2tx9RUc/NMZ/f4tlaUmGldrKShnmqndFTL1rAD6ZVXAc+ac74F
	 BH7RM1s1ir00DOl4rjUXCjUHjWP+DzCOwMfX0voqTPi7VzDdYtTBDk1VSyaYRk5sXw
	 uRV/7ZCXYvmu5A6231QWAkEsGPT31I36Vcmzivk6i0W/rqQQVpzgBkInFw/v5oZizl
	 JVikxN0OSZ42GHYVCvURToX0x0oAtM9egpSd291n1tUGJlknsFibZLww/qrKi0Q82g
	 JWECezMcC4UsfLBJh5SuLZdr5J1kLqdH6hZHckWT78kQGrXYWEG8aixJeRp5/aN2l/
	 baoW9kHHdNotw==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id D2354198003A;
	Sat, 28 Nov 2026 11:29:36 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Sat, 28 Nov 2026 11:29:36 -0500
X-ME-Sender: <xms:bgELa_Fi_Eq1XWnSEgIlHKJexInf-FqZezGuQIv5sR0mz5wbmATRlQ>
    <xme:bgELa3J6Fb5dcWeGB1cQ-m2Io51SwQPhg3ysxJ3z00gXZIV7HYJo-2aqUFHeHDw03
    SQOWqvEJo15RO_mqLInUjPr8Kk8o7LaUsGaxB_5SmDFTAPNxUaloT82>
X-ME-Proxy-Cause: dmFkZTFSVxrnYnP+evHNOwj6RpfeVNDSnzpJE07chN6ONcwfpkIDTQeHYfH7BuAMjKaX+k
    ekegHH4TCXzrup+gD8gjOSCoDj/Jf6J0BWDrryhRt/gznqjzTfhOuKJrxw3KP10pC6VZ5A
    jqbjniGjJu4byXpbbFQeYMaNiWqtccDO2C0E6ARe73giIqFwRpYvMU1+uZ28B32oMFy4gu
    oXvGXWMEbe4RxwxUfuD56nl+TEUtTwB6gucCVi5qjkY14LoCoaFyCpVxQTifONdas2bx7i
    pNoj0m3HYiZb/8BBCUeNQ+fj09DoN3c7vIL9dLqg5OslPFZhnB2jqd1zom/5woQTJoUtpo
    TqDx8dvBS9UXo1pPvW5F/SbTS6YUMqxtVFgqz0e3m3JDK3L5E0nUo8BUzseOCxCFUYAg7p
    d0VrCMroxYJuCB5Qn1iNE5CDQlh8Aay0itvyYhsirNS5wxmKKxnU4gMD/ulOgDWSfMHcnc
    vyUmxZukgujwQyTVZ4ADuZLrTRmQfSork4mkHKo4Q3SIvd3fkeqxLJoIt09ZUGBvWaIKL3
    zWanOfAVWaS56iX6vp9CYK+Wqa06xcLMN9Ch4K7NIeBlDpkpmn94r5jb/fu+MyAx4d2O8T
    MUh7nCfqWy3nCN+GJQFGmK0BwNIUWGFTHWMrmdCu6QvaPmE5o/IBrRMhJj/g
X-ME-Proxy: <xmx:cAELa7wSowD3WDUd6MBq4WxgwxZYyHoxQ7En6sHLvSYoySS_zzdlvA>
    <xmx:cAELaxhoDHj1SDaYsV9lugva_p43LEG0G0ALR0zobTjBoJnvowkvHg>
    <xmx:cAELa-olPAC9t8WrSccS7atW7sd74yjiB_OggFal81Kuq-UdgZOChg>
    <xmx:cAELa4gzSfpyULqi2lu1eBLU77uKeuO4rFtWo8c0M-DjbCPj89FX1A>
    <xmx:cAELawM8opbE3-435XhUJf5j-71GszV-GbwFWQ-xM-tQjejxdM9Hx_Lo>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B3FF02F8005B; Sat, 28 Nov 2026 11:29:34 -0500 (EST)
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
X-ThreadId: A1YW8GJ6io0J
Date: Sat, 28 Nov 2026 17:29:09 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <4a95e051-9fec-47be-88a8-0cd41b5342b4@app.fastmail.com>
In-Reply-To: <179508377005.3136.7735552086490209084@kernel.org>
References: <20261116102115.27574-2-kaloz@kernel.org>
 <179508377005.3136.7735552086490209084@kernel.org>
Subject: Re: [PATCH net-next v2 1/2] net: sgi: ioc3-eth: apply the DMA attributes only
 to 64-bit addresses
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2026, at 11:22, netdev-bot+sashiko@kernel.org wrote:

> For a 32-bit direct window address, ioc3_map() now returns the bare
> address and ioc3_erbar() returns 0. Where do the dropped attributes come
> from in that case?

From the slot's Device(x) register. Nothing sets them there yet, so
the IP35 Bridge support has to. v3 says so:
https://lore.kernel.org/r/20261128155146.2836-1-kaloz@kernel.org

> Wouldn't ERBAR still OR the barrier attribute into the
> upper bits of that buffer's last store, which gives the widget 0 address
> this patch is meant to avoid?

No. With the IP35 changes, phys_to_dma() picks the form from the
IOC3's bus_dma_limit, so all DMA of one IOC3 uses the same form.

> Can this deadlock on SMP?

Yes, fixed here:
https://lore.kernel.org/r/20261128154953.2664-1-kaloz@kernel.org


Thanks,
Imre
