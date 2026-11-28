Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881955;
	b=Z3H5RWJT3KSpNL+n00Wg/QxdfGQvOQ1LoyhpurMtSA21g6zoYo/Vg0wSVh8+z0NV3i6b
	 gQogZc29NYBvEBx9pPT7TLho1LOSe/2r1I8p39WmjjvyYZi8VCNOiuOAPGTZ35xrZ2I5c
	 aUeA+s7t6Dns6GmViDhVbg7gHMC/4IG/pwuS/4bVh8zYbzmN6XVfJapFURTMeIG3/eHOL
	 z8tqSy6ooVHF2hXz2hrpTXiDiuu5qjuMAvCpERU6mwTw+JmAjrQy9kcQ9hWADtrVZcEj6
	 M6mL42uEP/aSMixt1LDKwLvcceUxSzdOGv+9rtcUiI6SI2QIvt4jDwR3KkGRR/fHcoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881955;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Mp86DAsE0QDhN8DjgLOtJw9eLga3AnYBxB+Gxc3zG/A=;
	b=IDzZnhdjiBSP21mpZqD2h0ZtiXNnDEqhnliPoZttKvSbdJvEnVYeYO9674D/TDXiKcZD
	 oPcXrn+eEXZ3eAjHu8U+7K9E+T+kj6LV7w7+7eo1zCmqTpWR6GSPSaJEu0We/Mg7WQuqY
	 D0FgIcQl0eIpb33/YjwkRZj6Ozpw5jnTkL33RkJClVDPYiYohDPn2+s3i7+MwlTI24SPp
	 mkzcpk6nnKcpihB2JluDww7RfgUi+2WSwWDpp/LvTzsCgSovVzXKfubKUj13S4bfFogvg
	 xQWjHxG8S9zPP9be9PeuBcZz4FAOa3iUbGp8nG8QfXOAPlJRtMYX/CwVda9aNoHT1pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=IrkV7cmq;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6D606A321;
	Sat, 28 Nov 2026 16:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA6D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=IrkV7cmq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Mp86DAsE0QDhN8DjgLOtJw9eLga3AnYBxB+Gxc3zG/A=; b=IrkV7cmq7XfuEK1WAGSrOh326S
	CdME7dJ6tKbrUsHX6MrboermpHWSuBDwgsWiXNHso9aPQjdCF/TtAmoVbx2pwb2bohnXzurAMzuha
	ZVLf6HHTstfxyr0KQVyVAoH9L5lPirglDrdt9o3ElhB9rvKWFu9fhM9l5OeR8+IKZR6I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xXKvn-0020Jm-Ks; Sat, 28 Nov 2026 17:05:43 +0100
Date: Sat, 28 Nov 2026 17:05:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v4] net: ethtool: do not call get_regs() for zero-length
 dumps
Message-ID: <f08168f4-b76c-4147-a18d-1385b4955c0f@lunn.ch>
References: <20261127072348.5277-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127072348.5277-1-25031212351@stu.xidian.edu.cn>

On Fri, Nov 27, 2026 at 03:23:48PM +0800, YuanZhe Liu wrote:
> ethtool_get_regs() passes the user-supplied regs.len to the driver
> unchanged, including zero.  A zero-length dump has nothing to fill in,
> but the driver callback still runs and may use that length for its own
> I/O.  A zero-length transfer cannot move any data, and some transports
> report a warning for it, which becomes a denial of service when
> panic_on_warn is set.
> 
> Return success without calling into the driver when the requested dump
> length is zero.  The check comes after get_regs_len() so that drivers
> which cannot provide a dump still return their error to userspace:
> ethtool(8) sends a zero-length request when ETHTOOL_GDRVINFO reported
> no regdump_len, which is what happens when get_regs_len() fails.
> 
> This does not remove a way to query the dump size: the uAPI tells users
> to obtain it from ETHTOOL_GDRVINFO.regdump_len, and the core only clamps
> an oversized regs.len down to get_regs_len().  Since a zero-length dump
> returns no data, the driver also cannot fill in regs.version; callers
> that need the version have to request the dump.
> 
> The problem was found while testing the ethtool register dump path of
> an MCS7830 adapter.
> 
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
