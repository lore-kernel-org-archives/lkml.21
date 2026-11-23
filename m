Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447615;
	b=wIxmwTdoJNPen4j6wVQY/H7hmXil01GKxbDtKS/CWq19AzDPo1SlhywcjCd9lfhGnltU
	 H9exdCW+2gXRSlTzwGhHp3vfMQSfKZ9YAnGnJLJjr9UyK1UEceguA2ggYoss9l3bYWp21
	 Eus/oF+1FBgFV47/olFd0HbzZ6q5AsnlgOPcMORdg+hzXSf8answm4+MT4TAfHerxjNLt
	 tiuFJJ4ulwmwojMu1Y+sEQ3MlcKWXDJUVGSZnV3sNinB/gr4UAuXqLagbw80DjN9okwPZ
	 CUK8DRvMqUW8ZrThyYi/6/0ZwZeb4dp99MmEX8R5DVgw3N42AapvD7vjoeNy9vPIqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447615;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
	b=Rp5KVoemfFsbr8M2+3RTz0eeJn8ZdYsa8E8XGXFH4jMSAaux19b62bbshG2PXthS1WUD
	 zKW8LvW53e5HW8vECbpCVf584BHaUedvC5P5D6sk673OkzcVT1vdZjFPvG5jWo9n6cAPy
	 xZC2TY1D1YDpjdQZA00TSg/1pQXRNx6UJWNtxVeKCAnwZglPb74RqVKHN/nRqMHrqxT31
	 TUhAw6mUstR5tjHrO8bRs/Ls1jPD+vg1K5UnwzxFK9rugjQtSaqAx3ciQBJpUgHU2c4ZP
	 i3Qmtw1oKlZ1MuMmCi+ZxoB74PR6OS9xSeTj3mqZfZxs8poVdTLDz6wHjuRn33xF3Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hdHS7SmF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hF5hXOlS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EFE606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05EFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hdHS7SmF;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hF5hXOlS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795447612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
	b=hdHS7SmFkhREzSUTzdLJbgkkn0FcyIxCbLJluVXfVbkPi+syLKvVJSLdTGvdc0sdrMYEIY
	CULqV5E9I+UwLnIRUxvEN1Mki2XCvJro6fmCpwLFhVCauTMJxLUnA/fqS2Ec+DEpjkQo5r
	HS4V2eWBIuvlf7QxcOefQdZ13PCWWn4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-zmeXU_NLMRqRvv2o29MHtw-1; Mon, 23 Nov 2026 15:26:51 +0000
X-MC-Unique: zmeXU_NLMRqRvv2o29MHtw-1
X-Mimecast-MFC-AGG-ID: zmeXU_NLMRqRvv2o29MHtw_1795447610
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-492b5408dedso1985707f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795447609; x=1796052409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
        b=hF5hXOlS/r53HlAUexTYyuZCe6q+EPACFaEn07MBUB3FUgImxS8OGvnUnFynC/+Kmw
         MZwpliHGKotqh8eHVnyXGSBMvpE35CRKis60/xzUiJrRPjl+xWjq0CSYIVDxDxZxa7cP
         oat3Or1LS4+AuREgizvIEhymggWOTvt20x6mfs33HhOcMhxRuQwNka3lJK6W8TzXwcYx
         wxj5Nu8QCVDeWyO0FqPQ1bAUopPnKZWC2dfZ16uj1PTBXd31+AWF6H7lzBc7/5iSrJeY
         UGUGDi9dHYLslbohZIGmcmJw48h8lxk2DswnbuPX/Qm6B15rO0SFUMi8UgzcOggKsDwJ
         LvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447609; x=1796052409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
        b=k13l97MlljyVLJP78LyG1MOxQesJUDdVupQ+fMjBun9W9xWTu6lXyDDVUBnr/nwJly
         hYuLwoSzdgW5XbKpVY8yuPx9IeRYeSAz5V0tpvf2wMAVBI5Q+cJM1t+DepF1ITS48/Ag
         atYC4eqXeNYeS4Y+25htU4iEXYe0GQ0MHdlF7Cv4TrXJisdJdV9qKydGnqfhmMvb7TpZ
         qknpTtPA56x1e6V9VSuKIu7TAiChTxkawQxmrazbXrMG8F2MgKdnGmarL0hD87JbdNwK
         /Nee7m57c12XQCOnkKiGUafMo3qaPsGyELBRUwfpzZ/kk1GAezXsrvtP0CkGHjZG4kUs
         PEww==
