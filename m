Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795879466;
	b=zNneUW+KDr5Kut+Uetate6sJOwYuRw+qZRmrg6x8V6Vay4uM+9fTKbg7/XGBz5QqniG7
	 QV8CiRK8hNp5w33KXSgudqZZF257Eke214Yu3rmUY5jDgYSaaM6hCoGApfpqCYDnbx8bW
	 VnjsD+FNpP7mL+/5aJIgZYSq+VHFNbeY37SfsHsH7kxubeO6287mhyYetzGY3+eH0Lrfj
	 H0ZhYoKF3u0MMmJQgZom/OIzpSbuJUm4/DVuhh4aRmst35i3W50fpUj2rI8RnuJfAFqMS
	 bHE+H8mMiJ/vB6VP1wm2ydeOzExWE99xAglaoy9XVAbVlimVwROBe/4g/qPWut8lXaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795879466;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vD1i+tPUgYVemxkbbLf9Oo6Wf3yurgapiLF27lF9E6c=;
	b=HC/8eM9kmu6ULj4+AJyhBfVvQlEGbGPiE1OnRzKXIotl2Jk4hurjJVC23r9F0FDgUcJp
	 NwsQIC3T+ccPiky13kRRo78K1SmST9AcdJzupurW2U9a4Kx+hNLxeQ3t10wnL08yQRSs1
	 HX2KOWQGsKBLMLCAqJPghmRkrGYLyO/jwLyP1YCgsdlCqhqndW3qSzPGwl0Ih7nBaOHUA
	 6PlUK1mm+YWIHdw5zq97l8tfaLVTp13X7rm81bQrXBmkK0+gnyv6nbCKTdzlkEN6hC1Wy
	 ty69uYyUS8sqFlP1rNNIFg1l+TRl/2vTzYHqA0AJOfHnJmylU3deFbEFtej1jf3YYug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sz++uah0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F87606A31C;
	Sat, 28 Nov 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sz++uah0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDED1F000C1;
	Sat, 28 Nov 2026 15:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795879466;
	bh=vD1i+tPUgYVemxkbbLf9Oo6Wf3yurgapiLF27lF9E6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sz++uah0P4YtcPk3XzTDv8y0NMZAegT62O5qayREdhXv4np8kx7GsN6EM79sYxdZ0
	 xHQQFF7YkONbEqbGY9PuzFwaS4AX9QC/9U/wxZ3gMBvyCZxbLtzqcnjZx88v6OTXib
	 qr42CvjMrwNmA3nQ+6kI20IJi9dLu6ywkVJyXHMWFAVk2L8ljunglwDhnE4T3uoxzv
	 EpweTQjXFhAt16m+Vw3ABWpEnaxJuLq9AH8sbgq7k8IWClTQcgp9KiFuKt1uSPFALf
	 AfMwpP9ZpThDepJUkLmZ5e2u3WXXqsP6srFuoptlm/TxJEGDTpGB1xLoZWYaF0ttCY
	 2HC3cdIYTQRKQ==
Date: Sat, 28 Nov 2026 15:24:22 +0000
From: Simon Horman <horms@kernel.org>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: hso: cap the MTU and drop oversized frames
Message-ID: <20261128152422.GA804035@horms.kernel.org>
References: <179513801218.3291.4900870389760727017@kernel.org>
 <20261120095337.1088-1-chenaibing@cmss.chinamobile.com>
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
In-Reply-To: <20261120095337.1088-1-chenaibing@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 05:53:37PM +0800, Aibing Chen wrote:
> Hi,
> 
> Same provenance as for v1: the missing bound was found by code inspection,
> after the automated review of the companion skb_tx_buf fix in this driver
> reported that hso_net_start_xmit() copies skb->len bytes into the fixed
> 2048 byte mux_bulk_tx_buf without a bound check, and that hso_net_init()
> never sets max_mtu.
> 
> The overflow itself was not triggered at runtime; it is statically
> decidable from the code.  The additional paths listed in the review of v1
> (AF_PACKET with PACKET_VNET_HDR, tpacket_snd() with a vnet header, and a
> route MTU metric above the device MTU) are covered by the length check
> added in v2, which drops such frames with SKB_DROP_REASON_PKT_TOO_BIG and
> tx_dropped accounting.

Reviewed-by: Simon Horman <horms@kernel.org>

