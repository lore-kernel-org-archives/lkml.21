Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025004;
	b=svDsUInuAkYrQq13mup7YjaAC+lcbLbMz4vNrWsjaXYxazT/Ev8+SMVnCuBjGv8s9EbL
	 zNQBQMqhK5yaZrNOgffnZGUzD1REwKgRlZxCYZibU4hAoB+pARcXLszPXTTWMqBK2JdB8
	 GNtfMv+PC5s9wGhJF+AJye0s6cyDsff6WRVvEembv6uUdi5GGArHZQ58XfddPR/UVQZT4
	 TZvfYMqaI9d0MP3Gc6LVNrP/8Xg26eKOsNmi6O7Si2THE5ymq7RfJgGZaMLUGsGCfCjYt
	 m7e6vRSFKBDORp0Po4N9AvobP0aoa8W8NWUuKrJzZkfM5HVHdn2ncjsFJnO95FZHeMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8ddfh5AdunM9T3f/FFA8YjicpmkRq3+rIyb33jbcm2s=;
	b=O8S5zBGFpTaFdjbQPHgWZT6rJDA1G2sSdzaZQPrmUla7/fIchd4AcCFFWsKMFMJWLhcx
	 tCPujKo8nf/O3dqtPaIM0JhBd/txzumIuQRSkpQw+Dw2zoxyGDLEK2++zDEUqWWKgTvTa
	 AFWUr1IYzZ/UGkHg4FIUCm1SFmKmqA8ViaqFwCM1rG98aON2MY3naSh8Rr8Rmvf/5ePTv
	 NRjKE6G0ccXyux9K6v4HC1hgphXC9nxvz78PKOVVbLYDdPyH/vD+UniGaMG5YutSfe8tQ
	 X+2iMxEQw/VXsKK2keslllY09VlwuhXFEF6Khf/2FEy37TOvgTxB4CoKxXJYYreDpPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ovT2sGsI;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ABE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06ABE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ovT2sGsI
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-943e8d35f74so121927585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795025003; x=1795629803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ddfh5AdunM9T3f/FFA8YjicpmkRq3+rIyb33jbcm2s=;
        b=ovT2sGsIBDAgPrCx/LUVqTA2DoBZwhi1t3Ck+40HrcwHdf9Uw23m0X2L4UQ9eCuzpr
         VsRLx5L4hmk96p79gcCnh2MPtiXbJjUft+AzdOhVH+ilo393m9UlOacBl9sMilkkOCWN
         B9t0qUhd6w3NztjQgAp1ZafgeSK5JKKy7HGnoWBPOsOkEUR+iWPVJ5Bwt/zUSs8OkhrD
         s6v2G7rbF3yjJcimTmCvA48u1OJjxm2h2m3hppcD/I3k6MlsXN6AmNRS0VjzigaCh2AH
         oT1S2AHPeuLtqshQxEWylbyfaqS7D/Nd87L0VhtHu5BQLkXuEHVruRDO1aTbxu2A7XrQ
         cZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795025003; x=1795629803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ddfh5AdunM9T3f/FFA8YjicpmkRq3+rIyb33jbcm2s=;
        b=P7TsbE5Kxv3zIU5hTklsN63MSiwGvyUDPDrJVtTVb95pF/8IiZkGd1QlvFCBmZffDr
         BdBbt2WbhAZxKPbzquk03YcPY+yFzCmUf9Ta4W4anTHBVYE1wBYK9FJ8Vss0KYB7SMzZ
         lZk5P4o7IxTQau5Ud64hl2oMNzVN8KRQHrfyMOV+lERn8xdqwAoW61mvM5hyeEfxAFrs
         hnQ9pOqL6rrjJtmNcbavblF9qwUEz6E+FROJ95JEmpo5Yi5ar+Wa2ygEyJ8HdCehbHYL
         CFP6/aAXBGnwjzeEgpbHyarWCoaoM/9mPUIBCtxHKqpz/tNwtKxHfu4MCdfbvMuAA7b8
         F5zg==
X-Forwarded-Encrypted: i=1; AL+hErHgJx5w4Q1o0h1cPp9kTB/J52lSUBw050XwxaQ5hVERHu82t9xPIX7cfPUNAVFYRWfFsyyqP9R3/sBeqvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ezciYGEIu8Pf0pzfrBJRULyA5yB4mGPLHv7b9BHGG44jQhURy
	dCbGDV81mamXBnw6CnyKmAUhW2bA4n/GxUibB07saUpUbfmOzjo2S9ixlTw5bJ9nbg==
