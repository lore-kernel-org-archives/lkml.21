Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679356;
	b=DZxhCzvY4exSiBdw2TEv8hPeZMhwtjWRdSCVLmYNa9gyNsX1aMl4pZvPUZWMx99YCaf7
	 1DlIhBTKgU9ws0knACc8c6PJAyC/80u3Ijig2qAj95zZZN33OMqTMe8ML95wSMG6AZwo5
	 fmutBw1Z2W7+XeJx0d4cjSCBP9U0wW5e9F2QsrDXvJb0kz51UyzQbLpABna/rkG8MedYC
	 AjoWX2GbEeP6Lex8LVks50L7Iu5cbSIhhNe3cA1lyTHRqAJX5/l181hdwAhl1EIkuj9Ln
	 dIfwYS56t8O30TDfIgPR3ovKsRiibyjhBb6Y5cW+un9/xl8TOVywlezaTSM1yRnimLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679356;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B21i4+ZUhaISno42DnRuHLIvnKFoII5gbyv4BOzzN34=;
	b=SkUjsk3aId/8xi7bobuF7Q1TOpNpXIbmqtCIndgwpDKeEgxWt7wO3HeGF/ZgWWRxgo1v
	 BGt2wvfQu1CP4k7kwQOyzhNvDG/w/iDAMiQUVWzx0CAK7nte8ppWLsClVBpI4Ri23SiA1
	 KC1VEdlBIp1E9eaYQC/do//KG3/gWxTyJ5La7nGV1owpQkBI9tuHxn7rNR55iNx7tMMV0
	 4TzymxDFmG6j8Xk6GlVQiwy1QmGj5vZovewY96nXbcY5gseQKmK5cIWOHI5Xvl+xDDTv8
	 YJrd4bvSSSBxueidDqXYFE7WpWHARggGzU1DRkgFQ6YVrzB8jRQUa0WwJA11Wm6TSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PJneCwuX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OXuiVUf6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1082F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1082F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PJneCwuX;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OXuiVUf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795679355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B21i4+ZUhaISno42DnRuHLIvnKFoII5gbyv4BOzzN34=;
	b=PJneCwuXmw8O75xuhjstkWSL8OjeZATaw2QXqhiN8NqJ+mXvPBHpo4fH14AdxR778sCb7n
	akfLlhN3lHMCvl2GQjq9Z2Y0GAndpwEY1z6CPO3wyobCNF7c3fRS43+7g0f0YcKdwFxM+i
	qiSakEvywIBcrM6yO8DZTQE17i7L6oY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-N43S-JrHPIOLbLZU7xOoDg-1; Thu, 26 Nov 2026 07:49:12 +0000
X-MC-Unique: N43S-JrHPIOLbLZU7xOoDg-1
X-Mimecast-MFC-AGG-ID: N43S-JrHPIOLbLZU7xOoDg_1795679351
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso3021864f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795679351; x=1796284151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B21i4+ZUhaISno42DnRuHLIvnKFoII5gbyv4BOzzN34=;
        b=OXuiVUf68jlCB9alV8RL/oHewEdwKlN8yDpux1JMhlwJCFiS8BRWPtjpVqiT7JOwVu
         qvwbzPiURwqoTw7AYSYNtprqytRhYVtYS3JNveJQ87KhDAEKb3WkZ+JQ0acx8f8oAXDE
         lgGEJseW4R6/DdQtFfUgCumyyBy4zDtBI12IQWbMlXm5WXhxA0N/42bKh8QNg7KzbM+I
         1Hl8EFZNPDwvbK4pfUdwvIpOM/v8F+obrtmPrlcl0d8DFcfV+i/hzkvvmvS26eNqXB9d
         jm+HfGfE0IUi1MkH1rcRJ7BK3oRooeo7AKINVuPDP46Z+ppkxVlX/6jXxLmp1K4v/P4Z
         yhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679351; x=1796284151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B21i4+ZUhaISno42DnRuHLIvnKFoII5gbyv4BOzzN34=;
        b=LtugOnPiI+SY61f9H4AAsYKWd3IUmmmVTJ6CwyDRnsDdT+lAYmoKIhy0pwuJdeX8VG
         /CVsAf+W/lmypZRLomlFBo2XtEDiSuwUb2SB6SH983Xv5rDs1GA/QsaEYZ5e7axksORi
         br8xMmm7P3sJOK0k46YhrvViO5lRtMoxuGFUAExo6k+lMTlMjdEyi/porgsRTDNrXGxo
         GoauM7gAaEbS7arzKrXbzomzwhukq6rSp0r1OPuWhHQNNmNnXtHNYxm2WTpV63V15kgm
         x92uiXakIqfbfCrwXK+B0giUTzS8oPIf72L51JfMjTWodRAkZzOoVhq2xmzq2Dkh8ceZ
         hWVQ==
