Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598133;
	b=5grOL46DRxHpteXyrPp/XvoN94bJBhOITupH2To/a2XnCo5v9vu+LoS3YHIgM2TQ8ZE3
	 1VBORNKLAla/i+J1b6zpmUlCGvpzqcSYnQIiq+mo2lJWkapjijOgTrngKK6JrgWQxoCQs
	 5Gg2zsDVf7IyFNHMcNK3nYHDwsAfoloq5qb2BbSu6li6tp3RsoAiCjNO04el9TmdWV+I/
	 NMLHq1feaVeqm9XDKuq4UdkNtpqODul8RJG36vwqFq6wgcTAPvXRTZGvEGSXRVL2SD9Kh
	 MmptafwS4iptvrE0axG95bE4jMcacE3r9wcJ0f0ZNn45QryN/pesHpR4tgsPdfBCglg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598133;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Uxn3jxNdlE5+3G+0a/jOfGNwju6eb5abMXfzyttYx/I=;
	b=gqtTp8huPBJyzdq+NwpeG7QxHCwE/3qEC3lCePTgdgcsyxD8XrO1QmLS4PrAuFLC0Fwa
	 r2y1nUMBxYM9SLt4uQKb7JvppKtv8qw/aobsUCjStidv8sxVmzjkYkOy+6Pqm7XN5SZi0
	 QRw85TrjFCXPI7ZAKPJvs03HL9hrTfIQL5XPD8xE/DHzCe6qviNZjiojG+wuihBZ8oOID
	 wBj17P0GOud6ucnnCnr7nnIbnSU60X3Bk2/1so0OAjlj9KDwF+22tsXvUx6UFyiFbWpSk
	 huqipkxBt1TdEv0XMb+SfrLBosCZ4jB5yvbVgkyjn4EO196cdVxXEtNgiZCaw5u3mww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FQBXh1gs;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EC2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EC2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FQBXh1gs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Uxn3jxNdlE5+3G+0a/jOfGNwju6eb5abMXfzyttYx/I=;
	b=FQBXh1gsaj7wA1AY0uC5hnMdhUInKaGZN5DgzUSUA5PzR5R2NzUw1c82gXWs1j
	WrKr2XBNHi4cV62xghVsCLd8VjFP/afu5nQw90lyK8zjp4pcs+ysSkIyuzT10T9B
	hnS0fAmEvHQn7krH1HJoS4n9AUTvc6PuPJhhrfuUF3zpM=
Message-ID: <dcf71430-9c9a-4b41-a36f-4af2549e3683@163.com>
Date: Wed, 25 Nov 2026 17:13:57 +0800
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
Subject: Re: [PATCH v1] tools/mm: page-types: flush pending idle bitmap bits
 after walking
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, sj@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261118021253.1691428-1-wangxuewen_ky@163.com>
 <20261124184653.d6e1d627154d526e6cd85d27@linux-foundation.org>
From: Xuewen Wang <wangxuewen_ky@163.com>
In-Reply-To: <20261124184653.d6e1d627154d526e6cd85d27@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P9XVpgZrYVVvJw--.49914S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWxGr1kJr1xZw4rtF1fJFb_yoW8XrWDp3
	yYka17Kw4ktrW3GwnxAFs7AF1IyryfXFWfGws3Ar98uF45Xry2qFWFgry093W8Wr4fCF12
	vw4UK398u3WrZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joSoJUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8BY7JGsGptaFlAAA31



在 2026/11/25 10:46, Andrew Morton 写道:
> On Wed, 18 Nov 2026 10:12:53 +0800 Xuewen Wang <wangxuewen_ky@163.com> wrote:
> 
>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>
>> mark_page_idle() buffers bits for one 64-page bitmap word and writes
>> that word when a page in another word is encountered.
>>
>> walk_addr_ranges() tries to flush the final word by marking PFN 0.
>> If the last buffered PFN is below 64, this only adds a bit to the same
>> word and nothing is written. Otherwise it writes the pending word but
>> leaves an unwanted PFN 0 bit buffered. walk_page_cache() does not flush
>> at all, so its final pending bits are not written.
>>
>> Extract the write operation into flush_page_idle() and use it both when
>> changing words and after either walker returns to main(). Clear the
>> buffer after a successful write and skip writes when it is empty.
>> Place the final flush before the no-summary early return.
>>
>> Use 1ULL for the bit mask so shifts by 32 through 63 are also valid
>> on 32-bit hosts.
>>
>> ...
>>   
>> @@ -1364,6 +1373,9 @@ int main(int argc, char *argv[])
>>   	else
>>   		walk_addr_ranges();
>>   
>> +	if (opt_mark_idle)
>> +		flush_page_idle();
> 
> Very minor, but we shouldn't exit(0) if that flush_page_idle() returned
> error?
Hi Andrew,

Thanks for reviewing the patch and pointing this out. I've updated 
main() to return EXIT_FAILURE if the final flush_page_idle() call fails.
I'll send v2 shortly.

Thanks,
Xuewen
> 
>>   	if (opt_list == 1)
>>   		flush_page_range();
>>   

