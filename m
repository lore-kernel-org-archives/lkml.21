Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942580;
	b=M7IN8JD9LqfmBJnIpo9aha74ur5gbraNgrGkAi4YaAm0HxC27JIaWSG5Ch5BsQNtzJKX
	 XE65NBh2OCCE3/WbXfdzLZrvZaZfxrbTooP9kdO+l5J4A4TTr/xwv4hvQ8Jyw90DUggld
	 ou0H99KLYX1aZmDxWBCfbQbjs/j4NMqo9F6H64lDCCQHrC36xqnq5u9UPBfFs+GRfYBFY
	 Ywz3sYXD3AphNma/UAA1m/PSQ9M5u3YzAC6B2P7IXlt+YCgCupTvmZiHlqAIhDfGF/J28
	 yNs5YteLLTcPd+7hNXxN147cPTQjHeKqlNYdtoTutkBZ5ruPDqvgyDLtRyodaDe9vxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+aYf8g41eVpT0waLNALL3a30OTIwyYVnd0XINX9JXbw=;
	b=F3RHRxPm7oLy3ogHIV1MtB76qT2ATltwsvNaFmhgXXtjjNvVvlmi06vdQ1swi2lMf8Xf
	 ZNKWVGpBI9yhLJDQ5e+UmBHIOb98L8UoQMXqVTYGbBtPi7mrvnFAa8LtVYR/+SJ0iDmRw
	 qneVKmk2QV29l5igxD2BpVKg4mN0v7cHqEktHhbQ9GhzCYiXP9eNUsP6+82mrHumu2aIX
	 DL/uLtKUG/I1sKowWIuWs5zVBuMh78sfWXsk4IY0VF3bkv7Wkvi2pcLHa039kiATnKjYs
	 Mjg6NrLAPDwy6Hk8YEXDSafn4MEHuAD9JB/o4YFGhVQy6rgKILFMDXMTs9HLVNe6r9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTrFGvh2;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA55606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA55606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTrFGvh2
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so174680a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942579; x=1795547379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aYf8g41eVpT0waLNALL3a30OTIwyYVnd0XINX9JXbw=;
        b=LTrFGvh2up8kjBogLk1ZtofYatncwr6QZ2sdT8/epET8mDeNGmKTb219caMjagOQ/R
         HqyRirJeJR1PjcUZDv0WZwz8DggWHkRljVrdRmNrb9YNTa1e9wUtlueBx/wQHStV5cXJ
         Lz6SfZzFF0XEF0bJt6sWWm+y2HO7w/sZwJr63eMgnPhFWMIl7VhhBQKxoOuy5AWrk7/V
         QS2tcp0a9MgB1Itek+FxYHoDJPV1QWg9IRPFx3X7VV0Z88EXxe7yMQYPD4vzVK+fD2GA
         VqNjnZKz9HSwvBEH84jktD7qXuUgxt0+soidstQT81bfcSVk8PCOyG/fHsAwGH3y1OKM
         /Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942579; x=1795547379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aYf8g41eVpT0waLNALL3a30OTIwyYVnd0XINX9JXbw=;
        b=w46+IZ+/cC+zITTYQsRyrpjv5xEdV6st91omMBt/uBDOcRjDb8aSrNgdhCnfs+m/Hc
         OFE3LB/7eiAg6MpD/jhFtEatgvx8pjOe9awG4s0v7XCFEh+0lmE3GNN3aBuuLQRnvATm
         IBtSliy2bTqrFNDeppkg105+177bgOr4RlPb6w/+QfhYCIbk20QxCdbjwTPjYAr3yhe0
         t1ooNWokZ8mlBAjm9248kkg1NrloJZOGO501l0Mw215yyD4vzga1GPboLyghmI0+ecBO
         KLoyEPuqG0yvng1dxcitPnu1Pr9+OpvLF68sNiCKbpPErIADxDFaY1smp9OM7jEFHz6W
         Tn7A==
X-Forwarded-Encrypted: i=1; AL+hErGP1ChnCHUEAVHWLWeoVN/2/12/88b3JmcP0M2VrTNBfYBG6qgj0aBjLqHl+IWDlt7TM7UMKkZX/Sq428I=@vger.kernel.org
X-Gm-Message-State: APuU4Z82sfgKyJ1FOydtpe4WG9CTrBUljJMun1O2KnYyFjno3lznWSEG
	TV0f91DYI+XywbF0G4+9bEpDGBm2QuklS2MRIBvighvUzwk0Lvpofpzu
