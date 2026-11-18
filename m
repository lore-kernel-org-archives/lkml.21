Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026154;
	b=sILPfzx9M70cMUFhIbnyFvubIw1Dcc8WNEt6hJ4Ts66ezU4TsiQfdd4UbrIv/0VRjtW2
	 oemwV44Q7aEAOgXzjSAarkxsVuLEXZFS1W/AhN51bp5h4PJLZ2Vyw4mzHncHv4eROhsBz
	 uDUIWVf2ynTN00EVBO8zTvGOGVlk3+KXhE7XUTx3ucDbaPsqiEuoLEvgxdnhqDqMssWpO
	 uLB8hlsuwYlu7wTcV4Cwo83eJdoKc4fWUoyFJXK5Hu5z6znRp1rUxNuSP7/svea8srH1d
	 RbaXIjrdPAXrTRGGCmCuMYBW9BbVzXyi6SIdrAzvzoYklC+iTwH6JX/uENFJsvRlDsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vMKQOV/DxCkrPHKAtfr//ClygiL+UWH95ly6S/Oee6o=;
	b=YsLoKCKwKagtgLpJA7PPNyaOwayV9xXEp6NmdQ8rTp+KBF+chgiPhZKFqyXa2PUx8RNf
	 FfyhC/xYKPCsUPOQ68RYqm0E8QO7JxoMX1J8Ftisw532pCEGoEYPxCDyNKfi480n4iFkE
	 gFAlOkuDtnKQm7Pql9jOcBAJ4TRr/0WycdDtdl90dEHd6wgXNSheunzLUSWoc2jYbq2oC
	 u7QR8bgFXuTE1kD6XBHgEqCspXfH+uONiljQdkTJ3O2F6JaZ8YVQ7ESW6D+Xy+QxEDCkr
	 HRCRv1Uxua3xrN644I6Q+8A+i0jYWOMmK2G92HEtGKDNFazNFOq8SE3mEwHEpTDwybw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cnXGQc4f;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE1E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE1E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cnXGQc4f
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9497a167a6aso10341485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795026153; x=1795630953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMKQOV/DxCkrPHKAtfr//ClygiL+UWH95ly6S/Oee6o=;
        b=cnXGQc4fX2GKsWf2r8Qtk5ghyw0cgOyRGxVeq6PSdtK1Mit8DixMVGBAztBwq1SYyv
         Nh2ZxIn5/Jb2AH+7Lwu6eBwhI+h1l2aDdnqm58QsUmqbOis8XxNoLg9TYN0c1GiBlFUz
         3/vpM/zyeOwZvchrtfsful8LjthcUANs1ocWGSY0hVVSwfM6eFi6cS0bAUnDQKZ1zoK7
         Oci7ZXeXmKBV0n46NGoNgGbQOskzNVRKd//mXimvXDhj+U43XHR7Gyls57Y+x4RLz5Z7
         qPICM3Cg0qxwDjeHJjM79Gk3Lu6KfDU5TLhQtwXow16Fae1+VOEAyvE/TCtPhPd8jNkI
         zGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026153; x=1795630953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMKQOV/DxCkrPHKAtfr//ClygiL+UWH95ly6S/Oee6o=;
        b=PihcKsU4T6a7TbcSngw4OtGbUt+kfOtxH5Evnmid/uV1nqUvr7hPk82zuYfZakBC8F
         g+zkzrnk/5o54ghFWCN6f931xpq5ZJDgiVnn0DT8A5bVIE4JI741yEXDQ0335K28oHmw
         23q1w0eyhZXxwZRLNQp1ZYpYxtKcdeHjEgxtWVJk/x9s9YQAvB2l0qSZRLHPlZDsJiZi
         Et80+I/VEVQ+rXSeQGapqW6uOYZYZdw9VFmmyT7ZfNS5c8b7WYsBIMJbhJj+8xIcQqxe
         otxMDVoJG4RW+HiLWZdI5CXWxrCpYZsh5mS5/RA5rguf638iXrWG/zx0KDAPxa9p13vq
         L9Dg==
X-Forwarded-Encrypted: i=1; AL+hErGA6nJ5sfj4ZsQCuC+qPLCRsullwfpw0YAd9StpFdEoRq/sAbe0D14XOc8BnD1w/BGPDpgPQZDNv8mDhRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dAK/vQARrQkuSrXpsO+Ixggsaq3ocrjEv3+wQU13LUigFdKEt
	OoAmo/5xLuAfrGy633gj0qHxErdOe3D6UQA/Vaz0eiShe4rGcOlslqSJfF8APBeRhQ==