X-Forwarded-Encrypted: i=1; AL+hErEDwNKd3iYOdN6Bztl54DzDZyxBeDQMSevjFTiQW+rW+v91hQQs8Pmtq9yYd6kt69npVEx0grDwEJMCB/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+551xkoHItdr5x2iS6BjyStcvUrDlbcwBJ0tcUTMVBACVIlXyx
	HdkSlYgk7WOTxLRVKjqYsl6UFFBq48PSXtYTTQJ4BCEudV/s4isUlgCpr2rjMswFi5PaoSkYOTd
	JRikR6TACheodrqYoX7JQaz9lS52AbYpYcmd3mmezc7KactJFGHSQB1nTU/59V52fdg==
X-Gm-Gg: AZFdTZfkLP3IGp3VDpTBq2k/GxcI81qoQ9DM+lKwbAnG1H6KGVwhU7U0p1logtHPgHC
	hmEevGvmmKPcXr1zL+y+sotsw7UJXZOMByY+kiqP4cdDtZHqwnBzV/VEiEynLbZpXZeIRfCFC+u
	ImpQvJQ/SCq/PRcvChPvUAwI7fmOfARfEs4aHlz+s7NMU0fLRYj6biUqxakQOjzPQZCIITrUOKz
	J1ISmEvyX9psfsXnwWB2fVMne/oCacDF/c2bXyzZNXcDF9ijaPrlsZLvn/PYaoI1x27bwiZg8L1
	SAk9eUOD//HfrcmWxM66+kg/QwrbZYUVBbkCA+d1GlPyBaAIUdV5rvUBtvvr8ibzOcv6qdHJN+I
	gtpRTZ3WGHMnuyNQ7GOrqcRd8S9HMaK24iQDccWqPz4fG1DjdTCtbMUCN0aPbhPHyA0PbWy9pCW
	5TaboZ9vjivrcAo7+VjUngxdH4xZu1IMwHXcLVgtVG6dpn
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr273241945e9.8.1795447609625;
        Mon, 23 Nov 2026 07:26:49 -0800 (PST)
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr273241195e9.8.1795447609102;
        Mon, 23 Nov 2026 07:26:49 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm24250026f8f.11.2026.11.23.07.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:26:48 -0800 (PST)
Message-ID: <781ac9ed-a6d5-4b6e-8598-36938e76c34a@redhat.com>
Date: Mon, 23 Nov 2026 16:26:47 +0100
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
Subject: Re: [PATCH net] net: openvswitch: don't WARN on a non-IP packet that
 needs fragmenting
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
References: <179492834266.3639154.14679778183890331729@gmail.com>
 <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
 <179502509517.2983267.1652158471891914135@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179502509517.2983267.1652158471891914135@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 19:06, Kyuwon Cho wrote:
> ovs_fragment() only handles IPv4 and IPv6 and drops any other packet
> with a WARN_ONCE(). Since OVS_PACKET_CMD_EXECUTE takes the MRU from
> userspace, any ethertype can get there, e.g. an MPLS packet executed by
> an unprivileged user in its own user and network namespace:
> 
>    Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
>    WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
>    Call Trace:
>     do_execute_actions+0x580e/0x7380
>     ovs_execute_actions+0xd3/0x3e0
>     ovs_packet_cmd_execute+0xc21/0x13c0
> 
> The packet is dropped either way, so use a rate-limited warning instead.
> 
> Fixes: 7f8a436eaa2c ("openvswitch: Add conntrack action")
> Closes: https://lore.kernel.org/netdev/179492834266.3639154.14679778183890331729@gmail.com/
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
I think this better suited for net-next. No need to re-submit.

/P

