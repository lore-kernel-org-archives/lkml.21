Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430726;
	b=ZqaWWHajEOI8wglACO46naTKzSsU1usrc/1OiHoGNo3pMBtYQwZyxL1sWtkpU8M1haBz
	 8CRO1r1INcRgU4jhQ1uoNj/fN823rZlDsdkNQjhDl+3zEo4FeGlRmE948AjOczLYqP8J4
	 VrMlquDSUhzaiAiM4Hj7sZRK3vjW8NHPo4Frk+oP4CIA0YFTYnATGI1oxIJfw5oD0WQNv
	 PPHm1YmPm1gz6JtY3R09r9R9JI1yApv8f/1ZpY3b2r9hN0Ctxx3dIuttipsW+sheYHavJ
	 Totn60DFGtxad+5wm50AX+YPXcbH7sW0vHX4kizvP/0U5vnzdsFOvjuKaHRhks6UFkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=z/zmpz0TamTPeoYCPc5+PhM53Ju6/rNyQtIdD9TkNvA=;
	b=fdhSrF/OeaSB7mDob+hhE1tdketyKGBh5IDEh63kZfVaOUxexrOyDspMonywLxtXkYy4
	 Iqz0PHSxcmYRL0+HGcRJ3QFgbx5uVM6w30NUHhEfOhbd30+A9kBYBYPwHl1H0MQy5AqzU
	 RkoWjcmt8x3w6sq8YdDB5vTE3O4DvDVVFqjEEYQeydPbpaTyxN2c7SfVQxBZxLK3YfuFZ
	 WB6q8rGCd4+VIP5jldkwLZPWVeFR2U0nQ2FuRkYnHylMKVhaclS/GL93mKtzPrfNA4zTF
	 rhxh8ELzSJfn6Yfd6YxeBhlKMvx5WA3hgfN0jvcHjYLw5Aq39s+Gr/nKlxie6R+2IwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RIjnvKM9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF31606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF31606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RIjnvKM9
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 93A692004F5;
	Mon, 23 Nov 2026 11:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795430723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/zmpz0TamTPeoYCPc5+PhM53Ju6/rNyQtIdD9TkNvA=;
	b=RIjnvKM9/sml5/I68OAzMHquglOuil1ZFv5/SHYRYteoKPjt5jlein8W/0w6/xjhzHCIIV
	refavobv5KFomJ6Ba4iHhyh6SjQ6xbZlX5sDk0XDWfSr8hzgso98vkBnvKmzwMd2fZdbXJ
	v/E3lIpYJL4uCX3xbZ05DAZLbZZVXCEiitJgT4+PNAboGlOYHu8wUH7Pt4XprEqQl+XM34
	dpk8OIBiP3Zrlebe66/UmGwdBS+rot5LXN8OoZt9R98G+e91u/REn6HBsHk4NFvzerzbhY
	/+ZsEYaRF7xE6CpUd/dcqfDdcHOvtHiSOOT3RVbyJl5Yr6DsE4OE2hbFPpsXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795430723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/zmpz0TamTPeoYCPc5+PhM53Ju6/rNyQtIdD9TkNvA=;
	b=UsAr9rh0cp2RkRVjU7JO1PGEJ33tH8u91Ls8m2nIOHuOfFv3XgI0DEC3I/KWFCPqNmQ8Vb
	P1EOhWWZo6LGvrMggy/O0HXR/u3pwwP2qdYEO8wPhad1pgkfx189DBD53pcpyVE7YQtCoi
	YgTEqmMhWpTqzOTDDswRQOQh5B4qX1FPUeh481U8w4hbWXSLkICnFkyOJruD6bC9N3gfMs
	ahrQMQf0OQ66HmQhkE7gmD3hBmAFWn4YPipGJcpKe+L0TyVMiqK1OziLnAonLqBT/a8+vU
	SU8L5b7HkwsrHwsHi3Zia3Dk8qEUu1IMf4fvP/xhq9ky55akqxb6eqplbrc3MA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795430723; a=rsa-sha256;
	cv=none;
	b=frP32e+r/gQjOr9s3T9UeKlTnbzy2SaEoU40sY+pC6uGpdlGzL7W6XTGipl6L+ukqLMML1
	3/RKB4L8fDLOsaThmAwit53GKeSELhDhbdpP2sHk+O6vdLdNLWN7wwW4df0XTWAdE7Bneb
	ugyf6eg2H2ZdnxuiWAmgI+J+M3vCJ/FzsdSgLdwQaJkB0oLs9g32/LrCIiLkv6AYmMQwy8
	rFfSZOJAkczbgPKihbzDuk4+cN04AHM8paOJYKz3wMuIz1EZ/cAWb9w+mCWpTmMhONf0K1
	IBUap/dN5Zr9htDPpXKHgymQFt5CXLcHOYBZqzi0yw/fbQNRdfQXnIbPSZWOeQ==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 723791BF694; Mon, 23 Nov 2026 11:45:23 +0100 (CET)
Date: Mon, 23 Nov 2026 11:45:23 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: =?utf-8?B?VsOtdCBLYXrDrWs=?= <vitkazik@vitkazik.cz>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <34hku3cwz5tgpz4l7jtcsupictopwpwv6dmbkyhwvi2husszfo@5pufgrbxligl>
References: <20261121234125.16093-1-vitkazik@vitkazik.cz>
 <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>

Hey,

On 26-11-22 00:26, Vít Kazík wrote:
> Hi,
> I found Marco Felsch's earlier submission for this chip (2019/2020)

Uhh that's an old series ^^ Can you send me a link so I can check it
quickly please?

Regards,
  Marco


> only after sending this patch, and have read that discussion now. My patch was written independently from the datasheet, and it already uses
> 4-bit/512-byte ECC as agreed there.
> 
> One difference is the free OOB area. I expose bytes 2-7 of each
> section, following Table 11, while Marco's version
> exposed bytes 4-7 so that the free area is always ECC-protected. I'm
> happy to switch to 4-7 if that is preferred.
> 
> Marco, if you still plan to send an updated version, please say so and I will happily step aside.


> 
> Thanks,
> Vít
> 
