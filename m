Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795828049;
	b=n0D0iunah626SMpO9gnYed/U0nIjE9+KwXAxmf401iAU0o5lzv4eJBfASZN0ZIt619KT
	 mhtLiM9flmKMe7opZf1VBp2PfinueamRw7ugPSRSrN8zsC5CKGyE0UTebi35o78MD2bEp
	 PEY5EJ/gkhzJpLZov+EqQQrZndqjHSzSMeT8OWRL04wdk+eh2omwHzvi0NgmXLFuvfHK1
	 R9NK5FndWRS9m6/n5Jc149sSFbc13BDhIghQNtBBPxbN9we7Ts45PnIl7OaLAX4/BSra3
	 zY8gYhD5+23kSQuEr5h9q3iH5KgLZnJIv7xPICMERJyNPlBe543BGeSUyBsM8wyT8KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828049;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=a65dJjXELLvBjblKrcEEJmFH72J16tMPfL8+2JJSMhA=;
	b=EQST/VdftSpToLGzoaywiqm3ENpD1ZzZt5FV/z0DtWlKoNFntZSKFMwbeXAh0iatdBiZ
	 0+i3VdRpHtBICtZkXdZy5tIqUX+thWYNu1ATtBt+ZiXuQYQtJh+31aJlDulPNrl8TXT1f
	 ZbrNTXmIQbHw44QlpODAFIwPKLkYCczbhSD6TAMmnrd4y2ef+GkZ1kLPd3W37cWxeCDc/
	 clxayVAhMoPxL92jobv1sVp33sljrhz24noFEnqacSpedChI3+bxSJgybd0TucSanuIT7
	 M9X0Nx3O2od7t8fAwV2pecVGDCbBwntzpp6cPag7mUVH2IWYeH6WQaA15vWb6Q8GGLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yvikbyzl;
	arc=none smtp.remote-ip=91.218.175.189
Received: from mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036F2606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036F2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yvikbyzl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6o1m5Sj0nUNsooY5Q6+XpT1gVnU3nCsPrMfZZdGQvm8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795828046; v=1; x=1796432846;
 b=Yvikbyzl96oTGl48ew7/zn5/ACkXbb34oJfA8SvyxPQWJJpZta/Z3U+C08eY8Ook3UO5DpX1
 zaXt1Wj8Mwx8lhJ5EuYPe5jMPc90gkYfFXsxBHB27RbRxvxs9uFK5AHXgbqMZb8j8WXMcG0Bi5z
 UKeUBsZOPF9Bqtr21HzTWUVg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ce7dcfcfce2fff3;
	Sat, 28 Nov 2026 01:07:25 +0000
X-Mizu-Trace-ID: 4ce7dcfcfce2fff3
X-Migadu-Flow: FLOW_OUT
Message-ID: <200b9f7c-e533-4875-8cd4-3debd4e7ae94@linux.dev>
Date: Sat, 28 Nov 2026 09:07:19 +0800
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
To: Tejun Heo <tj@kernel.org>
Cc: longman@redhat.com, frederic@kernel.org, peterz@infradead.org,
 mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 hannes@cmpxchg.org, mkoutny@suse.com, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, guopeng.zhang@linux.dev,
 mathieu.desnoyers@efficios.com, Ridong Chen <chenridong@xiaomi.com>
References: <054a53a3-c038-48fe-ac01-fc24fd8065d0@linux.dev>
 <20261117083915.2971979-1-ridong.chen@linux.dev>
 <bc6e38f6-1412-49d0-95e2-76d5e9fc3858@linux.dev>
 <6f3d7612a6b2628fae3c14aaa87771ec@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <6f3d7612a6b2628fae3c14aaa87771ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/28/2026 5:07 AM, Tejun Heo wrote:
> Hello, Ridong.
> 
> On Fri, Nov 27, 2026 at 10:15:07AM +0800, Ridong Chen wrote:
>> If it is this one, I will send a v2 rebased onto for-7.5, as it now
>> conflicts with housekeeping_set_cpu() from commit 884e88175b95.
> 
> Can you please send v2 based on cgroup/for-7.4-fixes instead?
> 
Sure.

https://lore.kernel.org/cgroups/20261128010535.1831141-1-ridong.chen@linux.dev/T/#u

-- 
Best regards
Ridong

