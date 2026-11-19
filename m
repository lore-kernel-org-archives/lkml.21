Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101728;
	b=2IbYZU51AnliXPZvHpSnmPzvVn/gsN5fepEA5xjx5g95syIL8kMq+ZjwM0f/Px3ymYCt
	 W8kzWKxTcU8STPLYwuCAska1k6QwcgEpwITU1dXmBfi18AeUAKMky/zHnI6AdI6f0tBwW
	 eRIfKAXBj9tb2Jlvlu24xoh2E9ULaiNEuW+PRhXyz95qXWb42X0h3hFPYs1OI3dWwuJ7j
	 TC08wzYOlqFAVKy34umg6/PJQT4JveZaeWF0sgx1jMRPIDtUWxMTpXHmsUpReqjPUkJTR
	 Mtq9jkLpprlx73d7UjLM6N7lYPCsiV+J85wCuuuS1BpvExtunGHX8wt+Zdj7BfN6MYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oV4J42aG7aSlwZmO4hsI4nR3tdj4IKf86NVOjXkIpNI=;
	b=JfznDP/ww4x8NMV8D1hN2GstA+gA/vMsfZ61LUBWnfHVikjWHUe2UUCuyc5wLyy8zLtc
	 SN9ANLfJwr56KCfFhLcOBJZw+Wjsn06yih4uJzClkP4quifa3sRJ9sVirkbi10wMG0Jrw
	 l3lmzWImD1v0+faJ2JnP8CEbhYv7x2fk5cLbFrSXA/QBRXKgsfIeZzqiJQ1jV2VzGmdgm
	 4OKW8wNKsSON7JPu9uU9tdPwhIByiucHPTaXz9zn3EvywaSUnbv0lA4GTV0fdQnBIDooK
	 JbUwtCz8spSSpUb43gYTCRwoCU+6+TOko3LtyozDFkbWQmvWEf6Q6xCs11L/WARS20Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ed9MC6g+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8022B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ed9MC6g+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so7798885e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795101726; x=1795706526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oV4J42aG7aSlwZmO4hsI4nR3tdj4IKf86NVOjXkIpNI=;
        b=ed9MC6g+5Qtaoy2xB6R75hiktNRHrl7RaNAjvJeRhSHqpYmnLg4iyU3/hdIW4Pu90D
         a4LQmtDz7S9rGXQd8aG1A/52yzeUu+XvQDN90ggIDTb2We7bKM8vuvXuYrr9v7ehhHXK
         P7QBdQhyVZmPZydzQW88om3uzIo9thgVho6ku23S1CGgMS4BdIfOIiKtP50+yNHtvxJa
         KmtxG8XqHOaTzAS7jgYCxmxQTzMgfEsFdZPmlRsYoT29OqJYiNYjWC1tYEqdP0sMJwQc
         dlWpmyj71nQQ0v8C4hD6MEHQmwQRN2YbJ8uEGM8vF1OWA8ciDyydUn0Duphkcbv01yhy
         +P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101726; x=1795706526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV4J42aG7aSlwZmO4hsI4nR3tdj4IKf86NVOjXkIpNI=;
        b=OZBuAlYIkWDp4JpaaEzRQrCwABI3/O4+GoQ1I295oAvTThWJsPuB+7inQR/M6+E6BG
         3xC085f7d0ZN5W8aM7fTGOOtohNKfAlBy0pLz4OYfyvahYh7VSg38r7VILKLwh4oj5aC
         n4UqmGcuibQMwSZp71VHPkh6xMl6KKPKEyoD8Mq5jhtFGibcJjKtv+d+Vs3iq5tPUTJ1
         kK+b0CYcvN2b4T9WYDOg/m2arpIpYVaYKeRSOoQmVTzQBXjwt7sDL6aA5Qkw0x7U0v5w
         j/0SFA8PSLDcHMCmLXxI0kdxxDV04c0dfcN05z1WnXYYMujGbrp5MU+42hlJ3LCzw/Ec
         WPHQ==
