Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259445;
	b=BlLTW1O6DFdx2vrCOrOD3ADOk7kEwuzJ1DxmQv7Q63ANN/eoi1OsvF3yfKXRrzvNZxnA
	 X6GvI5u12yUC1j4LYWeQ6Uo/b745jSXT0Hc5DkpAx6BX46HEEZ+yvEQOakS4lgVtSKnM7
	 Jk3ROtE4QTG+ZGyXB/WiLWYULEsYZx0zGeSJaCRyL2Vxvb4vkCcXBjfelgUeM3wZomyUl
	 jgiA1mub27wbVnQ30Yns0C9NJ9kSkwu0szL5/AELUiEXPnAd0TG9XqVOxlLiuaN47APE9
	 7YzT+LR4pVdz7a7MMW4nYLnonVeQZevOf8usRCn/kw0mH8GGZEuXcECqEuzZzjV9CSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259445;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YbGsFuHzMPCucKqbbbZkf1QYXb3rREx6Caxd6NEAakw=;
	b=drJUgzVgzSs1EY4Q1s5xQRehVlliGa5XNu7A8DC902ZY61lRz+0lSPLOnfo9AFYHCTAX
	 nLupjb5/zqIPplc03Yk5wzRAP2wegmX8Vzh9b50/e9n7342UlnMBJ8t0Kv31wPM0jB8J5
	 x184Y+76haHD86qmTm8dL6MKEKjKnW8uAU/Vn+0Lm+cAUUdY4vK4wZoe/7IGKfRcOFdOR
	 TyaSzSS4oKOqch8S2tt/Vi3WoiYqQyQ5WPVZdvpZvyjPbc3c+Z60fi5JduViXkdw5vL5A
	 BEhLsyWOFIdg8BqO7etLiTLUtV1z3RFgiJ/d/X1YBR21BAADsdmW0bZcZxNJySxrSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sepxIr2q;
	arc=none smtp.remote-ip=95.215.58.250
Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C2606A680
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD2C2606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sepxIr2q
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lHOuyTOIwmr32upG1vX/kfSW8Fr2iMJ6LuKhLpVCBY8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795259443; v=1; x=1795864243;
 b=sepxIr2qERY1IsZok2Iy++k0OuFKVmyasiXM7ZG9HUsIEjl75UToJkDG4M8IonlWrvukwFRu
 +mqEjspSCpZA76YBEPeLAGZS0lebuCRBgHugUe5OdHUieahCaPvltuEaFryFrDLK1/U/FnSxhlO
 thUpwrTC7PBKeXjkKA/oz9TY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9deb2bf611a5095e;
	Sat, 21 Nov 2026 11:10:42 +0000
X-Mizu-Trace-ID: 9deb2bf611a5095e
X-Migadu-Flow: FLOW_OUT
Message-ID: <57ef6b0f-e9eb-4484-b07f-63c848ffde4e@linux.dev>
Date: Sat, 21 Nov 2026 19:10:37 +0800
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
To: Xuewen Wang <wangxuewen_ky@163.com>, akpm@linux-foundation.org,
 david@fromorbit.com, roman.gushchin@linux.dev, muchun.song@linux.dev
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261120110538.3256962-1-wangxuewen_ky@163.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120110538.3256962-1-wangxuewen_ky@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 7:05 PM, Xuewen Wang wrote:
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> The shrinker debugfs count file uses single_open(), so all memcg rows
> belong to one seq_file record. When the buffer overflows, seq_file grows
> it and retries the entire record. Queries for subsequent memcgs in
> an overflowing pass cannot contribute to the final output.
> 
> Stop the traversal once seq_has_overflowed() is true, using the existing
> mem_cgroup_iter_break() path to release the current memcg reference.
> Leave the overflow state intact and return zero so seq_file can retry.
> 
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
> In a single-node KVM guest with 1024 cgroups each caching 16 ordinary
> files on ext4, the 8865-byte output required three show attempts. Count
> callbacks fell from 3075 to 2472 (19.6%). With probes disabled, six fresh
> guests per variant each performed 101 full reads. The median of guest
> medians fell from 128.2 us to 112.2 us (12.4%, about 16 us per read).
> Small and sparse outputs had unchanged callback counts. Complete output,
> small reads and seek-to-zero rereads matched; concurrent memcg deletion
> and signal interruption checks also passed.
> 
> The successful pass still traverses the full list. Early exit skips
> count queries for subsequent memcgs in overflowing passes.
> 
> When overflow coincides with a pending signal, the original code can
> return -EINTR in the current pass. With early exit, seq_file attempts to
> grow the buffer first. The retry can return -EINTR, or buffer allocation
> can fail first with -ENOMEM.

Would something like the following work instead?

  		if (!memcg_aware) {
  			mem_cgroup_iter_break(NULL, memcg);
  			break;
  		}

  		if (signal_pending(current)) {
  			mem_cgroup_iter_break(NULL, memcg);
  			ret = -EINTR;
  			break;
  		}

+		if (seq_has_overflowed(m)) {
+			mem_cgroup_iter_break(NULL, memcg);
+			break;
+		}
  	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);

Thanks,
Qi

> 
>   mm/shrinker_debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
> index cafb566301326..3022d103b0b1e 100644
> --- a/mm/shrinker_debug.c
> +++ b/mm/shrinker_debug.c
> @@ -74,7 +74,7 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
>   			seq_putc(m, '\n');
>   		}
>   
> -		if (!memcg_aware) {
> +		if (!memcg_aware || seq_has_overflowed(m)) {
>   			mem_cgroup_iter_break(NULL, memcg);
>   			break;
>   		}

