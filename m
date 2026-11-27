Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776053;
	b=tcO1W9ysMYJfyeZe8P7S+YoxIn/QaqoxYYenzZLGYlcJSRmY5M5Yp2X1jkzXAZYKc52h
	 FabQw/WamQ3uCi5FFIuy9NMo+uyuYqC49zXjfMQTi+YCPjgielY9EwLmuH4Y4/9AFQGle
	 LFjvpUdHWxk9/dz/39PLMMD8Od8cvJND4hmO1SGpO+3SdKM1jJyuKphE1kKuV9hGRG9ge
	 3Vui0oZI3rO9LZPiLD5O6Ewj0zg/LZZI+QbNJxUEpQio61w1OyEblpAUYAO24j3mHmEkE
	 OoSWQGBwd3GbiaQEGSSuKQA/nYudk8Q9zQOcbIlx1o1yCA+4cQ4Z5+qV7RYA7jNa5gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776053;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5TANrIwwHSjXZfHd1jn1KNf/4swOD336NOoPhXDlR18=;
	b=ttl88vg2DSEY/ENfp+tdKzsOeqPY3qPCDImAwOLt3utXRvjFq2Mv6rri3HUs3Kr70+49
	 Q4QRuLMCP/6CSaWlU1bVK1bkxI+48bc9B00x5bB8Pjz4ZBYyHcJOAcJ/eDJIoi+bUwWZW
	 qngrsAqmn6NLSemaMMeLGj2FMEMAM/LeOqb4QKmvWgSVDUqgduGVQpklCAd5jT8BmXlnd
	 z8r518Zhr874cXlai5LwDw1tLw00cH+WPeFNkRsJTrDG8Aq9CSH16itw8w839Cf1AQGQX
	 NGEY6R8C9oaC3R8NN/bgot1lAEKdvxu0Sr9viuRrqJ7zq1WDy8QujDKIqweCtDnYFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.172
Received: from out28-172.mail.aliyun.com (out28-172.mail.aliyun.com [115.124.28.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09A606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A09A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1049004|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0651852-0.00107401-0.933741;FP=16139449376992758363|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083012053;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kBRpYX-_1795776041;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kBRpYX-_1795776041 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 18:40:42 +0800
Subject: Re: [PATCH] sched/fair: Simplify pref_llc_queued handling in
 account_llc_enqueue()
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
References: <20261127091146.3504-1-likunyu@open-hieco.net>
 <awlMqTZK8_0gmSMC@scheduler.schedules>
 <4432bc13-0d03-d4eb-0858-0efbccf6c697@open-hieco.net>
 <awlZNYtxplGytTtP@scheduler.schedules>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <46077e09-1b5b-7ef7-58d7-cca1681c013b@open-hieco.net>
Date: Fri, 27 Nov 2026 18:40:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <awlZNYtxplGytTtP@scheduler.schedules>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

On 2026/11/27 18:22, Kayra Cizmeci wrote:
>> I saw your reply on the cleanup patch in the linked thread and took it as a
>> suggestion, which I then incorporated (hence the Suggested-by). If that wasn't
>> the intent, let me know and I'll send a v2 to drop the tag.
> Yeah, I want my tag removed :-). And I don't know
> which part of my message was a suggestion to you...
> 

‘As I see and know, cleanups attend to get lost in sched's traffic.
I don't like that. So I'll review this :-).’ I came across this comment and,
since I happened to have some thoughts on it, I referenced it. I’ll post a v2
under this thread shortly.

-- 
thanks,
kunyu
