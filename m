Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942945;
	b=hKi1CWm+1MeG01+JyO0tV+jHgxWoOCIEZno2L9xJhxtoxdYNHWBjPyi7RuNk/IDwpYRv
	 Ajp/UOB7EM6yKUUVxmwb6lwKOmSXGVPW030qqD3SHJPmp2nMb5QNsx19Zlo2NhhQ2fphh
	 x0iFhwFCUw5vU0F55UpyhBPG7VpbfSIw+xzCDJRHwehS+PGD4ppWoFzKhFN6+8xcUKJ06
	 4RBtAAIijNi8h5kynSs6Bv7u+xEcW9B9Ckjey0Y2NVuP7TMhs8NPIgzH9avWeT4w93H0U
	 K9KqCVEt5IuialjCbU6IGHlvi2o7QpX3/TAgZC4M8ScAQQyW9TacUTr/1o+K11jM/pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+EY5FGHkUS2GKudgKtDNmc8zOL4SuNcoCljHw2tyuC0=;
	b=fVgJuf8xXkjT7qW/Di7+pJNqrfs5rT14jpwaX/sakDuPKRY3nGjFWgi1ZkqCwy/sbbwX
	 GbJ6kX/dyYChPx5dINa2qpPLTiXBKWPGpHH16/4m1r2JxAo8wL5tdj9wERUX0JcgykbyU
	 wV98+DnDq7YPTzvPx5XSy+x5cXNtY0TgPDxQ8htGzoY/tCuJdq8FClfTo3rZMqZxEVg7G
	 xWVcpVZfgfMbwzjlhL2IlLUAdDd/Ad0Da29EsuRW/Yk86zs2GIYYe5VKsyTA4n7KvDskk
	 QSEqMZC/TgZusKI3/gQWPD/QhoO9cKUwbeGdTp7yhqh4PbD4eYTOf1KyhQOCBGgvj+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so+zjMgu;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD6A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so+zjMgu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53669f7b518so1621911cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942944; x=1795547744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EY5FGHkUS2GKudgKtDNmc8zOL4SuNcoCljHw2tyuC0=;
        b=so+zjMguwhPGbUlWvGAWQPISVbrRCTszNezqQWlHIBT8Wdgxiz82POdB6izTNMzuzb
         V7aZva8UEqzxGOcwBZKD3uooNstbA0hYE46ACdjmmtbWG1mgGmNDmp7Pm5xna59j61pf
         qw5gblnNHuLG2KwaCiNLIucc5ooWsOKlO8Upb2vG3y4bzP368MwrLiccWs6aBoyEgEuy
         Y6y/2r4tspkuOj657PBMuMPOJPxv5nHuApMG0OdGNl67+Bo2v0g2kw7sPDDPYO2+c8n7
         KPMHHyvsXeTs5Vlc1uou3RkShXPtnmeLyIlR1m5zaWsQYrnsBw6gW5g82D4kvdx62vNf
         ZFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942944; x=1795547744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EY5FGHkUS2GKudgKtDNmc8zOL4SuNcoCljHw2tyuC0=;
        b=lLTzlkaS8XMoIcynhEv7xgAtnGjp89graCWwMHQbSolbOb3RrBc5Bk6uAfB62h67nd
         BRjApmz0K9XBPmjEoZCMXqMt/2Y1SGoPVnwLtmpMlFUkxxXNniYOYN0QmEsT/aJWq4Sl
         Lr6cexbUdmOPzoyXfmLXXcsIaNEDpKt56m7kMO/bKaDEQ3/XECv4mnxkxUyceifywsgi
         F4NzAXcI6LFiacXh5qH+nAJFOUg3xtIbZKbnwwKTS4pSX6PQe+W7yi0zGU3FTRWFxy0s
         jukwEluMs9sCjS0Qi+aTAgxR6UcIj44XeHTl4TvRhirFow9m6awbg6oAUJVoDooRC6xz
         819g==
X-Forwarded-Encrypted: i=1; AL+hErFbh4SU4kIJOZHuAo5e0c5cCaLvK+IJozWOtHNXWc6cp/QjB0q0St+0Rsr6Gtnah3VQQsH1g6waP9BPzJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TeJxlK6yaeJWinOreRBmHv6TVQd3qR0AONn6fKttPXUA0u42M
	EuP7ewkY9n9bMA4Vt43rUeoo+j7ZgWOU9o5Tb1dBEc4wnSzfG8ICWrju
X-Gm-Gg: AYBFou1km6uiyTYYQG0TTaEj2h5zr3eAwn1G4CX6iWFwpMZaa2gZXbzAYu54u4tY8nr
	S6vuydP9FCnHfndtSY6tuSX30HN5ZDmwAuR4/ev+qsIr9AjXuvDAogS+t3VaYKLEpN/33U2Zb1m
	9O/FXzTWWAfjyLdgxNupUuv7w/FWxisezG6piNbA+f2ycg5M8eIwWjrjhXwo+fBJWrXAoFsSO5O
	/7vCPHYx9DlQCBV48U+nqf4C3aHzqi4T72DiHF28h6AFHAGQNV86wqr72wClmnt6oAsZU2DFFL1
	UvFNjWmif8YhfgrfIaUiMzSDMdzy6ldfYxJFM8Oo7kDmWxH7yko3+5BNsnf4zUsrYi1tGUvzF4E
	TqhSZr8hDWCFzyj50TSXGWXTTUSSdch2VfowaxE/Lnpb02MITEcEGZhsOv8T2MFSEP9CFPlokC9
	QNrjk0u93fNl4EVV2nYdU/KB6C5B9hoWU6921VkiKnjw+5nUM4fMrugmZq66+/x72c3A900zkpx
	o52FuQwetVb5a2EHpsGen8ietHy5YJ578v1Yvr5GNZW8ARnrFqEPHQ0HUc0919HklZiBrNfbquc
	DHwbxP/NYbjmznFjBMc1tQAy/qIWjYpZvJIekeFWPXgbdODigqWbMq5L
