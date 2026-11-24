Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483853;
	b=YOCR8b8/U5IbOSPbdObIkE4D3CuFM2gnr2P9WQaxFlr7wuPwcwYyeCRYTq/whwOno4W8
	 Q0VY4SdD6zpEugRQUUFeuHFF8rGpzOKx5jyQXMOg1O3g1GJPVIjX/i/ogRz77mKc97c7L
	 TucQDxs5BguQLVkrY69RuqANmvNrZbs09uU9mirFkWOzshP8o6akeE3sstpC05mstD+sA
	 HyoqlVUipKtYMi8gX4br0OpsRm3Bee8NsBiA0dVSjwvYqDtrsv/i0/4GQpxiR09L/bKB0
	 zXgzHaDkM5xBtJCqYRUTVY+/QUvrDrtvg9vtLvxqPR0SVUwSDkEho8IXX0Mr0x223ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483853;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=uRAJYpbt0y9vhxeRJCzQmJFDBMkbju9GCV3kfKpg0Cs=;
	b=UEUov5lWzrQ2XGoanbp7QhzS1x36vhnqn/8hXoWiZ3xF+mM1CCGaQecyj8rtaU6k1C+9
	 pPFUEqvPpCtOu9nbI7QDPvhdbCLc3AZilVlJrWe/t+lpHoaBVwWOORcB+wqkZSGdE2sS+
	 opIJ+TPfUtIdk4dGaLoCCSpOuUSc9Qv7aK5Lg0afYQ0Y0VYsbmRFWY/jbDA7gNzDHJIZM
	 2GNVReQX7ND/CkB1k/JfxvZ2atqrL7zQuCff3jJWGa+EYwoNpzdAMBPJHXXPgZlCvW39g
	 7Ec9LUy9Nk8FnJDHS1SWsIPWeGiWBFAMo1uapmwwHa98hdTZsQRjluFvVlRp4iscGeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TdIWVRaP;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30483606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30483606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TdIWVRaP
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso1739522a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483852; x=1796088652;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRAJYpbt0y9vhxeRJCzQmJFDBMkbju9GCV3kfKpg0Cs=;
        b=0RYsto4QiotoX2QiQHo7pRZN6U5Z/0VY8kWs+q3FfsFTpL9Ok9v7Qy2sT2VtrHX5bY
         VAeYh5aY7lQTJwnXGY5hJsDznbm4U5S5dDkV8gdX1eZDm4mfuKj930MUuexJYhFB/kQp
         ddKOtA/3o1GbbM0Fh5AI05/ov3CfiMVQYi8iPyk/I1bjkhIBJHWH3U+6LH38Emfik28d
         8BDE7oIILfIde2XgydOG6PFCUtDn37juTne3YEgHq1r6H/jtzSYCieU5zU6QGY/umjoF
         H9Md18eb5/O6Gl92QxSzAExjf6KF39PhB9zWrkr9wjuGryzAAk7h7wTg6nd458czHxh2
         kqBg==
X-Forwarded-Encrypted: i=1; AL+hErEJK1a0DslbHHTH5QGHjcLwkYC3eMoezXpOYTpEHQPWiUPF380B7MSZ48Ppc4Q2wpHq2wl0/8VJcZamDBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f7sOvcAsKZfzfVgJiB0NbJ9pJSDkVz8IeDiSo/b38K8AtxecI
	LTx7GnO86qZRo8SgQlKH5uMYytpRPzN66uRRcTeQQ4N/dpdynn56zZF2tMtDQ3nmraAHNRbgWuU
	kwfXR6Nfrk7Elam9Sh0Gbd8fe7vRIo493pf/Sj5movIXI16kyAVbKaQCK8QNOeBnXXU/P+K0khd
	9Xx7EpqPzWR1BnpJTwJ/PgHYup5lth/XswZXbkrTQVLz/tg/VcTpL02zxVKlF9sWIMsAdPmIttm
	oZ264o4UQduoaBMSyaRNFhG
