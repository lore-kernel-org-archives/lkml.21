Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004022;
	b=eyq6E4DflmDVFLUdI+V8KYNbRNhBwUbEsFAcN7JXEwjY1/V81OPZpjWzS9jDfbT8o3oK
	 6PTCdlg4RhzUhli5/C3SiKI8QBZazG5zdU3LW5M8T8PhEhbdzlaws+VM7fmhajfxu8Sru
	 g6tLeYV/3sR66c3rJRlWMqfRriXGzV1lqXr/jrhUgQxDjafSoHHO4npH3zmLKcjww7la8
	 yq1YPs1tWa1S7iazm86gY4ybDA8s6TKrTGAxcz4upZ0+kRYM3OXaR/r33PhPNeUQNTc2m
	 A8rK4zfZMmE92IieVxBDeHtd6WAjGsjrWigJr5PjieJVr5cXuGOKwm5GtQpKES3nZ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KxB4jhH7Ez9P6lACX3OsbcpbKmuw17+KQ5Axx+XuNb8=;
	b=oi2Eco3Ih9rG1TGtoKr0CFuxn7BK7bv+rO2+Srk2rZS4pPCP+a6GH0ZTJDhDtOoRdSG2
	 EJNE0ffgTiAWPh6SFcsyNuxXV1/lxfr8eDGUShdMTFfcmK4rlfovkg9wjwFOQRzmmWG33
	 /D5eMX4Z8GGxl7tif0lMptcsJzn5HVw1z5iQg8e5jO98HY12caD+Bvj+ufGNluXTabWhl
	 5zoi3Fg3HSmMaoUO8s2qowNdA/2CJiKaxBlw55iFFamkHAJOwxpviZlm3CzLBzhMP+EUS
	 3xprDeagCnoXuTX8DWFFEIDH6j/hahYyDjp5lp4/KGEzXnZI0xt37jJ5n24OGuZUvIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQfdB3kT;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4CF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQfdB3kT
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6171265e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795004020; x=1795608820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxB4jhH7Ez9P6lACX3OsbcpbKmuw17+KQ5Axx+XuNb8=;
        b=UQfdB3kT0yJqEwZSuIqS5gg21zD7RCfqVEpZA9vfs7Nvbi/+mKxcYczUoJqjxFGJVh
         C0jgbQ5z+64GCj9xnH/3bD3B2TvWe2d7cklmXF0SMn79ubsgwwWnqVB41RlAYumnLPEK
         pekZYRFGaanA0g86umBdAcLLQyORHpNxX65fddKYAMrLdW5SRVdPyg1AyNBD3RlHW6G/
         g5BBSlzXmNp7JKHgybNumrnqQl5MQVRPIPk7uRzf704KTKPo3Rz48SocgI/RhaEYKvbc
         dlRkW7LMmTcABE41iU6HjSfdZHM1PAJsl2G0w48I4dKhkucyW7iBSuZBmTKo8NGMPr5U
         I+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004020; x=1795608820;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxB4jhH7Ez9P6lACX3OsbcpbKmuw17+KQ5Axx+XuNb8=;
        b=L83vLlZGcFbS/ei3xfYlluumV3vWHq+jSBvcEs+7wQa/cRNXIQ0axV1GSi9EfoltUR
         fUPwp82dYJjUZEXNUSK6a/6naMUF5PkCo9vGEHjjTxGin+JT/rhZbGD50ZvyMDhKe+aG
         i/fQO8Y9qq6y4SZKtEi1ci69AL1qluqDznuGq6Hf6yY5c86gFf8zopMZcqdlumUbQUtx
         JsLUB9N7gpvSVt15rfuQVcGYbfXR1IBEF+gHvVY5xa6Ox/CgMyYZjXc66jixhWJaNslg
         KBx+sVMA6qViOakCh8QRIWWe3mrer6qgqJPDdRrRZzr1pLf+trhhvFWvfmm9a6ontI13
         YAtg==
