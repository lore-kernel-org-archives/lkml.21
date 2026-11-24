Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542838;
	b=m1e4cf6AurnC/JocxBy19YUXZK66W02K3M/jotonSWssQwJtmV4xTCM1pNBaUujlxj8j
	 75wWjyAxMPs+06Thim2C7OQKJ9OLuBIUkvohHw5oFgqhWkLnOGzPbiePWJmk50/okoJB3
	 /b4YNnX94FUXmY44uQhYqYqetpSmbBVSwBet30px7tIDT2DlXx5xTrXRbJoB+DZsdpj68
	 EmxNT9/+tUI7vQou7CZCF0/CkAhxS3vREEStgX4GbCbxEt8HtfumTHK2HmD5okB9VFTL/
	 oOiQW0xnPzYUTyTDg0KZQRljd9VqrPrYhEHpwCUrn+yeH3HEjm4h2U/yhMGLE7lsNyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=29+XiIufhNHRKilLwg1As5CARzR+PGkJ4UIDPlIl84M=;
	b=nnNeslUH8p3kUHo10uwv+SPsvKnWkPqWxCyn+5W08VpSIIloWqjc/aZ6ir1+3kGXITk2
	 V/hrTXfaOEtVZUsZGUoLVoeg3YnOP4pLtfrBSM2lt18vkc6iSU7eF3SSCuCzRU16rNGZc
	 05dOt7/VsDTWaZYa3Lqj60ZXRgqX23y6KRmJdiCdxhIl6QTT8WMPNAl5BmUXv0GiHMsew
	 wa4+T6v+cCUyAPDx9EiVV6DVcz6/1GfbkYmqZBjhf/1G7YlELXTuUe9sBgkCZAldIywt1
	 TWWLf/tir4yG/oOzQ5hK3VXnapAIyHTvJfiY2vKFW6RSlsgsnj3fjAGHr/KiKnD1+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aG0Z5fnm;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6126606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6126606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aG0Z5fnm
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3042814f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795542836; x=1796147636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=29+XiIufhNHRKilLwg1As5CARzR+PGkJ4UIDPlIl84M=;
        b=aG0Z5fnmUusjGcD22raR6wIqQrnj6fd4EKESddtzQdaTdjvvSBs7iEHepb2t8WuQOL
         Wzl11SD3F3DHJLbRfaJhRFDjjj39aRU6X64krM5dRMXl8//3RapyjJZLSZPSNFpOfDD6
         JWgDQIEN8U/Cr+YS/mahGLc9+DQS2U0rafUUtediK6KiNCjDDLO0J+pi8M7ItN1E6AlE
         vD4SM1JBAcLh77vuNBXGubYdu0MJ7qMXCDyrDZ5/SRvoNGEUBuqR4B35Z3evWapICVwA
         QqTK0icrGUkqlIfEWLEtZ3J998gnNiDyspb/CZmD/wzeReiX6CAgBSptaBykFRWy9ULt
         RYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542836; x=1796147636;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=29+XiIufhNHRKilLwg1As5CARzR+PGkJ4UIDPlIl84M=;
        b=1aHMot0ln4FLYJRDL4Odi9Msd0eRx+462cdjzBl1SvkCc2nehXNE5CxPeTSMgm3VHw
         xg/qkUvH1YWdCPxY24LBVZ9r+tKGB2L47iCWprBZcZ6rUQt9goLU7fcCIaPhaGz3Ze4o
         K74VHDZ78MLwcwFhybKxl/GvO0UJi2GzE//jGoN+mTnUFayQ56wl7spjJjtwx/JXBNd7
         TMMBkkDY53Fe9euDPHS7Ss9MDYmOL0eGnTNHwWWMBDe807UG4/E5RiUmkTmro9KX/j8L
         pc4/1f19zbtM7mi3VYMKPd/kShbjZDgBD42KwXoMS/4Z8rNwuAjFe1s0yTQXGVm15kAB
         WMoA==
X-Forwarded-Encrypted: i=1; AL+hErFHpwln3kspcxISjHwdUjXOtzLRm1IYD9ApOMoTtRSeTeKAeJyr29ud8KwV218vSgPx6do9LzUEgRh4vOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z998uVTm7aOz6C76BWeEXWxTrlp/GWCccOgtAxx9iqHval24TDF
	6xS9jPCENuvHL9L/u3Ma+ZGrhsBu6Q/o+ow2q15KB5OGd1NoHtGpOl0MVukKzw5dgL4=
