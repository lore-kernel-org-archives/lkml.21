Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247610;
	b=E22MUVYMbYuEETW4CfL1yKnm/n90343i+uRBmGxAJi6gQWOKH9SYvFysrnqZqfNZ/5DH
	 jn6g4YvlPhXNAyYqoAnBMO45K1Y0TQWHboMB5880qGmduyDz8gGs/CvarXta2zQOqlX+n
	 AaFQ3HtjhfAFxKU/lCexHivnNMApJt35rg64+VQH+itdpDocZaTcCn8toxZD8qs8Whk78
	 qU1sLxf9BhqNv4/w6/fJXz+ynriMduug1XoqGVUA7MxtEc5c7+n39uzv0rEHRdpb2xiW/
	 w+oAMZ+NYYknc6SHNO/GooSYkJ1HeRqJAxP7gFPFjwCXSYURzvqPqmWt0Y9iEt1rfSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OFCgfXZyqNz90HWdYpeyXbVhNfixwYHLdj2jezmIKJE=;
	b=VLcSUq9Y3Kl7TUlK/dgL83xKGrVZjMyGch/XDL4F4cKhc47s60K+fgEhWpK3eMY3YVxk
	 kfAM9KJl9OdI8Ls6SunecGwtuuYd6E1hRW96wjf5W88oC7zyfNf7dbAO0ipAAHfO9CoNg
	 HpnBcYkn2nO+qr42eUAbUqdkeYxGTwDQ2WS+65uYMiih+iM6B5ntEwQ94IWonFo8teqH+
	 9ywj2KM+fLvNOtCX+vgpybkjiiutX1byndVjvohmrhpp1PmAblgGbmdpJhNaeSqPW16GU
	 5TScAx6G5I8WLX1MTTiqtEpov9Vd4cm/6EDPmjEntLihZxjSwPBbaupCAYKcrvkKi0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsjrLeJh;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C0606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7C0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsjrLeJh
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so801032a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795247610; x=1795852410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFCgfXZyqNz90HWdYpeyXbVhNfixwYHLdj2jezmIKJE=;
        b=ZsjrLeJhExZmq+zhRqrSR8+6MNEcnHuDRH6Ybj/2v+ODRA4bwXNFgNZ/m7quFkQvCa
         i6PFUV7KuCUYljPvm2NmE2URutm49zPCkh0DNhAEm4vI86J3h6zGPscN0KhuDQBNVRcj
         FhMXhW144241qz+UOG4qO7LU94hPNVtu6gYts+nVywrOiW2drXqPeYFQceitFnzvGQt3
         0tM6Ft0P2qQpIzhh62cYblRAS4g4KZ9F9WwpkwVf9jZO19FGWVFQ3paacLWh6WOYTy3d
         poJYAB99LJnASeX5ZmOyeHpe5qtzvsuw8HUnPNdQjIfALVbGApPRd1iULLXkoJHx+54C
         UA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795247610; x=1795852410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFCgfXZyqNz90HWdYpeyXbVhNfixwYHLdj2jezmIKJE=;
        b=JC9tUxoyWLjLktCSzt+J5oth23qpp+l4CzR0bZ2fviimlSMxC0pmnbdtvHG2ba8Nvc
         GvxrraME2GZLEpjKqfzI3VQRx9dDHKBohjpdARGvQf7Wn6uMAVccuvKsXAKE9ILdZnBn
         3THp1BLyyRy1wqJ6tc49rZ3QxY641wyAk47GR7JP1arBCjmtLvEu3AbfVDBkBREaRMzM
         zAvHX9m3ZfQGsvB+DYwxQyouRs4new+W2WEUBNrFFIJv5mWcTAJf6jGqeIc7DLZP+7Bp
         FDlvkzPi+m7SCCV9R2G5n7N0fYP/1XV5POv4OVkoieB3+tJTuxgGFVbyQyATft4ftO6N
         g3FQ==
X-Forwarded-Encrypted: i=1; AL+hErG+SwHEsVosu2hT9WUFcxmtGCdD7/eVoM0q1hn5AdX5J12rWCWFE+heSyssAM4Q/NfLDWMTO32NSzLr4M0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qz7L/mHs5tOEOFEni8RtS8q01+twMhd21xAkvmvpLDQEsvZJQ
	cFNaaDWeRuGAUWe2swdZy5dGxyW4vzJ7Wd1D70KFBsSlYzVT21koY2Kq
