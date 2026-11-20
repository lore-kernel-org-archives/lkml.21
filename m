Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167745;
	b=OBTjsOG2tmij1R0uNQlJ/y8RNfUKAo+KhVUCI2JajCBq7Fol8pmzU8TCTDIcbGu2+7PX
	 a4nhSkd4IVtAlt+0Ws5T54VeFbHCyj8D1DiBKVNx9wENpx8cHecdFlnFZpAHETNuTSyin
	 QKeKmd0ZVropdR59MpGWvRuUur+/qhheIRe0p/BmlMVJqCJniP2Rsnrz++nAY42CmEsXY
	 RrL81E/wAnmveNtq7rWksgJBIxgYRkx+PyPnDjZa/DrzMWi+eWLwMpMQdXJac4vwGKVid
	 ATCjYGNFs7njWDUBBL8D2FL6juRtmD2usbx+Bl6/DXVKfh8orSG4Kmf2XL7rjcoEt7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167745;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QwWHK9C8TpwlkKxGAZEDwqXX7JA3u75CpR1xSX14q/0=;
	b=gtaYe0j1QSVzyjJkNpkbQaLFKGmz30jh7WxapKFVUtlKUMWl2WvhytJotcRowthOxnZ9
	 jaPnhyETwCFYKB26LIOmpAYocQk2tU8OrNbCIjFtC4JHSAU7arm0CoiJxQZXrNcQXraMV
	 e4rvcw8EzKqCDoDamP5670aKb9BnckKvXJr/WuwbetaxSJ/ksK5dvRTOvMNoUTF3fnx8s
	 fUwEXDCt3WkRydEKPSbTqBkbcVLDmJHKCBd5r54ax724tRos3H4vwgD44yOwunRNcRBJi
	 3D372ZuAkrwYbg5XYwg/hbPXU1f8ewJcMuGIzQ3UzC1ak7X8mMfxJudumxeMYT/dJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDPE1A2Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97D606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDPE1A2Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8611F000C6;
	Fri, 20 Nov 2026 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167745;
	bh=QwWHK9C8TpwlkKxGAZEDwqXX7JA3u75CpR1xSX14q/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NDPE1A2YDsOvMavwu5sa4S07ZXzE0SXTLRGAZgLY4J/odzlhqyqJHHoMtF8a95kOW
	 d2a9jGQIJeKY+lA1guIm+ayAch+Ry5dxlyjc/ztzENcXPkeFQqL+rymLVq+Of13moe
	 4xNzKRmqGVet7gS9HdpOwHkNCix99kr3OUa88vzJBpyqf8A6bvz+WCAYLGt8B0wSDo
	 MUUlsGQ80CP44mF3G7CXH3kd9P290GMniEkBLWOtiketqWXOBNiD4GQA8coe9KPP+z
	 gSvO0LaZnKApkhp248ieuPPGzkz67BxqPiiY+E4MARznJm/Eo136jQc7zL3B8DmI9Z
	 5gz8BjgfBo+MA==
Date: Fri, 20 Nov 2026 10:42:21 +0100
From: Christian Brauner <brauner@kernel.org>
To: Laurijssen <lauserve@gmail.com>, linux-kernel@vger.kernel.org, 
	pjw@kernel.org, akpm@linux-foundation.org
Cc: Laurijssen <laurijssen@protonmail.com>
Subject: Re: [PATCH] SYS: refactor sethostname setdomainname by introducing
 shared helper
Message-ID: <20261120-geprobt-virtuell-festnageln-d217f708ecbe@brauner>
References: <B9DD7F6A-A760-41D8-8809-D12F3F178326@linux.dev>
 <20261112081132.14183-1-laurijssen@protonmail.com>
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
In-Reply-To: <20261112081132.14183-1-laurijssen@protonmail.com>

On Thu, Nov 12, 2026 at 09:11:32AM +0100, Laurijssen wrote:
> into a new helper, utsname_set_field. The existing implementation
> duplicated validation, size checks, and uts namespace update steps that
> are also needed by upcoming changes in related syscalls.

What upcoming changes? If there are any, send this together with them.

> The helper centralizes:
>   - updates to utsname()->nodename/domainname with proper locking
>   - propagation rules for shared uts namespaces.

There are no propagation rules for uts namespaces. The helper does
exactly what the two syscalls do today.

> handling. The patch reduces code duplication, improves maintainability
> and prepares for future extensions to utsname management.

It adds a line and a switch with a WARN_ON_ONCE() for a case that can't
happen. Seems like churn.
