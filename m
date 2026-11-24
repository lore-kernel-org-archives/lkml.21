Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523519;
	b=WElOnS+HDExs22+5oTxZ0vYVpg4wkHFXWreeD8nSw1siet6OYu5UsOj8V/z6VSMdO/vc
	 tSXpA4JpbZrN7W3dAwl1u2jl3+3+LYkA7c5DdaVBk76ApPx+IXA+Hd1TDBvl7RfEnnd/K
	 Hocm3BSE93vuq6aSrj5TRiiRuFUaA3sFYX+MZpESVT+avV1+ShW3wXtPuFP+zc90ZsSth
	 r8ubnZM3+ehQlCsuIoJmFfdvBHlsfD4XtvLdAtd9DH9JE0PbwchQ60nBcWcq6VngmqJL9
	 nBIsy2je634Ej/dHpjc3jbPwzXSf7zZM6TtM3BvG/kHeZ+XAVI1OWstG6NcN29tPUZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VAGi8ADLbe1nwsDdtMJUG+mqysismIkmi3QPANzknRE=;
	b=N3Oy/TQ5GvVnqazuzcRXCLRuAhTK9alqEkSXFmIGy4Gzu2wVd64O0/kUY1XO6glI0jFC
	 rrmuveJUhd/lyce4rC3VDp5xZ1YRYZQEPpjsUmNQt8zov9YCMnixu462GgH8EhyQQ6oQj
	 7h0R29gWakoQwByVE8sl2BazYPI4YxPHIjqs5IjWvFSfRl6AbDoeHrjYOmGsmWk/0Sm8N
	 tGtpYKthHiT58xRSgGAqIXElrbm9E1RAaC5z02WBWWk3pfO77eZ4acDjHgsZ6eTJpsZ6x
	 glBzETm8GK5kWlyJxaV9e997S12d6hLTwnye76du8hBh1xRV1khFQIIyGKJfGgJwxcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjCUpmNl;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8914606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8914606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjCUpmNl
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so4844971a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795523517; x=1796128317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAGi8ADLbe1nwsDdtMJUG+mqysismIkmi3QPANzknRE=;
        b=wjCUpmNl+mRVvplDoEgumYPE3g2vqJKQo580YWEMbgKWCwgMLPfczJbnJxQ2Lx6fJS
         yMpi0u2vJaALSnXWBIHszPeiqA8DCjAM+BWjq6vY+ps/NaGroZjTsfuQgmP7K4h+36Qz
         tQUPmLxV+LEfU1HxNxDFfHAgAqiFd4ma61hQXlKn1wGEgaZaDUk6pSN5v6EIgXxgMe3t
         npl0OXnPrxY6k3giZUxQ58l7irS7XvjxWs1BVUZvTke76E5MjqYYNGj9HMBsQwvf+U3l
         9EdajxbwknzTCJQr6V2FnxbYW82Nsi7Bp338o/4kSx+7Bzf7mU9y9WbTXxn2OZQzyleL
         bErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523517; x=1796128317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAGi8ADLbe1nwsDdtMJUG+mqysismIkmi3QPANzknRE=;
        b=aJcp7BcU12kkmnomC1D18DWJjkPdcn8IWOuAempOS2yxqUtUARX/iLNiCG16WIAZ8s
         ARE12nlt0cGSDQhZx5VnnrTH0WXQ0KKz4p61JAzHvYNENr28sXUTuZOktn8Id6p+5ojJ
         kUWogJ27bmdbUfojGS/UaYyb4On77o8tHAmgBXZsxgOkWeuLpc5X9ZBsrsWnXeV0vzZV
         9z911vjIYAWNVHjnNX8OBTY8nNVZ2gdoq/Z/0//GdIQG+PuQ4hhIt/NlFvMcDdK3+oKz
         nz2KIQf9jFbLsoZ5K6WiCDOo+uQCZmcsi8nlYWtx21zqZ6EEc9D4ixdGbDoEQST10tSd
         OZhw==
X-Forwarded-Encrypted: i=1; AL+hErEAJaC7sgafq2tJVicsZgagR5MTtC4cHcWHWZL00YU0ulLc7QXjZBCA0qPteejXasTnE/KwkjiaausLn/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rJHITkszmqiQtace9SwRqk5H0XIMrqGOcErr+1NhDeddOOx45
	nDQvr+rRHnazWCPXHD+WDxdup1uPekFtcUUZpMGHfva0HwgixOeUaMiP
