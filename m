Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774984;
	b=WLgU7A9b9P5WnwBswDyER4wyeL5O26C5FUrOnq73j1b+7yOap7pHvU5zFuuGhMVCh/3Y
	 0zvObEkck8P7sMIqxamw0JawNqJ/FqhTLl27V+vvGc/OlegetA+lyabHsrzSQfPM+XO/N
	 4dGaD0fN+REZD5hzGrp3lOgF4O5RDRGUHZWLsVQCM5+gM1RRd8z3MLRCgoL/L9KJ7s5D2
	 IQIn9BQ+aeiI1CtzscsyTqRf8UewKB/8AygRsDuXo2FihWVerlhsX/MsYHGc/JeIdYJXy
	 fYRtajFpS7vXjlsVe1NYxeXjjlUChvbJKLVtRlBqCgdS/rV/FjTXe64FuAAAbrX5t1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=P3ynkI0k+HcXF9qyy29FnNuc4QiJdDYam/TZECg0nx4=;
	b=n1fQJm952ZZxQTge6c7yZFsdkeiGUi4F5kMHGykDJ+AVZKilziv81pshWU2NWedX9JE+
	 huH7H62Nwbx0C3WkP0DYyOKkcRbwEWE9juhFFZ4BKYa3e++TVssjIii/COiFpBD6zTgSO
	 9athXA9UXx3IljnoasRvk04NG9JYyLCWvdzzpM3Pr/YulHm5EOsMXUTERP32sYRJrXpio
	 Mh7Zn6DcbrHb9zc0W17HeaeUuL1SXaiBpwhA0IpD6/IjCx1o8vlelkRjJHkHpV7WOG8se
	 1cHLmumA2RShoD+cvuKJPyOHcbrEyBhNAqIjAFzYpfc3IdJ26gD7cQw64hQhpm8mM1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpCt59Xe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1360A2601
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF1360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpCt59Xe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4af52002471so9091745e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774981; x=1796379781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3ynkI0k+HcXF9qyy29FnNuc4QiJdDYam/TZECg0nx4=;
        b=CpCt59Xej5ym/TOWvq/ak+Pgpv0ucn9nC7QHUDfquRZQHgDsTIfQOfZE42cpNZ1zeY
         exj3tdz/78uhxdN9yZbqsfzY/aWNnyzp7K77JY5WwJkVhLxwE6yBQUIrWfS2233prAMf
         H7Sn166KsdyZSSDGnjDAWcvmgt/Cv3ue/JkXqtrQt+Rey9IGcxMEMLP0ZIJZoIrRopzZ
         WnUd6B6ARZul2dGoKzqFLxZT7XSmDVpVUY7tKR/HgGLIgZufQiJjiKqV4Ri7pTSynU/V
         0KlSQZbmmkekXZSADHrshIGpCDuXfldAmXooNQbQReBS8nqQ6qAOxgg59+fhrXJmdtB9
         FZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774981; x=1796379781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3ynkI0k+HcXF9qyy29FnNuc4QiJdDYam/TZECg0nx4=;
        b=zRcvTWWh3NFCOpYQlss154BEEck/vWZhpqUOlGng2uB008CjZUi+tP4QWx6Gy9qpa9
         QpGYeHgAhRJaDE85JXNxerzWc/ZAElVJWdEY6H8DyCcR+xVQMmyqsrtbicGolU5gO1pm
         8xDnyr8X/HSIH2XbbxQnka3s5J3NOzr96+brRXvYJpp4KMgRx+s9uG8JnUFWLd1zPE89
         L4j32NNifbwDHmAAMzuEUzll85kszVlx4vAeFeP4+sqyN1ROTB/yGHAm44K+5ag/tfgZ
         88CdlofrPQijTq37+M9G6jb47wfc0Ew3q6vLY8IX0wYM0qyFFssyO4RNuTfxP1fEWyCR
         c4mg==
