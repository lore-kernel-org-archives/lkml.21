Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745720;
	b=v0F7pbOneg5cDF/0dguK0MhwYKb8HpYo23ax3W+Xd9LjYwrdqW4n6Ye6VQQxAmSoqlwn
	 BR666EvUTT6acISWTKvylbij/HTOlRGXuCeoN9AZJ1IGj+1+ye9B1rgsp3T2X6bGUyArr
	 b+vpk2YYqyJ4MGSxRUJ1VUedTknBwbg8Lx/AyubPMfBIZYpQ5iPodyC+NGjysWjgJiKwO
	 qNJsXtupmLGc8hDYG1yFIze//jISJcfZ0YftRfC+HBvSkn6dxZPy7yzOF9rpioyx2+poT
	 2bOtNG412XshNp7g8/SCdZ2c85oth9AAkI4ij4yf1oQYU08y58aD3dPCXMda+cLPECw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745720;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oBOKoaA48rE8EF/1cfxHdI1AQ5POAWxUBxC+DwiRvrc=;
	b=18WFm8LVIsV3idMlur5XeWudKgdrD2PFtb9h7pZMAI7Pgrc0+hfoWg1omPu6GLjKbGRy
	 OOtyjHErv/UFhSbcSfLEWAxlzE2TDxTrchcxh0aofHz/I7Mbr+OkutDzQbcJw9UguRPFl
	 vE+nnNmA+/XRnWZWanrsMQ6KUnyvXW16QNtDs+Zpuc8b3tNC8zP3OsNevjTwS99meEwy0
	 aR3NXm/bFmHl3Z8UYmFSZWUwjOEfn9Q5vgLBrhGFxKoql9tj0Td/skiToiulga4BR2AT1
	 ESQQwUbBMNQw5OG+iXLhaH6+roAAPrCzAX32FNdsG6H5/SL7Abt99vMrTDrePcYLWlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vhtr0wvK;
	arc=none smtp.remote-ip=91.218.175.103
Received: from mta0.migadu.com (out-103.mta0.migadu.com [91.218.175.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E872F606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E872F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vhtr0wvK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c4X+gqMxgHivpxeHUP0pL4+jrGpSF5DB2qBHND7Atd4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795745717; v=1; x=1796350517;
 b=Vhtr0wvK5D+MgFYXopkQY3QlGnEpdp82rS3J+/4yEfqlgfxZWGvOJVGOeK/mDEDfUhPR+lJs
 0jIYJzfZ8d0Ba+tCtZiy4pAD3rJzWoNYT7Mt5ehS9MXypJC8fhSfZYxG5+9bRw8eon4Ru/Fd0QF
 Xdj2knaOVinklxelOqkvxW28=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 60c40adf911d4eda;
	Fri, 27 Nov 2026 02:15:14 +0000
X-Mizu-Trace-ID: 60c40adf911d4eda
X-Migadu-Flow: FLOW_OUT
Message-ID: <bc6e38f6-1412-49d0-95e2-76d5e9fc3858@linux.dev>
Date: Fri, 27 Nov 2026 10:15:07 +0800
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
Subject: Re: [PATCH] sched/isolation: Publish new HK_TYPE_DOMAIN cpumask under
 cpuset_mutex
From: Ridong Chen <ridong.chen@linux.dev>
To: longman@redhat.com, frederic@kernel.org, tj@kernel.org,
 peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, hannes@cmpxchg.org, mkoutny@suse.com
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 guopeng.zhang@linux.dev, mathieu.desnoyers@efficios.com,
 Ridong Chen <chenridong@xiaomi.com>
References: <054a53a3-c038-48fe-ac01-fc24fd8065d0@linux.dev>
 <20261117083915.2971979-1-ridong.chen@linux.dev>
In-Reply-To: <20261117083915.2971979-1-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/2026 4:39 PM, Ridong wrote:
> From: Ridong Chen<chenridong@xiaomi.com>
> 
> Commit a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without
> holding cpus_read_lock") calls housekeeping_update() after dropping
> cpus_read_lock and cpuset_mutex, so the HK_TYPE_DOMAIN cpumask is now
> switched and freed outside of those locks. But readers holding either
> lock may still access it without rcu_read_lock() as allowed by
> housekeeping_dereference_check(), and synchronize_rcu() doesn't wait
> for them:
> 
>    CPU A                                  CPU B
>    rebuild_sched_domains()                cpuset_update_sd_hk_unlock()
>                                             mutex_unlock(&cpuset_mutex)
>                                             cpus_read_unlock()
>      mutex_lock(&cpuset_mutex)
>      p = housekeeping_cpumask(DOMAIN)
>                                             housekeeping_update()
>                                               rcu_assign_pointer()
>                                               synchronize_rcu()
>                                               kfree(old)
>      access p <- UAF
> 
> Fix it by moving the pointer switch into housekeeping_publish(), which
> is called before dropping the locks. Then CPU A either finishes before
> CPU B switches the pointer, or only sees the new cpumask:
> 
>    CPU A                                  CPU B
>                                           cpuset_update_sd_hk_unlock()
>                                             housekeeping_publish()
>                                               rcu_assign_pointer()
>      mutex_lock(&cpuset_mutex) <- wait
>                                             mutex_unlock(&cpuset_mutex)
>                                             cpus_read_unlock()
>      p = housekeeping_cpumask(DOMAIN)       housekeeping_update()
>          <- new cpumask                       synchronize_rcu()
>                                               kfree(old)
> 
> The rest of housekeeping_update(), including the workqueue flushes,
> still runs without those locks.
> 
> Fixes: a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without holding cpus_read_lock")
> Signed-off-by: Ridong Chen<chenridong@xiaomi.com>


Hi Frederic, Tejun,

There are two fixes for the HK_TYPE_DOMAIN UAF after commit
a84097e625f2, and neither is in linux-next yet:

[1] Waiman's v2, which takes cpus_read_lock and cpuset_mutex once
     before kfree(old), so readers holding either lock are done
     before the old cpumask is freed.
	
[2] This patch, which switches the pointer before dropping the
     locks, so readers holding either lock only see the new cpumask.

Waiman said either one works. Frederic, since this is your
housekeeping code, which one would you prefer? Tejun, could you
apply the chosen one to cgroup/for-7.5?

If it is this one, I will send a v2 rebased onto for-7.5, as it now
conflicts with housekeeping_set_cpu() from commit 884e88175b95.

[1] https://lore.kernel.org/all/20261117051853.2429410-1-longman@redhat.com/

-- 
Best regards
Ridong

