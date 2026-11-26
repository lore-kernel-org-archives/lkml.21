Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662785;
	b=ckvR+tLX20m17FrbnyOszxYjqF6KuCNqmHXpnqkzUFwdMT9/5mc1egeB6knU27glK8CY
	 dZSEiWBwUtyg6u3/ZxbRpd2oZ4uduaoYQTGfLEaT/8zQRH/WFeIEfTFmsMLelWTo/Ybde
	 sd6ibgrOdp6Gl4x6bXlPtOpI20kl0M8qnBf7oNRb0cOkxPur8DCc9hUV7+t8aZqmsISZ2
	 V4LYNbpSJOpJS4r1Rgdqt1Vr8oHcB7YDycGv2CrNzG+3myptu7TsML46H+kqB6g9jn9kH
	 NmQUtTE1H6/hvkt4vwKsxo99SvOikjthGUR7/usJ/F328o5/AXLAgNkIvSELCaNds4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
	b=OUIkO527HTjmjNWPVfX1A0dhlMJbFLRSvwENJIdnjn+u4P/ZgTXuhgwFn/tW3v8IA4pI
	 eK7ml4t4YEH2MGyieKOZg5mDTNqUXBzTC4dS+HKo31LZvWkbA1MTBMy8gEjaKRSZNcYu2
	 AtUU3wO9MtKwijNqUaVVieYfEVrsRiOvZBLCEMTJ9jGDpWCZsez7725JQbh1+eHkz/W6l
	 Ubk8YRlWzzDO+Khmz87YPpHXvslkvb5uruNKKe7TsuLqagSsRcm7VJwMdHi22wSJ3IkLS
	 enZBUmJRu1+hZOgBjUzlxa4SB5V+XJ+KL/6fMgfL2K3D8lzCcGHhLaLQ8xISto+yT0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UisuFHf+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5655606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5655606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UisuFHf+
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b32daac9d7so35632077b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662784; cv=none;
        d=google.com; s=arc-20260327;
        b=WiNDADP8KjItsjE3UotXUsNcLMb1VwW39bLIoPh/rMWgQY++WEmbhOrFn9r45/mQhW
         AtJHS/M8tK1mp6Sdkb69+mJcq85Eprs+oPkxc2OHYh4AAJozyssLmz6KsZEzqozR3zif
         fAB4UGu27TX1S22QK2TM9GjseLYLps0ojbi6HZridlRsw/Zs2wGRBAa1/oqYcgmfnFAf
         6pXGX2bEeNI0bzHXxQBRbGRovqnj88Znxf4OtY6QOMQmRRtvsCh6UFzTI3pwmeU7Xuhy
         NGI/OV1zkloxBSSvB3Z0AFGaIzlT3o0JQAnVpY/WlVELVsw49k2oRWfqX4G5RndiNxyL
         mdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
        fh=Uy4omCiRrkeWsm7m+nBifkK+amt1+6i9dtvfhErBhHM=;
        b=FfoWL1ATyeUVfNifSa0US4wGk30pkfsolAngGkTUaCDIRBm0ICMoB/KJ6gRnT6cvFk
         OSWMpngzkgA4J7PHn06dvveXNH1mYDWEE3WMm4coyAvICF9p/8AeUqcvVBYOz/+t0qOU
         fDwLKUb51irUbBtOijJ3fuPD2Li94nOHFeN4B8ePyOmQ+mQcxAR6Uga2+YOllpXiLWBo
         nUNGtBViDsQpXToThigYKkdpjAaMWJA4Cpyenw7IT9DXd8bRjxIHtehK02rcaDktiStN
         S3Q0pWC7Em5n7PsUCR+u+d+JkRpuUevWHz0ShXlKk4Rct5sUr4NfY6V7K7z/gaHT9X1Y
         IHJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662784; x=1796267584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
        b=UisuFHf+11MsiQEkohokz+1jDpyAqyX++7iLpg29wa6o3zjneM/lyPoL7/X1iNCEvO
         kZScrauJ/qMJ8kMTxa9PFoPJ1TS8z1vpnkJ2zARofylySHngdnuX3MXKPt14xwi57xsW
         lKGFJhN5zuUVkvmiYHg9G2xqhUaazUBCFZvZ/o2kXcCF4v6M55t0XkuGjKZ7viu7LHFr
         JGllJTyjOmxI9DqOjEdaNNZGAZn5Y+OruXKEea+t4GQMCNUMA1wO+NifHnnJxe+LhmGk
         GUwD6owy1Fy+/g9Giv6BbOgVUoDMYWVEhSGcOxlAq/FBCzAaK1Hs97skGyOP0qFngu51
         GsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662784; x=1796267584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
        b=BmZzOR1aSdsHXLNV1Wd7pkFY2lXvQ6A/tsGLwD3LvzYOOZtNcNNqVNdSXoq8e4PDBW
         4zmOP099Y+9L9kV8MRj8F5Hhvul5q9Q4kw+8rKhf2Kc3gr5EEwWRjkns1o2FRbOFDR9f
         AAOYzilR+kd170a28LiiesUmDwTh3cDQwA3baTg9cpG17a1j0/goiJXDBBAt68tAI+nl
         SN6e17Ucr2YMFzq58iQvQzOaCaUzxGrEFHs1aPxkNpkIz5lfRKCZfcICmT2MrGupEF9F
         109y6eij7pO8NcVx2yUqap8fr542W/lvqXMh8ML/p5SgIORkOAJH/Lr0RGYPf/OjTMPD
         MRDg==
