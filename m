Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943103;
	b=wWgdKYvG+kxlnjKoVQssPhrtMVsJBnFYArRh4+6S6PGSh1BuQpl17cyhtv9kCbCZLObH
	 BDOlONaloV1TraxgSYMOEmgA2xprIUqCYWRY7O2uiX0xdJnBRIctFft12+APog/Sq+jEF
	 2S+WdmEbn0rLsbPskBkWRKG7c8V7UcVCpNbbAC/pConlaSZGwVHmLKENHl1L9XiDnzzO/
	 56ROtmOarvLU3+Xr/J+sCjtVl5ABmQQBJGBAla5PRUyZcHGN3nxRyfdRx6XAUszMI+fbJ
	 tLcuFH/DZFasQnazcC9f03EmSsuyBu7ObHxQpRXtcM3d1X7C1L4W0Cpj6NojdIIxh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Edwp1EcAjO2ABx/cNirsINggYhI4Q4uIjqMsRIaK2c=;
	b=ZG/HoBF2RbVLHBlEfwqzZV/QFy0OtCJKPqje2xguBgPgTSfWQc+hR3B+n5XpPhGYb4/I
	 PjgOQuArhRRWy6pownpkKtUQNxoLyLV3fpC2qVS9XgYrsG4Mshmq1bpMzDVdQ43IRb5d5
	 maUMApjcqkYYJ8pJ0fVMFCky+8hHxpHdZecpE9Sq/Ik/CaUv/eTlxeDX/JTijjp1SMVht
	 1Tw7QKUg+U33qtvi85UP1lr6mM1vGb1zEUsIG62ck+qGSczIpcfG7hBvovQdFFNVAaGTu
	 r6CtgCSiYGEjVfg0OXPfvEoiiUmWFFyssjXrRqSlJDN8QqKPF27rvWPRaJAGGS5yy3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0R2MqpIx;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DF6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0R2MqpIx
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91f11161831so257526d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943102; x=1795547902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Edwp1EcAjO2ABx/cNirsINggYhI4Q4uIjqMsRIaK2c=;
        b=0R2MqpIxgKWqnVxLLFLn7f6a2ORR8Dlv9evj2spHbYLhN3X7ypfC7lit78GwvNKuKV
         Z7JZXNqmgi47OuXI4o7OQyKFepcm17OwfCiHpagjtQqlvHXZLN2+qpsklhAP40svnczE
         Wj4a50d5bPswncfHYVt2Qv/FHhoWt6aZCt+a7PRKA2nOiPlT1kjfnuBJhzuHKQ1GEB4Y
         YtcgYMEgM2wGHw+lYgajxFRNNgoZrsbhB9pXLZbybKdR6l4/p2Kb8o4UWo6CCBdMqUjV
         iIok+k+oUjzZyN7AhxqphHIdt/Lxlv+SqvXRCb3XCNSkkejRyQoqkByLu8O8xczC57IY
         G9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943102; x=1795547902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Edwp1EcAjO2ABx/cNirsINggYhI4Q4uIjqMsRIaK2c=;
        b=1Ai2W9xf3RMlwa4Lx7OAhnbf7u4vEM/FCKFsP99MhgOQ8uYHitObbOTpjrKBWhraQa
         6xJOhzSnSavNM/o4Ny1kMd7V3zQTg8hx1CHUYlOHKrhckIlhGSS8OZVczdXq0XFryD7D
         7QKocYnkuwnItp4K/JM9AIgVSQpjaoHU1ieLmEieejg8Rk04TZlQkBl81iPk2A6BHM5q
         v2kSb256FYXb6o6hAJxydreSxb08o3DBFFymSaQCYUWzJFwBrNYROVzIh0Ypi+zA+z66
         xQZCWyYhF6uorDSYNiBuNiSxOTrQiIrYqGMLzavBAUsEza8JPEbYNTjB2Rblf7raS/nW
         MBYw==
X-Forwarded-Encrypted: i=1; AL+hErEHPJXwpRN9Et5f3P2pm3vcVMPXvn66+wUX3kr34dYXEhnqjy6ln+Gq1XaFO8+Vp7b16R32ZJG/8b9ynk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uPdU1donNQWPoWxbX1f0IXcxBLjgSBMT5+zp4sFPpE3kCGdAA
	ujazW94LDlW6O0dnGIR2uVHr0b9of+47RpIbUm4XuMowXrUHOpu2NzI/CEx6mA==
X-Gm-Gg: AZFdTZfhgVgHSpM1MvwYXHXwkU5z8b1504jtmL79IMragB2gHRLXBFHXBSWUqeR8p4N
	X/gpFajztk6Rvb0Vam1hWt+7Mh6QGxnqiJQCXPuExH0BrrO+QcJEUxL3oAno22uCod84FuaBE7B
	EFEs35LtUpC1vf6UoAiog64dsbPtzMGzTRrZ+hkMHhKYMPIq3QMTYDpKb0jKeI2ahAEdnKirxQ5
	HaUm/adHMJPtgLLiDI4+Iy8/WxH7+j9Q4RoKzPsBDlK9LicBu1ic3mPZDowfujbGb/btxfDhTD7
	Snk2bPm+kDPolFCNidvJrdPmvUZjhqHz6mZdCTc6K4M+pfVwx0J0WW/PkZLb1BWNdjg+Rk+6Q4z
	ZBAmjbcNozpPfkUZ8Y+vEwvpafYQhb64v6/biJ4vfrudQfSJNLvLOqdGVTS8Km7EYg2AuE6+y4T
	X1/Pz6Me9OOGsGRnrswcS6UTMBbBbPQ/d3cidO826FB/fwEB5h1c81uPrZmkOHoFJCHaPhOpvOS
	aqvb+QC34KtiPGrpphPvQ5mK2oYRLNWI8330nMjbm+4lU5oreo6u3fV5rCbJBpzUeM42SFF5bzh
	D1ck+0D8F/1riWmSSP6M4Iz8jJRfK54/TnrsqTTMxNBIt1seyFBEeWHKDQ==
