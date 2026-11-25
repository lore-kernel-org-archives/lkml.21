Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574815;
	b=Jm00EuHOSPI1+XmKnxLcJ6QLDoXiZB2fYPQOLWeXTlTa8fWZULPu6cyYCOWikmWxPelw
	 oDA2KlGx6tjBtF+HxusGA7sFGWZFuOkKoB03Ux7a7CsoNZR0tPVwjXVR+TJ221/UQOhWz
	 p55xftNd5ntG7eYQA0q2e3QH/H3ySQYWrE8P2V9RQ/RkbGrc+f4dXBAulHqlXh96c56DM
	 egDwjAjpsVwFBLUxKLmGQw3ZWGVA+yqQ61qGYmFBtCKV/YjqNoKLZF3FJIoETVvhnWNUr
	 H1nvKuICXjL5Cw17IfDTBGDp53fQMXouHZn/tmPs32JBbxncnX/svBQ3K9xoUPxsUvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574815;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LBs2/sUNBfor4ZHtJTf22aCZgoIprVHJR6vT9Vi57+4=;
	b=P4i8SsDS70CPi30abu4J1SJnShuibnWTLbxrg+28t7a1SsU8N3lEq1vZouD09Le/LUkf
	 byQtyjtev48nhr8MqIqKluwAgvfwJm+P+MlvGDsVokxjNnXbWRp8LTl8aBAnl76eoYgFk
	 CAdj9Z5RcvLt3b8WSj8a1vEFja5QZMAQFjZ007YxmYicXnFxo/UruPu2wziYfDNy9MMEg
	 22VNrMbFGZ9X1eXJxpe0aXoFyBwrNPB4qaTlsVbMcrwDAsfCIRVOeRlsB6fleZLba1wOS
	 3qw8A6Eyn5nQqNxcGEGQ9ZZ5e7v9kaQx7a/rVD2m2akmE7P7Epg3YWpjTDWXcPyFW4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=iLViwbFr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1EE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=iLViwbFr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E221F000CA;
	Wed, 25 Nov 2026 02:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795574814;
	bh=LBs2/sUNBfor4ZHtJTf22aCZgoIprVHJR6vT9Vi57+4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iLViwbFrY9CPjLILqEqUdMW+frKVtQhVNoz4b5wrOn2at1oLEhjI2nDNPwI3yq+C0
	 A5lwpzKqQgwlWDHl5e2+2xh+SOOTASgBIT78+ryZLjcpoAsNiV04fhhsmwyCihSfj0
	 oXNh3lpUar1nahJ7f+ydJLCylbHSUz0Ie5ILZM+8=
Date: Tue, 24 Nov 2026 18:46:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, sj@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Xuewen Wang
 <wangxuewen@kylinos.cn>
Subject: Re: [PATCH v1] tools/mm: page-types: flush pending idle bitmap bits
 after walking
Message-Id: <20261124184653.d6e1d627154d526e6cd85d27@linux-foundation.org>
In-Reply-To: <20261118021253.1691428-1-wangxuewen_ky@163.com>
References: <20261118021253.1691428-1-wangxuewen_ky@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 10:12:53 +0800 Xuewen Wang <wangxuewen_ky@163.com> wrote:

> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> mark_page_idle() buffers bits for one 64-page bitmap word and writes
> that word when a page in another word is encountered.
> 
> walk_addr_ranges() tries to flush the final word by marking PFN 0.
> If the last buffered PFN is below 64, this only adds a bit to the same
> word and nothing is written. Otherwise it writes the pending word but
> leaves an unwanted PFN 0 bit buffered. walk_page_cache() does not flush
> at all, so its final pending bits are not written.
> 
> Extract the write operation into flush_page_idle() and use it both when
> changing words and after either walker returns to main(). Clear the
> buffer after a successful write and skip writes when it is empty.
> Place the final flush before the no-summary early return.
> 
> Use 1ULL for the bit mask so shifts by 32 through 63 are also valid
> on 32-bit hosts.
> 
> ...
>  
> @@ -1364,6 +1373,9 @@ int main(int argc, char *argv[])
>  	else
>  		walk_addr_ranges();
>  
> +	if (opt_mark_idle)
> +		flush_page_idle();

Very minor, but we shouldn't exit(0) if that flush_page_idle() returned
error?

>  	if (opt_list == 1)
>  		flush_page_range();
>  

