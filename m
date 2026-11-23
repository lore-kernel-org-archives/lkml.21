Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412745;
	b=wP4yjWiSN0SAJncypwInOnpgJLcpCuDmOz1h8cyY1YM28crONEcOUJNrDcwUl887QIhA
	 8k4rNB2lG35lD/mlERV0bzHxmWnJ9anmXts9gX5MW/PRKNrsx1+ZjNvTgJ7dLoDmc1EHz
	 oqLxlCREUxzE1YkJ1lAZ46A70nkdO9tyVfU77g+kVbAbbrAeJskZvwjdXECJb05Z08ZQ6
	 +iIbJ1RNyQxwuAosgKKYh8Jw7QrUpXZjM8Jkz5JqMMtQEhrik5r6jyCzrgwbA0yh7hxvp
	 d+WpkZ4uceKKMFYPgcTsbGfV0VKcvO5UWfQ6QXL/2zpTkANJm4t4/oGIR7s/FNQZEaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412745;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=GX55jPF+fKXW00sTxIqLc+Pma2dEmhfNWqv3JUsMNrI=;
	b=waIUCZnMpwHqFt3yJ+s0rytKV3y/plo4oNlFSVQIrYqRubxeIEwrarzwdXHR5WhUkDn2
	 pYfc8qYGyLkwE6esVrLWA0y7OqMmSrYKYouWDDtW4ZlOydHYrahYF/iHbDLNxVPJMdL+r
	 EugfGI8br0x20fphXH0A2FjoduQmrxbvS9g2zu1u3rJ3afNke6xq5XgsgCtgBRR3NTDPR
	 V051TiwOYLMBdJ357YHkpFM7QhMXCKhFwNvcWGBVahTLuMnRJpsKWBfIoJRBUJ0eCH78Q
	 rXQpSCEEJ+rpTIEXWpI2T0R2tO42w9r3vEhIekadlFx24zQrsxrQGFtFSmKavYHHSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XTSu54ZG;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66C6606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XTSu54ZG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=GX55jPF+fKXW00sTxIqLc+Pma2dEmhfNWqv3JUsMNrI=;
	b=XTSu54ZGN4TH4OFNy5hothbeMtXpCVmhayR9eyKta/pCJ6iR6bGi2h6tlSvdrA
	5avxJZ5/tcuxaLby1tJ2RdW5N76/ex7HqnpiWIJWZG7VD2PEE3RfP/n1c/T8mjUO
	USdFBMpmjOyrRAxC4JpZivDWdHTxkQ6skItU0MSKphqXU=
Message-ID: <56dc7b93-604c-49bd-9e86-f519c7a90b97@163.com>
Date: Mon, 23 Nov 2026 13:45:06 +0800
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
Subject: Re: [PATCH] mm: shrinker: stop counting when the seq buffer overflows
To: Qi Zheng <qi.zheng@linux.dev>, akpm@linux-foundation.org,
 david@fromorbit.com, roman.gushchin@linux.dev, muchun.song@linux.dev
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261120110538.3256962-1-wangxuewen_ky@163.com>
 <57ef6b0f-e9eb-4484-b07f-63c848ffde4e@linux.dev>
From: Xuewen Wang <wangxuewen_ky@163.com>
In-Reply-To: <57ef6b0f-e9eb-4484-b07f-63c848ffde4e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCnJhLj0gNr3HKiHA--.56468S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWrGw17uF1Utw4UWry8Krg_yoW5XFW7pF
	s5Ka1jya1DZr17WwnIyw4xXFyYyayFyrW5GrnYqrW3ArWrXw1Sq348GF1Y9FW8C395Gry0
	qr1j9FyDWF4kZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j49akUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQSJcmsD0uRIXQAA35



在 2026/11/21 19:10, Qi Zheng 写道:
> 
> 
> On 11/20/26 7:05 PM, Xuewen Wang wrote:
>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>
>> The shrinker debugfs count file uses single_open(), so all memcg rows
>> belong to one seq_file record. When the buffer overflows, seq_file grows
>> it and retries the entire record. Queries for subsequent memcgs in
>> an overflowing pass cannot contribute to the final output.
>>
>> Stop the traversal once seq_has_overflowed() is true, using the existing
>> mem_cgroup_iter_break() path to release the current memcg reference.
>> Leave the overflow state intact and return zero so seq_file can retry.
>>
>> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
>> ---
>> In a single-node KVM guest with 1024 cgroups each caching 16 ordinary
>> files on ext4, the 8865-byte output required three show attempts. Count
>> callbacks fell from 3075 to 2472 (19.6%). With probes disabled, six fresh
>> guests per variant each performed 101 full reads. The median of guest
>> medians fell from 128.2 us to 112.2 us (12.4%, about 16 us per read).
>> Small and sparse outputs had unchanged callback counts. Complete output,
>> small reads and seek-to-zero rereads matched; concurrent memcg deletion
>> and signal interruption checks also passed.
>>
>> The successful pass still traverses the full list. Early exit skips
>> count queries for subsequent memcgs in overflowing passes.
>>
>> When overflow coincides with a pending signal, the original code can
>> return -EINTR in the current pass. With early exit, seq_file attempts to
>> grow the buffer first. The retry can return -EINTR, or buffer allocation
>> can fail first with -ENOMEM.
> 
> Would something like the following work instead?
> 
>           if (!memcg_aware) {
>               mem_cgroup_iter_break(NULL, memcg);
>               break;
>           }
> 
>           if (signal_pending(current)) {
>               mem_cgroup_iter_break(NULL, memcg);
>               ret = -EINTR;
>               break;
>           }
> 
> +        if (seq_has_overflowed(m)) {
> +            mem_cgroup_iter_break(NULL, memcg);
> +            break;
> +        }
>       } while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
> 
> Thanks,
> Qi
> 
Hi Qi,
Thanks for your review. I've modified and tested the patch following 
your suggestions, and will send out v2 shortly.

Thanks,
Xuewen
>>
>>   mm/shrinker_debug.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
>> index cafb566301326..3022d103b0b1e 100644
>> --- a/mm/shrinker_debug.c
>> +++ b/mm/shrinker_debug.c
>> @@ -74,7 +74,7 @@ static int shrinker_debugfs_count_show(struct 
>> seq_file *m, void *v)
>>               seq_putc(m, '\n');
>>           }
>> -        if (!memcg_aware) {
>> +        if (!memcg_aware || seq_has_overflowed(m)) {
>>               mem_cgroup_iter_break(NULL, memcg);
>>               break;
>>           }