X-Gm-Gg: AZFdTZcg78opUpeigRxPMNEExCWCliFjxrH34nNy0daSb/v9owCCVDCV1/zAp0rl85s
	8WyVRzm+vELdURlsGus6rOymfwvvOYEzev/tzB91RkIsrf8ahggZYgAqlQZcvXxaTnI5NfALC4n
	P+mKP0HRu4O0waBrgauzPtOMTPRJN/B7YuBdlwgczxyid7OTgq2pt8Yh5VYSbZ02vi9xQT4oKoe
	TI1uboEgWHVYX76DZlt9cfuSUWF6UBkerQi/FBxnFeVCVrNSgJ+isoo4XJLzFwdMjfHyFBIsYIZ
	kQkLdf5tR0BvUbRB76+5CeIThA9WCFs7aikOx9mZMEjZc5WN9nEhwZxFmVeMi1cpg+QfTO+tJJD
	RNN+bDmyTD2ZMzwKJuiHbiQ7GgsdGQzBjmPZGD6YwGKATNlyUPFVsNaiRWbEYkolNrvjdQJmtcz
	zk+FgpK/lQHM/0kYZbEIIpDNi/sw1j5wHwWU5Da3GzSLz9rXuFv4L2oZflnTZXHloCE9gDxzVyy
	Mkxo/m5Jl/69wrqbDpjG3B4FM7GGERdnPPbXs4QBiD6q+SfAahdT9tcXKB3ZvWnBr/QPdc3OdQy
	zZWR+UBGfULTYosRA9sNRfCQiYCUqh2J
X-Received: by 2002:a05:6000:4616:b0:4a6:d298:832c with SMTP id ffacd0b85a97d-4abb31ae4e9mr28436124f8f.31.1795542836258;
        Tue, 24 Nov 2026 09:53:56 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29661068f8f.44.2026.11.24.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:53:55 -0800 (PST)
Message-ID: <15d9c032-a8cd-4469-9272-0964e8d9ac9d@suse.com>
Date: Tue, 24 Nov 2026 19:53:53 +0200
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
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential
 guests
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pedro Falcato <pfalcato@suse.de>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kas@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Naveen N Rao (AMD)" <naveen@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
 <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
 <2026112404-hyperlink-widget-ff36@gregkh>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <2026112404-hyperlink-widget-ff36@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.11.26 г. 19:35 ч., Greg Kroah-Hartman wrote:
> On Tue, Nov 24, 2026 at 05:10:21PM +0000, Pedro Falcato wrote:
>> Holy cow the CC list is stale.
>> Fixing some up.
>>
>> On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
>>> On 11/24/26 08:00, Nikolay Borisov wrote:
>>>> Resending this with the hope of either getting it accepted or
>>>> arriving at a consensus what exactly is missing so that I can take
>>>> it from there and eventually get something merged. As previously
>>>> mentioned this results in real problems for confidential guests both
>>>> on TDX as well as SEV-SNP.>
>>>>   arch/x86/Kconfig |  4 ++++
>>>>   mm/char-mem.c    | 10 ++++++++++
>>>>   2 files changed, 14 insertions(+)
>>>
>>> I'm still OK with doing this.
>>>
>>> But I didn't want to sneak an mm/ change in via the tip tree. Any mm
>>> acks or naks on this?
>>
>> For what it's worth, I don't love this fix. Yes, it fixes issues in /dev/mem,
>> but it:
>> 1) skips any other potential problem spots (I don't know which)
>> 2) open-codes random CC checks in mm, which is kind-of regrettable
>>
>> OTOH, it's unclear to me why that CC check is needed. If configs select
>> STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
>> in iomem_is_exclusive, etc. If not, could the CC awareness sit there
>> instead?
> 
> Yeah, why is anyone letting a CC system access /dev/mem at all?  That's
> ripe for abuse lots of different ways, so I really don't like this
> change either.

You are missing the point, this pertains to /dev/mem in the guest. There 
are a bunch of libraries (libhd for example) which reads the first meg 
of memory. This causes the CC guest to shutdown in both AMD-SEVSNP and 
TDX world.

> 
> thanks,
> 
> greg k-h

