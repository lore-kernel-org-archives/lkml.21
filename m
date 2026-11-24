Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529165;
	b=xA5XeSroOYOFLfRZJufbQWQssILyEump5PfAPbXexcXzaV/MS4B6pUJH6RTFpNEzhF2U
	 amtg1ISamHJqzke31AEAqOpRUdDYXsOg075vkq3iB8dfiNY1LZnujeGFsotJaukwEioPx
	 Qe9I73jHNXq6USpVsocIhL6Wy2Wo3saC4rOQz1c/s99aDr/4A7U9o8Mq2nWNgF8qaj2PD
	 eLrVKB2jI9GVl3eQO5GxGTtykqJ+/1qlD8PrnaMsJAxGaiv4iaDFo/o1tziAnsAu+ITb/
	 qM/mXB6OupX+WA9KPAFKK4XuX3iGZ3nOwQBs2D3YNSMdj5kf6qT36zVTtNQ9w1mBm8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529165;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
	b=UZU4mEeHQBjkPMHFFbfAHPTsFmIpAUNvG/+08NlNO4WE8POYdcdVndlY5tcoYQSG7Uh+
	 JyCzeVjn0OvsjOOf1ZC9lN/QQJbFJOxfABGZypYwvH0K1x2HCTdrtmOR3z6pLeKL4oAXt
	 MNv+6fizJczuipOXJQ7HoEPvAizrOYu9YBqAdT+rZ+XYHU2AVqo24Tjx5/EmuTcKlELio
	 jCnCyfMJIJHVoFmpSVq8WnFF/q73XuRjxAwb2FDQ0GmNBP8CbvbEkMtBsPPcBdJOMSJ4z
	 +/8/lvfTIyLhqBV6esem5u8VbGZLAEvgDOgx+xQG/MbBYAMyPp9jIh2kd5qPI0q0ajQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMmtkkTh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QV1dkshK;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FA26078482
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FA26078482
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMmtkkTh;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QV1dkshK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795529163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
	b=aMmtkkThe0H++jDkwNTYQthAHDGGqM1YUnGv2chsLgS/47+k2f/E8kJehjXPlm/7a8qpKe
	9WuE/tVRIhES9SmJDSqpQmGVU6JQNSDit4aFYubd9qhcozYqr+O+MQdkYKYJFhVQPYldOh
	sC034YH6+8pL33kd5FCzQ8b4be7inog=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-89BG1t98OTq4KuvtxREoDQ-1; Tue, 24 Nov 2026 14:06:01 +0000
X-MC-Unique: 89BG1t98OTq4KuvtxREoDQ-1
X-Mimecast-MFC-AGG-ID: 89BG1t98OTq4KuvtxREoDQ_1795529160
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42888c50c4so477652566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795529160; x=1796133960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
        b=QV1dkshKQmoZAXT4/b6jEf1+VHm0vo9NLdqA62AlH/1HVCp5u1FiqXbAO/7eXLGYUB
         vNKev4r0W+L60QneMmiYBNZLk8uRECWACuSh9wig743lrjHStt8trIr3X+RypvfHbYDZ
         Gnd9jhH84JkmUq1AdkTk5GCqrFglZNdB8oxbCDUuMTxhhqdYZ7G7JP8VGQeSX49hTVh1
         r6QY2nDOxV/gsTI4cQdjLQkHECg0+eCpJJc9LgsUvoVCSI2JRF/fEvjG4XyOjWSEiAvC
         Qpv/ag6O29sOn6ZV4jILUm5ukKAtc7IPvwGvQ2zbxfVNvh46gdS1dF4imrOm81wgTIYS
         W96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529160; x=1796133960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7h23mJqn1H2fN7GPoj07XLNna4GZEHqoI76yphfwDs=;
        b=wKOk/LYLvOk5y/+le4KSx9CxrVC3s7euBmBlX0iPPJpbbyg8uZrn2VJt+r6WPbdlxW
         QTMT5u9nCxOcji8+1vluqCZwTRfDFPUQAIq0d9JlIF5qq9Ypp6FsDINwXnYcNQlqxrVT
         gMRYT83tCMljxmDAQhkSbmTmz3L9F9lL8e2Xuk8bPd8AhozC/HxkQewSWGy2QG+7WFKB
         bk5+gUxrrrESYm4asRkYg/dNy9CHn8xRTR8LlNPnWa44DBjQ9/Lb4Vg/258Dk4MehP5n
         3pnV1L0o+f6z7wrbjsWLf9NFAUUB4heJWYTzRbxDk+4B/5PSwskkGPNRnt1AfX7vtuZJ
         1mtA==
X-Forwarded-Encrypted: i=1; AL+hErFTg4t2FxN8OiSNiLDUqOZXcmxVyqvC65wRTU0HVPcNsZvhJJPTuGiI3JYEf6WiNICyeAbUkXtNm0gAPbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+53jtzCb8WVr4B8x5NhXUmi77ECkWlOOzaFQCiRe6LwzEk98Ic
	7XpclfzegxW85hXeLnkiCe96Lf6m293FHx2NDmzFO+lblcK0CXb36NjowKOnO0IXUX/16Krgh/g
	wjOkiq6c0LRVcpxReF3D+lbvU/WEOLQs8fTt093h1bW+FBCevRMhYZtjUBUVV7lHTYQ==