X-Forwarded-Encrypted: i=1; AL+hErE1RCBCWSI1t01IooWIDGOc55gItAMPWA3r/91IaMxHLRujEXttYJVlpAd1xue9+hoqFmqMAhkMYDEA4FM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C5K+JChvEHYi86xdA6pCq0xiRkuqcIRCfBAfkI378DlFV+XGT
	/Bov81VrQI1HhYiwm2ZmjJIVsglsLpEZudSz9NGJAfIxL0vCraJDUWZ/DjK1rmac7ECOtdOIz9G
	zQuZyB/M9W45uKzOEqwS7iiKDlIbKZFg=
X-Gm-Gg: AZFdTZfwW2a6AZRtMRoYiyN+nPeG8g6LKYJCedb3HTIdq4ggtpnHqH6KAS/fVSObtol
	hgUk8K36A/wjIARLxQgWU1RlckgGK/PpaXcJ97mxTOcQr9JeAl9YsGc4jDOOxQGxKoAZwMoGMTe
	0xzxdbFrHBjZrjB8DqDlAkYRkQ+saSZpC1m5C+pHbi0EP/vvtGeDymuOOM5nigyhP/RV8gVtulN
	bpJEWKRuK6AsiMMsw0evpiCk/xSzzHuZIKlj/h3VSdL7bpMraRz4QsQpH5z1w7M3AmpmgSNyAiP
	MgDV3XJLKkg7moQa0k7th68e4SDXgNfVWuZlSbN73eiAIhhPJAGHajxSbnAuAZMGhz4elxI+KMC
	Z77V1oBfSEb3MsxBO4kVyMCJ4GkkDHFKrYMFSBDc5OTjgQjc7eXnKZY3kn3dlsgsMfh4=
X-Received: by 2002:a05:690c:6d83:b0:8b1:6c4d:6b83 with SMTP id
 00721157ae682-8b518f1cf54mr82200347b3.24.1795662783714; Wed, 25 Nov 2026
 19:13:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-klp-series-v3-v3-0-b1e0f79af331@vt.edu>
 <20261125-klp-series-v3-v3-2-b1e0f79af331@vt.edu> <sashiko-outbox-234405@kernel.org>
 <DM6PR05MB4137C0B5BB4D88A9D5847EBAD1432@DM6PR05MB4137.namprd05.prod.outlook.com>
In-Reply-To: <DM6PR05MB4137C0B5BB4D88A9D5847EBAD1432@DM6PR05MB4137.namprd05.prod.outlook.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 26 Nov 2026 11:12:27 +0800
X-Gm-Features: Aa3M54r9bQyCNEtl8vDg0fA8BgkRlMLeLZFLbV6lOjC0bsXV0kG9vz91uifhxJo
Message-ID: <CALOAHbAQuYG__4b054bRobVRyT+v143wBcVAN26T_PtiO-oqmA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] livepatch: Include exiting tasks in the transition
To: "Ravindran, Binoy" <binoy@vt.edu>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "Shastri, Jaidev" <jaidevshastri@vt.edu>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rcu@vger.kernel.org" <rcu@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:58=E2=80=AFAM Ravindran, Binoy <binoy@vt.edu> wro=
te:
>
>
> Thanks, this is right. A dying task reports its quiescent state in
> rcu_note_context_switch(), early in __schedule(), and then still runs
> traceable code, such as update_rq_clock() and pick_next_task(), until
> switch_to(). RCU does not promise to wait for code after that point, and
> with expedited grace periods the quiescent state is reported right
> there, so synchronize_rcu() can return too early.
> klp_synchronize_transition(), which v2 used, does not have this
> problem: schedule_on_each_cpu() completes only after the work item has
> run on every CPU, which on the dying task's CPU happens only after
> switch_to().
>
> v4 goes back to klp_synchronize_transition() for both waits and keeps
> klp_try_switch_exiting_tasks() from v3. I will send it after rerunning
> the tests.
>
> Yafang, this reverses your second suggestion; I hope the reason above
> makes sense. It also brings back the v2 transition times.

Agreed. I missed the point that the quiescent state is reported early
in __schedule(), and that the code from there until switch_to() is not
covered by synchronize_rcu(). Thanks for pointing that out.

--=20
Regards
Yafang
