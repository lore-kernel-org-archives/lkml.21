Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220761;
	b=0epbZbvEX37E1W3gDTA+6drE2KriHPF6ukFFpYxXXG2K66dmtggiNSAPcIRAYr2DTPF3
	 nAeXywyGGbESROaSfL/FNRNgZLIuiBI23oLxjbzL32G9IzKjLSFfGE0T3SdTyiEHRaqm1
	 rP3LHJS7Y9nvqtNXr5fyPKJK6vDHIPWyo529srHi7zUp0olRpAr6MZ75mswigcapogmVu
	 CZJqFskgzhpxc1X1W6Y8qkqH/nQFxO+XpiDpHit8CIgyqqTfaL0NCby3v5Pcetgb/8xuh
	 LKRYHjGUF+1Nfb1wNRRGtxvUO0UhdNxFDH2TuVsqRyltu6CTygJslCopD4ZOyJypogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b3NA8cLXZ81GRjj6C0GAUFj5xSIOEOnajxbqhcfZPOU=;
	b=i2NHeEBRKLR83mk08K70kwPTEqRixc0sdrB6O/+n2g1YcIbZXoFMh1VKu9RdXoDGzn/9
	 IGra0WFcssA3+5JZWWlovSVeqP4JAvXJaXkVTd1ecV34m+rDcdWRhZ0MeV1uU38dP8YlI
	 obhMmhvtCYeU/HrMGWS8FGhY4lk636EWUG4NM5AIJq0uzA7nC6wD/kA/m9dhd4iLwYw7l
	 nslgcy4Xkbe+9EHAwVmrF5kOdOLe/BsjLHAcOrYxNlkXlGpml/R9aOHhOIyT4ZgbuYBsh
	 B3PIcziDzyAOV/jkZaWriPsAsjnKp7wzxJ2WPq99I8npCT3POuOWhsQ0CFiEGRp3umw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HX+MHYFs;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E14606A6A6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E14606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HX+MHYFs
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-943e8d35f74so146878085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220757; x=1795825557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3NA8cLXZ81GRjj6C0GAUFj5xSIOEOnajxbqhcfZPOU=;
        b=HX+MHYFslrbdu5+COFc3VEa7BONOGoF7WofVMPVgeWkftDHObl/dhwHGIWQnv/K6/p
         FMUY5CtU0LTHrQoZdUbN8SEMfUZsQ735mItlNr5gdWIX73xEc//6W+FLDI7rwY5fEggO
         mbKoowY7E+20hq5A4wowe78vqdN/KEOkJtIKuBq5XbECHTVgL5p9mq+iz5l5JILoq7X+
         kR9OiPr+ZdAP7r0KHrcd9Uver0cLSwunH9A0bVYBBx2SoYVy4HyEMVi6uaiQGGVsjZFY
         rXhMQZBsWEA8pH1UbZCFz45NZWGUmlE48sVVyqEWvWs/GbpqqUxd/MegOF8HSQDRUJZA
         kKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220757; x=1795825557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3NA8cLXZ81GRjj6C0GAUFj5xSIOEOnajxbqhcfZPOU=;
        b=2vDECs362V2URUZXM5wa3ZAoESh1CYzRp2K/uD4ARQ7DKP/MQcmwI6Ni97DqCKKHjw
         WcDzXSVISd9zyQH0v5Hp0VqSnTjtEezzM03/sJm3IHaC2L6ET6lTQ5VDOlFQlhwMuDHL
         FWwyzIoDI6HDqs9FEwwyBpUN4tboChQ5nbLiWwJJrvMH13xBHp9Jvt9EMUO+ohE3E/9A
         6SxC+vrpGcaZw+WjnR9/Ugcux1IH0sxcStN/fh04wktt3OhrFk5Y/vKPBdLlmfGe1fnK
         qdP6DkaAa+M9lQ2bovAaBlsdwtcfY5U0Nz5kIuphzDXky+LqxcOZ3/2Sz/Y7VSsmPKiO
         GevA==