X-Forwarded-Encrypted: i=1; AL+hErFHTFSW01+W1oUNCOWxOfK/RCY5tqtSKujqeieE2EA1Rpw9sl5mP4HJM8ssBzm90qvsnd1F/yL1TNz+0Po=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B06/orq7teKc4su45h/AmnI6zs0IozQEFvwZtHdUsLKYQug8t
	QJyVIuRPlrDiKOlu525AnmAyHxSSaryFSK3KK9pgZDof0YUPnGmI6MLQ8cQdTCLq
X-Gm-Gg: AYBFou0Aa37HLobiuW2NtLqls//LsMUWIpiihaQ0ChlLvrC+VbJVmM7zMysW31Re6lr
	RdptyLtSOi5Uid1oE1YZsWVaUlsCsW4M0Saas5AsbBPowfirJv9WUrlacfBegBk7omfP51x3djC
	J8AWb32d0IeU3bpqJDaY1OnUyTtbACsHniCdv78qv74dEeCZaIYh/w+OPjG7YgGHZj7agG7QZUx
	ofgaiU1EM1THpRlfrrmXBhLv4dIlcFRDA1dD+5ZVIEP9e8NNQMgQ43bFw1eKbYNqp04jo+IiKF9
	5FJ75YNus8oZyueHx1vhsx5wPx/A+KT2RF2e7UcH8mo0eug7YQUaVGXII4uAvRwp9jiQNmpmofG
	gQJlLR/sXY4yqkc3oxDluWjhciiMBFfiIlFRf3fTYB390bjr7VsUasTYO455wmHfPTMQhU655Lx
	oCk2di1FUtiuaHimk8B1nkspCFofJYrExdmfp+4615lT0F4aHcE4f4K8swxCjClFVopvbThaQDl
	vcGoZnSHFp3yMLjZt5eA53AeJYXfGJk3JFag5pbVrARCdbjTLNJkbbKXNeP+cHW0LoDiHE8T8/E
	nAcfIRDzN7AoyeEuyzNLicVlqBTKpVz0suDx6vAUSIkkcSAgk3dWju5sZDh103+YuQ==
X-Received: by 2002:a05:600c:a303:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb7da13acdmr38582115e9.6.1795004020044;
        Wed, 18 Nov 2026 04:13:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e59f5d7sm27660235e9.4.2026.11.18.04.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:13:39 -0800 (PST)
Date: Wed, 18 Nov 2026 12:13:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH] compiler.h: Support 64-bit bitwise types in
 is_signed_type()
Message-ID: <20261118121338.51792d61@pumpkin>
In-Reply-To: <fb66a344-b688-4660-90e2-018d31c2a482@acm.org>
References: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
	<20261117080621.7ca022dd@pumpkin>
	<fb66a344-b688-4660-90e2-018d31c2a482@acm.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 08:32:11 -0800
Bart Van Assche <bvanassche@acm.org> wrote:

> On 11/17/26 12:06 AM, David Laight wrote:
> > Don't the trace definitions need fixing?
> > The trace code prints the numeric value so you really want a host
> > ordered value in the trace record.
> > 
> > An alternative view is that even asking the question 'is_signed_type'
> > of a bitwise variable makes no sense.  
> Are you perhaps suggesting that we should tell ftrace users that it is
> no longer allowed to declare __le64 fields, something they probably
> would not consider reasonable? Please let me know if I misunderstood
> your question. Below is an incomplete overview of the examples of __le64
> tracing fields (__le64 typedefs have been ignored):
> 
> $ git grep -nHF '__field(__le64'
> net/ieee802154/trace.h:74:		__field(__le64, extended_addr)
> net/ieee802154/trace.h:367:		__field(__le64, addr)
> net/ieee802154/trace.h:386:		__field(__le64, addr)
> net/mac80211/trace.h:2507:		__field(__le64, twt)
> net/mac802154/trace.h:191:		__field(__le64, extended_addr)
> net/mac802154/trace.h:272:		__field(__le64, addr)

The fields ought to be u64 - since that is how they are printed.
So the copy should either contain an lexxtoh() or a 'force' cast.
The same is really true for le16 and le32.

David

> 
> Thanks,
> 
> Bart.
> 

