Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513673;
	b=kL0aPTD5rCPRUuSQpXq983B752Q+IgQicteb+Ne0VRXz6nKsTi4prs3WeEPA9EVgENlO
	 qhZNa58NqUE1ZMLyYx/R0tn6lHKLNBsdzeZKlWLd8kubEGi4iU5KQ011eVnIcBRJ2LMFz
	 I/8TAmNq/6ZwsM57pDWTttffJiiKwevriGBVIqU2HwYDzceXryoWQbMJYr4fjnVNW7X98
	 FJWj/arPYkq/NIIxflVcqzxdzIVyRT0Pk0TcmCFxn6kR0M5iICqxZawkkYofUa5gH+/V1
	 w+Kd4xR0nIfFpkiTQAbZswcSQ1DHVUZY1QII+zanDewLVezWZjKxoCfO1gT5cFKXQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513673;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9UxDeIk67xuNdpXj+qBcspkYjPnMBMjpN0hb31P3JSM=;
	b=VlKZ7CbgAtyHBSGBeqc+JLCQG8L9Rvmb2vY28VAv8l1GvHtV6HhCLgz7+tvEdjitfSkE
	 Lr708uWvwe9qFfJBHTMTbybd416tqmhrzGQ31kXNMaz+27q97WEYv8zQ1LfYSgpPpdHvU
	 jISmYIfG9+YFjf+O1zpWz03Q8I+ujux2F3tbxX1zBuRYpyFqGCj+JgrzQAaUynqkOoh2R
	 v+P0UDWca8Nx7ZDvCKI/RHUtjNC6ASZkEsMmGDBkcBl4E1/v/iW9Pb0f5JBoXNy95qtKT
	 rzQ/mThYW2+CORkhHwRmzO6aMWYo4XeNvGDieKsYrYgYbKd2SArv1o+5eW1hLJt8lDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="Th/igziV";
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A05606CF0D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A05606CF0D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Th/igziV
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795513667; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=9UxDeIk67xuNdpXj+qBcspkYjPnMBMjpN0hb31P3JSM=;
	b=Th/igziVNXG4pbVRbmCRjhzHeAesbLMOhdUAyW8BjP43LiLjWr5Jt30acqy9cuGM1rA8z8GXObnMRlCZr/LVkG+av5qDWZpwDL1O9jQwUlGGdWAnw6qGj60pc4gKFuvMTuZ5ho1kL82O6gBQLYtgBp3xBZXTPeFroarKpJWbX5I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFO828g_1795513666;
Received: from 30.221.129.142(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFO828g_1795513666 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Nov 2026 17:47:46 +0800
Message-ID: <e76e18a1-6506-4dd0-a920-59d4d42cea2f@linux.alibaba.com>
Date: Tue, 24 Nov 2026 17:47:45 +0800
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
Subject: Re: [RFC PATCH v10 2/3] ocfs2: switch DIO read path from buffer_head
 to iomap
To: Heming Zhao <heming.zhao@suse.com>, mark@fasheh.com, jlbec@evilplan.org,
 hch@lst.de
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261124045501.10281-1-heming.zhao@suse.com>
 <20261124045501.10281-3-heming.zhao@suse.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261124045501.10281-3-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/26 12:54 PM, Heming Zhao wrote:
> Migrates the DIO read path from the legacy buffer_head infrastructure
> to the modern and more efficient iomap framework.
> 
> Under the current code, ocfs2 holds a cluster lock during DIO via
> ocfs2_iocb_set_rw_locked(), and releases the cluster lock in
> ocfs2_dio_end_io() via ocfs2_iocb_clear_rw_locked(). The lock level is
> stashed in iocb->private.
> 
> However, iomap DIO owns that field (it stores a bio there for polled I/O
> and unconditionally clears it before calling ->end_io). Any side-channel
> state packed into iocb->private is corrupted, which trips the end_io
> lock-state check.
> 
> Instead, encode the unlock level by passing distinct iomap_dio_ops methods
> e.g.: ocfs2_iomap_dio_ops_r_pr ocfs2_iomap_dio_ops_w_pr for PRMODE or
> ocfs2_iomap_dio_ops_w_ex for EXMODE. Also note that the ops_w_{pr|ex} are
> defined in the next patch.
> 
> Additionally, the *_iter() functions use the split __iomap_dio_rw() +
> iomap_dio_complete() API so they can determine unambiguously, from the
> return value, whether the completion handler already dropped the lock
> (real I/O, sync or -EIOCBQUEUED) or whether the caller must drop it
> (no I/O issued, or buffered fallback).
> 
> The new function ocfs2_iomap_begin() performs a similar role to
> ocfs2_get_block(). While ocfs2_get_block() retrieves only one block per
> call, ocfs2_iomap_begin() can handle multiple blocks at once.
> 
> Co-developed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Looks fine.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
