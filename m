Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562925;
	b=Yt3aTdizLf+HhHhCEMB9j3lVWWo4rqwNMPqr8UcJO3w89SLmB8wJnbjgHiRQQVdne9Bw
	 h6yfc2diPhM+Npgb99KhusdPXCJ0ryp2Fu6jZoReZXdSsihgUWkj1PI/MDrucVybOpNNg
	 8vGM8DYUv9mL9xUe5RUCl7fzxFiAyJuFTX2Rxidg96UDF6gL8pSz3/0n67yFyaUgnz68s
	 D9avhvCV/CLrkrP8MGjQwfmsCkNp3goITNhDiqj7G9NPClO01QUuth8iiY7c4CzKbkKzL
	 Z0KlmvIfwFOThxybLs48tPVnw21ly0URzYENXU5t8LEL8zUlni+A9or0kMbGzDFULyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562925;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Bp7vbYZqgnJSbea341jrZg5sveSuhCAR0xNbFY7zOp4=;
	b=x60+xdwnHM1ZLLItZN+97NfuupFHA0z7UPTnUo5jxMzYRfz9U3UXndrUAO2xhQjB3CrY
	 jpHbytFmS+HtnxVZP8NaI5zhb3PEz8d3rB+uqwPOCmuyl1df0X+AYrz4dOokslcu59FV6
	 7YA8m/Y7Hans6YsfXyaGWVtllDzZT0P3cC4smGgdQb3/gEaZcCbpl/JVpfohbveS2Kp/s
	 7jCnqCmdjhtSI8loOp9LWLflvHkD2H1wtiuLTcB9w5vZRzix+wfEu9zBMkvUtTzSj8RLu
	 HjSTO28yi06zXv5c02KOMjUHXtWSbmuT49sUsgmRJ3RXjAdLAJVCGNHVFTCRnEHlvnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YkHccQtu;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF93606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF93606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YkHccQtu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nPjM6DQ6Wy2VgjwnrWH1igbk+eR6QyexaJnli8SHASY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795562923; v=1; x=1796167723;
 b=YkHccQtuvRtzfa6pi699HYwBTfxxyiGITsdl+eqA55s4pDLsoAHncTkdo3HOlQJLOTiOcp9+
 31KWt2YV7CbnMGxVddQf3jZpB7O4zwInN0dm0wzP0pola5duJWxBlgvhGuCJDiilDKdexWnuC1g
 /BXcTw6nGS8PlV7WJLye//Gg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a5687cf46e03fba8;
	Tue, 24 Nov 2026 23:28:42 +0000
X-Mizu-Trace-ID: a5687cf46e03fba8
X-Migadu-Flow: FLOW_OUT
Message-ID: <b69a5619-87bd-41bf-9125-95f17f232c62@linux.dev>
Date: Tue, 24 Nov 2026 16:28:38 -0700
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
Subject: Re: [PATCH v3] mm/ksm: prevent zero-page remapping during
 ksmd-triggered THP splits
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261122-b4-ksm_fixv2-v3-1-f78ea7779746@linux.dev>
 <27c7a176-cd38-4e2c-b2e6-ad63b79ffc07@kernel.org>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <27c7a176-cd38-4e2c-b2e6-ad63b79ffc07@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/26 9:33 AM, David Hildenbrand (Arm) wrote:
> 
> [...]
> 
> 
> 
> I do wonder if we wan to make this an inline function to not require a function
> call just to check this.
> 
> Thoughts?

we would have to also expose ksm_scan_thread; tbh im not sure what the 
impact of that is.

> 
> 
> Probably helpful to throw in an unlikely() and to to reverse the checks
> (checking the latter is cheaper than the former).

Sounds good! ill send a fixup once we determine if we want to inline the 
function.

> 
> In general LGTM.

Thank you!
-- Nico

> 

