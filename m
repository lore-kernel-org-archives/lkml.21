Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084912;
	b=OtX6BL8nRootBfwD3FQGSnFncHBpzsK4bgw18ZgBrPIpOKPu22cpKr+aMM22vFOfA/xi
	 O12ub7jAQnKPAE1RVec0m11uIW6/pCPJT8umSjaHbjhqg8WqZzKzvCIbokF5eJ2lSaLPI
	 wLgzbAEkGDFgDbwT+DNHs33OHv5hPF3mhvK5mijhHPQfmMGeixQ1Op7LfFATlXlA8NAJo
	 MvcmQlQ+rhtRCCPAPtt1EG3wssuhtQbPTDZFq5TYyS5GEBiWeaqfvmSdDrChZBuDZJ97N
	 A452z+t6BJDfUmE+tdZUFdFaym4z/mWSSZkbBIuQodNmTPRtmw97UbxxrWbc3Zs8eFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084912;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
	b=Uru++6QqwXjF8pVllVSBA/jkVcU4Nhj5a4WVLm3dmrTb2y8ruWJDuU6NavXPTyaKFjjY
	 uOejroqPSLi0EaeR+Kgi9/R9OGxmtDEfuxJHqP2O4lemAwG4XbySdHUvcv/YRWChg0epN
	 r84jFi+KN9dZzJlwLJj4tPgDMYvZcxVxNw6XrWd2hq5TdViewjeW8jWyy/BBbnd8ubsn4
	 p2MD17KSCPwsWfedhSUowPU5lryt+bi06jelkgyn0qK7pYp6mtQYB9aP1qSB1oGXFFk0k
	 gtNQVLKCBs9bmSU6CzazwSjy9SddY943/HV8No7G7o3RRS/jcwvDh/zKvrYpy1p2Xww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mqes37qD;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UQy2FZwM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02810606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02810606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mqes37qD;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UQy2FZwM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795084911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
	b=Mqes37qD+B8DZRt8pCYmN9t2CRNAZZ/Ar5uX4mykRiOjAbzKeqR2bblx2Pe8ixia08IOVj
	KYcoTjawgFX8j9F409EqBtER1mmhni0GH50hHcQg6DAzs5HzJ0f6m87mzLIrz6l7OvTGXt
	xMqZEwXqOVwe6iJzVTZvKUF06KMRYuQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-wE9w3HeKPhqHSemXbRE9cQ-1; Thu, 19 Nov 2026 05:41:49 -0500
X-MC-Unique: wE9w3HeKPhqHSemXbRE9cQ-1
X-Mimecast-MFC-AGG-ID: wE9w3HeKPhqHSemXbRE9cQ_1795084908
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a647e776b4so1618559f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795084908; x=1795689708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
        b=UQy2FZwMZQHq2erosHbanHLjOrQFHdTU0ZxgcPV9p/SUftvKB8gJ3S7GTK+J1xYwGS
         8nLKhlMlICBXC1Z3/BKboZqqV99XVl6KZQ7r5G5Dtz4LuLF+nwR7ZRLwvyJ5V2fRV4BD
         /GLck89gmZQ6c5+LZsF/n8hZsEwfEyodOKNQ2legy2ShpVvjAZtiqCdmxVlcT1sKNG4g
         zkP/ugo4mJCsxOFZLAWlrn9nhb4QF2cR9Ca7SVjSQ8YMRnQhUHgIqQWPSq02h90JvNQ5
         0m5qAA7FtuFiaUZi51qET4iNfnEFUPQJMYu8eKcU9sMuyibVe2wt1mihU9ZZJYjqzvVx
         X2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084908; x=1795689708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
        b=Fz9Uat13ZGqgUD/FT1zgPHNgj+9kO3OE2HxWPDxHXCFf6tATb16lXGs4LhjIXMNRk9
         kitTh58NVt5nsH4x+S0apYKTVjQBZBevM7Uez93pLUQnuedSdermHYTmeN0sP+ADHvdA
         DxLjcIWmFc7r8/psxU05gJNVdeEEYp9lQmlxVHGcj+U3FQvfCXxDp5s+tSOyfk8tTwcc
         mPJKRyCtZnkQue9Jb0DkCC4yB+YUrOzpX5tCc+0CXa0ucR5iV3dZK5tVSHLbXq2Eprjb
         UXTglVYP+rObIdsSeKq3vFAT0HzLnsO7H3JXwGa2KbfLoRTgputVf4ELUGLykYKuenIb
         h94g==
X-Forwarded-Encrypted: i=1; AL+hErGzdg4Wmr4vXk/61PeYVNbxMiibxgFx9oMCiDluimx8gxAGzrBQglxaQeFMY+ADXJXTYknMMSSGqcElJkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z85MvLoKgA9fhYT7s6Dx/RLG5jh4blEHgg4/+OFFLySNf+4abPt
	QcMoStSIhIMpQ8qa/DTbHxspM0w6YyWuOAlwQFYEXPparMiCRJLfSTtyRejgTPZXMZ5FAO7R4hy
	2Ier22lFRSay2dBdpDkuoRHowcBGYkS0qIVtkXLeqkDA0G0PB2RmgpBzbTUPycdJUXA==
X-Gm-Gg: AZFdTZeUN0ruWbbMwvb4C9+uFBFK3NbSReKlBtq3UYzUJOT3s6GkXelpn3ujuJsNnGj
	iPBQvHAIyWEbfZ+M2mvExPF1wLcM4lee8eOwjnd8H+qtk276hUAQyLsuXq2HxeAFKO47+04YKb4
	BMGWIs4BAojCeLpR7PBBL6K2fXfqS5X5shOWnE9Y3SfSfTLTd19GgciEpe2xj+/MG4G2ih8fwys
	DXkpDVxdsIvqQHV3VBGeAZoaIoz+cRYtbglUaZLl6Piv6x5il1/ti/fV2jdGnq5XhYmx2b0UiUU
	S0ecOSn/MobgdBVnpf1dqmljt3OALmPzUPeWd0n9ELdjhxcd4G+rpTenNraEM+VohZPurSRNEYO
	sQqiAbLod2pUqQcAR+d8Hm5jnobZY/WyUggjd6h6eNl2+NmtnB+nfkqB3UWtUDim7N6tcYXmy1L
	0LibjrZixh8y7fjhUetmgMcdSN8dkLdgOYpIKixFw5AHdN
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315957f8f.32.1795084908098;
        Thu, 19 Nov 2026 02:41:48 -0800 (PST)
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315924f8f.32.1795084907691;
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656a28b8esm10196704f8f.50.2026.11.19.02.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Message-ID: <44ea3f0a-f992-4101-9cfc-bec1ebf6a3c3@redhat.com>
Date: Thu, 19 Nov 2026 11:41:45 +0100
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
Subject: Re: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 20:22, Igor Velkov wrote:
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
> 
> phylib suspends and resumes the unattached internal PHY across system
> sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
> phylink_resume() does not start the external PHY, so nothing switches
> the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
> the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
> receives nothing while TX works.
> 
> With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
> the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
> USE_INTERNAL or RX_CLK_EPHY stops RX.
> 
> Set the data path bits only when the MAC's phy-handle names a PHY on
> the internal bus. As in dwmac-rk, which reads phy-is-integrated from
> that node, the node phy-handle names decides; here it is the mux bus
> the PHY sits on.
> 
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Signed-off-by: Igor Velkov <iav@iav.lv>
Not that this 'broken since introduction' H/W setup does not qualify
anymore as 'net' material. I'm applying this to 'net-next'

/P

