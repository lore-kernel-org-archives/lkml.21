Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025464;
	b=0fRlNepVo7+Oscyy5xKqOuSZ/JfU1gEoXOA1GOh4nTMMxeU405F2HpfV6exa+QM+4BWL
	 ffoGknlDvS2HveArfr5Aj0qclhZA7bx9RvKSdlFyyU09nW8PQVsF/RUmVrdLbFS7mrN2e
	 OvPaMeV4X+PhAqAWDkD28amTlKo5uzY1u4NFSXVYAJ2wSeKGJIr0hh0kOj2fWp8uH+9nW
	 RvA2KXv/Rn694urZNAFXFYil08NPuL/dGCGAn33nfTx36ZJAhY94B2CbNNQTudGB/j89c
	 z8TgaPilE3ZA3Ztyo16mWK95iEbITcSh6NDm1mc34L3P3bPRHv6ZivvqSqC/t0oWjTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025464;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=h+nI0N1fI6gl+3hdnXgBqPEyuibrGS+Uti+mYCJPRCg=;
	b=l9S+pz3Ht2+jr4kkDCMUVroAJ5hISf420egVrjlloLXP3Zr+UBZQA0DfMhkYUO61ibNZ
	 SzlrZJcX4vSHhFdOhqwikKGhENV5atAtPcDVPJSbuG7ctRShAgF4feGW8Edvhwvq5uQeW
	 l+29CEn5HYrRsFPrkkuj+Q4kooPc+uZ7ERhfGvEu8f5ueidfpEMhkeBhoHtki/zWf6OyD
	 9uvAGafKxkmLhI7t7aJidc+oyHONGfJChRIYskN+Lj85mQCwbrWZjCq6VvdJuonQOpkxF
	 8FvLc+LAvNuypB7Ptyihii/h58kjOqa1+5Sskmc3BPZeXRZXYB4qnWd7FnrhdvLwBaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Cc02dmjO;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD0E606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD0E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Cc02dmjO
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdab938dc83so735454a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795025463; x=1795630263;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h+nI0N1fI6gl+3hdnXgBqPEyuibrGS+Uti+mYCJPRCg=;
        b=Ox6xYZP5FFio7vGegQOF+XSdd313XU0xaOxa1IbcaTUfzcIcZpt4JKpQmhBjSHDNNT
         lwEvJaqkac/2M+5ObMQJ+FGx3loKQgMEYCcHQdMYwZfb8zLxrismt4hk4EnCAcfkvAIr
         QqIe7Z86p/31wG78a/zWM1e2eaGh9lqUTokLkp3oV/Rib15WnxoSk5NMwhFj8AVfQeCv
         I8Uy4cqW2wAmLRp7XzL3sMfItS5WC4ZzN7IHvZ4DIIzWrtXT5CnF98MAv4FpeGkFxvUA
         q0neg5fcrNgn7YmZQo8vI3vGlp61FNJPCL0aClQR7Ft2+gZh0obaj/NhYveB7wpA3UvO
         h2rQ==
X-Forwarded-Encrypted: i=1; AL+hErFxRnhw6q4PLRPBuaaLIpOveR9dEgM1axDqPyrCl/fsBOJ8i7O+vfLRNVts7KKU963uGUvZmP3T3K07/wU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9amxUeGdBOY0+tzlOR0/qik4So1Oee+3WITpGSBwhcWeCYYCj0
	FX4P+h0pHb+kTH4a/AWqukkea8MFi7pcqFX6gt4SmHk5LbGmDfTV2iPgQmLat3y0pXQWRW4auRu
	6F0A929jOdavQiJF5IJJB5KrRzjPnQfaezXuwPLzvUtjog13DvcyaUkUBn/suDuJkdM8Nm73eXe
	7WQ9M0o7fUg99fKT9dy3/3OecRW4oKRGhExLSoDOzEcPL6Qe7rKdqrZUsZ/FtW+9NBWvGdJpNCS
	tSF58px1tQhK+8T6Vch3Ofw
X-Gm-Gg: AZFdTZc/b7Gbxq3QRlwQIqVn0nehdNL6WmBY7/FWSljtEEW7QBfOktfd13s1q+lTQKJ
	uf8B1n8kp3MQkW392/52Pu1oXSVIrWnLrIHF0BrbXBHb28S7QipFLOc2Gr0WrBvy+udUiRrwULl
	EyqxJDbw8ms9DqCj+nhgteZruYcYuSz9euQogpDKiDAA1egQrFK5qQ0iTQibxc93VRAevg4g+7W
	NmbPvXUfmRdZCSTjpRn0cx25cGYMU5vw5vj+uRlzFly2R0vCW6ZDsSxjlGQduZVvP+pL6QnfBHT
	b0I2/q7DrsC0gaf0mw1gjHPKkldC/NAbdJudeF93QoQfuatOhi4V472HgkFvh869h+wPPJfWxpI
	WXGKDU0Jv/l+Srqtu4Mc/P0QOy5gkCBZo3I+NCPWk1sA8kd+VXRq1xQyv1GKS4sEmunW8n7JOyG
	JHmVyNiznf1vnoaFp1BsjFmIJO3VG0RjSnskye3C4N
