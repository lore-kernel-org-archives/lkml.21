Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197022;
	b=qG5G76W1tNIq+YfdkfEnLVF0dyCTEYofhM5cubeqVjos/GQMZzZZ2qJOMgkGBMTc5OZj
	 JqdWhnRWZUWENQDWQKrPR++HewmGDuWW5j7TVFIaFOq3Uinj/svTghV7gJPb+3Czt1ho7
	 MUJUNvxNhAd5sqpTeKm57AZyHYju28yae1/Re9xNAQ+ZpMS1sCqivGturzmzWDNBynzN7
	 b363MfTogj0pMNDQdMBo8uhjVi0DN7omiulSfrPOVU7oXt810+i3PRZT9tTWsCMrVQuJ1
	 6d6+MpKFBlt+5zode3SN781mppXg7P9caLvWQZDIOLzw3FsZ6UaqH4QUmRcLeXj6rdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197022;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=GKW+vOqr1jPXPg8DxRcHCdGrEQ5Sm3HKeBZH63LQ8h0=;
	b=jreEM/FxgXyQtzWCbbhsXI6R43mGaqdcH0AfmadT9fOPtifzHl73uWui36RmpHSCLX4m
	 +n4NGV7QxEJMWJ4fBkoym2kZ/mOoYwJX2AKeAuNL0Bijhw4Fe3vMLB4X/yGdlDLeqLRCM
	 29xeYfKU/IGpHVmryTDgYDjmUXyZxVyvtgO7f/AfKJpeWZU+R6NnToMKvnLqAMQNeVWyl
	 ihDq/it0ChUiSvyct9zHqlldOOFXnX21Dk/kpWgF4d9ceOkUCCwJLpWS0mm3cU00tvhbH
	 eNHeh4/SK+LkGB6rkTr1GnUeJ8iozcMd5yRdCVhmHb4Q/DKf7bQ5OcSMOgim5o4P03Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMsSNk2X;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E360606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E360606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMsSNk2X
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso583183a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197021; x=1795801821;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GKW+vOqr1jPXPg8DxRcHCdGrEQ5Sm3HKeBZH63LQ8h0=;
        b=SH/vokpct2Q4tLnrtQlyb6ar9ZpiTYh5Wur+Dh75Tkmw5WHBxBWb1TDncUFfuUyPum
         YPAxwvyu4f1aTIdB/BEUK5CR82FFPq4YDiKnX6RjOLxU2F7EM27rbgR03Z7vAoggKrZX
         JlmfsB3QXzYYdYwAL/C4nAMSNDcHHe0+soDodFfVQWhvmM7QzTQWfXcFqID+alKQe88q
         8wF7ufDT2Ia7XfBT1c8mzv8vhF5h+6R/HjmRQIsrBjnTU777qa+tioM9GkNYjxh68b9l
         qeIV/a0qhzY9m4dFoQAF4o2wfg43qYS/TNuKU8xZIT15BtlklEb0ZcCjuKeCVC14g5Hz
         z/VQ==
X-Forwarded-Encrypted: i=1; AL+hErFYGKjJd+HaTgoE8YioARd0iuV3IQpT3Kj1h0j4lsY8WvuiUapox/z5zaNWuhE6gL7G9unb81JnNsXZeeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z86llYf2amrZp4ppsYl5IXOo5iUZ+8VcGUll/8d0aQI2QU9U4l4
	Qz602YB2jDzKcSwZ/ArcWbh1rEm89z9TtiSeM44zIBF1TgqIHSIEj7dj4+pTksgF7529f9g3ssB
	HEL1bGgWbdApVUQaNAtO70rO2NytFbLxpdgpmO9tactUHQR689CNOKu0umYysEK6m4un7kNWx34
	5O32rtQUuJtOt9fToF/Bt8H6eubEUKZeefZyIvh0LCFuEmAN7E9cdTEwUZpWNgt8m6cEZnLs28W
	NaFYRRzrNlc+7ANUcHWU1yT