X-Gm-Gg: AZFdTZcWzJf5HgXcoync2mR0WtgaelrBRVM9dKiWTrImKzru/GlrkKISQ7gta+ZbO+6
	zhxJOeFxFe1qq5twFIlLuKDMmc3tyXooLKjpl1wzDW3WPFo8qlU9uSixLUbAXpSR/K9iuOwqjjM
	pv242udiY437mum5SDpTdF5Qi0MppPqLJhFSFGj/FstnUbS2j5uTuFNgkhG+fj6dLBm+hmDMFOn
	DMgl58oDEKEJopYfjbR1JpD1omm/g6plNj8qJcmAaIdoo00qiJ0Hp6EMvSB4qqYbCDOcLO1h5cb
	toFQhvTTb5PAHuN+gc6yVWbfoIBX8Nl6AsHVt4yTwKMqfvRv6K3eFG09u7ua9H2riaf8Wtmvw3t
	zE/Bi5JXJmt6LYXfp4pp7ibgd8AxvRdjuvVDT7nQ5/ipMKlwHEP8XAsEmlgqDhYjaJwjuP70Rgr
	sBBUT2Dejdeb9Tg2rvyXYR8nDnhWizvDBu9dZkivNe21Xb
X-Received: by 2002:a17:907:7b9b:b0:c4d:3208:5781 with SMTP id a640c23a62f3a-c513a4b1c1fmr1311675766b.1.1795529160210;
        Tue, 24 Nov 2026 06:06:00 -0800 (PST)
X-Received: by 2002:a17:907:7b9b:b0:c4d:3208:5781 with SMTP id a640c23a62f3a-c513a4b1c1fmr1311671866b.1.1795529159769;
        Tue, 24 Nov 2026 06:05:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm517585666b.57.2026.11.24.06.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:05:59 -0800 (PST)
Message-ID: <34de8380-f2ea-42e2-87ff-97a52ec3200d@redhat.com>
Date: Tue, 24 Nov 2026 15:05:57 +0100
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
Subject: Re: [PATCH net] net/sched: sch_cake: fix unintended tin override with
 cake_mq
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 =?UTF-8?Q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>
Cc: cake@lists.bufferbloat.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
 <CAPB2EApXULDiMGXMS6qg17NJRyEruybWMfu_d35tjBPdk4ftSQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAPB2EApXULDiMGXMS6qg17NJRyEruybWMfu_d35tjBPdk4ftSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 10:49, Toke Høiland-Jørgensen wrote:
> Jonas Köppeler <j.koeppeler@tu-berlin.de> writes:
> 
>> CAKE allows overriding the tin selection through skb->priority: if the
>> major number of skb->priority matches the qdisc handle, the minor number
>> selects the tin. With cake_mq, the per-queue CAKE instances are created
>> through qdisc_create_dflt() and never get a handle assigned, so
>> sch->handle is 0 for all of them.
>>
>> For forwarded IPv4 traffic, ip_forward() sets skb->priority from the TOS
>> byte via rt_tos2priority() when net.ipv4.ip_forward_update_priority is
>> enabled, which is the default. rt_tos2priority() returns 0, 2, 4 or 6,
>> all with a major number of 0, which matches the handle of the cake_mq
>> children. The minor number is then taken as a tin override and the DSCP
>> mapping is skipped.
>>
>> With diffserv4 and diffserv8 this puts packets into the wrong tins. For
>> example, AF13 (TOS byte 0x38) under diffserv4:
>>
>>    ip_forward():
>>      skb->priority = ip_tos2prio[(0x38 & 0x1E) >> 1]
>>                    = ip_tos2prio[12] = TC_PRIO_INTERACTIVE_BULK = 4
>>    cake_select_tin():
>>      TC_H_MAJ(4) == 0 == sch->handle
>>      tin = bulk_order[4 - 1] = 3                     -> Voice
>>
>> whereas the DSCP table gives diffserv4[0x38 >> 2] = diffserv4[14] = 0,
>> i.e. Best Effort. Likewise, AF21, AF31 and AF41 are demoted from Video
>> to Best Effort. diffserv3 happens to be unaffected, because the only
>> reachable override (priority 2) agrees with its DSCP table.
>>
>> Fix this by matching skb->priority against the major number of the
>> parent cake_mq qdisc when the instance is part of cake_mq.
>>
>> Fixes: ebc65a873eff ("net/sched: sch_cake: Add cake_mq qdisc for using cake on mq devices")
>> Signed-off-by: Jonas Köppeler <j.koeppeler@tu-berlin.de>
> 
> Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>

FYI, since this was broken since the beginning and does not look
ultra-critical, I'm moving the patch to net-next.

/P

