Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212085;
	b=dM8Gr0iuG3u/igo9tYNrx6D4rQR30UT4UFFAGK6YH8bT9fdG9s1tVML/otYwYCCGTzFy
	 zf2k7GTrP3ItwqbMdRqvofyJ+kWeII/glCM+xZz+GSbJkhwERjU+W5lUkjQ9UI4jK3/dG
	 XjWPgFHY2bRGfoqa84cXixGlXDQFm5xM4WSiDn0ZYR8i+cZYfFDWIo1NH9xg3HuI7HABv
	 dTN3pxPHxJ8445HfhhYE7QbprHJT1qLcLrdRu+lYVfp20RS+AaZ7Ri+xRh7zII3Gn4ilq
	 PwByGAv6UZBb6hIaJqsYfbCfmuuu+lFwIJTLMpW9HTi/D9s+lTFsGvVCZ+4R+wFUpUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212085;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=kwLDrqnpiUw3OZLU2mtDF7v+FAlv1It0vWx0TeCrCQU=;
	b=bKJIs+P3ZQ8VfO3hx3+TzJd2VxU0t5qfYVj5wD6z/TDhK+wApuCavMdjbWDLcwqkzBQk
	 ePq89zPnaXEZwMwXREhlZ06bQ7643JEMw6vIw9H2WGVlt4oi1p5akjJKfWb6pjIOSg/U7
	 kFbPxbLTNisHgS60amiF7WFpmNn2RjbG7d2xs4DqFOfMVANEo28oqWRNEd2i8wnc+Ymo0
	 5Kj9WiJhYcHFENVF8HS5Km//B3lLc9WAF8mDw/C+SZQss0uCI7LTJUw4taTHbKs2LIUgH
	 SOYO9O1+H53hzCT632by3Ds8U0zF9exsjLeh9JyEnwstv9dkNYuEG1N47EVyrhwxKxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="cR+Er//9";
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B3606A6AE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2B3606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cR+Er//9
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso997290a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212076; x=1795816876;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kwLDrqnpiUw3OZLU2mtDF7v+FAlv1It0vWx0TeCrCQU=;
        b=DF0eXdKSIdevpDJqR/90IgtdDS7umIzRKmqg8vpEqdckCmdyrh69j+PSDutJ356a0R
         cqNPCA/h860QuCuxZoA1MKqOB9Z8zJ5bydVfXksx0jlVtT/I+REe6hVi22Vvvl9t4Eyf
         z8o59AE/LfERnpKGINzjnBTH8OjKRIjipf18okoy6ESPdindsSX6xARNj69OxUmX3qZu
         5yLAbhuRym4UM2cGXTEdVzaDL49bLqWC2J30ziEKSmobzRG+OVjDczeai8UEczvt8n1s
         KFENHxpcaqh/29TJLHA5m8QHRxBLeBS+sGrmxr1Aj8wyt3o0NL1MmLsoCfNsWkQVSX7u
         qJHQ==
X-Forwarded-Encrypted: i=1; AL+hErE6mfzfZif4iKWyrH9665jpsKM7JNv+MNzmkXFTQEog1GuZxwBkzOhjRaa96z7ciFWuKWIZDd7bEt3lo0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UjX/OJBL+LxLLN7n+DllsrrXRh7rBT1oj2DEMGt6sAhaeThcI
	1ZNw+HHLA0MfSRePibccYXs5sVRoRhjqgG9kRB2cpmYF3/+vVJooyzmya1sBWNwLbp2S2ZHa71y
	9o2v8aSICAObBd5EJbOOEct9kejjo+7dR5EefzBN/J4dMtFxoKV3LPknvK3RvP/2heRKH8Si7q1
	j48QLmkRfiGr6HYy2mxHU+3tcLGGSZk+9ibOtiGC55aIeVbputfTclhcFgR4s8lsbpd5VxuVINa
	ZpNaRzqO1/hX4mRg1MNEjKQ
X-Gm-Gg: AZFdTZfMrIsnutnaKxzol0JPZMceeUgE5zjQBL8xUEv8jYO5qgiV3B5YsNqjhyALgps
	u4N7WfhFNerhW6vnAyEYdRABiFD2DQT9mffzUdCW9DGpcx9QGEGNR60XP1aWW0sT7EUyYsPx8nB
	9xab09lGN2Y09GHeTEFoWILZ7nnktTSQV1+yH6n78cQjDs4FrA6Z9WqxZcxGOz1Y7jEPspA9HKd
	BOndmF49Kk9/rOLOSVg9FeFbWAbBRYGhGXmYrJJvZmPca949pcVx/9vOX1iWnkLMsZExRuI3YBO
	cpNCGqlJl/f8hqWRka7f+mCbrRWAb4zu1RSCx+oTcxADXlVPovVeMcwzVzApfc9gustbZlXXeTD
	1+9yaBZCnsgnPOquHltbACtRgLfnBByTOG6sd7Rl+PhK830ouqqSjqFaBct1Ebvu7Zd5U0ZVBBb
	L70XjSEzZQKTF8illL1IBuiYLSPeTZG6uUxigisKdnhmU=