X-Gm-Gg: AZFdTZcr+UgoGHFqrPV5ENkAlytGRsuA00argRiegkB6GqfXwUUtw6OL2fj8Y4fI0y3
	jpG6SOTV5K9ktCGVoZqkQlEhy8/DTGIa6Guy1U4dHFwekpKbTLuGa7tqSMyVtUHkyhQtczD4Jqt
	ftTduT2kbhpiP5Gpv7d8BMGvlsZjDzmVO2AruWnw2JY32l1ry74ID/9Nt3MkiMEhcU7cFLvgMEV
	08XVJSBhqtxa/Z51mJ7V388FssQ8OswPwyqEbE40QhnrynLEUIlwH4JiZ0EySRducgGeXmBcD0F
	3az+l5JeZ4COkC17uvmExSQut1+uQuxOuJQRMrKr/QWv4gpN6kXvBSIny5npngPMDuQ1QpWW3Uz
	jl/DsgnXYugH3CtV0PVTZqDlf/1/Mw/8T9YgzrbaJiHXn2zdBgeemoea7oXxkcnTdTK1Fx57c7U
	WtaRKTkQgoFxOhD8djf0QWUFccZf53ek2p0x8k6IoN
X-Received: by 2002:a17:90b:134e:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b41c96764dmr3678280a91.49.1795197020823;
        Fri, 20 Nov 2026 09:50:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm3410608a91.8.2026.11.20.09.50.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:50:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99063f4065eso314146241.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795197020; x=1795801820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKW+vOqr1jPXPg8DxRcHCdGrEQ5Sm3HKeBZH63LQ8h0=;
        b=HMsSNk2XO+KQehiPXxsZWKlllRrOerwyaSexbSyUdYfBgXE6jaGAYWHZMjQHlO6DJ6
         NCXOACB5cBCNK/YIzLsHJRHd9giK/cjWGh9X+JuzXe44nzseK0LUWZjPq3gWfgakDIZi
         MiC1l/PdPVrVsPzkgTXqEB3JA57OTzCc4i2g8=
X-Forwarded-Encrypted: i=1; AL+hErGDEOpFzAdkekX4wvaNZUizlJ07NquUUZHEf14qta3rFfg+66rOhEfGCSq4VgDIkmOJsorGuCgvfhkvRJ8=@vger.kernel.org
X-Received: by 2002:a05:6102:c0a:b0:7cd:3218:362e with SMTP id ada2fe7eead31-7d7397fcfdamr1786557137.29.1795197019747;
        Fri, 20 Nov 2026 09:50:19 -0800 (PST)
X-Received: by 2002:a05:6102:c0a:b0:7cd:3218:362e with SMTP id ada2fe7eead31-7d7397fcfdamr1786549137.29.1795197019256;
        Fri, 20 Nov 2026 09:50:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0a2865sm3625504241.12.2026.11.20.09.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:50:18 -0800 (PST)
Message-ID: <122aba51-c972-4b9e-8b74-4a48f8b5188e@broadcom.com>
Date: Fri, 20 Nov 2026 09:50:16 -0800
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
Subject: Re: [PATCH net-next v4 0/4] net: mdio: Clause 45 support for
 mdio-bcm-unimac
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Mlody12 mlody12 <kudzo51@gmail.com>
References: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
 <8a4d3925e1476061d23bc463453285e3@tipi-net.de>
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
In-Reply-To: <8a4d3925e1476061d23bc463453285e3@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/20/26 00:30, Nicolai Buchwitz wrote:
> Hi Florian
> 
> On 20.11.2026 06:16, Florian Fainelli wrote:
>> This patch series adds support for Clause 45 MDIO operations within the
>> mdio-bcm-unimac driver. The series breaks things up in this way:
>>
>> - make the C45 bus scan done by the MDIO core carry on when nothing
>>   answers at an address, as the C22 scan already does
>> - scope the existing defines to make it clear what is C22 vs. C45
>>   specific
>> - rework the polling completion loop to be a tighter loop
>> - add support for clause 45 operations
>>
>> Changes in v4:
>> [...]
> 
> Isn't this the same you've sent already? v5 would be the follow-up?

Yes my bad, too many on-going threads!
-- 
Florian
