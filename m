Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942723;
	b=dKg84X3ySLHtgIF5i+FJOSCwrfvu0+4CDM+3Slsv0P69Jb116TkJkp734zydBb7ScxFP
	 c2w5UEmGVNddTNfj+4EuKj6QfhrOXReDq5TFr0Q415RZaw4PM1uG9jkzQCRpaoVqAGrJ1
	 uEr6zvV8m2qd/HZPXq6n2+lPrASno4bE2TfKczeC59i8qrOviglm6fR0wTQkLbYsWeZRg
	 tqp67eScp/eiml7KuynclWqOv5QUbwbyf9+vc4awI5a8P1ioE2cRZpZ7vipURtqBl15Ww
	 4sDABsmvvHUIf2mc7D4ivXLSU8+a0q/PaeM6yN5BCrBT6oFMvhAxzSq+GkbULtGjhjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bT39nq+rkIX6hcx56sUqmxgqdg9Payqc0fsUYc8anSk=;
	b=VnLX2vtU64Hrdh6ccVWVLershFwwxk4sdb/MNa/2R3DC0KOD+zFUoo9wXRzkWwOiaCQR
	 ErFKkWWwFOnKsUF1FSUZBNdNICUEGiL4j/vEueUo6Q0/mK7BfarXqyduZGChaQxEeavGb
	 1M/bRC1YRvRbkrK6+MLoFo9ykQ532IdNLQ0890g0oFnsTj+1gZA7v13bXP4OVdZtUhEx6
	 dc+siYj9laVnxHCZrdbQuBYVWk8EZIeYzIYOJqpq0O8ja+FqfPh1nq/whJYy06tCYkvl8
	 sMIE1baC2hRy5n/n5oYFpf5mqLAvBLyzBovHSAil/4Zf/WudH9PyBRehRPWE73fsC9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYkknru+;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC1606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDC1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYkknru+
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so36278a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942723; x=1795547523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bT39nq+rkIX6hcx56sUqmxgqdg9Payqc0fsUYc8anSk=;
        b=lYkknru+81p/+aoxpQJlfSE32fNy1p5tv+2ndWpsgBDwv7JlC1GbCRDEW+jD9yYASJ
         QlGeIGRn42P7sWsTepbKEU27k1VYkS+ap+qINxLXKoROS+quoR2WRwNXa42fxpO1j5uj
         I2dsObFGtJTRiHmmNX4J2q6rNX4D+uUzunj5kn1W6s8UJuawcsFN7eB1sC3Pr3gm9DMi
         7xz/Q6XrrJYJGj0DWQH5UJgNJZR8C8IpxPFrF9v0V2r+JXE1SZf0orc7MXqO6fk8+EnN
         0ht2KDONgU1gIc4t6YdCwtBdr6kCueAX+qpdlULF9VmLyaAbwVll/prLWCMrm4cOJM9q
         NIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942723; x=1795547523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT39nq+rkIX6hcx56sUqmxgqdg9Payqc0fsUYc8anSk=;
        b=aj2f22LKXXUkx6JjGCJjCgma4UzkBKwXdnGgQwJJ7MJoIPl5Y8sdc4lKJPLV75gMY2
         XS2QYPusuRdjZGjKtMKWdwpMR6a7ZlRfwbF0l6b8sboiYr8td8CyBnjjp4r58YxNW5OW
         2HDzn4IV5hZu006spD0y4q3oPWcripfwU8vN/6THIteRmUXNUgoRO11QVquDvxV6EXG0
         ZBnrePl6K7lJ9hGiHeAPXBb61bGGVu95RpSWzpGd+H19+j6wpKlpdCqnNuxZjIS5UL4Y
         VcBjeaO32qjXCMhqdjWmOx6ILkTMZMjM5GkSD3XhnFmXOX35REgilkAmBTgUGI16Dfek
         V0TQ==
X-Forwarded-Encrypted: i=1; AL+hErF5fEOjd+BQ/10+/X/fYqk9eGpEGd7/4wCAI5LKE5aD+wAC0laJFn2PdRdtQu069lFGA44lP34P2IPSiWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z85Vt85oxJJ9F8Y2vQMTzeQP0GcuhRrAjIdTS3I81BHyLpxtzQb
	pw/dvD+ywgHOKKwXdAW4ikoOLMxHHovprrw7DC5Y6J6kDe7OLaf5nPpf