X-Forwarded-Encrypted: i=1; AL+hErG9NOVuOBJwRrIgynGGz6h6ID3SSjIvG6fi5lt45h35T9qEs1l1T2zQeoXMBGLjMl7MfN0DKFK1TH8DMTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AEbWyBx/z4V804obNCGh6GJvI6eVvK/+Mg8sd3SbuHv/wA51j
	UrFnfL5/DLPn/ZkrCp4f8iptGH5NlrhTwpwd8zwwMVW99om8n9MudFvUCq9C74bhStc314dulnW
	LNU20wDYWWT+n7WYqm1S1dNY+K/6JOadbCatZ/cK2Z9uk1QR6HhRjuROBieoR+2I5WQ==
X-Gm-Gg: AZFdTZdi24nBRxX7GGe1sqLKWZd36AuL8iqJkWBG0vcUDXOHODE2zLpd5ce+QaC14CK
	l1kl95O0vzR2i42OqlUmW4bbgvMz2gOcY1NUSWmqqug+vOepN8pP1Acxv7bpNxLBmf/k7sv704U
	P+4r4sBrkhT/wZVW3jyv9HB/OUFk16iZFSUDvu+rBb1Tiu6dn0DvtyBDeQ6Dk9ReIlmcKo7KPIY
	cVppqAb6NKRK46A7IBVNMqArIea+Cd1zviDrYxcHlClv4DyPFO8AA+t8M8AF51z8lg1bZWFebWc
	tzCvYhcApuIPg8Pt7Jo9XRiYj0gXdrKtag0wIe6HpJJwwvS3Pvx+b12R8IOhcvl4hLqzZ4xiheW
	F/ZhTRUuj9wpoKd/mSCFtP5lXB7p1reGzulw0AMuC3nsNcsIQORLXokclkzudBY9GBuRM8KSKIe
	dhw6Ky
X-Received: by 2002:a05:6000:2913:b0:4a8:7115:fa08 with SMTP id ffacd0b85a97d-4abb0f3c202mr41157253f8f.13.1795679350698;
        Wed, 25 Nov 2026 23:49:10 -0800 (PST)
X-Received: by 2002:a05:6000:2913:b0:4a8:7115:fa08 with SMTP id ffacd0b85a97d-4abb0f3c202mr41157225f8f.13.1795679350388;
        Wed, 25 Nov 2026 23:49:10 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.146.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm38587132f8f.42.2026.11.25.23.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:49:09 -0800 (PST)
Date: Thu, 26 Nov 2026 08:49:07 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Tejun Heo <tj@kernel.org>, Yuri Andriaccio <yurand2000@gmail.com>,
	bsegall@google.com, cgroups@vger.kernel.org,
	dietmar.eggemann@arm.com, hannes@cmpxchg.org,
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
	mgorman@suse.de, mingo@redhat.com, mkoutny@suse.com,
	peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com,
	yuri.andriaccio@santannapisa.it
Subject: Re: [RFC PATCH v7 00/29] Hierarchical Constant Bandwidth Server
Message-ID: <awfkczwhkLkXVEVz@jlelli-thinkpadt14gen4.remote.csb>
References: <471bf8d446becabfca00041fb2a78067@kernel.org>
 <20261120120659.2e902463@linux.fritz.box>
 <6fef47e08a37079c08806b3c57994778@kernel.org>
 <20261120212418.10221f2e@linux.fritz.box>
 <06f4c157677f99fc5386dba4c9d68cd2@kernel.org>
 <20261123084345.4e24e3ca@luca64>
 <awQTy09VbrDn9RpA@jlelli-thinkpadt14gen4.remote.csb>
 <20261123151846.3fdcbf4e@linux.fritz.box>
 <awfe_r5McCTzr84x@jlelli-thinkpadt14gen4.remote.csb>
 <20261126084322.4abc6744@linux.fritz.box>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126084322.4abc6744@linux.fritz.box>

On 26/11/26 08:43, luca abeni wrote:
> Hi Juri,
> 
> On Thu, 26 Nov 2026 08:25:50 +0100
> Juri Lelli <juri.lelli@redhat.com> wrote:
> [...]
> > Just for my own (hopefully) better understanding, I tried to come up
> > with a setup that uses a cgroup with entries on some CPUs and "max" on
> > others, to reason about it more concretely. This is an illustration,
> > not a deployment I actually know of:
> [...]
> 
> Thanks for the example, it really clarifies things a lot for me!
> I am going to look at it in more details, but, just to check if I
> understand correctly: the "trick" here is that "P" does not contain any
> RT thread, and all the RT threads are either in "P/noncrit" or
> "P/crit", right?

It would make sense to me. Also, I seem to remember we said it was
actually a requirement at some point (threads only allowed in leaf
nodes), but I might be wrong.