X-Gm-Gg: AYBFou2CPE9V3a8tX49S4NmF7cInbjsVplTo0KGE8IfPJp4Kgp1jpA5I/6bkfa5kFTb
	5iPAtDL8c02E1lwcXqfABv2ofi9/B7WlloQwsdGIiPg9NvCgav9uYG47/0k1miRnd01KKaIjLQI
	i852p0UA6t1Sp7WhMb8efgdib8cKh0sbcWv3BQbPBVF+cles1Hnoqu5l9v+UAeryPecAu5eTUfu
	wZ0oN+N/mXulu++2Gimxjw80XQWGWExCOwaAzRJXT/hceQJNqTqvqRkW5gwQ47OYLcg2fVpMk96
	do8Btefh1PWOs3RVvzrLahr0B54/RCX8O5udhsvV5USuiy9dUxB8qFT1VAdgRyFSpBwApMK37J5
	t3LElmvXtg2ud/CN9EqWb5gTikJw+FOIA/p7XYEp5TF4zq5RhuocztrpC18mWwRwD9KE6f36MB4
	E8Pb+1LgvshN83SJ3B9vtJ2/O5LQXJJLyen5FHI+5a1OkYgmAbiO9BdOUjEQafHXu+U5YtkeWRb
	EwxtKsBTP08A2LGrgoib31+7NOQIcVewh/p7gMGKbdoevVqxjC9IcVCXqHmAFHHnYkS0vs19rLH
	zsF5kO3uOzFUcu6Pm3W0LItu91Yk2PZWo8HtiS8A6Xli7sRNuvQo
X-Received: by 2002:a05:620a:2907:b0:949:5ee9:ab27 with SMTP id af79cd13be357-9499965e07amr577848185a.83.1795025002709;
        Wed, 18 Nov 2026 10:03:22 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b79e081sm233340685a.26.2026.11.18.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:03:22 -0800 (PST)
Date: Wed, 18 Nov 2026 13:03:20 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 2/3] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
Message-ID: <571dd0fd-90a8-426b-8e6b-8898047f3cb3@rowland.harvard.edu>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
 <20261117-udc-connect-v3-2-9413b491d213@flipper.net>
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
In-Reply-To: <20261117-udc-connect-v3-2-9413b491d213@flipper.net>

On Tue, Nov 17, 2026 at 04:48:08PM +0400, Alexey Charkov wrote:
> A gadget driver deactivates the gadget through usb_gadget_deactivate()
> until its functions are ready, so the deactivation means nothing to the
> next driver. Yet the UDC core keeps gadget->deactivated set across
> unbind. Only configfs resets it, since commit bf95c4d4630c ("usb: gadget:
> configfs: clear deactivation flag in configfs_composite_unbind()"), and
> it does so from its own unbind callback without connect_lock, which
> guards the flag everywhere else. A legacy gadget driver that unbinds
> while deactivated leaves the next driver unable to connect.
> 
> Clear the flag in the UDC core under connect_lock once the driver has
> unbound, including when the bind fails after the driver has deactivated
> the gadget, and drop the unlocked write from configfs.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/configfs.c | 1 -
>  drivers/usb/gadget/udc/core.c | 7 +++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 51df6d1d1487..c0f9e6625b64 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1849,7 +1849,6 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
>  	spin_lock_irqsave(&gi->spinlock, flags);
>  	cdev->gadget = NULL;
>  	cdev->deactivations = 0;
> -	gadget->deactivated = false;
>  	set_gadget_data(gadget, NULL);
>  	spin_unlock_irqrestore(&gi->spinlock, flags);
>  }
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 577bc15f61a1..449b303c2f81 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1705,6 +1705,11 @@ static int gadget_bind_driver(struct device *dev)
>  		dev_err(&udc->dev, "failed to start %s: %d\n",
>  			driver->function, ret);
>  
> +	/* The driver may have deactivated the gadget before failing */
> +	mutex_lock(&udc->connect_lock);
> +	gadget->deactivated = false;
> +	mutex_unlock(&udc->connect_lock);
> +
>  	mutex_lock(&udc_lock);
>  	udc->driver = NULL;
>  	driver->is_bound = false;
> @@ -1734,6 +1739,8 @@ static void gadget_unbind_driver(struct device *dev)
>  
>  	mutex_lock(&udc->connect_lock);
>  	usb_gadget_udc_stop_locked(udc);
> +	/* The next gadget driver decides on its own deactivation */
> +	gadget->deactivated = false;
>  	mutex_unlock(&udc->connect_lock);
>  
>  	mutex_lock(&udc_lock);
> 
> -- 
> 2.56.0
> 
