Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743670;
	b=cAFCB61ASeKqqmc2v+t2es0RHkzvOfHRvsvaaogaNuvql/DofMtHUBci4StfGemW1bRd
	 UNnyKLiqc+C/szD7J3qKjGdP0aISl7GznulPYOKH32ZaaaVkKUZUBKtDmmcMO14BF9P/n
	 WpTBctCxWp6pcgq716l9YGab0kqDyTzhL9XxwT5hG7zn2XkfdbbQ8YYl7lvUwiEn2CL/3
	 7ZnZSOfoV1rKwKXrdLZiHKa9DJI7S64jBR545bInfv5yDkiexVVKAT0mdVfou1o7w/TIE
	 cJy4qFS+rND8pgF4anv5cGtsBnoR/ouhET+Ji0/0pQBnCU7dyluKrp0fVhgFlodVmJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743670;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=8fTW3KeXDiiLMmJG9fyVvTKh0sZa7l/HWo28nMyrYN8=;
	b=fYtkg3+Mufs0/8MvtSZOMkGF6/lFnIk+1llZAg60ZeYHyO0x1wdJJqy15uUM7p7SsD41
	 QpRzAGlLq4VauBJuB9iEFpnMWyBve+4smSRo09WU3WPuAfUBjLngsf58xUSUmZUT92NDX
	 NnD9wIC+VM43VOeO2lTBHmnMqeakIYYc25qrHPk77iXwx7f0vRdGKcfYfxCghWQFz7DM6
	 3PVr3TamSDjwKerBCE0cQ11WLJtxYguBHa3KeHEYFQd9AwXewBSM82zHamakdNKYL0xEP
	 L+mBUpKG6ly3lFXhEZv0MlJwWubIkHaqu6DpQ2KuTdKYMCbgafrx1jQaN9JB6QFJ4Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=easystack.cn;
	spf=pass smtp.mailfrom=easystack.cn;
	dkim=pass header.d=easystack.cn header.i=@easystack.cn header.a=rsa-sha256 header.s=default header.b=G2uO4Tmn;
	arc=none smtp.remote-ip=154.81.10.34
