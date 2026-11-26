Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725657;
	b=bOzrCr0CrjbgXRIydNMHWfvEldip9VmgwoJW0wABxFk1ZQpZAMAPsF2jOh4Xv2zinOFz
	 JSe7ELhxv8NC+nzDIBr3QKBnceRC7DNBhJI9qxfXaXIqjia3nVXJvcA910boiL8IfAvHB
	 I4aAkoKXURqdTIrf4IJ0VtgzS8N+ToU2GFgtFAuj9eILGVS2Bx3LVZZvSLY7l5NXv9CbZ
	 UEdwZhHM/uhSmNCBp753MWdAABz6DuSw/Rvk+NiHRBFWuQhOSagQBKj6ynQ/1du2DHGwZ
	 FDSRKuEKld5tQOfOVE2D75poUQaTEBDw2Kwmhj6CSw/Xb4YpnAP4Gz+KQ7XWnL2Zo4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=vhLI3luhSnY5QjC9WSQKZtTBj+4qzkm0fNGEEgLeI6U=;
	b=uU6w2Juuba6PJ8HKAjyPMs1jkzaq1KMrp6ywKNMdI5z5SHltuhovq7YKNry2AbrlLUl7
	 lwonLnVR32jrNqH4mgt4pouIhS1215VQSGJlHL7wSO2qrCyKNYdlA/QiLOisLMHrDrHju
	 uDhuBN/QBK2mdslo3q6s9ZEVtuOSa92O8/elOPlCMH+LGU4D193xUi1puXh1VB6qqBm/X
	 BMH66jmIXEU+m6/6ZlKxdKMh3VDR8T4NlrqjeKF35iwXZLJozU2hBqp2T/fdtpnatjGkq
	 fwXZ0UyScFeBbFMdkdyVPl3Ewi6z/kgtZjiNqMDspJo30IUATBLfsRzFcJYfztikC5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbsIeKP5;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5443C606A333
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5443C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbsIeKP5
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04244c3d0so58648945ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725657; x=1796330457; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhLI3luhSnY5QjC9WSQKZtTBj+4qzkm0fNGEEgLeI6U=;
        b=WbsIeKP5XsiIBgC8Dr7ZBcZMZ4xF36wK+BWE+MzEtrXP6qc/2PZBrlwGfCAc0ulQzQ
         pe3SALpLm4Xm0f2MaDh1tHFLE0vGygk0K8RMLS8hzVc/Q2OtE5cm4xKT1dW3ry1rPlIK
         XQNkP6lbk9fhdWRv6mkpplEh9lZEx8LT+Yd3asyolPpm9wzq1cokNLWpY6zXHxld8mLd
         mL/jgi0j/zFD5+6AN4T618eGKu1heCfJzoR/g244F2O6RZ7AbO3+9r5oHQzLNh3az0jS
         L1o5m9a4JMmBF6kexKeTHPPo0Kg+aINm1gzZvg1MGX6sdIc5KOgLUy6Od6yDXWspStR5
         E/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725657; x=1796330457;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhLI3luhSnY5QjC9WSQKZtTBj+4qzkm0fNGEEgLeI6U=;
        b=WZNTMbaZiiJFiSUAWhXQUNZYsLv0AE479mLzD+JAtWGxKh8rIE7pE+f7F9RvPBiaLW
         nruAP9CBAdREehDNfQ7naChKpcQ+z+9qkXC+WF+s4Mjl6siOhLmjODMJ7GtWOk5RVkyP
         sghLgEzi9Vnd+DHr8jAk/UKTsfQ6rm533fLDf77VIjnmYaIZKAyFERBKrQUn01V0BQ76
         cZOa7V6g6+7NUw2UN3c1SZPCGatleWqxNqv5aGlpk/XK0/p5Pd2c2ro/kNIpJf0M4M3G
         VreX9mWmCTd+MXWFQNaKmygzCeIsFQY7iCMmutVFAdFuR2+36LMNyt0+4TwRLRxG54AR
         mVRA==
