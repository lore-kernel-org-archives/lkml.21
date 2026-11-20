Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163923;
	b=2ICr7U/QLU3h1of2lIpQ201w4uhu1VDOOFuFFFaLGTC+oBl/tuIGT5lA1Q0kzvoaO+Ml
	 3ZRCeOlTT6MPufQI6/diRekLWn9wqdGnz3I+lYxbw+ooFU/BHKB4ul0GmonvP5rlfxLe9
	 +t5ZJWwVIR+Fyo3uIDeCgbsIEDI4gV5xIoz2NnHNDjclhbA11jiVBaak0v6B+G4CpEtYP
	 +Jb9SZoxJMwU8gQTyrLaRtLWqZZ71I7W44I4+RTzif2Pgtar8G1XcWLV/VSQ5UuzO3u35
	 EHfuR1ElS5FDMT49VDP2OZt58M7ldI7chgcqQuHg/uOjZRb7IuKsQr9Z/ZRlcZ3TpQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163923;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=h/gr63NDQYXLIZ+49BGD0eSjl21BN1D6Jr2bHaDtoZE=;
	b=V3GKLWbefgRK+bqMcXmn6287qWvavPU2fQV01UioD1bp6BLppeCqZGi9c/iL19XYa/d+
	 lU5xlIFA6Pn1lYVYnU0skj/6nmuKiFd5lzIU3KhiAivxIO8xIubZSO+lanRqkFiwQUCOC
	 hfVzsuBvvWWyVYp6vAVvZVP/DVYBm+2u4qXCatXBv15FOy/MeUkLnUZp3j6+YbB8dUd4d
	 VcP31IxK2sH2XRAiAh4+NTAe52bnTdXLXUnqle2+hce9Lc+wfE0TY7JtdiU4jz+Qcc0Zz
	 buJCPAaolo6AIwIooCwyeKiaAA0UiDJC5/htcH6EfHbjIqKuxDC9jhWfXyQxLSk+hxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN7xfZxY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88933606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN7xfZxY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF6B1F000C6;
	Fri, 20 Nov 2026 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795163923;
	bh=h/gr63NDQYXLIZ+49BGD0eSjl21BN1D6Jr2bHaDtoZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IN7xfZxYM7VZTd63vDaEyaPde1kWVU9sZKvRx6OcYGVAS2uqsLW/DHVo5hiwihqHc
	 MyCPWPo37Aqbk8VbruxIijn8QZa9N/VsSIbHaSL1vVWDs/Ldhzec6eSilUvOH+hnmq
	 OD54nyqcUMmvOFcWm+Px42z/wy03wFGwTuC2zcKJyTMGiBluN6ofFfJgh/O/zMxVM6
	 X0mKexouooArQNuFO3X5DqQu7V4z05HjCU1gccjEmrI1N2IWLmO+zasiv4bBQTpgMG
	 lK4s/q52tmMA6YbsK+f9wzwZXehUK9zepDkOI0i/Tykx8GxFlmcIy+A7CEZFEl0ukt
	 GvFl4kGVIXOug==
Message-ID: <da01ae71-8b99-42b3-9a46-d7e39c1eb981@kernel.org>
Date: Fri, 20 Nov 2026 09:38:36 +0100
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
Subject: Re: [PATCH] mm: skip temporary folio allocation for anonymous UFFD
 missing faults
To: Avi <thnkslprpt@gmail.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, akpm@linux-foundation.org,
 rppt@kernel.org, peterx@redhat.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, liam@infradead.org, mhocko@suse.com,
 surenb@google.com, vbabka@kernel.org
References: <20261119180015.933433-1-thnkslprpt@gmail.com>
 <av88TW3GQRvXJDwA@gremlin>
 <CA+jvY9E3XD5mJZ7V-+6HFxEkY1FHNGom42F-nxMZNGtOy9POqA@mail.gmail.com>
 <8e56f690-7031-4a57-abdd-a02c1c94782a@kernel.org>
 <CA+jvY9HQp6iDPGDTuVqrQNnw0ENDDq46_AwZqzcjXNcyFWqPsA@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CA+jvY9HQp6iDPGDTuVqrQNnw0ENDDq46_AwZqzcjXNcyFWqPsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 05:20, Avi wrote:
> Hi David - the real motivation is very simple - avoiding the wasted
> allocation (if possible).
> That's it.

Just to clarify: we are all right now completely under water with fixes.

Optimizations "because we can" are not heplful. They cause more stress on
maintainers and reviewers without possibly benefiting anybody in practice.

But that's nothing new: we always required a good motivation in order to spend
our precious time on proposed changes. Because maintainer+reviewer time was
always a limiting factor.

While your changes might optimize some uffd workloads, they make the kernel code
more complicated.

"Because we can" is not sufficient motivation to do that.

IOW, if you don't actively run into a problem, there is not actually something
broken, or you have a real use case that needs solving in core-kernel code,
changes are high that your submissions will be dismissed.

Because we simply don't have the capacity to engage with that, sorry.

-- 
Cheers,

David