Received: from mail-m1034.netease.com (mail-m1034.netease.com [154.81.10.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE7A606A31C;
	Fri, 27 Nov 2026 01:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=easystack.cn header.i=@easystack.cn header.a=rsa-sha256 header.s=default header.b=G2uO4Tmn
Received: from [192.168.1.100] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 262eb5d71;
	Fri, 27 Nov 2026 09:40:58 +0800 (GMT+08:00)
Message-ID: <0810cc96-ad0b-4718-acf8-c2bbf43e388b@easystack.cn>
Date: Fri, 27 Nov 2026 09:40:58 +0800
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
Subject: Re: [PATCH 1/1] bcache: fix use-after-free when waiting for
 dirty-init threads
To: Coly Li <colyli@fygo.io>
Cc: kent.overstreet@linux.dev, linux-bcache@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261105131954.1195428-1-fan.chen@easystack.cn>
 <A7BF631D-A5E8-47D0-B265-73C220200424@fygo.io>
From: chenfan <fan.chen@easystack.cn>
In-Reply-To: <A7BF631D-A5E8-47D0-B265-73C220200424@fygo.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21aa9b2510229kunmd68f2d7bf9e8a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTR9LVkhPTB1LSU5IGBkYHVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=G2uO4TmnaRWHL7+oHlODaIUChNZB+J55G/lGUfrDajT0RtFNAafzcNYxmMZlOtNl+AADy+0P2xSGE2hs1cy+rrn9wIo7a399a1NFVP1hraIgmfMRlU0lQJVIcOkVWVAAOdhOK9J1YmnFfwmpgFVigdPhunvHGcSSzp/2CSuUXYA=; s=default; c=relaxed/relaxed; d=easystack.cn; v=1;
	bh=8fTW3KeXDiiLMmJG9fyVvTKh0sZa7l/HWo28nMyrYN8=;
	h=date:mime-version:subject:message-id:from;

Hi Coly,

Thanks for your advice, I will refactor it in the next few days.

在 2026/11/26 19:35, Coly Li 写道:
> Hi Chen Fan,
>
> Nice catch!
>
>> 2026年11月5日 21:19，Chen Fan <fan.chen@easystack.cn> 写道：
>>
>> We use multiple threads to count dirty sectors in parallel (read-only).
>> bch_sectors_dirty_init() waits for the last dirty-init thread to set
>> state.started to 0.
>>
>> However, after the last thread sets state.started to 0 but before it calls
>> wake_up(&state->wait), bch_sectors_dirty_init() may observe started == 0,
>> return from wait_event() directly, and free local variable state.
>> The subsequent wake_up(&state->wait) then accesses freed memory, because
>> bch_sectors_dirty_init() has already exited.
>>
>> Fix this by using a completion to wait for all dirty-init threads, so that
>> no dirty-init thread can still access state after the wait completes.
>>
>> This issue was triggered in our environment with the following stack:
>> ------------[ cut here ]------------
>> [30433.391386] Internal error: Oops: 0000000096000047 [#1] SMP
>> [30433.585804] CPU: 54 PID: 48242 Comm: bch_dirtcnt[1] Kdump: loaded Tainted: G  6.6.0-98.0.0.90.aarch64 #1
>> [30433.718972] Call trace:
>> [30433.722722]  native_queued_spin_lock_slowpath+0x33c/0x420
>> [30433.729401]  __wake_up_common_lock+0xbc/0x118
>> [30433.735050]  __wake_up+0x20/0x38
>> [30433.739575]  bch_dirty_init_thread+0x1c0/0x1f8 [bcache]
>> [30433.746169]  kthread+0xf0/0x108
>> [30433.750583]  ret_from_fork+0x10/0x20
>> [30433.755425] Code: 91002020 8b040284 f862d8a5 aa0403e2 (f8256841)
>>       ---[ end trace ]---
>>
>> Signed-off-by: Chen Fan <fan.chen@easystack.cn>
>> ---
>> drivers/md/bcache/writeback.c | 31 ++++++++++++-------------------
>> drivers/md/bcache/writeback.h |  4 +---
>> 2 files changed, 13 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/md/bcache/writeback.c b/drivers/md/bcache/writeback.c
>> index 4b237074f453..e74457a8c952 100644
>> --- a/drivers/md/bcache/writeback.c
>> +++ b/drivers/md/bcache/writeback.c
> [snipped]
>
>> diff --git a/drivers/md/bcache/writeback.h b/drivers/md/bcache/writeback.h
>> index 31df716951f6..e6c74be20fc6 100644
>> --- a/drivers/md/bcache/writeback.h
>> +++ b/drivers/md/bcache/writeback.h
>> @@ -31,7 +31,6 @@
>> struct bch_dirty_init_state;
>> struct dirty_init_thrd_info {
>> struct bch_dirty_init_state *state;
>> - struct task_struct *thread;
>> };
>>
> After this change, struct dirty_init_thrd_info has only one member state,
> I feel you can totally remove struct dirty_init_thrd_info, and move state
> directly into struct bch_dirty_init_stat.
>
>
>> struct bch_dirty_init_state {
>> @@ -40,9 +39,8 @@ struct bch_dirty_init_state {
>> int total_threads;
>> int key_idx;
>> spinlock_t idx_lock;
>> - atomic_t started;
>> atomic_t enough;
>> - wait_queue_head_t wait;
>> + struct completion done;
>> struct dirty_init_thrd_info infos[BCH_DIRTY_INIT_THRD_MAX];
> You may think of changing the above line into
> struct bch_dirty_init_state state[BCH_DIRTY_INIT_THRD_MAX];
>
>
> Thanks.
>
> Coly Li
