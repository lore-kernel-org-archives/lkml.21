Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805751;
	b=AqAwKQ9RYJZCf9FH1VdtBY8QfgPb6l/HoqxjOQS/OhtjYoSoBYVpyMD+ly+Lp0kM22Or
	 jv7coCB8vsD+ualytX9mhHEpUoFa4Xjo7q2vGgES2NLS8EeK70izBBurXODNKRjlm3gkw
	 rFxMLoX0QmOmtDoXGsm4qwVwtE+yyUQaDHaettEoKad02DqYU9xikw4KEm0rhgRqqSkzD
	 awa54Y0UK17mUPgtjdqN2wBQS5EArITybj+UFehqjuktZvEXQVUPO6k6pTdzwryx7f08j
	 dTfbso0CIbHwQNq0hfL4FXb0d9PNNXB7Tavsm2rf7p7EbRMoUjzy+T2C5+sjNe+CK/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805751;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Kk0P4RjBnkUANQ7BOgGeFQVkoBHRZ4qGLab3lxHDvm4=;
	b=JHLtIP+CnerbZJg2tZZa7rpxaByUX9zLEsH7/bNa2eIUwxheAnF9RQ9DLYvMQoxjLMDk
	 5n4y2JNN3C3g/S9Emlw7PBhCiyz+Pht1rhDlznaxCMQuLl3t3W+pwOAYGF040UOLgnp5m
	 FSLXEhR8JDgUD1lGSMR2L5322IlFWMyoNoFNC2+qhN+DBYBTOhMWEUudYxjJ+KC1eMqp+
	 ZqvWRBTrKhWIWcmbInVk6wHgLV4Z6Vzgtr1Yo8fAD/y05k5p+F5FLpYr0mjjsunq9scU5
	 WQo0qTFKqDaLs+Tg5v9OgyUOKU04wCwypCT76dveEnuzuidlwczRVg6ytTfgKkmwDgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WB3S9P18;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1101F606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WB3S9P18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3B31F00893;
	Fri, 27 Nov 2026 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805750;
	bh=Kk0P4RjBnkUANQ7BOgGeFQVkoBHRZ4qGLab3lxHDvm4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WB3S9P18agvkjXrKDgXBdVcq6JGAoKj/Y9IR/h4TZBJzlQD3BQ2kkykmug6PJ4hFX
	 4lQOchnrxH8zl2WR7eExQFReU0eR6nijOcU+EetFP7ENuUDnXnNE5H8X3ZfvOCp4op
	 0jKsDumzQC4tywsGwl3VFYYwn46d8x+TcKa1bm4Rw5huh1sZv3/APrTQBLYwN+v2Jo
	 vrhN7dBTiJRh/Bv/ONbKmxcIltuMRcjHx4BFjU6JWZD+wATwE5cbVIv6OtLSzQRuz0
	 mptppS6nOjVLkHZX3rOpUXSuPJlv8UgwHNtg8XQaJSTHUBA4pILOp8LB/K91Uq+UG7
	 xevJLqjUQybhg==
Message-ID: <43b57ca6-cffe-4fc8-9622-c3e3645d2976@kernel.org>
Date: Fri, 27 Nov 2026 19:55:45 +0100
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
Subject: Re: [PATCH] tools/mm: add a drgn script to show HugeTLB reservations
Content-Language: en-US
To: Aveline Noir <jm5905938@gmail.com>, Muchun Song <muchun.song@linux.dev>
Cc: Ackerley Tng <ackerleytng@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zhao Li <enderaoelyther@gmail.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Karl Mehltretter <kmehltretter@gmail.com>,
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.de>, Omar Sandoval <osandov@osandov.com>,
 Mike Rapoport <rppt@kernel.org>, Usama Arif <usama.arif@linux.dev>,
 Jinmeng Zhou <zhoujinmeng@bytedance.com>
References: <20261126-hugetlb-resv-drgn-v1-1-345a6ee7c08c@gmail.com>
 <FDAF27F6-A5D1-4911-BB86-6645272E2BD3@linux.dev>
 <179578806997.38.3754686117717776990.b4-reply@b4>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <179578806997.38.3754686117717776990.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/26 15:01, Aveline Noir wrote:
> Hi Muchun,
> 
> On Fri, 27 Nov 2026 19:30:04 +0800 Muchun Song wrote:
> 
>> The Dragon project itself probably belongs to this type of script? See
>> here:
>>
>>     https://github.com/osandov/drgn/tree/main/scripts
> 
> Thanks for the suggestion! There was a similar discussion when
> show_page_info.py was proposed for tools/mm/:
> 
> https://lore.kernel.org/r/aACaf4_molKromnT@telecaster
> 
> That's mainly why I sent it to the kernel tree instead. Having it close
> to the code it inspects should make it easier to keep the checks in sync
> as HugeTLB reservation accounting changes, so it felt like a better fit
> here. What do you think?

IMHO it's better if the support is part of drgn itself and can be adjusted
with kernel changes while still supporting older kernels at the same time,
and automatically detecting which scheme applies (not from version, but from
what fields exist or not in the relevant structs, etc). Like e.g. the crash
tool does. Yeah the scripts are then more complex, but it's much easier for
the user, who doesn't need to fish for the right kernel version's scripts.
Which may anyway become out of sync because nobody notices, and are only
fixed in a later version.

> Thanks,
> Aveline Noir

