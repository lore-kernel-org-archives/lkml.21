Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196953;
	b=qFgexsmYpLESc6qv5jiNLxQBC4sbypdoGyPhlu0cZXtJVY8zDqS5a0KKyoVfXFPUEFQ1
	 dg9wYzBqRcWm+JtkfzB1nXbUTITUiAfvnSy7ytRQtCsxnas6LkuYBcysggImytmuYmYCw
	 gulHiq/1dqxiflcyAF4glADTPOJHU1Gl8+GxvBV4RkmwVpmVZIz/QOU0leRwZGBQ4i6C/
	 SoiQZmvxwJ3BPjZaR6BULV9v628cdf4oQAVop1CTL0P3UBSf64c6XlOgKCsFMSBpVdoun
	 jAfXMuarJOzr/onpRdG3AWCMnHbYB77STo4A8ek2OPmFJZ5D5NgCGQ8L1KWwd4UwjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196953;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+zYovALtkcHPl59gCzX5V7GWLuEm62g0nvKcmVyct1s=;
	b=E0lj/LWzjXR+63wwxmdiJV1aJu4e5nm9WqCpyXo5Gn5+IHGTFjQANndpP8DyB4Ks7O91
	 2x/D5MoJz+ZraeRTL3bWUkjiImRD6AdkBmeqWshLpPa3BGZQ+0NBcQVW8QR3X5uY0CsyF
	 0rBikyTHauNO+VGVESA6eFqKPlXEqIOR+PCVWpbPGl4x6qCSaa0Sa9ez3Hk0EoRBtEXrP
	 33yKVEoxeO5iCex0/qdbvBTDeINVsAk0MXZJEJi9iIcOmgQUu724unhn9uOqbrXFeUtK6
	 9fyftrnjSK3s0SL+B/0iM0hRmbIJOtvxrK1e4xCdkKkGfeMUU5FoWH3P9iQACDc+fsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csiMIdOD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9E606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csiMIdOD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BCD1F000D1;
	Fri, 20 Nov 2026 17:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196952;
	bh=+zYovALtkcHPl59gCzX5V7GWLuEm62g0nvKcmVyct1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=csiMIdODBm2pIDuSwd75co35GN0fA1GSj/myokYyx8Yn/BCJOJdAw8SM674xNgffp
	 2aXr/FJHVTANstwKgZZ5V/uzpjO/TkEJKLx4dYYui43b3KJkaF911PA+ju+/thhlyu
	 F6LAh7WBrY5lDnBjsHT59LrBetngPqexvqJ3BzigCP7vhEWAovhMuaAnC2j6XO3oAN
	 y/X5uwxOaWSahlA1HMwVj6I+1UWURHr+9aPmtZjbXRRepcDq4XM7toUXIcAOjHd3rM
	 bEndgoIOMO0xylKyVyM8QT13G7Lill/LE/Tz3xKZZKJ73HXis+SNHz/+EzrEb0w9yP
	 6Fj1FkH6QS5OQ==
Date: Fri, 20 Nov 2026 18:49:06 +0100
From: Gao Xiang <xiang@kernel.org>
To: Friendy Su <friendy.su@sony.com>
Cc: xiang@kernel.org, chao@kernel.org, jack@suse.cz, amir73il@gmail.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: Re: [PATCH v3] erofs: set SB_I_ALLOW_HSM for bdev-based mounts
Message-ID: <awCIEqmgv8Z6xw_0@MacBookPro.fritz.box>
Mail-Followup-To: Friendy Su <friendy.su@sony.com>, xiang@kernel.org,
	chao@kernel.org, jack@suse.cz, amir73il@gmail.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
References: <20261120031909.1757230-1-friendy.su@sony.com>
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
In-Reply-To: <20261120031909.1757230-1-friendy.su@sony.com>

On Fri, Nov 20, 2026 at 11:19:09AM +0800, Friendy Su wrote:
> Set SB_I_ALLOW_HSM to enable fanotify FAN_PRE_ACCESS events for
> bdev-backed mounts. File-backed mounts are not supported.
> 
> This allows EROFS to handle cases where file data is not available
> locally at mount time and needs to be fetched on demand by a
> FAN_PRE_ACCESS event handler.
> 
> For example, an EROFS image can use blob mode with metadata stored
> on /dev/pmem0 and file data on /dev/pmem1, where the latter initially
> contains dummy data.
> 
> The filesystem can be mounted with:
> 
>     mount -o dax,device=/dev/pmem1 /dev/pmem0 /mnt/erofs
> 
> On receiving a FAN_PRE_ACCESS event, the handler fetches the actual
> file data from a remote source and fills the corresponding blocks
> on /dev/pmem1 before access proceeds.
> 
> Signed-off-by: Friendy Su <friendy.su@sony.com>
> Reviewed-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
> Reviewed-by: Daniel Palmer <daniel.palmer@sony.com>

Reviewed-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang
