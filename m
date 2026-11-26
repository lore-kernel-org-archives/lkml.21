Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677473;
	b=2bb/diDOOkvjBStFS2wxv1YYLSbUnEXBxL9B5ZoH6Vmm1JZPVzXat4817bGwZDWPm96I
	 WLSJ2gVPeXa34e2uW2dHVhq59AWH9RUTZE4TniRLT7erYoz81iuAoNzE82+tW1kcqlqdb
	 LgjEPoGWYq2BO6cTA4xQbtCDlVbZ0JX/pUnoLhc6NfFV2Daw7o9qrokUSUIZMREyCJs7G
	 aUv5WY9z8xZUBXOtoKJS9Md/bg207F6HcA5FEwegcCyTm6j9S2KeuPGfGY8GjKimtaOf2
	 zPDkkTVMHsk2HHDj5rlAg1YCL2M/XPsii9DL/BqrWZBOzjFvBoOGPskJVHz1oxoM80g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wiVxz1XhCvSbqHjLx44qyZZxEHDYSWwOkZ0h4qId1n8=;
	b=XjSY5wQMDsTDFJFfAVn0MdwR5XsWIbKvYUGVOL9GFsvI0gkHx/wnFQaDgehQefbanB9N
	 hj5v+2zXRFzNRLlADmYYC0nScY4O67BeO8Q9LkkrK247H1wtoew02hqpzjNATMOX1W5Ze
	 Jb7b7IjBKoM5KErxuA5ZQl3ks3Bt7Scb818yBktuzUoejq+10BFIrxYk3KDwdO7sF9QTe
	 WSB74NaKPcnQpoEO4R6dAMSbP0JsPhFOi8ZhdZVohMqQz4tq8vjpe52qfg6bvqAZX2Hw/
	 IkmenpoUrfvbXaqSdjdSTckB9gAqwS9H0IBZBHCbrCbqmrRNa4BpJnlTtqyuYL6xZMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Sfn+1XGf;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA55606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Sfn+1XGf
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e47347279so4009884f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795677471; x=1796282271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wiVxz1XhCvSbqHjLx44qyZZxEHDYSWwOkZ0h4qId1n8=;
        b=Sfn+1XGf9gfG5Jn7/PdhjghbRyNRuYp+f8+9MKmPJC1kRa80vZr8lNh+RRB4nfmfk7
         knV+9WTMyabHlW3LdeTvg1HEs/tzhTh2r5nn5KM8VjhNo9Cb1ycy+u3p+Mq/ghtKlLSs
         7U8oIORFpg+SB9S+KNOcRTF9JGCSFkBCQb4a11/5VttDHxuo8VZ7WyDr5WrFzxjSYEk2
         oBownlQPfhor9uWGVen4Hkf3u6uIsBzyPENrUwdOhfw0hYUR7N1Q42CsIWuM2EAB2lN6
         nhgeHn/FdeHCTtdSXpJ77vp2Iw9H1JjjBGkIVaiUcCB1GQCY/WYzj/F6PW2jeEuuQl4r
         p5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677471; x=1796282271;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wiVxz1XhCvSbqHjLx44qyZZxEHDYSWwOkZ0h4qId1n8=;
        b=HKra8w3lBoS6XMtMfHb5B4zhl+vxoZBOj4X/EKR07yEkhTEM7AH1FA+K153oJ/hL/U
         b4Nul/7RnlinuQit0ijvRD9izFSWN9thFbNlzhDb4xwCUY0d8FD4b3/8SS1ONoIDuEEC
         jCgyQNqZth5Hx/t4j6IpzFj4HH4HfESI1EZFBx0NmpUIsQxZjfp0+E9rqVyb2j9iNLYM
         92/FDlQT8UPMJLGHTMRt3u0mTCk6C6akv9P83roQ6dLrYXbM57mVZY5rMcmUuaZt6zqE
         ZL8Suu5UV+aPQXC/QDyRAnLwS08UoG8faCcVz3nEd+QCWlUbJ9N2AZQqPs6/KMvWA32i
         uu0g==