X-Received: by 2002:a17:90b:3d90:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b41cb42c13mr3870986a91.61.1795212075601;
        Fri, 20 Nov 2026 14:01:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d683sm4111031a91.3.2026.11.20.14.01.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 14:01:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2c5f10ddso28950421cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795212074; x=1795816874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwLDrqnpiUw3OZLU2mtDF7v+FAlv1It0vWx0TeCrCQU=;
        b=cR+Er//9DniVkKxbQjc8CS+rs7a/AcLpR09nAEUoSnj66zPPl4H1isE1UrI98fvNLX
         MIytxU91HSudwrwTi0rqj/mad2NKZlOlI47Bv069DjSO7oPL4gxA8GzzNQmUv6S+AMAF
         Mo9rUpTvjs9SmCsbFHvZ7mdsfp+SIh6DCH6lk=
X-Forwarded-Encrypted: i=1; AL+hErFLHSgyhfauRXhNv86rrNDpxqico3J+LFG1IMcFo+V4VOOj+JImnlMuH8+TbMxX1hOrdqxou3hto8PUQhU=@vger.kernel.org
X-Received: by 2002:a05:622a:1b0d:b0:55c:2cf5:350b with SMTP id d75a77b69052e-55d76a5899cmr82915651cf.31.1795212073441;
        Fri, 20 Nov 2026 14:01:13 -0800 (PST)
X-Received: by 2002:a05:622a:1b0d:b0:55c:2cf5:350b with SMTP id d75a77b69052e-55d76a5899cmr82914721cf.31.1795212072753;
        Fri, 20 Nov 2026 14:01:12 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031617sm294067385a.1.2026.11.20.14.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 14:01:12 -0800 (PST)
Message-ID: <b3a4817a-d514-4c3c-840c-8104e6a447c0@broadcom.com>
Date: Fri, 20 Nov 2026 14:01:08 -0800
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
Subject: Re: [PATCH net-next v5 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>,
 Justin Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Mlody12 mlody12 <kudzo51@gmail.com>
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
 <20261120194318.3952487-5-florian.fainelli@broadcom.com>
 <905c34c37a843cfc95f95e10b32f513e@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <905c34c37a843cfc95f95e10b32f513e@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/20/26 12:29, Nicolai Buchwitz wrote:
> On 20.11.2026 20:43, Florian Fainelli wrote:
>> Add Clause 45 read/write support to the UniMAC MDIO bus controller driver
>> by implementing the read_c45/write_c45 bus callbacks. Each access 
>> performs
>> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
>> under
>> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
>> MDIO_CFG is only written when the mode actually changes.
>>
>> Since MDIO_CFG also holds the clock divider, unimac_mdio_resume() now 
>> takes
>> the bus lock around unimac_mdio_clk_set() so that it cannot race with the
>> read-modify-write done by the accessors. Resume may therefore wait for an
>> MDIO access that is in flight.
>>
>> Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0 even
>> when the controller is still busy. For C45 this would let the data cycle
>> or the next access's MDIO_CFG switch start while a frame is in flight, 
>> and
>> return the command bits instead of the read data. Check that the 
>> controller
>> is idle after every cycle, C22 ones included, and report a timeout 
>> instead.
>>
>> Also skip the BMSR workaround read in unimac_mdio_reset() for children
>> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
>> expected to respond to C22 accesses.
>>
>> Note that providing read_c45/write_c45 also makes the MDIO core scan for
>> C45 PHYs at registration time, on addresses that are not masked and do 
>> not
>> already have a C22 device. This is not the case when the bus is 
>> registered
>> from a Device Tree node, which masks all addresses.
>>
>> The platform device that GENET instantiates when it is probed without a
>> Device Tree node (e.g.: ACPI) does not mask any address, so it is scanned
>> too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a 
>> timeout
>> per frame since GENET's interrupt is not registered yet when the bus is
>> registered. That makes the scan slower at probe time on such systems, the
>> same way the C22 scan already is.
>>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
>> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
>> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> 
> Forgot to mention: Your tag needs to go last (v3 had it right).
> You can keep my R-b as the changes are OK.

Indeed I did, thanks!

pw-bot: cr
-- 
Florian