X-Gm-Gg: AZFdTZfLrVdOUcKE28F0sp1idj19jbjzoXJ7wKiB30Vd8x66ovYVMod1HeChcJhpFwS
	ZMHMrAjS455WORSrKK/KvEsfMHGgGu05qXuD/8RPxf7gkaF8ql5jcJzjJQ3LRHaVtKsGqXe8+FU
	pOOO3hj/+X1UVs6DTmaivC4pSwwHPj0yl+p9w7wqfYwqbOdOZwa6/xR4TCM7Dh/sVwjpESgZuI/
	gUXsPCZ7gkUYYrP13m1BHovQhChvse4Af/VNRawoX/t1Wf7QnkJXjrMpLfYoZv6uU4EipqrZIo9
	AsAws/D8v0U4m4ZW6voXs5ubBH70+ibOSf8QhzC/xH+1hTm7n41dWbLZvblQWzwst+GGXK7wsSu
	j72g4Jr01MFuI3ZCT6feLzDW90P4mypE3KYcNm09IaaCuV54bnmT/t/CBHqj46kvq7KMGKLXWnl
	40cFmvmnG/oAFQP9ILHTzokezjnHy1VX3cAbBlCbwEriFvGEuO7D7BwyE65swQj0WWsT39eb8rF
	SVcF4SiO169lWhmoly1jvtXTfOfGKujb1/egD1ItiWnfAfIy/zzD0RcylC/nDsyvbr2oL69LPiV
	xCYVtajQ8XVJF5/KbWa3EweSuXcREkT1KQmQkWZHvOLQHjZGMg8AcTQ3
X-Received: by 2002:a17:90b:3f4d:b0:3b3:8094:3228 with SMTP id 98e67ed59e1d1-3b3d07597b4mr329507a91.14.1794942722670;
        Tue, 17 Nov 2026 11:12:02 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm5413030a91.10.2026.11.17.11.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:11:57 -0800 (PST)
Message-ID: <d6c9b502-abc1-40c5-a3e6-9bebdcdd3933@gmail.com>
Date: Tue, 17 Nov 2026 11:11:54 -0800
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
Subject: Re: [PATCH net v2 06/12] net: au1000: assign a valid MAC address
 without platform data
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-7-f.fainelli@gmail.com>
 <179483704445.3136.5178913144882531268@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704445.3136.5178913144882531268@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message overstates how far the bug reaches, and it
>    carries a Fixes: tag.
> 
> --
> 
> net: au1000: assign a valid MAC address without platform data
> 
> When no platform data is passed, au1000_probe() now calls
> eth_hw_addr_random(). Before this, the device kept an all-zero dev_addr,
> and eth_validate_addr() rejected it at open time.
> 
>> The supported no-platform-data path leaves dev_addr as all zeroes. The
>> device can register but eth_validate_addr() prevents it from opening.
> 
> [Severity: Low]
> Can any in-tree configuration actually reach this path?
> 
> The only in-tree au1000-eth platform devices are au1xxx_eth0_device and
> au1xxx_eth1_device in arch/mips/alchemy/common/platform.c. Both always set
> platform_data:
> 
>      .platform_data          = &au1xxx_eth0_platform_data,
> 
> au1xxx_override_eth_cfg() is the board override path, used by
> board-mtx1.c. It copies into the same static structures, so the pointer
> stays non-NULL:
> 
> 	if (port == 0)
> 		memcpy(&au1xxx_eth0_platform_data, eth_data,
> 			sizeof(struct au1000_eth_platform_data));
> 
> au1000_eth_driver has no of_match_table or id_table. It can only bind by
> name to the platform devices above.
> 
> So dev_get_platdata() never seems to return NULL for an in-tree user. The
> failure described could only happen with out-of-tree board code that
> registers the device without platform data.
> 
> The code change itself looks correct. It restores what the !pd branch did
> before 7718f2c27dbd, which only added eth_hw_addr_random() to the
> invalid-MAC branch.
> 
>> Fixes: 7718f2c27dbd ("au1000_eth: use eth_hw_addr_random() instead of random_ether_addr()")
> 
> Could the commit message say that only out-of-tree platform code can hit
> this, or describe the change as hardening? As written, the Fixes: tag may
> lead to a stable backport for a failure no mainline configuration can hit.
> 

Yes this is more of a defensive change, I will drop it from this series.

pw-bot: not applicable
-- 
Florian
