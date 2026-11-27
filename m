Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772853;
	b=y5xvOpNCgZ7yB5bOMrkSZFHk1F8pdxbHZCW2zO4JR7eiusYkMOJ7JgkvAozefXj+j0Yn
	 vr56GgZpgq5GU5mIoWGP+0vOCxJAbhanyKh/mEfR2OstRTxDFZ7Q6bh5RLiLJpLrDVh1z
	 12T824MJwJyKNpsY4Xma4oCFViLcqzrOJF+VQqFp14IP/ePX50X2X7qHJ+bpfXvVhtyKg
	 qxuZUy8WKFkiHKaRfTnRqrPGS2z/ZSZnCGEd5/1eGj7jGJVVY5nKVTep9/ePuuuhjS4dB
	 Tp0LWBN5hdbFi/Vy4DgAOTUUlU2o1JcpCZe2su4PUR+qdzMNGeq2hdDbWc4sazRsHtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772853;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Yi5TGqGDTFUFdZLAvv9bskhzF0AH7tyiH8DAj/gsKXU=;
	b=lzfYxvR5jCy2NHaQdCBq2CIsgQOClIpW4wXujOVNusiEnbYGDzNJlxV0u4qEuabAjV8e
	 lDbeu83hphZMNWdHpY6SSBCzwOiJhGTPd8g1P89Z57eOFRfGnwqKgFUhT/8/r+n7nqeIJ
	 K1+2EHdw/9ToGF4VyhZjHavwIlGafPngB2M/eD09QLxe0Zh2LsMZRCupcbr5kgF5PMyHR
	 p+8BK7FVauq4UNgu7QAyDODbKHVgmoNP9MiMn3yPl6wpIjSiCPzZ5wMdPyymBqGP+98Cp
	 On4qARHhKdjJTaDbPt9+teiT15RaD/x3m+FXBcUn9NrT3Spu2MrhjazJsEGTypbY5Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.147
Received: from out28-147.mail.aliyun.com (out28-147.mail.aliyun.com [115.124.28.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DA3606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DA3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09270047|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0234835-0.00227038-0.974246;FP=4016039461341993050|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kBVIYjl_1795772840;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kBVIYjl_1795772840 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 17:47:21 +0800
Subject: Re: [PATCH] sched/fair: Simplify pref_llc_queued handling in
 account_llc_enqueue()
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
References: <20261127091146.3504-1-likunyu@open-hieco.net>
 <awlMqTZK8_0gmSMC@scheduler.schedules>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <4432bc13-0d03-d4eb-0858-0efbccf6c697@open-hieco.net>
Date: Fri, 27 Nov 2026 17:47:26 +0800
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
In-Reply-To: <awlMqTZK8_0gmSMC@scheduler.schedules>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Kayra,

On 2026/11/27 17:33, Kayra Cizmeci wrote:
> Hi,
> 
> On Fri, Nov 27, 2026 at 05:11:46PM +0800, Li kunyu wrote:
>> pref_llc_queued is only used once. Assign p->pref_llc_queued directly
>> at the original sampling point instead of caching the value in a local
>> variable.
>>
>> Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
>> Link: https://lore.kernel.org/all/awhlwJTOLPeNqFW8@scheduler.schedules/
> I didn't really suggest anything. I don't know which part of my mail
> was a suggestion to you? Maybe below code is correct but I didn't
> suggest it. So please remove my tag from the patch.
> 

I saw your reply on the cleanup patch in the linked thread and took it as a
suggestion, which I then incorporated (hence the Suggested-by). If that wasn't
the intent, let me know and I'll send a v2 to drop the tag.

-- 
thanks,
kunyu