X-Gm-Gg: AZFdTZelpDixcFJ6uedBqrvT3x9ypqK0S10FhNisWNmuuYoz3Q5sfKbR36s+8bUcja5
	qy7iEI2Wz8cKhCe2QsCp37aAX3eeQSGEAn3jIQtWB+kmCJzy9Ck8TOgtJOnpE7NUUaOaPIwvCFJ
	PXHQptt9bjWuJ9eLBlZJirrYHjzTDywRSfoZoMQPmdgt7S/HEYopwtIZ0zr9aqZCxgzAfYHbjmo
	7Uqi47DlMmR6Y90KJawOzQT8SEZyc5gegNXGYJ8UrR8wuXt5fqfx1rjg4iDyETwQqeiogBaOw9g
	vnKIKGNgzkh4ypyeyisDpTw5aCMssXPDnO5LijcaH0AugyzEqdNXZYJzlYzCUXHw0/uWKU/5e5m
	QNQNL3n8Y5HLVESIh12utGznqkLbiEBpAkIhyUqzzlh/gITzvkPqJQi8S/I/c0qMuLNhAFb8zH7
	QEeWKha+xzG9aXHVshImV+F+BH3AtjOnwlNN1Nb8Mi7KA73Es17QBl9gap6bll+Eq5OixGP0gH1
	HH4R48xK9j2k8tifGc9KxIoG2nRWu1FAq2dZrYyTLqEgnIe9M/Gr89F6hl2t4ENyM0hfHgnRcfZ
	SSm/X4hDBrotbrj1XnNZbD/OT00=
X-Received: by 2002:a17:90b:3ec8:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b41cafdb7dmr4480174a91.47.1795247609783;
        Fri, 20 Nov 2026 23:53:29 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm10382959a91.7.2026.11.20.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:53:28 -0800 (PST)
Date: Sat, 21 Nov 2026 15:52:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Vladimir Oltean <olteanv@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rhys Tumelty <rhys@tumelty.co.uk>, Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <awFL17YyVU7yRKZz@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
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
In-Reply-To: <20260929085235.469515-4-inochiama@gmail.com>

On Tue, Sep 29, 2026 at 04:52:33PM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/phy/phy-core.c  | 253 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h |  55 +++++++++
>  2 files changed, 308 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 8fbaea003b90..5b76c006575b 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -1004,6 +1004,259 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);

[...]

> +/**
> + * phy_bulk_init() - initialize multiple PHYs
> + * @num_phys: number of entries in the phys array
> + * @phys: array of struct phy_bulk_data to initialize
> + *
> + * Initializes the PHYs in array order. If an initialization fails, all PHYs
> + * initialized by this call are exited in reverse order.
> + *
> + * Return: %0 if successful, a negative error code otherwise
> + */
> +int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < num_phys; i++) {
> +		ret = phy_init(phys[i].phy);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (i--)
> +		phy_exit(phys[i].phy);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_bulk_init);
> +
> +/**
> + * phy_bulk_exit() - exit multiple PHYs
> + * @num_phys: number of entries in the phys array
> + * @phys: array of struct phy_bulk_data to exit
> + *
> + * Exits the PHYs in reverse array order. All PHYs are processed even if an
> + * error occurs.
> + *
> + * Return: %0 if successful, the first negative error code otherwise
> + */
> +int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys)
> +{
> +	int ret = 0;
> +	int err;
> +
> +	while (num_phys--) {
> +		err = phy_exit(phys[num_phys].phy);
> +		if (err && !ret)
> +			ret = err;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_bulk_exit);
> +


Hi Vinod, Vladimir and Manivannan,

Before sending the next patch (I guess I can update it in the next
week), I have a question for the error handle.

As the phy_exit()/phy_power_off()/phy_power_on() can return an
error code, should the corresponding bulk api need to call the
corresponding  phy_init()/phy_power_on()/phy_power_off() when
there is an error occurs. Or just leave the state as it is.
I saw the reset subsystem does this rollback.

Regards,
Inochi
