Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415688;
	b=vqa0WOXefsHR32cWogEtHY/T0UaE5HBFWA5EbKtnMLk+38hsHAJWvQSxa6DhSwaJhAnh
	 /v4WyyV27kNrPoVqMFw5R4F+lwzGySHoBLowW3N8GOvHuCCDgcoUupgDyYK0LOVOIDKUz
	 kxoiL2WYpOY/AaPtV/59KcTCj1J+rbooM0hyhIoEHflwGDuKy0kzYTsap2gxFKA+cgZU+
	 VEl/UWxxhRhWUqDjo1FTxSI62ucn/dapb8XdcePY2Ko+6gF4QiYN4zDcG/7nHymzfHbAn
	 Dvqt1lSzYnJbQd0zR0h3m9LEDwzTSF5fobgpcrApX9uYdjiKMbp0qJKYbsjbTt4AITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3HpDDKl52SUVYCO2/8G27hNCaySa90diGhXb5D2z9z4=;
	b=wpuTtmpcZbTyh/cWhyUyE0DAq9+A6Owp0ZwLbFxBPBxVjYorCoPVdracdbOg1I7ecI92
	 vees4llxmv/xSr0v/JJ0PU7Z5J72FrAQ0bRp/1UmxCDs/cBRD6mEO8KTxT/n6eNwAJ3H8
	 ZNH9GGgxV+P6LASiZQMPBGVHJ/9ehbLb+kSl36hOOT/RYQgqpDNZPVPKN3AFpA53D7qbM
	 UFkuBOiwF4UHDF3VvYQF10YJR2DdLW52fCrazsnjeV+jtwH1FR2uhW5KN0ZO+bLD62cPA
	 5FB9H2koIIHSxBhEEi3ifxfjxwU8BFcZwzEbb8UfjCEGkQc7AZrX8NVbLkaajQ7rwtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aza7N45n;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8B6606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aza7N45n
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso1625358a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415688; x=1796020488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HpDDKl52SUVYCO2/8G27hNCaySa90diGhXb5D2z9z4=;
        b=aza7N45n9CiQzz9m8tpVIjYSs07UAJCpRB2fvl7Ngct0kR62UBlSz/NQnlmttnKbqI
         dPYq0Yc9BRhVQtwGuYi3ZY5WVlvAjMT+HnpeJ1bzwi880yJhnI9oeGTXZEfp3GxmgCWQ
         NDvZ+lMggBb/LZ/PlUBDeGJLt7DXirmr5dD1hWsbitsZGikT/vEzW6SxtNA/i8cTSFwh
         r3esnBe4GH1WXvvQfr8aJH7rmuAop0O3gn5454cxD+r5wqS72A2TZlKi4RMGBsxnZCNT
         RHOGIp5O0+oG4P01NTczYvi4wAjkULHK8p9BnWQv2bDgc1M5PxSlDXu1mjnyc59k664G
         KiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415688; x=1796020488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HpDDKl52SUVYCO2/8G27hNCaySa90diGhXb5D2z9z4=;
        b=ZM/Gt5ldmHUPw+C/WtZ0tSujJaGpLGhRjkDwiGvzq/ueDBvUgFLKB+euwCCE6KdE3z
         RiBPwvbMBsTOZMhm4fb5OtJOXLzusOzFM18TW3bBTJym5cgHBsLT4jy8QWhUCK9S8tYa
         cgOhqNtPvpS7hz6Dr0otuAkZrjjUeLU3e8+LjuRUootppWkZOcvNWZhmbJFik821uX6L
         zblYbCGM/mQSxmJJdgZ2/pq4JDdShgY1OVD3i7imP8q2whZ2tMRBl27+SU/aI5aHRxh5
         msJQBl+MG3I75kQK5Bf+D16EkDTymipjFN2ynmj28E1wMdpJuo+ylKCRnSlRrnhsOQng
         FuYQ==