X-Forwarded-Encrypted: i=1; AL+hErFyt1YkDFVICv6EmJ5FJCaXk2DTYS9CpGFJfjZz2kqEUSgpjdiF5cu79vM3Ua0CZ8tSXGn/U+vp9kImTVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/busS7OqfTEZdMo0K5lKAr+RVynfLN1Xz6qKxVI+q6c3kKhC0r
	/UA17FkMKkzDpbM1BwfAOI3aSN5tCz/OH8aXs84HdJ8CdySQCq282sDO
X-Gm-Gg: AZFdTZf5Gpxh9YucW8R1uVNZN6H+yYxvffC+0VM3KFNAhnHzjbStrMv7JD58FYNE7gv
	nks7XRjVHNi3YoFth/hvXIZIVM59n7e7dxDSz0gLCOFUV4WnoaejULAQ/bs5NqF4QAPjZ3OaXIv
	ktBwFkTItq9jgZC+r/l44lwyPTrHMtLRZHBpC/Vx0FyxMroRCtSqvfN8h8EJ6ZR9GLgAN/+bznk
	vC/JI3NYGVLEmMGqMd3+QAwmz7LXIpBGhzr1ufGiM+6/whniSwyUnwYfMtQYAh/MFrkbPYJWH/i
	CJvdxZgEyG9j8tBTGyGbQ0VGl6OLGZ8sZhzxxHu1Hb3waTldzLo3I40bYx9UtEnoYlZi//Eny6y
	9ztVxgQl9tqbzunS5e6EED6wkYEw38VlAFTz+3M+lEiuMUTW7Lvtu/+0uagsWnnAhT+wUGcVlGJ
	/OqNx9JlE6rHw6VK2D+E+vp4aQ88CLGSqa+lpKKpz4Z0eRkXrEcXGhhzh0P1/7qICi4fDH/mpCK
	YhHBo+V41UHXPgpvWXj2GLWo9ePXkt/seiUUZVKJp6uR0/LLK7AXygZharO9mBpddX3/Ud81Vsc
	ou+7qi/2UFBz0vfaYIMO/i8jegJ8POY+XQXllIFaBi3ixPMIgl94AyVZ
X-Received: by 2002:a7b:c30d:0:b0:4bb:b884:7ec6 with SMTP id 5b1f17b1804b1-4bbb9068724mr377645e9.0.1795774981432;
        Fri, 27 Nov 2026 02:23:01 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm654552305e9.4.2026.11.27.02.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:23:00 -0800 (PST)
Date: Fri, 27 Nov 2026 13:22:58 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Simplify pref_llc_queued handling in
 account_llc_enqueue()
Message-ID: <awlZNYtxplGytTtP@scheduler.schedules>
References: <20261127091146.3504-1-likunyu@open-hieco.net>
 <awlMqTZK8_0gmSMC@scheduler.schedules>
 <4432bc13-0d03-d4eb-0858-0efbccf6c697@open-hieco.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4432bc13-0d03-d4eb-0858-0efbccf6c697@open-hieco.net>

On Fri, Nov 27, 2026 at 05:47:26PM +0800, Li kunyu wrote:
> Hi Kayra,
> 
> On 2026/11/27 17:33, Kayra Cizmeci wrote:
> > Hi,
> > 
> > On Fri, Nov 27, 2026 at 05:11:46PM +0800, Li kunyu wrote:
> >> pref_llc_queued is only used once. Assign p->pref_llc_queued directly
> >> at the original sampling point instead of caching the value in a local
> >> variable.
> >>
> >> Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> >> Link: https://lore.kernel.org/all/awhlwJTOLPeNqFW8@scheduler.schedules/
> > I didn't really suggest anything. I don't know which part of my mail
> > was a suggestion to you? Maybe below code is correct but I didn't
> > suggest it. So please remove my tag from the patch.
> > 
> 
> I saw your reply on the cleanup patch in the linked thread and took it as a
> suggestion, which I then incorporated (hence the Suggested-by). If that wasn't
> the intent, let me know and I'll send a v2 to drop the tag.

Yeah, I want my tag removed :-). And I don't know
which part of my message was a suggestion to you...

> 
> -- 
> thanks,
> kunyu