X-Received: by 2002:a17:90a:e7c1:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b3d07e3cd4mr3179462a91.64.1795025462779;
        Wed, 18 Nov 2026 10:11:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4914caasm721091a91.2.2026.11.18.10.11.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:11:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so261306885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795025461; x=1795630261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+nI0N1fI6gl+3hdnXgBqPEyuibrGS+Uti+mYCJPRCg=;
        b=Cc02dmjOWdpITY67cZ44ovz353/8tUE6RK2PJL4c/k8UtklHiPfjpSVEkDzuIIL1dn
         vkducgChbIzgX4c4RYray0ntuiSglz/GHH7/i6xqK6Mi50zW4/9CeDSWNWPIFsAg34BU
         Fm4CXUu7hNI9/axlrsWHTPKfE8RpTv+RyFB+E=
X-Forwarded-Encrypted: i=1; AL+hErF5A/RTjTxGG1POaozWVkJ8/16hw0vWLwTGIecgNk8ecq2D/JRTdfiDrId2Un8+9j/rR9ELRN+q8p61eyA=@vger.kernel.org
X-Received: by 2002:a05:620a:2714:b0:93e:5fff:db07 with SMTP id af79cd13be357-949995b3620mr545480485a.40.1795025461435;
        Wed, 18 Nov 2026 10:11:01 -0800 (PST)
X-Received: by 2002:a05:620a:2714:b0:93e:5fff:db07 with SMTP id af79cd13be357-949995b3620mr545473985a.40.1795025460860;
        Wed, 18 Nov 2026 10:11:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b75aa1csm239613385a.20.2026.11.18.10.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:10:59 -0800 (PST)
Message-ID: <47125533-d611-4d88-8c08-65a1c4b8106d@broadcom.com>
Date: Wed, 18 Nov 2026 10:10:55 -0800
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
Subject: Re: [PATCH net-next 6/9] net: flow_offload: allow drivers to validate
 and invalidate cached paths
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 horms@kernel.org, corbet@lwn.net, jonas.gorski@gmail.com, olteanv@gmail.com,
 pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
