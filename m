Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492853;
	b=cmRyD1yQ3U5ZBe1D2PkIsEs94W7+uivR0PYTkQ2Xe5vUMHZ2IL8oxQ+2f6zYfRR61DU1
	 y/FoznsHx7JkS2kQvBXoJ55Q6gaSzFA1EaqI4IStgBW2hBIQrbZbyEFaFFdoyEstdXcFv
	 i+oJFdMzHaOSvWySx4T4sfEeJv2TH4/qifG7lg4h2hEO791Gg48Wf2+1DcMJ4DHZuQ7mn
	 L00x6cnlGWiXedPcw7WfSn5M22w1wPShZQ7ZQczZjirqlnDEJfv+5Mf8OrcPTpEBfhNm4
	 1gUM/NIUMpqy4La/IVjCewV6OOXbHbQ3TAj1g8Pn8EPXB6UGVYcjI8TFMUYG/z1j5pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=35yxV76fuMTZupLunX4MeNiX3puXHVhhoMmA7IX+fzU=;
	b=FchEjhLg4Xi/W006OfTersg/LYwoA2eg/1jkNyT/bRZCOmomQJbyw0YcBsPf4nN2FtPE
	 uiF+u1kriPx5bl8v09JBjDG27Uo10BFnbnlJX6tSSxZ3Zsu3df+YOnNeRQIgfbebrANOK
	 XR/o6oVBPHDbHj/bAKazL4nlnY06WD3+Kr3aqi1atp8C7C+v6GoTXDqccOntWQA4MsVnv
	 tLaZ4qfITKb18j/6m+lFRMQw+25hRL5dAQkKYmuv7rYVJfV3M2cmEboFPNm1148rDeE+K
	 pQFjRMezWvLEkgqB0pRcDWIqwKjJOaafmqDh6pdgctwqw89U3mfDkJ86TLflTVwu6pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJydpIHZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA8606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DA8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJydpIHZ
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0dba37a7fso32676657b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795492852; cv=none;
        d=google.com; s=arc-20260327;
        b=aM7gJKhLnZr2PPbaa46DQr8p1y3Eygr6kG0imQJs+xSbm4y1VeUg5eCw1D3sTV/j/I
         Br7rXLYtlRwJoylQwHvGWGVuF+u1lCHX9jpW+axvuvoST3QNrguoo9vEtB7ELa2qm3rE
         P392XHPs7DPBFtiBoYf0SrT5+MmbS5AvqKzEb2ystm7pCXjm/mAz0pAc0peekGC+T1ZN
         OUtkWcak9ePSqfpTfM1kdqTzZfYhRwWujXBoQzWD0/r+8fwmFzYtaE7JH9NGhq/A/8ry
         93RuebVN52vl7+0HYXNW9uTOZwGrt871XQKpmdL4pQ/V5XHp7PxetFXacg3KevgBnvs2
         UDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=35yxV76fuMTZupLunX4MeNiX3puXHVhhoMmA7IX+fzU=;
        fh=ibCmaJGgeWpXskEGcWob2IXUMOKtuSrTAPr4y5dvEqY=;
        b=U6SYJN7y0XIFGjTDNcfxD/UzHvAMFEaA0+rzbHIr2LeBgqpiEebMpA5wN3zS8ibqsL
         tZSkBHoe1V1xrB0nDyLEc9CGuhZqBLv02ITY4/2Kjw/WG34sFM2BJ53pTtd6IGa2xmCw
         lK6be0K9yEtKpWcUbzsU4luL01HvhV4jN1+tktxyJbj2eP1KyYyLZBRxfx1Bzhiv0BiU
         c+g61caYzWDDXfuH99ScSeEvx4pn8iVyxDxF+Q1Cnlp/X7ZuTIvWiVgIb4gxsayiOJ5B
         s2goaM/YEeuv3RW0iZmbbhbNVKUL784m/yppPjCWM+mdMqlKa+PKtedGkdGyRmksZpgM
         y2ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795492852; x=1796097652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35yxV76fuMTZupLunX4MeNiX3puXHVhhoMmA7IX+fzU=;
        b=pJydpIHZC+jgHMbGbpKTWCLHhOdsM07+l+r6Iur+1AhfH/oT988kwuWHphDXcip7/P
         cbRY9NEZIDjPm9AyosZX+sPvzjMrSZfr3OB+obOF2BcguyJL/e85jRu80yQge87IhNEV
         Pw5EtxwHAzUjKkh/1GENQ/1oXtMjOQo0ePqUidxQzhHZpuBboxaYE8e5Eof4XStZLPV+
         n4mJUPW412DeDIJ1zU0Hoct2/PlcexBGHDsxWGY01pkoS2/2OhMKIlICdZWKVWSh374T
         MRegLkHQLpWoA90n2Guv5NgKnEq40qd7n3BG22dlg0/MPsg5LP8t4ZYEG1zJdPvSu9jm
         Idtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795492852; x=1796097652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35yxV76fuMTZupLunX4MeNiX3puXHVhhoMmA7IX+fzU=;
        b=KC9bFHfcDICALXBOJ7LQOHeG4dnCAC4Rf9SEoGc7Fg0oXKCTmLwAYpe67TO0hCYwhc
         yzKgJGFIiRHWsei+7VG12ZgO/YWt2jjhHUVUdMJ3O21k0dMspFwyIWc9UnILdH22aAEM
         Mucl4o+A4xt/M3sj+SWKVNmIctEp5JlQJIxLMOZI5e9nPVYWf+3J4QmuwofxLZFC5Ucr
         1KJ5sNP7Qo/DwUkbDV8Vsh9fOxbCPINI9cjzpJ4P45lENGgx5Vt67znwwQ5/5bHtzJB7
         1+AIxK/9eUanLbJoybqjrfq3NmMvwmzc5kGVDEe9dLw2P9D6hK4sE3gm+35KveiPM3Is
         l0dQ==
