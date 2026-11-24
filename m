Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505764;
	b=P+QmMQk3gvb/QRI7KJaO8bhI88fuXi+KFDxXIxxcf71EgPuyxRp1n83bQsjST+41CCqo
	 TtCmHy1Ib1TyWAS6sKlDzs1f08ZMly8e3m7gJPLtIE7/66+RKvM3Ljwv+cqabKAWqGGEk
	 AvnC/yFP2wusmUC/etoGLxO41oxFUf3nX0aKUivlcnEck5FUDDmYUFcewNwynmLO3OyC4
	 pB/a8c5/d5v1lLsBQG3L8d9hQdCuWAO+XCOpupmyviwuHshmDrz/azmuakmxDMfdbHYYq
	 jo3y+InfrKACpMwlX851+wkTu5DDyFi9EexhmVR3oiN6meewjwT6tPbidTxw3JaeKvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505764;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=V7pbJ9uhpGhN+1kSxcNHzQRBcymuEphN9sunBG772yk=;
	b=UpyMI+yRCYSaFKNPVUY6hqsgfyefb3eUiMC7OZY/8CgjRhagR1l4qd7aNbyECG7nfShO
	 Oh0XHF7bQZYFL48nWy2g5AqKsV3wrozy7w6qFfW9l4wmdHqJbOHUFOK9rco4R/xwReajR
	 J0O+gyMDGqeqm2RrHdXEZIyJlSDq6LYu9/KguFxqfH28xPf37SspyOglIMDMFIIr4NTnk
	 9ubRPraAYhy6Y9iuaRBDcsyA2QDwRm5CPOzSbA6a6M4E9HYlGIWgE78quxaMHFq91L+Z1
	 ENvJgqtug0agG1h8UUIILNTJHla+adFA6CFpz0THcrArO3FTFrQnilFh30+8TwA1+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d24iPo0t;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38A7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d24iPo0t
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29C04339;
	Mon, 23 Nov 2026 23:35:59 -0800 (PST)
Received: from [10.57.71.117] (unknown [10.57.71.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C94C3F86F;
	Mon, 23 Nov 2026 23:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795505761; bh=lavwvUvnZ3GN6bpw6lQu0qJ6+Rzr3/ojn5HS0I0oCTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d24iPo0tQ8AZXw5d7EO3yb0SlPXQVa1R9gXyqY8jGou+d1U867HdnqpZQmc0E3Vcr
	 RfzBhZeDruCor3NLYlfan2NLKIE+GZHE8fzaUg1ZkSJ5B9dz9QBHW84Kn02t+gezk1
	 tNKdgwSYIGe9TU1HiecK5G0Nx8/9Sih0rzugfCnc=
Message-ID: <6c8a8583-e7b0-4331-a92d-ba174e926755@arm.com>
Date: Tue, 24 Nov 2026 07:35:58 +0000
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
Subject: Re: [PATCH v6 0/3] Fix uclamp race against non atomic static key
 enable
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <070726aa-0e91-4d65-b3c5-00df3a180732@arm.com> <awU36OTU45MPn-Lg@aerith>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <awU36OTU45MPn-Lg@aerith>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 07:21, Qais Yousef wrote:
> On 11/23/26 09:19, Christian Loehle wrote:
>> On 11/21/26 04:15, Qais Yousef wrote:
>>> Latest version drops the partial revert (patch 3 in v5) as RT group
>>> throttling is going to be marked as broken and anyway a proper fix will
>>> require non trivial rewrite how dequeue happens for throttled tasks or
>>> full revert of subtracting nr_running added 10 years ago. Both of which
>>> is not appealing and with the proposal to mark this feature as broken,
>>> better leave it and hopefully just delete the problem area.
>>>
>>> So in summary RT throttling is not fixed and being ignored. Fair
>>> throttling is fixed by pairing uclamp_rq_inc/dec with
>>> add/sub_nr_running. For RT, we do that in inc/dec_tasks() which are
>>> called when tasks are actually enqueued/dequeued - as stated will fail
>>> in RT throttling case. Given the minor severity of the problem and
>>> effort required to restructure part of RT group throttling that is being
>>> marked broken as we speak, I think this should do.
>>>
>>> Changes since v5:
>>> 	- Drop patch 3 to partial revert subtracting rq->nr_running for
>>> 	  RT throttling.
>>> 	- Drop fixes tag from patch 1 as the series now is partially
>>> 	  fixed and not suitable for LTS.
>>
>> Is this how this is done? I guess we could also NAK the backports?
>> Also presumably this was observed in live systems, so is not-backporting
>> an option?
> 
> Is this the best way you could phrase your question? I asked clearly for
> feedback on v5 and you kept quite. If you have such strong opinion, speak up
> next team at the right moment instead of trolling like this.

Qais, I don't know which part of my phrasing came off badly here but it
clearly did.
The above questions are genuine, I was just wondering what the correct
way of 'fixes' are that we don't want backported (yet?), afaics the obvious
options are:
- Omit the fixes tag (like $SUBJECT does), but that obviously loses the
information that this is a fix.
- Keep the fixes tag, which most likely leads to stable AUTOSEL picking it
up, it lands in stable review and we can NAK it there to prevent backporting.

I'm not sure which one is preferred, that is why I phrased it as a question.
I don't have a strong opinion that is why I hadn't responded to v5.
That is all.

> 
> FWIW except for RT group throttling breakage, patch 1 and
> 3 could go to stable. Not sure what would be the right fixes tag for patch 3.
> 
> FWIW I work with Wei who reported this and this is not a wide spread disaster
> walking on earth. It has taken more effort than it is truly worth actually.

