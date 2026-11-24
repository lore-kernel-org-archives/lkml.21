Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543029;
	b=riw6L65ZIgjEBvOxgfeWd7zxbsHXY8kMwZ9n1uLv+7NQGLlRL6svMrRRU9TWsLuOFnbG
	 ABHQ9ly1ffz9vFoexAYArTLYfVj+btOOhwkYYLtkWrVS9aYmVPh0Q+dVj6rW8aurDrFPt
	 FatI2WoD6DoK1BsTqZtqcGJX+Jk972IlhkqRPxAS+XFRqFYHAa/JwkECXRapByigs8rtj
	 NckonmFohAczfyPOB6FftRLjXNOLDPIrcfrIk3Pm/0RC8jaFzvRw8fFUn5xwHArPxssT4
	 NQl+l0TntqjLbqTasU8lleEwthZd+I38dPP+aLkt8yCKpQpPCjoGVPq5O9aG3dIE+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=icWoxjPKMdK2zuS82/rLrHvg+EKrMTW6YtEm9PqDifw=;
	b=FCHgk1W1PMQDbGq/ObX3HlR5b/SMZUCdAl5qjrqzEZ1+LAJ81s39ZagWP+KMiG6gaiKI
	 AIuPm2ouCZwG3Lrvp7sUQgJQa33pn6iwE87e9+DkQEq0r3ntpVPLPJaBW2hWkTmRYVEKe
	 9D1WKKTlMT3Hw6pWfr4tm+zRMnfsvZd7CKkj4Hmg3cJ2pSHy15LQ5xItWgEiMTJNRzDF0
	 fuuBsFXgL3HRSAR+ATDdJ82ZCABqX76zUuh6BQBb6JF4k9b8R18O8F5nUZpaxk1uGT24I
	 necusb1jerH8hXDOafqIoVp/58EKGqN+b74XYRpEWJiDyrHRxCTyCJ1L1hIOH7TwHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TC1kV5af;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40110606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40110606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TC1kV5af
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso802314666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795543027; x=1796147827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=icWoxjPKMdK2zuS82/rLrHvg+EKrMTW6YtEm9PqDifw=;
        b=TC1kV5af51AcLN/tTR0k9PMzEj1uRVsvMtVTQUeb46TaJc+c0MCt/OS969l6TIO1Rl
         vguq4E+qrIFkGsxLUIkRc9DgGxPCFx2Gx29N+DJXN8aMWgJhU3QjenfJ8xF6NbU1OJNT
         S7qSzfyRTgbsLcaSdOknIYEAfSyL5teSKRXjzWun+z+HkMJoL39s+x0wmnQRNABMhuC7
         W1bIekVryjpXWERTHLxr9+QGvjZVcX1t7lLem4e9S/Q2Lj7HhPeTSOEU0XfTXdVnhoNd
         0M51THHjFaDkgh10v74UvExOK2+MNCqlZdoXt+PgkUZcP9YkrJ30rmgAEP0ackf+4/9T
         gUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543027; x=1796147827;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=icWoxjPKMdK2zuS82/rLrHvg+EKrMTW6YtEm9PqDifw=;
        b=BCGR8X+P6D05dFUc6Ts2Egn/K3BfYW3EXysGOoxf8645N7VUp+R9WmzKxG7O3jZfgl
         AUqaaAQ+voxk4Mggix5DgGkbVcmeuur5SlnRWIknT7cj8l7hiOqihCVTNlmwkJ0knCO7
         EIgUW8+4KuT3yFrfKtLG/S0vGFk8y9eSAQ2d5dJgv2U2qqu0yGLzJ6nZKeH9EHVMHQG+
         YH0P/bwVfN1dcidqSn3LEkaOQSZzYXja2cUfksclp0egssb+zD8czQsWQBPvR1nJxnf3
         54joE9lQY8tO823RI7GbWye8pyPJ4bwms5klvOlbWNgRF1ugtoio229DFM0r5PbY514W
         NFkA==