X-Forwarded-Encrypted: i=1; AL+hErHQgEkcgH1nkWRSlE9ThGGgSpTyGEPPE1iNkOHNFpTTt+l5/nTEPezkTDxxxnY4saqJUfyEKxj1FH5WVkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D5+LIBOz5iMA8Cz2pekIBFErMgAx1aCTd2wiA/BUwMMOApzK7
	BKHGlZaOtPIukfQzWkSCMyx87X7vQx5ZYuuU8upWLCwpa7ya8zCSz9CZ
X-Gm-Gg: AYBFou1YXITLnaiVXf4Dlp6Vqe0QVXCLfeapgt3Hq5cUMaJUXWg29rEe/2SVyCMs0t0
	IeXh+cEx0pfuzT7Crqzuh92Dmzcysu58kHVeCop084l1OL6LIGEUvblNTzEaxfo0/Fm4shN4/gy
	QpmHrVSlBvxNnNd8um/SzrlL7MOdmNIu7Si1r2VBz8h3Cn+KYBBAll3L3oMNtZGYmG2boxvBxMU
	I+GYE1ZhvRwleq4tqxIbzb9fOQmNDGZ8O7oEYcixlwMkkiSUhZ3NIPUGr6T+Uo3z4T3rEvG3jU9
	fBL+J89xqiutyvwD3UZn4WOXJ3b5TcTwIhCLVHTxjfZSdBRQ/16CVQrrdtRHVbmb75Ana/7oJRB
	X6pLFZA/uHL77+rv7xmWCENWVQgXFLMhlbcxH4wZmd8aH1Rr1oMgxVVG9sBBEtjpDHhjm+hJoOt
	LyUheBsubilL2JcU0rLPKbsoTUHI5nmMGjWg994bgqYY1cKywSq88sqNQ05gQcfZcX+LxnbP99P
	93trjwkv6MSxGKL/6wdOHaA7+0M0xT9LK2Qwt0WphX0e5dqw9F3OJvn7g0gdeN1fuYOuRPU8a04
	+h8gTPyfmTJhJl/ng5i3tgR3B+cN6Pt7drPvoThMoenj2xn1psgqWgFP
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr744439985a.58.1795220756601;
        Fri, 20 Nov 2026 16:25:56 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm115177685a.20.2026.11.20.16.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:25:56 -0800 (PST)
Message-ID: <a3b7204f-8483-4fcb-9ff6-fe62c16d9592@gmail.com>
Date: Fri, 20 Nov 2026 16:25:53 -0800
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
Subject: Re: [PATCH net v3 08/10] net: phy: smsc: wait for LAN83C183
 power-down recovery
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261117193223.2795612-9-f.fainelli@gmail.com>
 <179517075993.3136.6152160672961651320@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179517075993.3136.6152160672961651320@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 02:32, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The 500 ms recovery delay in lan83c183_resume() only runs if