X-Gm-Gg: AZFdTZfBjL3gCskCKMfIzrcCMdmDY7GDftddgZHSuoEPL5ySOvjCqgtmd4R7Sovt29R
	mD2ZT8sjbXJ2Q4Sr9mpNJZuqHQZd/QKAcLJDv9uNXJSusQzTG2K7i7nj77TsX5oEJq815dpc2JK
	70QzuDj6a4PufFGfcyvJL6y/A6w8Sn3csDX38zLmnuU/Z4Ph5yriJxYySDpVlzSPCER5yJVpsIt
	+Yf6gdXJQYLpe9rnjIBcLXKYpuSqMLu4ymaMW5D2lTDZ2lcs0MVmA31L6bTZwLB1XDE60v5XoNE
	VnwLyY1kv43CUO7bSP9qbxTgYq5p66nrXrJAOU3FE7dzCsMBJdDvUVhz9KWDlML491VoeFZCP0j
	sTDC4tQ02vwBTA4to7SGTnM9aavr2kfu+dpMo1V21wE5MzBX8qUhglpClME7g0FbQPpbXX1vVxf
	6/Awp+zZ4aiDYwl9WOWEC/Pbwl/96SB+sg/k0Mm1urNQA=
X-Received: by 2002:a17:90b:5289:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b41c908147mr9073908a91.21.1795483852438;
        Mon, 23 Nov 2026 17:30:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff51aa0sm4301173a91.2.2026.11.23.17.30.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 17:30:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4387796eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795483850; x=1796088650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRAJYpbt0y9vhxeRJCzQmJFDBMkbju9GCV3kfKpg0Cs=;
        b=TdIWVRaPH2LcY7MXPXm5Cf5QsNiCNtivUxxcJXeiRJJKrG4MJ7mrI07UGFElxszsRB
         n6n/aSMALilWPFqOBHQ0EDA7rzvxBqtKEetRx2LblRzRF/EvPnU8ql0FQWs8rt+BpiqR
         m+AphIMFnib8xptlkNr1gESyZnT9bt3ZGyVI8=
X-Forwarded-Encrypted: i=1; AL+hErFJql2qWcK0DMBUg8V+lwyJJp1l8lg8sFN64pYG9QOaWxGgVJE3kFGYQGsNDitr2COWNyIWichpEoVID3Y=@vger.kernel.org
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11948535eec.18.1795483850281;
        Mon, 23 Nov 2026 17:30:50 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11948501eec.18.1795483849484;
        Mon, 23 Nov 2026 17:30:49 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm68971663eec.3.2026.11.23.17.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 17:30:48 -0800 (PST)
Message-ID: <94d6d8a3-b686-4916-ac18-60e7450a2017@broadcom.com>
Date: Mon, 23 Nov 2026 17:30:46 -0800
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
Subject: Re: [PATCH net v7 6/6] net: dsa: b53: fix mirror destination and
 source state tracking
To: Joseph Telaak <joseph@telaak.dev>
Cc: netdev@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, linux-kernel@vger.kernel.org
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
 <20261119190348.2317702-7-florian.fainelli@broadcom.com>
 <20261124000849.25327-1-joseph@telaak.dev>
Content-Language: en-US
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
In-Reply-To: <20261124000849.25327-1-joseph@telaak.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/23/2026 4:08 PM, Joseph Telaak wrote:
> I tested this on a BCM53125 over SPI, with the series applied to v7.3.3,
> using skip_sw matchall mirred rules and the switch MIB counters:
> 
> - ingress and egress mirroring to one port work, and stop when the
>    rules are deleted
> - a rule for a second destination is refused
> - with two ingress filters on one source, deleting one keeps mirroring
>    and deleting both stops it
> - once all rules are gone, a different destination is accepted
> 
> Tested-by: Joseph Telaak <joseph@telaak.dev>

Thank you Joseph for testing!
-- 
Florian