X-Gm-Gg: AYBFou3BmQuLlJeWw52MaaZZ1EjhIGLQpGJhGCAlhnFyP3WY5Wpl64aJ5y1HU+3JIvM
	QxyldY2IDpQFORhAjk1+FzYQrhxnu5PEp/kC0LJycGSHQ3UF7E1LNRrRb2wYot1rEBG6Vw/XQ+a
	y5tw46V5JlVyDrjV6c2Fi5PXZ+kfzLcneOGc6qQNMjDNL/PLfgI1EnpH/6jj7xxvZhUFYkUnaj+
	9L80Gz6wVMXflAYrh6uwjRAs+k1XQxnlCzjodIZ7cJPzii/2sBiuAo7pOn89WvCBqOkwuo475mG
	LuqErqDYDyVlTtNpKDjBDfRvaJD2cO9dsfh22f7rGW2uu6gkK2WYrTfuHOrz1NiICG8aa9IZvSb
	rQZc/hhfdLYiAD9tctOhbt5RqIMRWS37MYJp/tGTIyMTJO/yGXqNzNIPfdW8LAiuEFQ5qKVnpbc
	+FMIOaNB++0HnmuNnK80DMEGI8k/pDubFUi68Up/29G8KcKCcO0Csy6Mk/IpRonbVxnfe6LK3Lf
	Z3P+/ilsO3Ib8jITyKaYK6ioMRvebpBJ41ScvjTtnO0z7/v83nLA8MUHdo+6wtSk740viNFaWXl
	VSuRGGeXCcHyWRofAB07C4qN7Vae9IVNxZffJwByeW7Eugkjolw=
X-Received: by 2002:a05:620a:2988:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-949a8bafce3mr60524085a.22.1795026152815;
        Wed, 18 Nov 2026 10:22:32 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b767dd6sm242351385a.24.2026.11.18.10.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:22:31 -0800 (PST)
Date: Wed, 18 Nov 2026 13:22:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 3/3] usb: gadget: udc: Decide on connecting in one
 place
Message-ID: <0790eebe-a009-4617-a62a-e1a6578446a1@rowland.harvard.edu>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
 <20261117-udc-connect-v3-3-9413b491d213@flipper.net>
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
In-Reply-To: <20261117-udc-connect-v3-3-9413b491d213@flipper.net>

On Tue, Nov 17, 2026 at 04:48:09PM +0400, Alexey Charkov wrote:
> The UDC core connects or disconnects the gadget on bind and unbind, on
> VBUS events, in usb_gadget_{de,}activate() and through soft_connect,
> each by its own rules. gadget->connected means both "the pullup is on"
> and "turn it on once possible", so the paths misread each other's state.
> soft_connect also starts and stops the UDC behind the gadget driver's
> back, and its "connect" overrides VBUS and deactivation.
> 
> Allow the gadget to connect only while a driver is bound, VBUS is
> present, the driver hasn't deactivated it and userspace hasn't
> disconnected it, and re-evaluate that in one helper whenever any of
> these changes. Let gadget->connected track only the pullup, as UDC
> drivers already assume, and clear it at unbind even if the pullup
> refuses to switch off, so that the next driver starts clean. That
> supersedes the clearing on UDC start from the previous patch.
> 
> Reduce soft_connect to a disconnect request that is forgotten at unbind
> like the deactivation, and leave the controller alone: the attribute is
> documented to control the pullup. Keep the request if the pullup fails
> to follow, so that the next update retries it, and warn about such
> failures, as nothing else tells the user.
> 
> Treat a UDC without a pullup control as having nothing to switch.
> Binding one has most likely failed with -EOPNOTSUPP since
> commit 0ea39e030a80 ("usb: gadget: udc: Handle gadget_connect failure
> during bind operation"), but I have no affected hardware to confirm it.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> @@ -766,26 +773,20 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
>  {
>  	int ret = 0;
>  
> -	if (!gadget->ops->pullup) {
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
>  	if (!gadget->connected)
>  		goto out;
>  
> -	if (gadget->deactivated || !gadget->udc->started) {
> -		/*
> -		 * If gadget is deactivated we only save new state.
> -		 * Gadget will stay disconnected after activation.
> -		 */
> -		gadget->connected = false;
> +	if (!gadget->ops->pullup) {
> +		ret = -EOPNOTSUPP;
>  		goto out;
>  	}
>  
>  	ret = gadget->ops->pullup(gadget, 0);
>  	if (!ret)
>  		gadget->connected = 0;
> +	else if (ret != -EOPNOTSUPP)
> +		dev_warn(&gadget->udc->dev, "failed to disable the pullup: %d\n",
> +			 ret);
>  
>  	mutex_lock(&udc_lock);
>  	if (gadget->udc->driver)
> @@ -809,6 +810,10 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
>   * Following a successful disconnect, invoke the ->disconnect() callback
>   * for the current gadget driver so that UDC drivers don't need to.

I wonder if we need to look at this.  The current code and the code in 
this patch both invoke the ->disconnect() callback following 
unsuccessful disconnects as well as successful ones.  This seems like a 
topic for another patch.

Alan Stern