X-Forwarded-Encrypted: i=1; AL+hErF56IU36l2MSixL7/Lqc5+1QZ1zfRk4iTqKN3eJYPUJcZ0wyB+4NTHDYnXlL3YxlskGYU1XZkOsqPajgrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z92OLPKsQH85T/MO42hNYKAd9XY9EGW2WbmesJR7I1r8jOkxjE9
	l52aUDipy3dY5sJGfDxUcOEA9c4GQAuUbXxlklmCamLuPVnr1kqtlxn4b0zwYb0odPQ=
X-Gm-Gg: AYBFou3Vg/A01tYsRiucg9cgVbqopxLbyFGpp9DZpnfWJir1R5GYvNU2NKPwuOywA07
	pHkfJlS/+gAnlAt0W5bzQKVF2VBquBd5Mv3Z4Q4bEqSJslLrwnP97Gdr2rfYFuladkCxlkV68+r
	UB6qsjHYsSz5cN71ZvSxfR0KTskgCFrz0EEdTHerxvIg/LDLCkzJGqzm8eXEu4d6xhSYyoiR4+U
	DFTeycdBcYW1KZsGc1nXJgyVB+wCRQBs/DY9zJQ3DAMnQHs/G6GlGiLZv/dDLsIVDxTQ02b5f0s
	XrjNr4PUqzhTtp7IxTVePal4ds89GKLnl9amEFLIzl9NKxJjda8voTinH2PuAu5hpOg30dxHRoq
	JeBgAiVma4ALU9Gx1MlW1EJOZBLsoCPX7XBP/GnWZeAfhLWToFNgl6HmGb9YCBmohHTfNkul349
	rao7HRoRf3bav5eJP9wa2MMIccADgxH2SewpBiQ+t02mtuYkBffuWbN3omIZ6FCVI3KjNw42fEt
	qj/5lG1uHj/pUGtIOC898J0IfxV1ztz9b4ZPVLdhhUd+dDbAAUpLI5pWNZv2BoRgm/mAEph0w9l
	OFnAJFCEPyfUbQTu8B7kBD1GUpPGI8js9EmIFYtLyggxYD0YgZdlBoui4vZGNVWqFg==
X-Received: by 2002:a05:600c:674b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb860ffbaamr34819435e9.5.1795101725389;
        Thu, 19 Nov 2026 07:22:05 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84cbc5d3sm29859235e9.0.2026.11.19.07.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:22:04 -0800 (PST)
Message-ID: <8b47b628-865a-416d-b9f9-fbeca3f9d649@suse.com>
Date: Thu, 19 Nov 2026 16:22:04 +0100
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
Subject: Re: [PATCH v3] module: Add stubs.c for CONFIG_MODULES=n
 module_put_and_kthread_exit()
To: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
 John Fastabend <john.fastabend@gmail.com>, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014-module-stubs-v3-1-319f2a7d4a55@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261014-module-stubs-v3-1-319f2a7d4a55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 3:34 PM, Petr Pavlu wrote:
> Module-related stubs for CONFIG_MODULES=n can normally live in
> linux/module.h. This works well when the stub does nothing or simply
> returns a constant. However, some non-module implementations may be more
> expensive, either because they have a real implementation or because they
> require additional dependencies to be pulled into linux/module.h. This
> header appears in roughly 15k #include directives across the kernel, so it
> should avoid bringing in unnecessary definitions.
> 
> Specifically, linux/module.h defines module_put_and_kthread_exit() as an
> alias for kthread_exit() when CONFIG_MODULES=n. That in turn requires
> linux/kthread.h, even though linux/module.h otherwise has no need for it.
> Note that linux/module.h currently doesn't include linux/kthread.h and
> requires its users to pick it up through other paths, which is itself not
> quite right.
> 
> Introduce kernel/module/stubs.c to hold such stubs, built only for
> CONFIG_MODULES=n. This mirrors kernel/time/posix-stubs.c, which is used for
> CONFIG_POSIX_TIMERS=n.
> 
> Define module_put_and_kthread_exit() in both CONFIG_MODULES configurations
> to call __module_put_and_kthread_exit() and add a CONFIG_MODULES=n
> implementation of that function to kernel/module/stubs.c. Since
> __module_put_and_kthread_exit() is now implemented even when
> CONFIG_MODULES=n, remove the corresponding '#ifdef CONFIG_MODULES' from the
> noreturn_deny BPF list.
> 
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

I've queued the patch on modules-next.

-- Petr