References: <20261116222519.1416501-7-florian.fainelli@broadcom.com>
 <179495816543.3136.12103952304400202953@kernel.org>
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
In-Reply-To: <179495816543.3136.12103952304400202953@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/17/26 15:29, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] nf_flow_offload_validate()
>    (net/netfilter/nf_flow_table_offload.c:931-939) checks the neighbour…
> - [Low] nf_flow_offload_validate()
>    (net/netfilter/nf_flow_table_offload.c:929 and 934) is documented as…
> 
> --
> 
> net: flow_offload: allow drivers to validate and invalidate cached paths
> 
> This adds optional invalidate and validate callbacks to struct
> flow_cls_offload. Offload drivers can use them to ask the flowtable owner
> whether a cached path is still valid, and to tear the owning flow down.
> Netfilter now keeps direct-path dst references for hardware flowtables and
> implements both callbacks, checking dst cookies and direct Ethernet
> neighbours in each direction.
> 
>> diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
>> index 4365859220e6a..1f3adf70f5987 100644
>> --- a/net/netfilter/nf_flow_table_offload.c
>> +++ b/net/netfilter/nf_flow_table_offload.c
>> @@ -885,6 +885,62 @@ static int nf_flow_offload_alloc(const struct flow_offload_work *offload,
> 
> [ ... ]
> 
>> +static int nf_flow_offload_validate(unsigned long cookie)
>> +{
>> +	struct flow_offload *flow = nf_flow_offload_cookie_flow(cookie);
>> +	unsigned int dir;
>> +
>> +	for (dir = 0; dir < FLOW_OFFLOAD_DIR_MAX; dir++) {
>> +		struct flow_offload_tuple *tuple = &flow->tuplehash[dir].tuple;
>> +		struct flow_offload_tuple *other = &flow->tuplehash[!dir].tuple;
>> +		struct dst_entry *dst = tuple->dst_cache;
>> +		struct neighbour *neigh;
>> +		u8 mac[ETH_ALEN];
>> +		bool valid;
>> +
>> +		if (!dst)
>> +			return -EOPNOTSUPP;
> 
> [ ... ]
> 
>> +		if (dst->dev->ifindex != tuple->out.ifidx)
>> +			return -EOPNOTSUPP;
>> +		neigh = dst_neigh_lookup(dst, &other->src_v4);
>> +		if (!neigh)
>> +			return -ESTALE;
> 
> [Severity: Medium]
> Can this lookup change the neighbour table? For IPv4, dst_neigh_lookup()
> goes through ipv4_dst_neigh_lookup()->ip_neigh_gw4(), which creates an
> entry when the noref lookup misses:
> 
> include/net/route.h:ip_neigh_gw4() {
>      ...
> 	neigh = __ipv4_neigh_lookup_noref(dev, (__force u32)daddr);
> 	if (unlikely(!neigh)) {
> 		struct neigh_table *tbl = arp_table(dev_net(dev));
> 
> 		neigh = __neigh_create(tbl, &daddr, dev, false);
> 	}
>      ...
> }
> 
> So validation can allocate a neighbour with GFP_ATOMIC, run forced GC
> under tbl->lock, and insert a new NUD_NONE entry into the ARP table.
> 
> It also looks like two cases that are not provably stale end up returning
> -ESTALE. The header documents the contract as:
> 
>      Return 0 for a valid path, -ESTALE for a demonstrably stale path,
>      or -EOPNOTSUPP when validation is unavailable.
> 
> The first case is neighbour creation failing (-ENOBUFS at gc_thresh3, or
> -ENOMEM). dst_neigh_lookup() turns the ERR_PTR into NULL, and the
> !neigh branch above returns -ESTALE.
> 
> The second case is an entry that was garbage collected while the flow kept
> forwarding. The software DIRECT path uses the cached out.h_dest and never
> confirms the neighbour, so the entry can age out. Periodic GC can remove it
> above gc_thresh1, and forced GC can remove it above gc_thresh2. The next
> validate then creates a NUD_NONE entry, fails the NUD_VALID test below, and
> returns -ESTALE, even though the next hop and MAC have not changed.
> 
> The consumer, fa_replace() in drivers/net/ethernet/broadcom/bcm-ns-fa.c
> (added later in this series by "net: bgmac: add Northstar IPv4 TCP/UDP NAT
> flowtable offload"), calls cls->invalidate() on -ESTALE. That runs
> flow_offload_teardown() on a healthy flow.
> 
> A flow that the driver declined keeps being offered through
> flow_offload_refresh(), roughly once per HZ. Under neighbour table pressure
> this could keep tearing such flows down.
> 
> That driver's own fa_route_check() uses the lookup-only ipv4_neigh_lookup()
> and returns -EOPNOTSUPP on a miss. Would a noref lookup under RCU, such as
> __ipv4_neigh_lookup_noref() or __ipv6_neigh_lookup_noref(), returning
> -EOPNOTSUPP on a miss, fit the documented contract better?
> 
>> +		neigh_ha_snapshot(mac, neigh, dst->dev);
> 
> [Severity: Low]
> Should these dst->dev accesses use dst_dev_rcu()? This callback runs under
> RCU while dst_dev_put() can concurrently republish the device:
> 
> net/core/dst.c:dst_dev_put() {
>      ...
> 	rcu_assign_pointer(dst->dev_rcu, blackhole_netdev);
>      ...
> }
> 
> The ifindex check and neigh_ha_snapshot() each do a plain load of
> dst->dev, and ipv4_dst_neigh_lookup() does a third load through
> dst_dev_rcu(). KCSAN will report the plain loads, and the three loads can
> see different net_devices within one validation pass.
> 
> There's no memory safety problem here. blackhole_netdev has addr_len set
> to ETH_ALEN, so mac[] is fully written, and -ESTALE is the right answer for
> a route that has moved to blackhole.
> 
> Would taking a single dev = dst_dev_rcu(dst) snapshot, or passing
> neigh->dev to neigh_ha_snapshot(), avoid the race?
> 
>> +		valid = (READ_ONCE(neigh->nud_state) & NUD_VALID) &&
>> +			ether_addr_equal(mac, tuple->out.h_dest);
>> +		neigh_release(neigh);
>> +		if (!valid)
>> +			return -ESTALE;
>> +	}
>> +	return 0;
>> +}
> 
> [ ... ]
> 

[Medium] validation creating neighbours / reporting -ESTALE

Agreed. dst_neigh_lookup() can create an entry (and run forced GC), and 
turns a creation failure or a garbage collected entry into -ESTALE, 
which makes the owner tear down a healthy flow. v2 looks up the next hop 
with __ipv4_neigh_lookup_noref() under RCU, never creating an entry, and 
returns -EOPNOTSUPP when there is none, since the path is then not 
proven stale.

It also returns -EOPNOTSUPP for non-IPv4 tuples, as the next hop address 
used is an IPv4 one.

[Low] dst->dev accesses

Agreed. v2 takes a single dst_dev_rcu() snapshot under rcu_read_lock() 
and uses it for the ifindex check, the neighbour lookup and 
neigh_ha_snapshot().

pw-bot: cr
-- 
Florian