X-Gm-Gg: AZFdTZc5Atv6jV54xilcZrgq8cbm6ZQ/VGx8rZPighylMl1MVKFWlS3kzjDDgfiUss3
	h7EFxzxopL6O8sZZYDUei736gI4Cx7T6FI5ur+vS1zxZt1NCewaXHmlfkoyIzCSImNGKX4nQcmu
	sqkuM2IJlX7SVkqIfd0VdwhtWnApJS6Km9jmAWNXweCO1CO4ysOHBJbgh0CSEqgB1yoof/lOLxO
	iLclaufYrs141EdbTJT4tmAPliu2XaoS0sJ9VP58fPPlgYik9YRO8sVKMa8munUPMwY+LxBc50y
	A+pUIydJHr5Mm4iN0oo055dYYwzs1bHkMHOv5/sPmy473aAjFe1bVqJ7aSiyaBTI1rXsegayUaT
	Qf4EV5P8zBF5p4mQbPV/rZf/hhQDF5HWTDreeX+t7QegS/myAZKhqYbNWsinEqOm+/pio4MqeCy
	Ob0Spw0AaTV0Uvswoch79ErI1JM6AEe0URvzndQpNiS/MiFOt3+LWhtDPU8CgDg5dQG/iB5+HdS
	SlofeDJ7E6fwA+2Ohzoo4QTnR8ZhUOqnXEptZSl8tqwuQ0Au9t3w52eO6+sFBMvRE0bB9xSheMV
	p/Xe9sERud6RCLFae/sPn682MPGQKW1IhR9Hz6wg7gop+kX89mqMX3Fb
X-Received: by 2002:a17:90a:d445:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b3d06873d0mr304059a91.2.1794942579422;
        Tue, 17 Nov 2026 11:09:39 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm5191801a91.17.2026.11.17.11.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:09:36 -0800 (PST)
Message-ID: <09116c63-4c6b-440d-914a-e75902dc36ae@gmail.com>
Date: Tue, 17 Nov 2026 11:09:33 -0800
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
Subject: Re: [PATCH net v2 04/12] net: au1000: report MDIO transaction
 timeouts
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-5-f.fainelli@gmail.com>
 <179483704272.3136.4869685253432664524@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704272.3136.4869685253432664524@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The patch adds a second timeout exit to au1000_mdio_write()
>    (drivers/net/ethernet/amd/au1000_eth.c), and both exits log the same…
> 
> --
> 
> net: au1000: report MDIO transaction timeouts
> 
> This commit makes au1000_mdio_write() return -ETIMEDOUT instead of
> reporting success when the MII controller stays busy. It also adds a
> readl_poll_timeout() check after the write so that a failed final
> transaction is reported to phylib. The read path now returns -ETIMEDOUT
> instead of -1.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 7063f9e5bc7c0..6b2e216a83618 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -292,26 +293,27 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
> 
> [ ... ]
> 
>>   	while (readl(mii_control_reg) & MAC_MII_BUSY) {
>>   		mdelay(1);
>>   		if (--timedout == 0) {
>>   			netdev_err(dev, "mdio_write busy timeout!!\n");
>> -			return;
>> +			return -ETIMEDOUT;
>>   		}
>>   	}
>>   
>> @@ -320,6 +322,13 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
>>   
>>   	writel(value, mii_data_reg);
>>   	writel(mii_control, mii_control_reg);
>> +
>> +	ret = readl_poll_timeout(mii_control_reg, mii_control,
>> +				 !(mii_control & MAC_MII_BUSY), 20, 20000);
>> +	if (ret)
>> +		netdev_err(dev, "mdio_write busy timeout!!\n");
> 
> [Severity: Low]
> This isn't a bug, but could this message use different wording from the
> one in the busy wait loop above?
> 
> Both timeout paths in au1000_mdio_write() now print "mdio_write busy
> timeout!!". The first one fires before anything is written to the
> registers. The new one fires after writel() has already started the
> transaction, so the PHY register may or may not have been changed. From
> dmesg there is no way to tell which of the two happened.
> 
> au1000_mdio_read() already uses two separate messages ("read_MII busy
> timeout!!" and "mdio_read busy timeout!!"). Something like "mdio_write
> completion timeout" here would separate the two write cases the same way.

Sure, that can be improved to be clearer.

pw-bot: cr
-- 
Florian