>    drivers/net/phy/smsc.c is the driver bound to the PHY when au1000_eth…
> - [Low] The new smsc_phy_driver[] entry and smsc_tbl alias match phy_id
>    0x0016f840 with mask 0xfffffff0.
> 
> --
> 
> net: phy: smsc: wait for LAN83C183 power-down recovery
> 
> This adds a LAN83C183 entry to the smsc PHY driver. Its resume callback
> sleeps 500 ms after clearing BMCR_PDOWN, which is the power-down recovery
> time given in the datasheet. Together with a companion au1000 patch, it is
> meant to fix an interface reopen hang on the MTX-1 board.
> 
> Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
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
> Does this delay actually run on the MTX-1 board that the series targets?
> 
> lan83c183_resume() only runs if smsc.c is the driver bound to the PHY when
> au1000_eth attaches it. The attach happens at MAC probe time. That is
> still true after the companion patch, which only adds phy_resume() in
> au1000_open():
> 
> au1000_probe()
>    au1000_mii_probe()
>      phy_connect()
>        phy_attach_direct()
> 
> If no specific driver is bound yet, phy_attach_direct() falls back to
> genphy:
> 
> 	if (!d->driver) {
> 		if (phydev->is_c45)
> 			d->driver = &genphy_c45_driver.mdiodrv.driver;
> 		else
> 			d->driver = &genphy_driver.mdiodrv.driver;
> 
> arch/mips/configs/mtx1_defconfig sets CONFIG_SMSC_PHY=m and does not
> enable CONFIG_MIPS_AU1X00_ENET at all. Other Alchemy defconfigs, such as
> gpr_defconfig, set the MAC to =y alongside SMSC_PHY=m.
> 
> Take a built-in MAC with no initramfs. At probe time, the request_module()
> in phy_request_driver_module() can't load smsc.ko. genphy then stays
> bound until detach, and loading smsc.ko later does not rebind the PHY.
> 
> In that case resume goes through genphy_resume() with no wait, and the
> reopen hang would still be there.
> 
> Should the commit message or the series say that SMSC_PHY has to be built
> in (or included in the initramfs)? Or should mtx1_defconfig be updated to
> match?
> 
>> +
>> +	return 0;
>> +}
>> +
>>   static struct phy_driver smsc_phy_driver[] = {
>>   {
>> +	.phy_id		= 0x0016f840,
>> +	.phy_id_mask	= 0xfffffff0,
>> +	.name		= "SMSC LAN83C183",
> 
> [Severity: Low]
> Is 0x0016f840 specific enough to SMSC parts?
> 
> This ID does not carry SMSC's OUI, unlike the neighbouring entries.
> phy_id >> 10 gives 0x5be, which corresponds to SEEQ Technology's OUI
> 00:a0:7d. The existing SMSC entries give 0x1f0 (00:80:0f). The model
> number is 4.
> 
> The ID is correct for the LAN83C183. drivers/net/ethernet/smsc/smc91x.h
> defines:
> 
> #define PHY_LAN83C183	0x0016f840
> 
> That looks like a licensed SEEQ/LSI core inside the LAN91C111.
> 
> Any other SEEQ/LSI PHY that reports the same OUI and model 4 would now
> autoload smsc.ko through the new smsc_tbl entry. It would bind as
> "SMSC LAN83C183" instead of genphy. It would also get the 500 ms
> msleep() in lan83c183_resume() every time BMCR_PDOWN is cleared. The
> LSI 80227 may be one such part, though this tree does not confirm it.
> 
> Also, this isn't a bug, but the new entry has no OUI/Model# comment,
> while the other entries do.
> 
>> +
>> +	.get_features	= genphy_read_abilities,
>> +	.suspend	= genphy_suspend,
>> +	.resume		= lan83c183_resume,
>> +	.set_loopback	= genphy_loopback,
>> +}, {
> 
> [ ... ]
> 

Agreed on the binding prerequisite. Our MTX-1 tests used 
CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=y, and the boot logs 
confirmed attachment to the SMSC LAN83C183 driver.

I have updated the commit message to make this requirement explicit. For 
early boot with a built-in MAC, SMSC_PHY should also be built in. 
Modular configurations must ensure that smsc.ko is loaded before PHY 
attachment; merely including it in the initramfs or loading it after 
genphy has attached is insufficient.

Regarding the ID, the LAN83C183 and L80227 manuals both specify OUI 
00:a0:7d and model 4, so the overlap is real. I added a comment and 
documented that the match also applies the conservative 500 ms 
power-down recovery delay to the L80227. The entry otherwise uses 
generic PHY helpers and performs no SMSC-specific register programming. 
Hardware validation remains limited to the LAN83C183; I have not tested 
the L80227.

pw-bot: cr
-- 
Florian