X-Received: by 2002:a05:622a:1e0c:b0:535:9686:b9e9 with SMTP id d75a77b69052e-55d5a2d5840mr4863451cf.11.1794942943667;
        Tue, 17 Nov 2026 11:15:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58fea22dsm4007601cf.9.2026.11.17.11.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:15:40 -0800 (PST)
Message-ID: <d74816f4-d624-4cb4-8740-c5f8729d903c@gmail.com>
Date: Tue, 17 Nov 2026 11:15:36 -0800
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
Subject: Re: [PATCH net v2 10/12] net: phy: smsc: wait for LAN83C183
 power-down recovery
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-11-f.fainelli@gmail.com>
 <179483704808.3136.15887744025770615688@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704808.3136.15887744025770615688@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In this commit, the new 500 ms wait in lan83c183_resume()
>    (drivers/net/phy/smsc.c) runs only after the Au1000 MAC has already…
> 
> Pre-existing issues:
> - [Low] After this patch, the SMSC_PHY Kconfig help text
>    (drivers/net/phy/Kconfig:424) reads "Currently supports the LAN83C183,…
> 
> --
> 
> net: phy: smsc: wait for LAN83C183 power-down recovery
> 
> This patch adds a LAN83C183 entry to the SMSC PHY driver. Its resume
> callback clears BMCR_PDOWN and sleeps for 500 ms, but only if the bit
> was actually set. The aim is to let the MII clocks recover before the
> Au1000 MAC starts when the MTX-1 interface is reopened.
> 
> Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
> 
>> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
>> index 30e9d22c8d1a3..10466b2574eb4 100644
>> --- a/drivers/net/phy/Kconfig
>> +++ b/drivers/net/phy/Kconfig
>> @@ -421,7 +421,7 @@ config SMSC_PHY
>>   	tristate "SMSC PHYs"
>>   	select CRC16
>>   	help
>> -	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
>> +	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs
> 
> [Severity: Low]
> This isn't a bug introduced by this patch, but the help text still
> names only some of the PHYs that smsc_tbl[] in drivers/net/phy/smsc.c
> binds. It leaves out the LAN911x internal PHY, the LAN8710/LAN8720,
> the LAN8740 and the LAN8741/LAN8742.
> 
> Could the list be completed while this line is being changed anyway?
> 
>> diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
>> index 48487149c2252..c3b51afd4b1e5 100644
>> --- a/drivers/net/phy/smsc.c
>> +++ b/drivers/net/phy/smsc.c
> 
> [ ... ]
> 
>> @@ -684,8 +685,32 @@ int smsc_phy_probe(struct phy_device *phydev)
>>   }
>>   EXPORT_SYMBOL_GPL(smsc_phy_probe);
>>   
>> +static int lan83c183_resume(struct phy_device *phydev)
>> +{
>> +	int ret;
>> +
>> +	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* The PHY needs up to 500 ms to restore operation after power-down. */
>> +	if (ret)
>> +		msleep(500);
> 
> [Severity: Medium]
> The commit message says:
> 
>    Starting the Au1000 MAC before the MII clocks recover can hang the
>    MTX-1 when reopening its interface.
> 
> Does this patch alone prevent that ordering? au1000_open() starts the
> MAC before it calls phy_start():
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_open() {
>      ...
> 	retval = au1000_init(dev);
>      ...
> 	if (dev->phydev)
> 		phy_start(dev->phydev);
> 
> 	netif_start_queue(dev);
>      ...
> }
> 
> and au1000_init() already sets the RX/TX enable bits:
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_init() {
>      ...
> 	control = MAC_RX_ENABLE | MAC_TX_ENABLE;
>      ...
> 	writel(control, &aup->mac->control);
>      ...
> }
> 
> Suppose a close has run au1000_close()->phy_stop()->phy_suspend()->
> genphy_suspend(), which sets BMCR_PDOWN. The reopen then appears to go
> like this:
> 
> au1000_open()
>    au1000_init()          <- MAC RX/TX enabled, PHY still powered down
>    phy_start()
>      __phy_resume()
>        lan83c183_resume()
>          clear BMCR_PDOWN
>          msleep(500)
> 
> If so, the 500 ms wait only delays the PHY state machine and
> netif_start_queue(). The MAC has already started by then.
> 
> The close path has the same ordering in reverse. au1000_close() calls
> phy_stop() before au1000_reset_mac_unlocked(), so the PHY powers down
> while the MAC is still running.
> 
> The next patch in the series, "net: au1000: keep the MAC stopped until
> the PHY link is ready", seems to fix this. It calls phy_resume() before
> au1000_init() and enables RX/TX only after au1000_adjust_link() has
> seen link up. It also calls au1000_hard_stop() on link down. In the
> PHY_HALTED path, phy_link_down() runs before phy_suspend(), so the MAC
> stops before the PHY powers down.
> 
> Can the MTX-1 reopen hang still happen when bisecting to this commit
> alone? If so, could the commit message mention that it depends on the
> au1000 change, or could the two patches be reordered?

Agreed. The PHY patch alone does not fix the Au1000 startup/shutdown 
ordering, so the reopen hang remains at that intermediate commit. I have 
clarified that dependency in the commit message. The PHY patch stays 
first so its recovery delay is available when the following MAC 
sequencing fix is applied.

I will leave the pre-existing Kconfig help-text cleanup for a separate 
change.

pw-bot: cr
-- 
Florian
