Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944663;
	b=fucF+M013uaGuAfnQX5PEPPcDO9uMZADm9EdGOVAMqg52bv8mYmE3Ct4w/W+NghMvron
	 gbJR1S1xEMs+zQtmWGHjxsbkJpuDv6ICO+30GRiFTqwzmGtLaTE4Itp5nCEqNZWetZkYK
	 xDKHs9KAqO2VfRyA4jKN0+oEEzHpDqGvspN8LmnQmQk362Oyh7tbyjatey+AUaCsD9okE
	 hugz6Zi3hKDQhNrqwR9VJEzy9sKRkQIc568hX3EzhxaOyLoZYDBFXDog3U3iqn8E4a+Gq
	 099AvLzq1VHSIRgmKzzZj7IQC4p4aahxDdl7kY8ksLjoX7w2qy7HUoMDx80Y2lhx2dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944663;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
	b=124pWzmcWR8GhwqQRkUVXBusP7+J2DlGwELYLYS9PCNidrIhJRuHYSnjpr+DH9qK0KYB
	 cj7cGa18WeuYUn8AlRuxgEhFNt0RQubAEa6vnI/V8Xqk9M1tpy4nWDO4E2NvJdLQ4qdTS
	 ss7Z37NEL0P95bxtalCVZEV6ZAhEFXCHytaT9IFjC89NHhEK/aBTQMxIswpsRzj0XQRoh
	 wY+bjD1tDEkkNaETwqUN6gq+/kzYtksvyt8lK8WvH768k2grc58TeiYrq8myLdAXI4C+M
	 54V0v0tmVyXfXIwi7dlYFltVKd2ic8VKrGTA35D7ZPqAtMbDB6gyApSnWXkE1oqeX7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e1frChzq;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50543606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50543606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e1frChzq
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ed11653a91so758175ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944662; x=1795549462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
        b=E34kW3ec6+ic+RZcOkxJbNX9IEZ4Jio+yILdeNB1PuTx//T+vmdnFj3aH5W0tU/V6U
         +vCO7d+qY4Vg+bGkkhRYfzTdHALjrqE78LvLnae+FgBSkM6nI2esh5B0Y0d7nkWv97ei
         sMlLnFUwAzQCQcz+42Ku829xX8/ajZERYup70p4yX8eDILO8JMSDUuc00pw1+epZk2S0
         kAVdQkZKMABfh9RYlvEpYr8oKJI8gHR2k6bxQ55uHV+V9d7/K+zda3d3qfGhM+LNJdqH
         XBgvA4fftHrQ3/I50aUQXE48spd6o4LKcsZd+BIMCqOxI7J016gRgFCQqEsnptSJRRnK
         rpRQ==
X-Forwarded-Encrypted: i=1; AL+hErHSoj8yzcHU03qKEPysbqJ7MQyQLcBLQ4jfy8+2A60lKa6khN2+MW+LhfahwFVICmCGuHIpCHn5clna4qU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lLa7MxeDg/GiLiXTBuMRSiUGOVz3wP/qlRSXrG435ZuHiNAhC
	F8NRg2ilv9/5w/twKg8Jzp3Lh3I0eENX40B6VtSgkzk2+p3/MCEHP47+WTBA5UsuWCR+NoXro18
	dfQNOozADjcgh6draZgVzosvGQGGEVjd8Nq17JwE/tqZRvN9tzE8qa6rJbcVn4U/X5JTIVIN0z0
	8f3fsVndtOPphqlAZ2vz2I+dO/jGUwf3lVZMFyHIIJ8RZA+vvDz4Hd5HoYDd654LpX+8WEXTcOe
	e0GzoRxImjmlLFB+q7VpaE4BA==
X-Gm-Gg: AZFdTZdSQ2fRmCKYbfw8lUb/oHaMpBAheZZTiP2pH6xpJII6RrRaLHBHjYqqj9d21nx
	XI9R8h+TGElTONDKHj6DLE/umW7O1EHD9VgQiPOpiFNnQWVe+vg6LkhEk9HyPjTKYjFx+YYgtAC
	W8JfvYREb3FMzNliiA4qyvNpv1ztMmDpkrWIghHCaTZjXZ/lsgCcJaA0GSRG5DKKIgwZDhJF8XX
	/aOhMwiQSOeZDmF4j7a3kimfZJXamTRSLMDUZUy9vmT8mWt/OM8XjQu88XTiSyOMbXxHKLGlYi9
	l9R8uH0zPdjxJorsvw2mWqvymCbfnaLsxv6g+Asv5s0liKxad4cs8tQptbzefcPX4RDpJBLldkh
	DFa1GaNLCtIbPp7wL7Da6j0XMGsaCtEwprqEZQtsTS6uFa+FZP8uCQ0AkC56lIqQDQxlelMWWT2
	wd/huGmBm7bEvZIaRogiOvCHf66PuI6yFVAfwSIuQ=
