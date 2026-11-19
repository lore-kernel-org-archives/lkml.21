Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116189;
	b=ksdRWNNl5Ws5BwmZh/MdFYxl7I8MgV5PUHs/zI2ZgAWwLRhuVNcU3XRJCVXqhld5PAWc
	 jclRpm5cjxaK2iag4ARR3ufd7ZMbtO62HuLepbs8ADULP5kieR2O0wyPW4Kqjsc+ycuYb
	 XIXxeKLZgBU2WRW3nYfl5MWgE5nTE11KasTo7FKiG98v7Kj+GRLo6vwPhKdFF0UqDn6/l
	 HYhmH88NjlA09EU+ZeA3gK5uymavWCjlXG6c8m6ijbwca0eqp3kRu6+qDW4yvqcWGE+/t
	 zIyB2lbNVr0JWdfB/dsBji4n+3mShg7H7qamcRSc/OaoxXpasituM1VH9wOKnPlGiIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jJDSnbyzne38FDHsV3tXjpH+/j/MDsHXL1OO4jooY7g=;
	b=gTkkkAHE+ltTnQpWwav/t1X7NKPB0oAfe+CQVBK+zjRp52tyNkgJZYrOdlkJs7sc3iXu
	 tN72cMQgulmFSsLMwfDzZUpXZDeb+bz5XO95cucKGLv5rv9OHoXDdXoKomF1orpbppBTv
	 J0BHs3UWYgfwxhctQWOSnXGC2IZyYeXhGuVMeJjDYnbGwgQK7FaKId0cfTi4FTrBt9mtC
	 MHEAYhWiRzfcizuXzT/9SGrQNawrvJT/kg30LzaKaEObR2CRiGvCpb/JZ/w21SZb3W1MH
	 SjbKxnGmveqCskkqFBniyH6zbCh1d5FJZzbdmN8YhQTHB6UuHwKgFGltWkr93FQP+3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pe74eJbE;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02F606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F02F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pe74eJbE
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so32271f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116188; x=1795720988; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJDSnbyzne38FDHsV3tXjpH+/j/MDsHXL1OO4jooY7g=;
        b=Pe74eJbE23fGNWDiG046/AQTcxem2EuWN0NkCSma6lZ2p/8W6zo9bbAHYar6k+sFLH
         pcnWHmOgJSUrp+AyDsuTjlFUyJw+TG4jlgparkgf5kSmYqFKQSrbWjUX6abzYSAzePBi
         /KscSlQ/FPPBPIqTrptgfH2BBm8ji2ylE4frlIjCMkdSRmLZ33nkHLW3rj0lqTw1diIc
         Uxkotri4QcQoknci1SyFe0ebSOIOvrHpXatb+EkCB8pbEnJR0bH529pxZVmlSbeaetVO
         B15CXteVzkIcrQCyDZLnKxiGQPR6lU+2zDs9yY2o4eWstBSRHQ0RSzLoG1XDa1NWAo0S
         3cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116188; x=1795720988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJDSnbyzne38FDHsV3tXjpH+/j/MDsHXL1OO4jooY7g=;
        b=zEweRIcfSboEJucS7IdEG17YrpQk0YN7XZSaA9Zb17rv76zbGNziJNl/4Maj551J6+
         clAguqBrX2/TQYcQnZgqRMSB+I/QwXKXC73yJPi0oeYII4lx03cfTqKiqwPGtTqKZJFe
         O0A44HdMsyxLuTAnkZAC65v0Cz15qtbzOKoOHdZvbNw8RdIsxUSwt3abi3SXNNUBuBwI
         Pe0xiscM02RzkH3p5Wc9lINXtyfBIT2yyYpVlTGyotfIIli9grmHJ6MmpHm95iEpKa+w
         Rbpm1IL28Fzqy9DavCG6OSXQtzjG6E/rwd0Mb0mAGHJMh0mMfrXw4Klq/uzSOFjVhcZK
         LmDA==
X-Forwarded-Encrypted: i=1; AL+hErFGdRwFFlvAvcETcDSkVjKamPU/KiOCOF1XBznMh9LG0GNiI6HP5KN0mYjCRdAFo+oXvHULGCiZAUgGOFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z81lKAnrrZH4vZPakTZgMaNwStGeULw34IZCjICNbGTdzgfEHcm
	cg7M8OHYIz1ydQXbuqonNSUS3Cnczr/0ldht8EybenPUElkHvrwFzF7gzoyrlCExMc6rUOBGUQ=
	=
X-Received: from wrbhe10.prod.google.com ([2002:a05:6000:15ca:b0:4ab:ead0:8dc5])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4a14:b0:4a6:9f2f:414b
 with SMTP id ffacd0b85a97d-4abb71cbc15mr611338f8f.32.1795116187704; Thu, 19
 Nov 2026 11:23:07 -0800 (PST)
Date: Thu, 19 Nov 2026 20:23:06 +0100
In-Reply-To: <87cxsfwkm7.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <87cxsfwkm7.ffs@fw13>
Message-ID: <20261119192306.reply-tglx-sched-mmcid@google.com>
Subject: Re: [PATCH] sched/mmcid: fix per-CPU CID ownership leak in sched_mm_cid_exit()
From: Dominik Maier <dmnk@google.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, dmnk+artist@google.com, 
	Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thank you for taking a look on November 8 and for pointing us to your
broader rework at:

  https://lore.kernel.org/all/87mrs8bhp4.ffs@fw13

Apologies as well for the two process mistakes in our original
submission: omitting linux-kernel@vger.kernel.org from Cc, and including
the removed Assisted-by: tag instead of describing the tooling and
validation in plain English in the changelog. We have corrected our
workflow on both counts.

Re-initializing the MM CID state explicitly across execve() rather than
relying on the last-user exit path in sched_mm_cid_exit() is much
cleaner. We will test your explicit exec re-initialization approach
against our reproducer in QEMU/KVM and follow up directly on that thread
with test results.

Best regards,
Dominik