X-Forwarded-Encrypted: i=1; AL+hErG9iEz3dkqntAkz22GLOaInOKHMar6PlQwyEqJTacWHuOpyNfDMy7CERSy4bJASWBkQsNUp7Qg/tn/HxYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wigJYEfZAPohDpzmu0/bU8sGlhHO9KnmR4i5i4K2y7DsDjZny
	GgZ47sbRNbVjfxX2RDnCjAXSUFfVYl+QYYfnei1Qb0HB3fY4e4NgmD+SfDJiiw==
X-Gm-Gg: AZFdTZe3LaMlEVpO7Cc+6qwJcjkUHaR2cML+73LfCVCG70PKXDcLMz5cp/ZWoN554Go
	d064YYYoAOv0Zmkek8Mv374WIRZ8LSsqZ5KubmKKpfE10LyVd6iCBaVIkT9DTmSIjg+OL2ESeqI
	b6Gp/mxZ2tj83/OvOujvJ44Btyr8zFsd7wOySsq+WnjUHQoLvn2WM3AWYdeP0RGJtjgeK/AvlSk
	cyYX6Jo6FZ4lI80/Ar2Xw5Z/iBjYmbsDe80yIt/YKPrlGkO8+514NCnCQfPFGCnkLT2F+ptfyP+
	oVazAf/PuL9b7OdKPq5yo/qp9Ytgsdfo2NtJhxO3L1yiOFqthusNgoQgZXMOn4OHCteIi7EPpYP
	hm7e5WbvtftAlfnAD/Zs/Nwhy0yUhCuzFymSIum+Z/IH05urwuL+b3zfJaSGw0Fmgrk7Zk2h6Vh
	LVkLnQg9qmieYBD+w8MPBVzjvBGDRZlhVPrbQneXsb2RdOaEF69tATdSNQExD5A7/ZRjfB689or
	EYy1bnrDndQGy/ZxkBTAJ/s+aS7ectTreFKletgUJLlVCFBHi2N/TkUmKQ2m/XXioctsTS/hXLj
	uV4NwRqzkhHEJageDWrfNzx445A96TnH8v9Mvv5JRHKxbHnMWpLqX+vxhyAXCeggxs+1Cd4=
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr9391990a91.57.1795415687786;
        Sun, 22 Nov 2026 22:34:47 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm18943151a91.4.2026.11.22.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:34:47 -0800 (PST)
Date: Sun, 22 Nov 2026 22:34:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: mpr121 - propagate suspend and resume write errors
Message-ID: <awPeWz0BrERX1YOA@google.com>
References: <20261112071728.154571-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261112071728.154571-1-zhujun2@cmss.chinamobile.com>

Hi Zhu,

On Thu, Nov 12, 2026 at 03:17:27PM +0800, Zhu Jun wrote:
> The power management callbacks ignore failures when disabling and
> re-enabling the touch electrodes. A failed resume write can leave
> the keyboard disabled while the PM core is told that resume succeeded.
> 
> Return the SMBus write result from both callbacks.

How does it improve system behavior in practical terms?

> 
> Fixes: 36682b81de32 ("Input: add driver FSL MPR121 capacitive touch sensor")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/input/keyboard/mpr121_touchkey.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
> index 06329cf5c749..973fbc5521a8 100644
> --- a/drivers/input/keyboard/mpr121_touchkey.c
> +++ b/drivers/input/keyboard/mpr121_touchkey.c
> @@ -302,9 +302,7 @@ static int mpr_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  
> -	i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR, 0x00);
> -
> -	return 0;
> +	return i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR, 0x00);
>  }
>  
>  static int mpr_resume(struct device *dev)
> @@ -312,10 +310,8 @@ static int mpr_resume(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct mpr121_touchkey *mpr121 = i2c_get_clientdata(client);
>  
> -	i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR,
> +	return i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR,
>  				  mpr121->keycount);
> -
> -	return 0;
>  }
>  
>  static DEFINE_SIMPLE_DEV_PM_OPS(mpr121_touchkey_pm_ops, mpr_suspend, mpr_resume);

Thanks.

-- 
Dmitry