X-Received: by 2002:a17:902:d4c1:b0:2e9:5829:9b41 with SMTP id d9443c01a7336-2eff7537da1mr3425315ad.37.1794944661574;
        Tue, 17 Nov 2026 11:44:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eff62c2f72sm144695ad.56.2026.11.17.11.44.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:44:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b6fb975053so200487a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794944659; x=1795549459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
        b=e1frChzqTMz18PJyDJgNMGYe0iujmsPgXMjke5c5qFLcK7NqhbWU/47zeMRICMJemW
         gs/fFGGcm7F9S728xChjDTIzRk71wXNeBJTFiZo7kDPeBqqU4If5DRwcJZhKLTGr33aS
         eOQtoQQGPhx7dmhWVdk9nFzJFfl9g13jooxQM=
X-Forwarded-Encrypted: i=1; AL+hErF/V7HcAN4BfamZlYu/ILG/+Zqrd5MLFwzWczRosn1H5GgtT5BRcrW/dA3QJSWhYWALnZIN0NetidLGHVk=@vger.kernel.org
X-Received: by 2002:a17:907:d407:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c510e15c00cmr29023766b.15.1794944659442;
        Tue, 17 Nov 2026 11:44:19 -0800 (PST)
X-Received: by 2002:a17:907:d407:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c510e15c00cmr29020766b.15.1794944659038;
        Tue, 17 Nov 2026 11:44:19 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca0d085sm15771766b.13.2026.11.17.11.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:44:18 -0800 (PST)
Message-ID: <7d5eabc5-5876-4ee7-8a82-0bd3a47c733a@broadcom.com>
Date: Tue, 17 Nov 2026 20:44:18 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host
 on Apple chips
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Andre Eikmeyer <dev@deq.rocks>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, Yossef Osman <Yossef.Osman@proton.me>
References: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
 <BF5FB50E-063E-4EAA-A06D-ADC3670DEAE9@linux.dev>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <BF5FB50E-063E-4EAA-A06D-ADC3670DEAE9@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/11/2026 18:49, Aditya Garg wrote:
> 
> 
>> On 17 Nov 2026, at 2:07 AM, Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>>
>> ﻿On Wed, 4 Nov 2026 16:16:29 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
>>> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
>>> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
>>> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
>>> then pass the PSK to the driver and leave the AP side of the 4-way
>>> handshake to the firmware. On the BCM4364 that handshake never
>>> completes.
>>>
>>> [...]
>>>
>>> Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
>>> runs the handshake.
>>
>> [...]
>>
>>> ---
>>> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
>>> 1 file changed, 14 insertions(+)
>>
>>> @@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
>>>                     BIT(BRCMF_FEAT_WOWL_GTK);
>>>         }
>>>     }
>>> +    /* The Apple firmware for these chips lists "idauth", but in AP mode
>>> +     * its authenticator never completes the 4-way handshake and the
>>> +     * station is dropped after about 8 s. Leave the handshake to the host.
>>> +     */
>>> +    switch (drvr->bus_if->chip) {
>>> +    case BRCM_CC_4355_CHIP_ID:
>>> +    case BRCM_CC_4364_CHIP_ID:
>>> +    case BRCM_CC_4377_CHIP_ID:
>>> +        ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>>     /* MBSS does not work for all chips */
>>>     switch (drvr->bus_if->chip) {
>>
>> The commit message and the test report only cover BCM4364 and BCM4377,
>> but the code also clears FWAUTH for BCM4355. Where does that come from?
>> Was it tested, and is BCM4355 found in T2 Macs? If not, please drop it
>> or justify it.
> 
> 4355 is also a Mac specific chip found in MacBookAir8,1 and 8,2. I'm actually surprised you forgot about that especially when there was a whole issue when Cypress named their chip firmware wrongly as 4355.

Getting older and a bit senile I guess :-p Still it pops up here in the 
patch without mentioning it in the commit message so my question still 
stands. Also are there any logs made while debugging this issue? Having 
firmware console logging enabled might be useful to get a clue what is 
holding the firmware from completing the handshake.

Regards,
Arend
