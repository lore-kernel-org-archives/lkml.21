Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348728;
	b=KwWfWoJLI6NUwCCsAUMToLt1Eu9glZR/kK6XIT/b7SafYXXl5Klhri9k5vl3LpvCUicd
	 VWRhFgZgzIpIi9xioYRGDlBGn+B0165gHY3Bf6vctotwbA/BOPWTdx+Nwc8guNreXJGsj
	 JMm1nvMWzZsTBr4ssFZHrm323lXd0/aGWjYzgi2/AcyHukGHEMHVXbFD1uR6bYsu7xPQG
	 PiWtWhdi3wPQmtfyjBs6E2g8MPj1s3Yl4iPXwpG5QhdMpeKwebeGCrxZmnNzIgxnbjCU+
	 vf9EwhwmB++JixNcsUJOOfmqoIJ+2QIR+beirh48t0qdsHRJpjwT70Dqm0PkHLeFzLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348728;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B6gRmrMmIeT6PDLP4jdr2d+FZm74h0ydQ3whXPdu6CU=;
	b=IxC12chwZlHkc188SEVA3QznJhNEaU/98pdleh5NzWWkVbWJuKAfpS585Q8XtvTGCnuZ
	 XeJ1xwmrZIg2yrNKKfrIC3JZHNIpaMpi3DRR6kq7Pl3FGzjP7r91HXiGfv33Cmv/np8sr
	 +xoFIVXSqkpQN+ZrWqaz/quyaqgDM9i4bnTVc3Fa4TaTilI1VqFJ2ScOg/prI2yXwOkjx
	 IgBc8n6gfqbgsfIedEDVBpXAN/Tbhv7YBuNAOdKd6XG0cgPTpmN2JHo+FZIhUtWrVB0qd
	 ijh2uelp/wg2JLupcsu6+G1LrYOz55N3A09AKZ+wqsLW/TF4kMt+txP8oWY5ZGy6DZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lTGcvsZl;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E9A606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E9A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lTGcvsZl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ryWXKdGt6pMawUrYdr9GJQTC4h6r7TQ0FZPjcUKLboQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795348725; v=1; x=1795953525;
 b=lTGcvsZl2sArPgA+ta3CyzG47TBmyuWxJBWLP2MkHV5ctRQuXNbPB36oC1DAUckSqkj9ih2U
 jEHXxhZdwbb30nWZyTgHjm2ULCJ0B3dxwmld+4iPEW6WVJs/iUpC4X8tjzvlzmajETiuax4ePCm
 r3nT4z9X93D3qH9i00jxAKXE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 61aa96329a398c95;
	Sun, 22 Nov 2026 11:58:45 +0000
X-Mizu-Trace-ID: 61aa96329a398c95
X-Migadu-Flow: FLOW_OUT
Date: Sun, 22 Nov 2026 12:58:10 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] RISC-V: KVM: Batch user accesses when updating
 steal time
Message-ID: <awLYx5ASZJLHDcpv@orel>
References: <20261121173526.892344-1-den@valinux.co.jp>
 <20261121173526.892344-3-den@valinux.co.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121173526.892344-3-den@valinux.co.jp>

On Sun, Nov 22, 2026 at 02:35:25AM +0900, Koichiro Den wrote:
> Updating the SBI STA shared structure performs 2x get_user() + 3x
> put_user() calls, each of which toggles sstatus.SUM.
> 
> Keep SUM enabled across all five accesses to the shared structure.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes since v1:
>   - Drop might_fault(). (Andrew)
>   - Use scoped_user_rw_access(). (Andrew)
>   - Use le32_add_cpu() and le64_add_cpu() to avoid the extra temporaries.
> 
> Note:
>   - I haven't carried over Andrew's Reviewed-by since the scoped_
>     conversion reworks the fault paths. Would appreciate another look.
>   - As in v1, I kept WARN_ON() for uaccess failures.
> 
> v1: https://lore.kernel.org/r/20261118062242.2914385-2-den@valinux.co.jp/
> 
>  arch/riscv/kvm/vcpu_sbi_sta.c | 60 +++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