X-Gm-Gg: AZFdTZcLnXInbosEcwF7bapablP3oLV5p4TF0GLZ9br/aVVm8TaDDYukgUeZwZb8E76
	4FnQb9W13Za7Ld/TYtEBE1pYaJyov5O4v0yoTXXgiVn9CUD5BoEiVGLdJlk5gm2cJP74KSWogkv
	QxDyfpFgJzWwYF44zsxq5Dlc4LDbSgV93uM4WAUHPWw5PhY/56UeXnEie8lnSScvxjqTh/QtxqO
	Mzo2zrYgft73iHjpgRzPeD0JZe9NjOD5HUhq8y3wgQNDkWFs6judGhiKZEpc5vwCNK4vGQavq51
	2GzaYD03f5R7ioeS857zv42eKefcaVGGFYWsafsRy9GZH83z3O93mCtNArq34Fr22w6saaG/vAl
	oJEOIaoLykB4hESnDP1bzY2oc0eUqGr4pYzjVbXQzXifkMRmS8KNzYMvteTENmFggB261TJaFA9
	gHIx3tPaswc017uU04RfqfmyDa4yHVS4UPeaBgeDgbJXLYTD7zMmnbZ1FeOXREFjEF0eClOIriw
	7hY7G90E3FoMRwo/C9ViS0Ekbj/0RuVAqBRjpqSMzIw7iqu5n6T5gF7eh6b5uxDVqmugg2Qoqo7
	rFIYB+NLyBVe+cy8Oln1FgMPsGkhixOh/jmBjGWw6OrrLSIcA+OVwCH25mlGZyYoT2yX1yp03Gl
	IpD6qeikgmjyuO/mV1vMnrCkLO9FSovOvlEEKtx6WmcXKFMEH0GyGITUgCEEBYGiyIpvnmV5swz
	/owlQaqKGHstP6Htr6Yboc5wSjV9rJZb0WBFb7c+3nPqt9VI2Wf9CmAlVwk69Ofhs=
X-Received: by 2002:a05:6402:ea9:b0:6ba:eb4c:487a with SMTP id 4fb4d7f45d1cf-6baeb4c48ccmr1907009a12.22.1795523516710;
        Tue, 24 Nov 2026 04:31:56 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm4675512a12.30.2026.11.24.04.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:31:56 -0800 (PST)
Message-ID: <02419845-bab8-4e36-9a98-6830761da1b9@gmail.com>
Date: Tue, 24 Nov 2026 13:31:55 +0100
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
Subject: Re: [PATCH] net/x25: fix invalid lock_sock() usage in
 x25_kill_by_neigh()
To: netdev-bot+sashiko@kernel.org, syzbot@kernel.org
Cc: syzkaller-bugs@googlegroups.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, linux-x25@vger.kernel.org,
 ms@dev.tdt.de, netdev@vger.kernel.org, pabeni@redhat.com,
 duoming@zju.edu.cn, horms@kernel.org, linux-kernel@vger.kernel.org,
 syzbot@lists.linux.dev, ngocthang2710.1999@gmail.com
References: <00f667e3-a158-4fb5-84a3-9ecda4718ce8@mail.kernel.org>
 <179551432467.3135.11868205229731190547@kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <179551432467.3135.11868205229731190547@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 09:58:44 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] When the new softirq path finds a socket owned by a task, it
>   only sets a flag and leaves the dead call usable until release_sock().

Agreed. While a task owns the socket, the flagged call keeps its LCI
binding until release_sock(). __x25_find_socket() still returns it, so
frames that arrive after the restart go to its backlog and are processed
in the old state before x25_release_cb() runs. The owner can also still
transmit on the old LCI, and after a LAPB disconnect this brings the
link back up.

This patch follows the same design as Thang's patch from October [1].
In that thread Martin confirmed both effects in a test on 23 November
and announced a v2 which skips flagged sockets in __x25_find_socket()
and returns early from x25_kick() and x25_write_internal() for them.
That covers this finding, so please drop this patch in favour of his
series. I will not send a v2 of it.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it is still
>   reachable after it.

Agreed as well. x25_disconnect() clears x25->neighbour since commit
4becb7ee5b3d ("net/x25: Fix x25_neigh refcnt leak when x25
disconnect"), and x25_sendmsg() and x25_output() dereference it after
they take the socket lock again. Martin wrote that he has a separate
fix for this.

x25_recvmsg() has the same kind of window, and the review did not
report it. If x25_disconnect() runs after skb_recv_datagram() has
dequeued a packet and before lock_sock() returns, x25_recvmsg() then
calls x25_check_rbuf() on a socket without a neighbour.
x25_disconnect() does not clear x25->condition, so with
X25_COND_OWN_RX_BUSY still set and sk_rmem_alloc below half of
sk_rcvbuf, x25_check_rbuf() sends an RR through x25_write_internal(),
which dereferences x25->neighbour. I found this by reading the code and
have not reproduced it, but it may be worth covering in the same fix.

Martin, syzbot tracks this report separately from the one in Thang's
patch (extid 9faa82ae2e94c5c7d2ef). Could you also add the Reported-by
and Closes tags for 300375dfd44665f063a6 to the series, so that syzbot
closes this one too?

I am happy to test the series with the syzbot reproducer once it is
posted.

[1] https://lore.kernel.org/all/20261001150118.128470-1-ngocthang2710.1999@gmail.com/

pw-bot: cr

-- 
Krystian Kaniewski