X-Received: by 2002:a05:6214:1bc8:b0:91b:9536:21af with SMTP id 6a1803df08f44-92114eabcfcmr2276646d6.46.1794943101894;
        Tue, 17 Nov 2026 11:18:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d537bcsm1263596d6.24.2026.11.17.11.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:18:17 -0800 (PST)
Message-ID: <ddf29c30-de9f-486e-b6f1-42f06200eb55@gmail.com>
Date: Tue, 17 Nov 2026 11:18:13 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 11/12] net: au1000: keep the MAC stopped until the
 PHY link is ready
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-12-f.fainelli@gmail.com>
 <179483704995.3136.5707920157509018990@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704995.3136.5707920157509018990@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message and comments in this patch don't match the
>    code.
> 
> --
> 
> net: au1000: keep the MAC stopped until the PHY link is ready
> 
> This patch stops the MAC when the PHY reports link-down. On open, it now
> calls phy_resume() before au1000_init(). It also keeps MAC RX/TX disabled
> in au1000_init() until au1000_adjust_link() has seen a link-up.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 8b7a88ceb3c5e..d60430a3795ed 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -691,8 +692,8 @@ static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
>>    * When the device powers up, the clocks are disabled and the
>>    * mac is in reset state.  When the interface is closed, we
>>    * do the same -- reset the device and disable the clocks to
>> - * conserve power. Thus, whenever au1000_init() is called,
>> - * the device should already be in reset state.
>> + * conserve power. The device must be stopped before au1000_init() is
>> + * called, but may be out of reset for MDIO accesses while resuming the PHY.
>>    */
>>   static int au1000_init(struct net_device *dev)
>>   {
> 
> [ ... ]
> 
>> @@ -928,11 +934,25 @@ static int au1000_open(struct net_device *dev)
>>   		return retval;
>>   	}
>>   
> 
> [ ... ]
> 
>> +	/* Restore the MII clocks without starting the PHY state machine. */
>> +	if (dev->phydev) {
>> +		retval = phy_resume(dev->phydev);
>> +		if (retval)
>> +			goto err_reset;
>> +	}
>> +
>>   	retval = au1000_init(dev);
>>   	if (retval) {
>>   		netdev_err(dev, "error in au1000_init\n");
>> -		free_irq(dev->irq, dev);
>> -		return retval;
>> +		if (dev->phydev)
>> +			phy_suspend(dev->phydev);
>> +		goto err_reset;
>>   	}
> 
> [Severity: Low]
> 
> Can this error branch in au1000_open() ever run? au1000_init() has only
> one return statement:
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_init() {
> 	...
> 	spin_unlock_irqrestore(&aup->lock, flags);
> 	netif_addr_unlock_bh(dev);
> 	return 0;
> }
> 
> au1000_enable_mac() returns void, so nothing in au1000_init() can fail.
> That makes the new phy_suspend() rollback look like dead code, even
> though the commit message describes it as:
> 
>      if initialization fails, suspend the PHY again before cleanup.
> 
> The commit message also says:
> 
>      Initialize the MAC before phy_start() so the PHY worker cannot access
>      MDIO or enable traffic during setup.
> 
> Didn't au1000_open() already call au1000_init() before phy_start() before
> this patch? The diff shows that order as unchanged context.
> 
> The actual changes seem to be the new phy_resume() call before
> au1000_init(), and making RX/TX depend on aup->old_link. Could the commit
> message describe those changes instead?
> 
> Separately, the au1000_init() header comment now says the device "may be
> out of reset for MDIO accesses while resuming the PHY". The comment in
> au1000_probe() was not changed and still says:
> 
> 	/*
> 	 * The boot code uses the ethernet controller, so reset it to start
> 	 * fresh.  au1000_init() expects that the device is in reset state.
> 	 */
> 
> Should these two comments be reconciled? They now give conflicting
> preconditions for au1000_init(). Neither is strictly accurate, because
> au1000_init() always forces a reset itself through
> au1000_enable_mac(dev, 1).

Agreed on all three points. In the respin I have:

• Removed the unreachable initialization-error branch, including the new 
phy_suspend() rollback, since au1000_init() always returns zero.

• Updated the commit message to describe the new synchronous 
phy_resume() before MAC initialization, while preserving the existing 
initialization-before-phy_start() ordering.

• Reconciled the comments to explain that au1000_init() forces a reset 
itself and that preceding MDIO accesses may already have enabled the MAC.

pw-bot: cr
-- 
Florian
