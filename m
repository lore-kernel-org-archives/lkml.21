Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433580;
	b=jb9gbsFInMnHu47e+AXJqfYd/7L6DTyQeDK7cYtYD+5ex7nqASWK+U1E7zyGzerNb6Qd
	 OP0EhiS/y+XlMrIvvmH/ZfthSWT2MILtIby3DhdSqWQxhWha9Pg5ALxGujIRR2QuSA82y
	 L6zTIlwJBkBPOum7vkn9l0ANCDs0kOKSjEnC4mVYL2CXpk4T1s7rRL1R3U/brzoTUk7uW
	 qRyZqFJjuaPLQVfHdb+UDPE0AHOMLELCI4lq/jn3hj7poAQrnEvnJZgH843g0SGT6ruwT
	 AbczI1ziNFIYO/HhD3JpiNcYOUAFQl69alAUPMaKgKQWufWdFrHhv5GoYoYdLVMW7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433580;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=g/yjtbcg5So+54TQQrwZaOAyU8C7v2qrotK0MDLGBlk=;
	b=Kw0WmMruGiFKZh/9WHti09j2jx28YFRZalR4DlLRaNHiuOisJ9I0ICA8ybB5iCNUbP29
	 Fvi2FELh2A/DBgsFsGVETIhu0H/wNJw3j7uF4SvAWy2fY52QGgwBYCMH5mlJ5Ohkz21Vu
	 WzWpi1PRXFJS7zZ5xda+bHmesYC0GCfKuDbArc1uigOx3ZecNAUiFniE6iEqgr1/npIuQ
	 kMlU7Tii3/zSOdFYTCMadpozwfC4C5rKPZkrJ3t642CEfLOFzVYOwJGx5NGxTmt91d3b+
	 Xjk3KvIwe7dU1/et4GUxaH91emrqqY7K33xbdgMd2xxZZ6alEg7jQlv9RT/5bUdwYhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WTrfVq08;
	arc=none smtp.remote-ip=95.215.58.174
Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7E8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WTrfVq08
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EJgnsJKgFUNVuWQixFdvu+2zJ14nbsStpxGkd+Wpnts=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795433577; v=1; x=1796038377;
 b=WTrfVq08LkZEOI1ZPNilLy/If0IKJhvvY/gDlg1LlJiC047SiyuW7EevjWWerKUAaXJb20BW
 cnQQ5/ESEek/bGeynjCYTAHQulDaSQ+WXJU1qH+7/+981YeFj8iUirRy0V1hvXtHOB3ex+OHPgn
 r96lyXxIb4XkD4p51F62HMNc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6b58d3fb24c8c492;
	Mon, 23 Nov 2026 11:32:57 +0000
X-Mizu-Trace-ID: 6b58d3fb24c8c492
X-Migadu-Flow: FLOW_OUT
Message-ID: <0e30c5c2-b9d0-40ea-b7f9-af9a8854bd58@linux.dev>
Date: Mon, 23 Nov 2026 19:32:48 +0800
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
Subject: Re: [PATCH v5 09/11] mm/vmalloc: undo what vmap_pages_range_batched()
 mapped on failure
To: Suren Baghdasaryan <surenb@google.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-10-hao.ge@linux.dev>
 <CAJuCfpF_=KV3ArFO5LtMjc4EGMr79tX_tX2K=YCG_JTvC51OfQ@mail.gmail.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpF_=KV3ArFO5LtMjc4EGMr79tX_tX2K=YCG_JTvC51OfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren


On 2026/11/22 12:13, Suren Baghdasaryan wrote:
> On Sun, Nov 15, 2026 at 11:14 PM Hao Ge <hao.ge@linux.dev> wrote:
>>
>> vmap_pages_range_batched() maps the range batch by batch. When a
>> batch fails, the batches before it are installed, and the failing
>> one may have installed some of its pages. mapped_end follows the
>> end of the last installed page, and the error path undoes
>> [addr, mapped_end), never past the point where the walk stopped.
>>
>> The KMSAN metadata is set up for the whole range up front, so it is
>> torn down as a whole when the mapping fails, like in
>> vmap_pages_range_noflush(). The only caller, vmap(), also calls
>> vunmap() on its error path; the double teardown only walks over PTEs
>> that are already cleared.
> 
> As I mentioned before I think this patch should be merged with patch 7.

Ack.

> 
>>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/vmalloc.c | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 28e65073624a..aa80bc273ec0 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -3748,13 +3748,14 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>>         const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
>>         unsigned int prev_shift = 0, batch_idx = 0, nr_mapped;
>>         unsigned long batch_start = addr, batch_end = addr;
>> +       unsigned long mapped_end = addr;
>>         int err;
>>
>>         err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
>>                                              PAGE_SHIFT, GFP_KERNEL);
>>
>>         if (err)
>> -               goto out;
>> +               return err;
>>
>>         for (unsigned int i = 0; i < nr_pages; ) {
>>                 unsigned int shift = PAGE_SHIFT +
>> @@ -3764,9 +3765,10 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>>                         prev_shift = shift;
>>
>>                 if (shift != prev_shift) {
>> -                       err = vmap_pages_range_noflush_walk(batch_start, batch_end,
>> -                                       prot, pages + batch_idx, prev_shift,
>> -                                       &nr_mapped);
>> +                       err = vmap_pages_range_noflush_walk(batch_start,
>> +                                       batch_end, prot, pages + batch_idx,
>> +                                       prev_shift, &nr_mapped);
>> +                       mapped_end = batch_start + (nr_mapped * PAGE_SIZE);
>>                         if (err)
>>                                 goto out;
>>                         prev_shift = shift;
>> @@ -3786,13 +3788,21 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>>         }
>>
>>         /* Remaining */
>> -       if (batch_start < end)
>> +       if (batch_start < end) {
>>                 err = vmap_pages_range_noflush_walk(batch_start, end, prot,
>>                                 pages + batch_idx, prev_shift, &nr_mapped);
>> +               mapped_end = batch_start + (nr_mapped * PAGE_SIZE);
>> +       }
>>
>>  out:
>> -       if (!err)
>> +       if (err) {
>> +               /* Undo the part the batches installed before they failed. */
>> +               if (mapped_end > addr)
>> +                       __vunmap_range_noflush(addr, mapped_end, true);
>> +               kmsan_vunmap_range_noflush(addr, end, true);
> 
> So, you are unmapping (addr, mapped_end) range but removing KMSAN
> metadata for the entire (addr, end) range. Is that intended?

Yes, that is intended. The metadata for the whole range is set up
before the mapping starts, kmsan_vmap_pages_range_noflush() at the top
of vmap_pages_range_batched() installs the shadow and origin pages for
the entire [addr, end) in one go. So on failure the metadata is fully
installed and has to go as a whole, while the page tables only reached
mapped_end and are undone up to there.

I know this looks somewhat awkward. The asymmetry comes from the metadata
having to be set up before the mapping starts, I don't see a way to avoid it.
Maybe add a comment explaining this?

WDYT?

Thanks
Best Regards
Hao

> 
>> +       } else {
>>                 flush_cache_vmap(addr, end);
>> +       }
>>         return err;
>>  }
>>
>> --
>> 2.25.1
>>
