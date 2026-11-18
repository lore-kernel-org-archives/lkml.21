Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011375;
	b=3ghwBQUnBARZFySntAKsXCTRZOvtVLqq8Y+uuJUELBObSZA1Zo2gHoBmEQAsG4Bg5Jed
	 xONG+XQVN2g9qZFzrlxK+qbybWywrPO3LCCT84k1mDEkPpoCKwVPvxH1eRsOLuOrfa86u
	 ytUQsSfk2480bOa+qUZNpsv5jfMokK++k2lJRGuUrnZg/MBqxthJIIPcxXY2CM8Xbu9nt
	 EhJ+ywRgh8pfa3yd1i0ZKDhVIdGuWUJxQFHS2Pq0YBPtWyWpJP7QZNkBUtqUVS8LYpH+I
	 Pq7bFxKJhOkJtO7cJKZv/55Vedi04/86CWmR5zEOeFjgT70rkG6XRoepDNNb85l1NRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011375;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NkRayhbqFtlPnHUvyhGbsBwanQgB2ADYmADCwUGi5uw=;
	b=v9Qmbj62fRfZ2oJJaYQL7xZ/YluAuP5Q7j48lB+zcrF7dRaOkAdcviINZdryT0m0IUal
	 UDVFiDXR8GijjUmegr8c+Pcgm0cSCOTnATjjh0EyBuvwmM9I0KbbCLzTJYeywEfOSRCDv
	 Xgy4ZgHzZHY2yfHM0ArX5EQe7slmHI4dXWQ8eSmZ/paA9U6bFo4eYsTmWsIpiOPeri5B8
	 ldUDh6WSxOUZ/jeFqg73m3qwPbA0OC2simvTkM2kGTbWGv22oxtP+GLCszflDDN0+xpnH
	 m+qAzrg1w30mwjsjYGZOo5yc2utKosrj9Id7X5cPUdBlI9toDvG4xLVLDwJy4AXoThQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA960A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81AA960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 97239286e35a11f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3094af1f-aa7f-44f5-84ce-86c27277b13b,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:3094af1f-aa7f-44f5-84ce-86c27277b13b,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:d61cf93fb4fdaf745f8ccd974ca04727,BulkI
	D:2611182216074FAVQI0Y,BulkQuantity:0,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|153|841|865|898,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil
	,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,
	DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97239286e35a11f19a56ed5b684f684d-20261118
X-User: lienze@kylinos.cn
Received: from [192.168.3.106] [(111.193.136.161)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 821553608; Wed, 18 Nov 2026 22:16:04 +0800
Message-ID: <bc48e456-5c1b-4479-a426-6639ef695914@kylinos.cn>
Date: Wed, 18 Nov 2026 22:16:01 +0800
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
Subject: Re: [PATCH v2] mm/damon/paddr: skip non-LRU folios as a whole in
 pageout
To: Aveline Noir <jm5905938@gmail.com>, SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev
References: <20261118-fix-damon-hugetlb-pageout-20261117-v2-1-547a65a3206e@gmail.com>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <20261118-fix-damon-hugetlb-pageout-20261117-v2-1-547a65a3206e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/11/18 00:24, Aveline Noir wrote:
> damon_pa_pageout() uses damon_get_folio(), which rejects folios that are
> not on the LRU.  For a large non-LRU folio such as a hugetlb folio, the
> loop then looks up the same folio once per base page even though
> pageout cannot reclaim it.
> 
> Use damon_get_monitor_folio() and skip any returned non-LRU folio as a
> whole by advancing to its end.  Do this before the filters, the
> accounting and the last_applied check, so that adjacent regions within
> the same non-LRU folio are not walked by base page either.
> 
> In an x86-64 KVM pageout microbenchmark, traversal time dropped by
> about 99.7% for regions covering whole 2 MiB hugetlb folios. For
> 4 KiB regions within hugetlb folios, traversal took about 1 ns more
> per region.

Good catch -- thanks for looking into this.

> 
> Signed-off-by: Aveline Noir <jm5905938@gmail.com>

Reviewed-by: Enze Li <lienze@kylinos.cn>

Thanks,
Enze

> ---
> Tested in x86-64 KVM guests.  DAMON KUnit tests all passed.  Ordinary-page
> and THP controls passed the 3% non-inferiority bound in the microbenchmark.
> 
> Changes in v2:
> - Drop the redundant hugetlb check and update the subject and description
>   as suggested by SJ.
> ---
>  mm/damon/paddr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> index 5b773012a876..0a205fa8d468 100644
> --- a/mm/damon/paddr.c
> +++ b/mm/damon/paddr.c
> @@ -268,7 +268,9 @@ static unsigned long damon_pa_pageout(struct damon_region *r,
>  
>  	addr = damon_pa_phys_addr(r->ar.start, addr_unit);
>  	while (addr < damon_pa_phys_addr(r->ar.end, addr_unit)) {
> -		folio = damon_get_folio(PHYS_PFN(addr));
> +		folio = damon_get_monitor_folio(PHYS_PFN(addr));
> +		if (folio && !folio_test_lru(folio))
> +			goto put_folio;
>  		if (damon_pa_invalid_damos_folio(folio, s)) {
>  			addr += PAGE_SIZE;
>  			continue;
> 
> ---
> base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
> change-id: 20261117-fix-damon-hugetlb-pageout-20261117-a4e03d9d5a5b
> 
> Best regards,
> --  
> Aveline Noir <jm5905938@gmail.com>
> 

