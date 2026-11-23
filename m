Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437042;
	b=m64f7+8pFykFZghm2S/ZO8lFmSG95lhO+wMI5B4d8q6KU8es/txqNmVn2+2DiP0ijLUG
	 KbjgOXFI33sM1JAEG61yJP8JPoc4IGtAu/PF7J9LSPZvw5kkhADBO2b40HXhByz7U1Sc5
	 L3LceWs6NLridP+AEitm6Z3QgNAdS9uCPzy6WXvLkNPJeWjIT/WQ02wU9zVQvidZF1opE
	 9jPUd9ZMATdVnXnN9lCnJtX6mRMkTbffQzN1ZC57edtG4sntEvMkASoUqBFUCUrBkiQqu
	 NFvbZFgijR9+ODrF+gGAxYO32Ye1C43u/XsPwQhChE78HnwsNvOW6DB6eIwheyCjf1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437042;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=pgnxGqH8FthlsEichz+tm7DA6jv0/wD4jOInsJE6H4o=;
	b=sGKMay5FnQgfWzqy7ZxRYs+nxbiyDIr68sRHiKwvWoUcoilnZtxjbd7hkKOTrH3i8ez6
	 nL0Y/QZEmgfW44pqUIuUT1brnFcF7/ik0LcdI2ol//avW8oNDMlB1msWhJe42ekVTMrgF
	 UmM7FxIFx9L0nxB7u8l4gSRvTBicDJTXFSBjt5jsJ2PXx2e8YrsORxdTZ0JYs6K3km4On
	 6aYVdZ92IhoecrNdYJA38AxOxUqP5JBHUunO4zc7hm5GCCJ/8C3J/kxpjyQH2A02t9gsU
	 zjdRSZDV4TrPRGKAkWhZUrlXKJERj5ptQAGnpAdl4uGWHrMUMcrjVkeYiF7YLsezHgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XcJxtPCW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jyAwNJGN;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F55606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F55606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XcJxtPCW;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jyAwNJGN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795437040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgnxGqH8FthlsEichz+tm7DA6jv0/wD4jOInsJE6H4o=;
	b=XcJxtPCWAjHF15LjEDYO4+b99nziJkV2rg1RnGKYOM9VGUVq3/LmHuC7GnHzSqlc4NQgAc
	waRNooB1DYYh7EN7M+8pd6xA9XhKGc9yRo7ClnxNJQqLW+ViXR+Ipma1KR0ptiG0Gs3WdG
	Mza/FTklYwYoXeoTgrqQbVDkVIXCQkk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-MdPhAIvEO6mroLDtWGLRCw-1; Mon, 23 Nov 2026 12:30:38 +0000
X-MC-Unique: MdPhAIvEO6mroLDtWGLRCw-1
X-Mimecast-MFC-AGG-ID: MdPhAIvEO6mroLDtWGLRCw_1795437038
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso16442215e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795437037; x=1796041837; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgnxGqH8FthlsEichz+tm7DA6jv0/wD4jOInsJE6H4o=;
        b=jyAwNJGNhiGgkuwIDb4eY+AmDrjRiP+FQ5skIJJEEiSkxBOOjko3hWkZlOzSr72bMD
         jSU4FYMZ8UDUiaH9cyYoVaE807hBwTnskiPCrRotr8JZrrpbjLCFQqCkVKxlAD1gAv3+
         /1e0uSI/CZdM0xYXaPTM3tXWqr086ZCuhUiwris8x6kERLJ9h8wslpLEidT4juT7UoI1
         9QCMiKEo3geQl4K2fklsSOjRpU1PpQ9XqNIbwC3XC5AMmKPXdpl4GnLDA9hmdEG68aM9
         O4V0NpAh5WeZcU59cvOilTUkmL/oO+4nmjmLBRk98WwV7hRsgnKBrIIJyHHpEsTajJpL
         r4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437037; x=1796041837;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pgnxGqH8FthlsEichz+tm7DA6jv0/wD4jOInsJE6H4o=;
        b=spQn/PvJr9yI94Ve7g4hmajzFfrD2r3+2p9Ghb+d3eQEsrbUlwU+KeqQh0RRVQ5IMV
         jqveddEv+nrSRw9HM8EeEWZ/r1OGy5KLx14x45YTfSec5IoGzPWXjv8V1IMSoaW9+c0b
         H6AcI8Bm2xqbUI2SzhY7VsLcP8DKIEVSAVI2fz350jYX6DhRQyVeVb31b0skqMKI3+uv
         za5M+qd458iq70hPEYGnD7yacC9d54R0/dzAyIpBUVb8cEiRTyiwdwuAP8+BWptDbCzG
         PIzJqYMkMVgqvQssKtcvWy4oizA5BxivpUyy+8HwtMAtO+DHuMksLR1uxuoguWtzx6Vi
         DVpg==