X-Forwarded-Encrypted: i=1; AL+hErEle02fRgNv9WRR7TcE5exEasCKhNQ69bxooBBzz2t8ZfJvEc9fTY3J6gkZuYzOTxThQkk8J1L89nG1PuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zeq9POcQQEfwoKJwJmbxCCbdaCwQXHV8/rkQ/jiitFXnE6aRi
	7FpH9eOLtM7+QTaFWf65gtdrdk3HLyn4DX4kmvXa3NnBJeVaw5ZWOTu83icyfJvIjPY=
X-Gm-Gg: AZFdTZexo5xwglLQXr1MyqLEZlaFXzXeettYy6TpD432VEvxbB3fW2NWKUgCOqcKbdC
	9myRTxQAX8UMLs3wTRzT7u1UB9rKcM6nlT56ukR6Xs+LpXaDWgIqb+Iok6sTlrKuAXwf79N82d/
	LQiBiG2WqSGP2T93vuU7im0in/42hF2L9DmpZTS6JtbqV0tIaurAgLrde838P5bwoDGBWo7ep5L
	37uafP44/F95yhmgigIn8ZQIBI3vGIolNucZvyjPmASdBSOR1dl0AzoVy4E+/bcjJqcee12S9n1
	hNA3PrpxvSLwMuLfyMQvVQXBU5jiKMG4iAqMy9/47LJvYEno5cwfTJS1vI1+BMAFyjeaPzYBtg+
	M9j6ojY/00fYlz8LaItQQN6zkKBcAfXnihcktszFgVB76fmnWIJGxPSjL2tlYWarcn9V6KtxHcg
	eJD4iS42utupT93tpkpr2CnrvxtwcbvqEMJTt9W2gLuS5ZxPwvPc0kXWKifsvIWC6IDge73Xfpt
	uXdTeHrUG/v3Nd1R05lppLNfViwNEy7DcSUqGbbsk5spFeSYkl7t602+9hyUOZLyovsiq9eCRZ/
	ZbZ9HOSPLRy+ZC9t+/qhyyiLOR07PK5I
X-Received: by 2002:a17:907:1187:b0:c49:903e:1e19 with SMTP id a640c23a62f3a-c513a8595d0mr990271566b.26.1795543027309;
        Tue, 24 Nov 2026 09:57:07 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2d97sm541021466b.59.2026.11.24.09.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:57:06 -0800 (PST)
Message-ID: <8500860b-d2ff-45c1-8604-28a2b3d66382@suse.com>
Date: Tue, 24 Nov 2026 19:57:05 +0200
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
To: Pedro Falcato <pfalcato@suse.de>, Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kas@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.11.26 г. 19:10 ч., Pedro Falcato wrote:
> Holy cow the CC list is stale.
> Fixing some up.
> 
> On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
>> On 11/24/26 08:00, Nikolay Borisov wrote:
>>> Resending this with the hope of either getting it accepted or
>>> arriving at a consensus what exactly is missing so that I can take
>>> it from there and eventually get something merged. As previously
>>> mentioned this results in real problems for confidential guests both
>>> on TDX as well as SEV-SNP.>
>>>   arch/x86/Kconfig |  4 ++++
>>>   mm/char-mem.c    | 10 ++++++++++
>>>   2 files changed, 14 insertions(+)
>>
>> I'm still OK with doing this.
>>
>> But I didn't want to sneak an mm/ change in via the tip tree. Any mm
>> acks or naks on this?
> 
> For what it's worth, I don't love this fix. Yes, it fixes issues in /dev/mem,
> but it:
> 1) skips any other potential problem spots (I don't know which)

Well that's not saying much. Of course there are thousands of bugs 
lurking around the kernel and not any one patch fixes them all.

> 2) open-codes random CC checks in mm, which is kind-of regrettable
> 
> OTOH, it's unclear to me why that CC check is needed. If configs select
> STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
> in iomem_is_exclusive, etc. If not, could the CC awareness sit there
> instead?

Well, you are right that if we retain just the select 
STRICT_DEVMEM/IO_STRICT_DEVMEM it might fix the immediate issue. I don't 
know why eventually Dan decided to also add this check, I guess it's an 
instance of "fail fast".
> 
> /me doesn't know much about CC other than *if you touch something you shouldn't,
> it goes boom*
> 