X-Forwarded-Encrypted: i=1; AL+hErGPGk6g1xzd2Ea1V0rSkVo1QrPWAz7s1H/RfDozPY7cOKTxNsrCHNfMb3Y/8Vf977pSzGwJ3yFec2L5LLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nYOuw0HnAxGtpTA2Bot7oAkaBlot1hxIv2Bis1vSEQoCFR/ug
	zVfHWR9KSHo9cVLaXuIaNcv+JZSkgc3w07yCySOmomDVIzcQ/NeSi8o3cmcVgkPLOJA=
X-Gm-Gg: AZFdTZd2Psgzm88EwLxvlvKSDXl9m6df+f3j53DV1BfmjM4Q2O2ty9RIv6mlUuMOyup
	5AakQwnI2UnCxsceBhhOcv4FbCo+mQU9oJQmK7L9RM9x+P8Jvy2hGJpmG3O6gYe7yJRMkVVfFuY
	cX3KwHiWSauD5Add2yJFExzJKBG4rmdzcNJwwq/TbRL9YyM7NSVylIpFpnj0JvXYHmtkySEmss/
	59o2eBZlBireMSIqj02ZcwIVuWqvqB4K/wvHTqUS1+p1vaUh8SmEPbAI1B3km6sLGYFmCIDtpFQ
	+Z29mX8savPO3vIJTosjcP4RSy7c4e4Z5NzdK4g/CmR3ljT9rL1Ap4We3Cebb/pPn7s1shJQa7u
	XLt89BPCquRbG7hp6FSwiIIz9pdRG1jl/WmMSLz7ZTXg4QwpVy4kwL8UUCP3sgqfo5UuhawEnSU
	gS1QNJXJhTkgOZNduJ3aaBmWGGccekhJvtSl0f5EO2sJAAenPT0Ady7tZJhGULWN8YutOwA/Kdm
	KdL9atQ37LulTQTM8bHAsg6CuI5gQ226PlMyFSWABAhm156bEusPt/n6hJL3SYB/Jg/635recMJ
	w1KWiNL085erEMv/Mh3APTkACP/g3/YR
X-Received: by 2002:a05:6000:3106:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-4abb7787bc0mr41436090f8f.47.1795677471097;
        Wed, 25 Nov 2026 23:17:51 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm39014813f8f.20.2026.11.25.23.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:17:50 -0800 (PST)
Message-ID: <d642f950-6423-420d-927c-991cbb5c2669@suse.com>
Date: Thu, 26 Nov 2026 09:17:49 +0200
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
To: Naveen N Rao <naveen@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Dave Hansen <dave.hansen@intel.com>,
 x86@kernel.org, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kas@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
 <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
 <8500860b-d2ff-45c1-8604-28a2b3d66382@suse.com>
 <awcMnXKDWjTvxumG@blrnaveerao1>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <awcMnXKDWjTvxumG@blrnaveerao1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25.11.26 г. 18:51 ч., Naveen N Rao wrote:
> On Tue, Nov 24, 2026 at 07:57:05PM +0200, Nikolay Borisov wrote:
>> On 24.11.26 г. 19:10 ч., Pedro Falcato wrote:
>>> On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
>>>> On 11/24/26 08:00, Nikolay Borisov wrote:
>>
>>> 2) open-codes random CC checks in mm, which is kind-of regrettable
>>>
>>> OTOH, it's unclear to me why that CC check is needed. If configs select
>>> STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
>>> in iomem_is_exclusive, etc. If not, could the CC awareness sit there
>>> instead?
>>
>> Well, you are right that if we retain just the select
>> STRICT_DEVMEM/IO_STRICT_DEVMEM it might fix the immediate issue. I don't
>> know why eventually Dan decided to also add this check, I guess it's an
>> instance of "fail fast".
> 
> Actually no? On x86, devmem_is_allowed() allows access to the first 1 MB
> area, so STRICT_DEVMEM alone isn't sufficient.

For the first megabyte of memory (BIOS) is return 2, meaning "Just 
return 0, rather than trying to access the address range".
> 
> 
> - Naveen
> 