X-Gm-Message-State: APuU4Z9ZZqr/n9fYBZA8iQ8dQ8hgbL10MP0gftI2FMoLqaa5waisBSLP
	QvzG1iWn9SqjQuTaMC3s/Q2rbWLL2i3g/mzPMP7uYsVWHgs+h3v2aRARNSt7H+PQO3VundK32SJ
	JyUqnuNs+aBXyyAZPpW/QZ+C+/oUALqryzbk3xqul4+RExTkdVN9ieUiecjLhdwS1Xg==
X-Gm-Gg: AZFdTZdZyL0MyME7jk/05DkW924LfRXzL6aVeL2JVD9T5xyOJZczTG1WolAFkfGQ/Ze
	NNGQ1nUECHsFVZHCBu8E/swKgCb/9bnAJ9fNpq0zo15MF1bAbau/QqjVdVA68eYCrlCP66I0HGp
	bsLmXd91FLCpmMZ5HZsHg8LTbkyzm00D4f0d7JcE59a72tN/XlKTpfRnV7RHj/MiWiltipxiQVy
	JodLVVxPxpqHuKnYBxA2khfIOqqUAOAg0EcIeweleHZev69vNfaAby2OEv1DFLNTX5m2hWvtJwO
	Ps0aAg1kU+LkX9bLXt8vS0JyyAAkkk5y81IsvdmEuCyeoxwIJsNyT6tf6QdGFYPyWOak0Bqe6uo
	Y9aAWqe5cq0ZI4BMIAlqE0zvjA5RAoh5w4GAXFgoSeXB0UKe1inAVEcMS5rTJx9VhiheUL5/ynC
	bAlLUat1Q6r21QNdVWrwNzMgVoseL/EIIMdw==
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr226584655e9.7.1795437037603;
        Mon, 23 Nov 2026 04:30:37 -0800 (PST)
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr226584405e9.7.1795437037266;
        Mon, 23 Nov 2026 04:30:37 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm188352465e9.3.2026.11.23.04.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:30:36 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH] sched/fair: Don't let task_tick_cache() IPI dyntick CPUs
In-Reply-To: <20261120154015.GY2668564@noisy.programming.kicks-ass.net>
References: <20261119203825.2732984-1-vschneid@redhat.com>
 <20261120083440.GL2668564@noisy.programming.kicks-ass.net>
 <xhsmhv75rojdy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20261120154015.GY2668564@noisy.programming.kicks-ass.net>
Date: Mon, 23 Nov 2026 13:30:35 +0100
Message-ID: <xhsmhse0rohlg.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 20/11/26 16:40, Peter Zijlstra wrote:
> On Fri, Nov 20, 2026 at 12:02:49PM +0100, Valentin Schneider wrote:
>> > +	/*
>> > +	 * If there is no root domain; there is no balancing, and none of this
>> > +	 * matters.
>> > +	 */
>> > +	if (!rq->rd)
>> > +		return;
>> > +
>>
>> What if the setup involves a separate root domain where all the CPUs are in
>> dynticks mode?
>>
>> Methinks the signal we want is:
>>
>>   is that task on a NOHZ_FULL CPU with the tick disabled?
>>
>> If so then we shouldn't do anything about it. Let the other CPUs in its LLC
>> / RD run some balancing. If they're all dynticks, well then there is
>> nothing to do is there?
>>
>> And that should also apply to the NUMA stuff like you pointed out.
>
> If you have a root domain with more than 1 CPU in it, you get balancing,
> deal with it.

I think I can live with that. It means we mandate complete CPU isolation
for NOHZ_FULL to work, but then again that's what you should do in a sane
setup.