X-Forwarded-Encrypted: i=1; AL+hErH+IYlDVW5mWb5jkh9J1fP+rpI9cL1vpdik1A2aJ+CNsM1JKEDFc92WjW8iBYomR0M/ZsmtJc4v4lnVUrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+93EYM3xFaNmKe5wj7CVP9uLAhJHw3o+/xItviTL1u6aTptFdP
	cjYB1D3MNvgQbwxVzIkq108CjlOTPB0VC5efeOtvxRxBkmp+dhbohJ4N
X-Gm-Gg: AZFdTZf9ruR59gPjnvUD8zt9maNoAyJZsbADiofG8uKQPMX/tSfUDfSMDQaPmVrUvMh
	N96fMabL3rOgQ7ulER1xcI9Qy/ztfJ/i4FRXzC5YX+XhVjId+hNruuXzz/3f9HFGphPNBQn8VTY
	/JDA+4Q7j5N7TYhO7+K400BjYKOeiDRXis9fNPWXBYfez/6Knt3diZ4XgoI2qfZqGBF+vM2vqz/
	2s9TXQVyB4mTapjkTAdwB6+fb9/lsBrI33nsC3IvnWFa5OxX1FIaCs//a7KdGa26cJEKV8c1ES4
	gaP3onBbf5hx/f0ZqM1W6nN1Ga7zNNC+6d/Uoh8TDc+IqqiOZ0/hqbgN/D578P9BAayQOJLebLt
	zycW43Y9BAcq6UVZTHBOdJ+UP+elTNquaH/jA/qA63CWbB/00Se94YH9SsTC6u7IVoguAoKty2F
	go8PcNdMKVVS6nxRmHqBEEpU2pudbFNNz9BVxMPivUuf83BNYmMJQpAqng01AMept9T/rg2rVx7
	JgEmNsKlkkLXitjcVROzWQVY3QrJ2eSMdp6p7cyWLsVHxORG5AzyeCXMe9sXeE5bcGuUiEn+Y2G
	LH7zEGlq/67sqJ3/9knLG8HKDloGgv5sE00mW4JbUShav5/NzFf1UELpCaFVZXdo1H3bDw3Ic22
	vwW81Qllh9yD9JojcSg+W3enrbwnottmaYKI=
X-Received: by 2002:a17:902:f603:b0:2e9:8505:5471 with SMTP id d9443c01a7336-2f03ef44affmr240191085ad.7.1795725656537;
        Thu, 26 Nov 2026 12:40:56 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm110470815ad.12.2026.11.26.12.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:40:56 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:40:55 +0000
Message-Id: <DN5FM9P3X2P0.2IFD5DFBRELP1@gmail.com>
Cc: "Harry Yoo" <harry@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <bpf@vger.kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <daniel@iogearbox.net>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 <linux-rt-devel@lists.linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Hao Li" <hao.li@linux.dev>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Brendan Jackman" <brendan.jackman@linux.dev>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "Zi Yan" <ziy@nvidia.com>, <linux-mm@kvack.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Waiman Long" <longman@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/4] bpf: Add call for selecting kmalloc or
 kmalloc_nolock at call time
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>
In-Reply-To: <aecebb39-47c9-4b0f-a076-ac0ddc7724d9@kernel.org>
References: <20261124060357.11700-1-emil@etsalapatis.com> <20261124060357.11700-2-emil@etsalapatis.com> <DN38HGVL8JHQ.2ZVZQCKFXVA9T@gmail.com> <awWRZ9xCzWLnj_R6@thinkstation> <20261125140902.GE2668804@noisy.programming.kicks-ass.net> <DN4QLI2XAGO1.2DDIFJ49PNRPS@gmail.com> <20261126094403.GA49833@noisy.programming.kicks-ass.net> <aecebb39-47c9-4b0f-a076-ac0ddc7724d9@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 26, 2026 at 01:46 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
> This is all just way too complicated and shaky, sorry to say it.

Which part?
I don't see any new concepts of failure modes vs existing code.
