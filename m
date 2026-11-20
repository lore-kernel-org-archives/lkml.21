Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167131;
	b=WEDuPSZ6Il7tAsKpVAOqTOV0H0BLhFgsAhRpuVZN2VbT/xpQK6KHWV5fJ8Q2Tlk3R+r8
	 9sejKFLjqTXBJL0DsT2uP7ADoEhDs9aEqACAN1vbDtuhD2fyr1IP+zVqeho/MssbY3tmX
	 fETyJwCPc+dYSrzK0t/IDsvImr2R6aXKhj/G1sW88/maYyEB4vla2+b8b8mIefs87Bozp
	 KXtaxZGGCKxiTzpFDTk2XgpCReQ6FEPUhyyQN/4LN0rNeAXpI9EA7ogKnK5OJT4HTEoo7
	 nuHVJzrXPOydLuvnOp81sb3gvNwE3w+yU6UYwiwYv/VzNw+1eyUGZiKG5jT+WSiKYSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167131;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MSB4v976klsbBf90H4eh8WMDP091ijp/LUuy+yy+YWo=;
	b=B+zGnZvK41q9ScA9t8rd0Rmzf3qpdAghDshUyyzDNAq6uC70As93v+Q7GIzKIM7occLE
	 zLkVysJjtv0Baq9PR8GcqWML0MiiWfaMPP3XBidr63Oy0tLn+vANXmSLEAKl+HVed3HTy
	 o/fvUzKUuZLxXj5JlxisMGgg9MrHhbpIdPeR+999itun0lr0WKrg69StAykMiKN/6KfX5
	 tSru3xNOqw70d4Y5wMVv/DgJnRPwbfhOq6V07tdmSw2snzd1QGLPOWLy8AjaVDgYEXDMk
	 yzkt9yZ4GIoozzP0Kc7HP8FBTaFXgiMo8e4n/JRltxY0P5eRU2lNi6+11wzshKf+JtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGojT1pX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3936E606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGojT1pX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB451F000C4;
	Fri, 20 Nov 2026 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167130;
	bh=MSB4v976klsbBf90H4eh8WMDP091ijp/LUuy+yy+YWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hGojT1pXLm0ARgaNzFbFL04UU8kien9rUf3A2JXL5vIP/AZMP4XCa6PqZHVOTkzl3
	 Kbo2++p0L5+OG6Eu1wwXm4m+du4rVCua+tRUOr92Qm+61aw/WeZ5G+r62F1UbaLBCM
	 WWM+7kt1N5lVCRMPtHaWDULUSA1Cu2RsSqFOKdoNDFfajKT8gFUJg/3GIXokJhqIk7
	 0eSDk5PphEeCCSsW+lFAT4d3putSLevVPyNAa1cW62Xhx/eHgKw+vn7qygQdZuS7GK
	 HP0L4Q7nWAEpbQo3KM/vV8DOdLn7qD2gK49wT2zk47eAtaHcSUG5x9Ee/eEjoOFXM1
	 WmPf3pA/ty+rA==
Message-ID: <857f5928-5aad-4e15-ad45-f8701e064c49@kernel.org>
Date: Fri, 20 Nov 2026 10:32:05 +0100
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
Subject: Re: [PATCH] mm/secretmem: Keep locked memory accounting until inode
 eviction
To: Mike Rapoport <rppt@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Lorenzo Stoakes (Arm)" <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261030152407.113568-1-pocj8ur4in@gmail.com>
 <45ce0b42-d45a-44e3-b300-607989e618c5@kernel.org>
 <av6m4wU7iDOGviIa@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <av6m4wU7iDOGviIa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 08:36, Mike Rapoport wrote:
> On Wed, Nov 18, 2026 at 11:59:57PM +0100, David Hildenbrand (Arm) wrote:
>> On 10/30/26 16:24, Baek Kyu, Kim wrote:
>>> A secretmem inode can outlive its original file. An O_PATH descriptor
>>> opened through /proc/self/fd keeps the inode and its unevictable folios
>>> alive after the mapping and original descriptor are closed. The file
>>> release path nevertheless drops the locked-memory charge, allowing the
>>> same user to reuse RLIMIT_MEMLOCK while those folios remain allocated.
>>>
>>> Move private-state and locked-memory accounting cleanup to inode eviction,
>>> after truncating the page cache. Keep secretmem_users active over the same
>>> lifetime so that the hibernation guard covers retained secret pages. Let
>>> iput() handle file-creation failures and tolerate an inode with no private
>>> state.
> 
> I don't like the last part, see below.
> 
>>> Fixes: 97d34aa65c29 ("mm/secretmem: properly account locked pages")
>>> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
>>
>> Lorenzo, Mike, this problem seems real to me. Can you take a look?
> 
> Yep, it's real and the fix is correct.
>  
>>> ---
>>> On an arm64 QEMU guest with an 8 KiB RLIMIT_MEMLOCK, an O_PATH reference
>>> retained two secretmem pages. The baseline dropped the charge to zero and
>>> allowed a further one-page fault; the patch kept both pages charged and
>>> rejected that fault until the last path reference closed. The Image
>>> was built with KASAN and lockdep. Hibernation, other architectures,
>>> and long-running concurrency were not tested.
>>>
>>>  mm/secretmem.c | 31 ++++++++++++++++++-------------
>>>  1 file changed, 18 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/mm/secretmem.c b/mm/secretmem.c
>>> index 384f5cfc457f..fa8be360bd2a 100644
>>> --- a/mm/secretmem.c
>>> +++ b/mm/secretmem.c
>>> @@ -185,18 +185,14 @@ static void secretmem_destroy_inode_priv(struct inode *inode)
>>>  {
>>>  	struct secretmem_inode_state *state = inode->i_private;
>>>  
>>> +	if (!state)
>>> +		return;
>>> +
> 
> Its really not obvious how we can get here with state == NULL. 
> 
> And since it is needed only for error path in secretmem_file_create(), I
> suggest rearranging the initialization so that we never get here with NULL
> state. 
> Allocate the state before creating the inode and adjust error handling in
> secretmem_file_create() so that we always get to iput with valid i_private.

Ack, Kim, can you resend (putting me on CC ?)

-- 
Cheers,

David
