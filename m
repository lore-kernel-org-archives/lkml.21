Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.181.97.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780017;
	b=Y9psi8vbQb88JztQnZsVZhh0Bn0OxOUqybxgJAdAIWcz4St3Fcsb55aJ+fy3wOLIC3Vh
	 RAb60dwyqxHbP23ZhCS4Q6/z7oxgA6aj9cnD3qes+UmAXjWbAytv0Fl+yMrSXVfF8uuP2
	 oCkMhDO2rqEmfrx4XVGI9B0Hm2Sp/UpVq7OLWxMWmoZKNbWU1AWj8DWNmDHW5A6IBvyJl
	 UMwnS3DZI4Ztq9QdexZSgWpQMgwGF8J0PmqGDcpLOtbyRtmSqeSctCh2OL3uxSkCkzCoR
	 EM6DJOveWxL1W/4BG89anjbcXNq92WQmJHiMjCsU/p4IcEn59G7kiDANOXpsfvUS7XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780017;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Anti-Virus-Server:
	 X-Virus-Status;
	bh=N0At1DAw++AdT9MezF05VYDBrF0x2cjHig4P04WajBs=;
	b=qtCQcm/0Y/EDHCFGobRmnT1D8td7lr8d2iCuKNZxrYSsRrZa6g2EuZbNtky5Nmt/t6A4
	 LKWCQRrEu+KJ/kCywpNAGdYpe8c8VsWhy7rvncMfsp1dTrO6yLlpaesW6mbztfjHBVzMD
	 k0OIlJDPfUZYGqUP1qrIogIcnzCabPO0Z/Q0NnoY/RoSW89v/fzlPLzisWECo+7YLzf1Y
	 BQ9mvfQ8qKBoC2CJa+MeKVDStubc8V09qpN50ElY+BxJRp+I69hVeUTwioE2p35sCUXVj
	 hM4uX40VEVRtAB7QZPe8rGn2D2p7/mTZPLPSnvTJY9p40rJcYL2idBOw+KubcwMYFow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=I-love.SAKURA.ne.jp;
	spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp;
	arc=none smtp.remote-ip=202.181.97.72
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CB8606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CB8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 6ARBktr0068972;
	Fri, 27 Nov 2026 20:46:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 6ARBksDq068967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Nov 2026 20:46:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <fe95ba74-e195-477b-9ad5-c53d48446ae5@I-love.SAKURA.ne.jp>
Date: Fri, 27 Nov 2026 20:46:54 +0900
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
Subject: Re: [PATCH can v2] can: j1939: avoid address-claim timer deadlock
To: Oleksij Rempel <o.rempel@pengutronix.de>,
        Felix Hoffmann <f3lix.dev@gmx.de>,
        Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-can@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
        kernel@pengutronix.de, Oliver Hartkopp <socketcan@hartkopp.net>,
        linux-kernel@vger.kernel.org
References: <20260731134255.1002902-1-f3lix.dev@gmx.de>
 <20260803101503.21023-1-f3lix.dev@gmx.de> <awlYpT9xeUW6CCzQ@pengutronix.de>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <awlYpT9xeUW6CCzQ@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav411.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/11/27 19:17, Oleksij Rempel wrote:
> On Mon, Aug 03, 2026 at 12:15:03PM +0200, Felix Hoffmann wrote:
>> Name the 1 ms retry interval J1939_ECU_TIMER_RETRY_DELAY_MS instead of
>> using a literal in the callback. Track consecutive failures per ECU, reset
>> the counter when its timer starts, and emit a warning guarded by
>> net_ratelimit() on the fifth retry. Five is a pragmatic threshold for
>> detecting unusual delay; it is not specified by J1939.
>>
>> The timer uses HRTIMER_MODE_REL_SOFT, so its callback runs from
>> HRTIMER_SOFTIRQ with bottom halves already disabled. write_trylock() does
>> not change bottom-half state and must therefore pair with write_unlock() on
>> success. The write_lock_bh()/write_unlock_bh() pair is unnecessary in this
>> context.
>>
>> Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
>> Cc: stable@vger.kernel.org
>> Assisted-by: Codex:GPT5.6-Sol
>> Signed-off-by: Felix Hoffmann <f3lix.dev@gmx.de>
> 
> Hi Marc,
> 
> this patch seems to have slipped through. As far as I can see, it still
> applies to net/main, and the bot findings on it are pre-existing
> issues. Could you please take it, if you see no problem with it?
> 
> Tetsuo, if I read it right, your v15 3/3 fixes the same lockup. If
> Marc takes this patch, 3/3 would not be needed in your next version.

It seems that netdev-bot+sashiko@kernel.org failed to review the v2 patch.
In the v1 patch, netdev-bot+sashiko@kernel.org had a concern about likeliness of
write_trylock(&priv->lock) failure
( https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260731134255.1002902-1-f3lix.dev@gmx.de ).
Asking for opinion from netdev-bot+sashiko@kernel.org by re-posting the v2 patch
after applying my "[PATCH v15 1/3]" and  "[PATCH v15 2/3]" would be preferable.

> 
> Regards,
> Oleksij

