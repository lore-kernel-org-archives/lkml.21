Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795878544;
	b=GV7S99Y3z92BDlombHXcKkInEIDgCSditomN4U0bNht9PpNcexyOVTrkUzErLECAYSwJ
	 DJ2U0t9vUZXwHb9sa/OBYdmAk5hWSqS4MKTk3/ndV/lL6ON1q/WAQuYDy8sBeQLefXBmr
	 2C3MSoo9lv3Aw7bHxH5vn/rw5BlXNr+1EGB3lvK+t5ewIS9GwXYjPEe954uiZmq1qto5O
	 a+EZ7I2qeOl7DbAJwmq861U5AeiN4b0jJ9jtFZZOZWg8qOHjWKiHyJq27pdOd1nX5Cbth
	 KEs+17kPmPn7vD5mP2tl7SKv6wZai72pnaV7S9oI0qHKcZEDAOpfYDxJ0RrO6O3lM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795878544;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=zj6HwMdkz7ovzYXk7gJatQ5LUnkgGX3g1g5SL2sK39Y=;
	b=TgCGUT5HhxxZsTJwmNBZLF+CXQSLCLhlr3G/Dv5A0wZ7oNjH6dXyA+XkG1h6Nwaxjqek
	 /ohV5u80tj+34YVTJbK6ZYUZltEDCCrxKK6WDMzychYMZPhQgU8vyyTakzXZC7ZaukNnN
	 iajs+jvxxJMUioa2rZAnkpNIPcgIN0UXguGvq8IwXtOsfLTbljL7olutlhOCv0aVv3CUW
	 gRXeK+f1fG9TTV/cFk4vFp33/OgXA6S/WppuoWHFRNZrzB2v+9AcV+0RKj14Lj3j+xSsB
	 OIBilIJPQUw5u/x76NsdEsQP0FaissD37ReP5+e4xU+WUjqiBKsVYuBgF/8U++qTRTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kbjaTlf+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291A606A31C;
	Sat, 28 Nov 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kbjaTlf+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB531F00898;
	Sat, 28 Nov 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795878544;
	bh=zj6HwMdkz7ovzYXk7gJatQ5LUnkgGX3g1g5SL2sK39Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kbjaTlf+xP9z5wRm0fQ+HAZbSlEUWDlR68zeHfpnKgWcpXDQWNceSg7fFnqnzxTCf
	 6r4i17X2AZVKDxVP31YmV1HqhPiaCoz3piJKP3XjSV1H1OMEI6d4OqZ4MKAufAtMiu
	 XpF89o5NOHgfFcSRWbBEFL1GhLcSFlnURHFxRlZMqbvj8WgHLAvf0guIqBr65lOcvZ
	 wU3m1lxMrCte2y0ABzMzLUj4WLYVHTTZp9Y3QsTE7le4d6SArDaPRHnp6wuyk7Pq+E
	 1bsiKS2B+cIfZVwuJ8DR0Vk160BjvT/ho1lgQCGx9Qi6LGADdgsT355WU0TXy2dK//
	 x+r4UQ28Pxdcw==
Date: Sat, 28 Nov 2026 15:08:58 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: florian.fainelli@broadcom.com, netdev@vger.kernel.org, rosenp@gmail.com,
	rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bgmac: unregister the fixed PHY on probe
 failure and removal
Message-ID: <20261128150858.GI31322@horms.kernel.org>
References: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
 <179548085846.3135.4498796165187686052@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179548085846.3135.4498796165187686052@kernel.org>

On Tue, Nov 24, 2026 at 12:40:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 1 (1) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new bgmac_phy_disconnect() reads phydev after
>   phy_disconnect() may have freed it, which is a use-after-free on the…
> - [Medium] bgmac_phy_disconnect() picks the release method from the
>   device tree, not from how the connected PHY was registered.

Hi Florian,

I'm suspecting that neither of the above two issues manifest
with in-tree DT. And if so, I'm thinking they are more theoretical
bugs than manifesting ones.

But none the less, maybe it would be nice to make things a bit more robust
at some point. Either by prohibiting configurations that lead to the
conditions described at setup-time. Or making the tear-down more symmetric
with setup.

Nonetheless, I agree this patch fixes a bug in a minimal way appropriate
for net.

Reviewed-by: Simon Horman <horms@kernel.org>

...