X-Forwarded-Encrypted: i=1; AL+hErEHzhHbWqTCp0jDFpvhMJH9Zm9Wgf85zhXWQ8vsLxJTQr8urEqT28evAL2Cp4Sr1xQdJ9tzUs3Ie2WlYA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lyuYOMHcTcXnWPnrb1vJT4LTXjM67bsBWfnmwlYrn1DliFz1g
	TNPTk13XmypAS9JvoIVkpzq91w5XhO5qxrJFUtBzePIzUzTbaMLNllB79ku9lSyC7HcUVOebx0E
	ktkOYC/eiZ3uCYsmzicpO6lagySoABM8=
X-Gm-Gg: AZFdTZehvImij/AOdWN00BkRrHWKh7sUOUI4YVw8xIBTq7LuXN5rYNNtVkFYI5GYZQE
	/P55ueg+HSHNMGSLOK7+16IqMmwBihA9TohP8YcJmyUhNZ/6P7GZE2s6ag9H5WdG/VeyADJ1EQw
	sHpkKvwpMfsysDMvpUPU57xvgutRVMtJ6vrhcuqYnWD4WtGjtNaZ5l2lLAf+QfA/1HDlEF1QNIm
	L7h827exN3h+XNQoRlIlZI+W7NohPsqesnPrPdMQ9p5rNQuWXkYTDU83J1MkGVijT2YczLQh2o9
	73FSdgsgrHzFnumefAdIemFISohMYLn8MLrx6eIShd4gK+65sCkitGDCmZAMCD6vzfR78NvpVDf
	2NFMqtOtB8OonCd4rGfYa+fROO7W8WWanioduO9bmLbEq+OAXxLRxD/uUuBf1lyhfTw4=
X-Received: by 2002:a05:690e:4813:b0:67c:1907:922c with SMTP id
 956f58d0204a3-67df44257d7mr2356677d50.44.1795492852350; Mon, 23 Nov 2026
 20:00:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-klp-series-v3-v1-0-427c95811d9b@vt.edu> <DM6PR05MB41373C039888AD13938D3838D1452@DM6PR05MB4137.namprd05.prod.outlook.com>
In-Reply-To: <DM6PR05MB41373C039888AD13938D3838D1452@DM6PR05MB4137.namprd05.prod.outlook.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 24 Nov 2026 12:00:13 +0800
X-Gm-Features: Aa3M54q7s3VMxk7FJweeUn3luJjDb4P7LcCfNfajJc0izoqcRUVhUDIdY_OqAjc
Message-ID: <CALOAHbDu5NmVowk4SHzeUDxASaxKkbL_w1dModFWzdi8yK9tBw@mail.gmail.com>
Subject: Re: [PATCH 0/2] livepatch: Do not lose exiting tasks during a transition
To: "Ravindran, Binoy" <binoy@vt.edu>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "Shastri, Jaidev" <jaidevshastri@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:40=E2=80=AFAM Ravindran, Binoy <binoy@vt.edu> wro=
te:
>

Hello Ravindran,

Thanks for driving this fix.

>
> The two issues Sashiko reported on patch 2 are valid:
>
> 1. An exiting task that has not been unhashed is on both the task list
>    and an exit list, so klp_start_transition() can visit it twice and
>    set TIF_PATCH_PENDING again after it has switched.
>
> 2. Between exit_tasks_rcu_finish() and its final switch, an exiting
>    task is on neither list and can still enter patched code with a
>    stale patch_state.

We also discussed this issue at the thread:

   https://lore.kernel.org/live-patching/CALOAHbA9WHPjeZKUcUkwULagQjTMfqAdA=
g+akqPzbZ7Byc=3Dqrw@mail.gmail.com/

and Josh suggested something along the lines of what you are proposing,

  https://lore.kernel.org/live-patching/20250124010848.pdcxokfsk2ngrowl@jpo=
imboe/

I did not take it for the same reason Sashiko raised in issue 2: the
RCU exit list narrows the race window but does not close it.
I could not see how klp_synchronize_transition(), as you describe
below, completely resolves it. Could you please explain that in
detail?

>
> v2 will walk the exit lists under tasklist_lock and skip tasks that are
> still hashed, so each task is visited exactly once. It will also call
> klp_synchronize_transition() before func->transition is set and before
> completion, to wait out tasks in that last stretch. It will document
> rtp_exit_cursor as well.
>
> I'll post v2 after testing it on mainline. Please hold off on
> reviewing v1.


--=20
Regards
Yafang
