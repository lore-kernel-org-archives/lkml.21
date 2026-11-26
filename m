Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670092;
	b=xTrjARoDyLyIBdcHVG+mP1oJofjfjfxDf70YL19/YCW3xNjy4RejIXzyYJr+bGeQVA3T
	 iDEA9Pii1aMqAcimRFUvhEzKC83sAR2ddPjYl+WEBAzFI81aorQlqwHG0JD6EEQNK0lOa
	 8AATwMgqdiEx8hxivVnDObMpt8wePJS2P7N+4HBYY0jwOgl0s+QfXmT6PBNKm01QuKISw
	 PrjHyxpnMtizNdmGf5VXibBcoDjrgGAqL/d9uyWVbmuxwtMY8jj+eUmjVjFGie8RSG1Uv
	 378RvpvpPnDpwGNzD14yBEspw0s4gR10roFefQLCu46CAsPTFBH9GiOxSfh7cq2mD9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2JpzhvQEWqZ6NbDVMV0XN2qfoP7fEEn/fCdNHvD4vk8=;
	b=UTOSMlu/yDqmwIMFf349CRGMh4f6ue7IFppuhCmsUlwgXJy7YltorabmaslpLOlMKUS7
	 8Iz5C81/gCh7pwvFjUPee6Tnr3wCHBuSp/l+2fDhCWNxPPwAocCfYz/iIwEy8S7w9p7t6
	 Dk7ARX9HQCtsVvNgMSPjvgSYg9qNYpzZe5tSzf1R0+2pYUFcmee3QRtSPMIx4FtuNb70T
	 DnNT+erWRhkXyF7qFYC8WG0tXSPDjKBRbwV8/8bOGCZYzi1a35cD2Ys8HXaVxvr35Cd2n
	 grA52a/ClGUGcEgZuWUN+KZzfX68IWUnEX7miu+pP/zmvMTMHvGQ9eVQ5CF7RiWtLPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fpt3XycA;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBEB606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fpt3XycA
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3830301f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670090; x=1796274890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JpzhvQEWqZ6NbDVMV0XN2qfoP7fEEn/fCdNHvD4vk8=;
        b=fpt3XycAjtOHtGrIyv6NNdH5jtBJVW0qZzzKWBEZBXr2kbM16xnEC4oeZUL6pWpjGr
         iaZi+p86DfFJ9TH1tlSavVf3wvPMBsb/XFgES5d/tkK1HwdOV6sBSWRbD+0cYIaLd8t3
         6g6Ih28FiCA2btebS3wOLrBuyLZKdqJ2FTrB1iG6qKRdksPPp03PCJS9fHkTCPdradZq
         jIoYKj+dBy3UpZHcLUI2rnoIV4g+HeDHCJq0XuJYaWRHZvMzUs5rrzOcg6P54fuYStTj
         626HIr20xHPq4FnA9o198hs8X/nbJJSrriwJJPudae3OhiawSfJab7bVRwnwNkO7/2Za
         AN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670090; x=1796274890;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JpzhvQEWqZ6NbDVMV0XN2qfoP7fEEn/fCdNHvD4vk8=;
        b=Q7y0gJoMM8ImhIh4gHt/0RiWEcOtW6A9wgKu1eoS9cSXLe7eTIrSArBTyLb5XXVo+J
         GieQvZeBMhf7+VGOm3onHoXqoPFIGXMMHzlwiVOkwxOrp9WKoCTAFQN+hIpxv8fcc425
         X+NqpkADKem7G/M7RAsNRAtJiOj2GJXdOAFH41BlLq/bWw/+HcOEf12WbrhdwZPfs8gR
         8lKxWeq5ubVTE/UCTBqoYo0g2T3QP2pscfN1X7/q+BUtqa2v/iyNY+jcKdZN+5h2hg8Q
         OBSglsv9wRfnV/zxYv0A0Mk9ZdRMm1rrBd5Yy9HBEUhoJLd/HuK11PYLZq1txzMj+J9r
         9QXg==
X-Forwarded-Encrypted: i=1; AL+hErH8WvyQRGLrud7CTY0+HopjLkiMaOARVCjVmPcVTDU9m6dupG0DeiTuOYHmSPN1TM514NaKVeiZzhYnPH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r9CHUM9MB0dOZNzjw1HqkucEpUYpY2uesXElsVy8xrEpA98Sl
	9fMcFecev8QgUAkv1L1qiF9XKRIr6LB/LIuOrfucnzBiXw0RiHqjaRKqS0Sb5iSIHeE=
X-Gm-Gg: AZFdTZdYFX+B3JoW0MTGmDD9uwVL39Iphiz2hF0d+77pSja4lbPMV7/6VsxIW+4BYQL
	8k//pcQy5RcfJyK/WWvLwLaOHVC3iUjGZ9e2I5GJDJhc8qsttgfBi+v4kGV4KusWlodhaze7DRM
	UgXGtKD4s3VMdTD0+pLK0S0ZVpgTN6riSErU6a8hFCnasWAZuTBMC6npS0mPg6N3fUUJ6faKEGz
	IhqDa08Hpp31K6sKEqvGOl+f8pGgAE0FoTp+BxeM5tZeHzrsNESIE3ua0VEfB8rMi2hlLtgUJO+
	B+BIgZLSHcvIHN1G6jr7Sw6p1gpdMziPefuAFcyVKeGtymUGc2kQWHMuSTRne9EULHwChJ2Ao1p
	yp+BH2pYe0ZvPE+NLrTZOKgCmO+eXErdHLQofOruEfKsDnxNWqDMhaKs0GMSr3/HsuvYw2pNcA8
	N+2pEeKKoZduKL5qOqGWbyCzN7AyBk0QbZKTsAXRyrbFGMQuDP3+9nCADvtXOCjnR9adifTldi/
	3HW9YLzz1aLdO5yXo/7AbNOfUBxXkVfsnBxYRi88vO8xsXOxgK3dpp5Ae1YxMCc9W0JnWLkATaZ
	ruVhsCAM31azomGyWrFioRnxpzVkqKteoOG647v7UfzxoyZ+TWZgZ1NW8+Hyk7VahetlnSPKJ3x
	Q4yvjHUO+lFnSvE0py8+buB+gfNp4IA==
X-Received: by 2002:a05:6000:2997:10b0:4a4:d03b:ef34 with SMTP id ffacd0b85a97d-4abb0e46a3bmr30503916f8f.17.1795670090523;
        Wed, 25 Nov 2026 21:14:50 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:49 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v3 06/10] sched/fair: Extend util_est to improve rampup time
Date: Thu, 26 Nov 2026 05:14:25 +0000
Message-ID: <20261126051429.14091-7-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126051429.14091-1-qyousef@layalina.io>
References: <20261126051429.14091-1-qyousef@layalina.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Utilization invariance can cause big delays. When tasks are running,
accumulate non-invariant version of utilization to help tasks to settle
down to their new util_avg values faster.

Keep track of delta_exec during runnable across activations to help
update util_est for a long running task accurately. util_est should
still behave the same at enqueue/dequeue.

Before this patch a busy task tamping up would experience the
following transitions, running on M1 Mac Mini

                            rampup-6338 util_avg running
     ┌─────────────────────────────────────────────────────────────────────────┐
986.0┤                                                               ▄▄▄▄▄▟▀▀▀▀│
     │                                                        ▗▄▄▟▀▀▀▘         │
     │                                                    ▗▄▟▀▀                │
     │                                                 ▄▟▀▀                    │
739.5┤                                              ▄▟▀▘                       │
     │                                           ▗▄▛▘                          │
     │                                         ▗▟▀                             │
493.0┤                                       ▗▛▀                               │
     │                                    ▗▄▛▀                                 │
     │                                  ▄▟▀                                    │
     │                                ▄▛▘                                      │
246.5┤                             ▗▟▀▘                                        │
     │                          ▄▟▀▀                                           │
     │                      ▗▄▄▛▘                                              │
     │                 ▗▄▄▄▟▀                                                  │
  0.0┤  ▗         ▗▄▄▟▀▀                                                       │
     └┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬┘
    1.700   1.733   1.767   1.800   1.833   1.867   1.900   1.933   1.967 2.000

───────────────── rampup-6338 util_avg running residency (ms) ──────────────────
0.0   ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 5.5
15.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 7.9
36.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 8.0
57.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 8.0
78.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 7.9
98.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 5.0
117.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 5.0
137.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 5.0
156.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 4.0
176.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
191.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 4.0
211.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 4.0
230.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
248.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
266.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
277.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
294.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.6
311.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.4
327.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
340.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
358.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
371.0 ▇▇▇▇▇▇▇▇▇ 1.0
377.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
389.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
401.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
413.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
431.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
442.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
456.0 ▇▇▇▇▇▇▇▇▇ 1.0

───────────────────────── Sum Time Running on CPU (ms) ─────────────────────────
CPU0.0 ▇▇▇▇▇ 90.39
CPU4.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 1156.93

                            6338 rampup CPU0.0 Frequency
    ┌──────────────────────────────────────────────────────────────────────────┐
2.06┤                                ▛▀▀                                       │
    │                                ▌                                         │
    │                                ▌                                         │
    │                                ▌                                         │
1.70┤                             ▛▀▀▘                                         │
    │                             ▌                                            │
    │                             ▌                                            │
1.33┤                         ▗▄▄▄▌                                            │
    │                         ▐                                                │
    │                         ▐                                                │
    │                         ▐                                                │
0.97┤                     ▗▄▄▄▟                                                │
    │                     ▐                                                    │
    │                     ▐                                                    │
    │                     ▐                                                    │
0.60┤  ▗         ▗▄▄▄▄▄▄▄▄▟                                                    │
    └┬───────┬───────┬───────┬───────┬────────┬───────┬───────┬───────┬───────┬┘
   1.700   1.733   1.767   1.800   1.833    1.867   1.900   1.933   1.967 2.000

                            6338 rampup CPU4.0 Frequency
    ┌──────────────────────────────────────────────────────────────────────────┐
3.20┤                                                    ▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀│
    │                                                    ▐                     │
    │                                                  ▛▀▀                     │
    │                                                  ▌                       │
2.78┤                                               ▐▀▀▘                       │
    │                                             ▗▄▟                          │
    │                                             ▌                            │
2.35┤                                          ▗▄▄▌                            │
    │                                          ▐                               │
    │                                        ▄▄▟                               │
    │                                        ▌                                 │
1.93┤                                     ▗▄▄▌                                 │
    │                                     ▐                                    │
    │                                     ▐                                    │
    │                                     ▐                                    │
1.50┤                                  ▗▄▄▟                                    │
    └┬───────┬───────┬───────┬───────┬────────┬───────┬───────┬───────┬───────┬┘
   1.700   1.733   1.767   1.800   1.833    1.867   1.900   1.933   1.967 2.000

───────────────── 6338 rampup CPU0.0 Frequency residency (ms) ──────────────────
0.6   ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 37.300000000000004
0.972 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 15.0
1.332 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 15.0
1.704 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 11.0
2.064 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 12.1

───────────────── 6338 rampup CPU4.0 Frequency residency (ms) ──────────────────
1.5   ▇▇▇▇▇▇▇▇▇▇ 11.9
1.956 ▇▇▇▇▇▇▇▇ 10.0
2.184 ▇▇▇▇▇▇▇▇ 10.0
2.388 ▇▇▇▇▇▇▇▇▇ 11.0
2.592 ▇▇▇▇▇▇▇▇ 10.0
2.772 ▇▇▇▇▇▇▇▇ 10.0
2.988 ▇▇▇▇▇▇▇▇ 10.0
3.204 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 85.3

After the patch the response is improved to rampup frequencies faster
and migrate from little quicker

                           rampup-2234 util_avg running
   ┌───────────────────────────────────────────────────────────────────────────┐
984┤                                                                ▗▄▄▄▄▄▛▀▀▀▀│
   │                                                          ▄▄▟▀▀▀▀          │
   │                                                     ▄▄▟▀▀                 │
   │                                                  ▄▟▀▘                     │
738┤                                               ▄▟▀▘                        │
   │                                            ▗▟▀▘                           │
   │                                          ▗▟▀                              │
492┤                                        ▗▟▀                                │
   │                                      ▗▟▀                                  │
   │                                     ▟▀                                    │
   │                                   ▄▛▘                                     │
246┤                                 ▗▟▘                                       │
   │                               ▗▟▀                                         │
   │                             ▗▟▀                                           │
   │                           ▗▟▀                                             │
  0┤                       ▄▄▄▛▀                                               │
   └┬───────┬───────┬────────┬───────┬───────┬───────┬────────┬───────┬───────┬┘
  1.700   1.733   1.767    1.800   1.833   1.867   1.900    1.933   1.967 2.000

───────────────── rampup-2234 util_avg running residency (ms) ──────────────────
0.0   ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 5.6000000000000005
15.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 8.0
39.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 5.0
61.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 4.0
85.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
99.0  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
120.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.0
144.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
160.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
176.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
192.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
210.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
228.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
246.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
263.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
282.0 ▇▇▇▇▇▇▇ 1.0
291.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
309.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
327.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
344.0 ▇▇▇▇▇▇▇ 1.0
354.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
373.0 ▇▇▇▇▇▇▇ 1.0
382.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
400.0 ▇▇▇▇▇▇▇ 1.0
408.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
425.0 ▇▇▇▇▇▇▇ 1.0
434.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 2.0
452.0 ▇▇▇▇▇▇▇ 1.0

                            2234 rampup CPU1.0 Frequency
    ┌──────────────────────────────────────────────────────────────────────────┐
2.06┤                             ▐▀                                           │
    │                             ▐                                            │
    │                             ▐                                            │
    │                             ▐                                            │
1.70┤                            ▛▀                                            │
    │                            ▌                                             │
    │                            ▌                                             │
1.33┤                           ▄▌                                             │
    │                           ▌                                              │
    │                           ▌                                              │
    │                           ▌                                              │
0.97┤                         ▗▄▌                                              │
    │                         ▐                                                │
    │                         ▐                                                │
    │                         ▐                                                │
0.60┤                      ▗▄▄▟                                                │
    └┬───────┬───────┬───────┬───────┬────────┬───────┬───────┬───────┬───────┬┘
   1.700   1.733   1.767   1.800   1.833    1.867   1.900   1.933   1.967 2.000

                            2234 rampup CPU4.0 Frequency
    ┌──────────────────────────────────────────────────────────────────────────┐
3.10┤                                                            ▐▀▀▀▀▀▀▀▀▀▀▀▀▀│
    │                                                 ▛▀▀▀▀▀▀▀▀▀▀▀             │
    │                                                 ▌                        │
    │                                            ▐▀▀▀▀▘                        │
2.70┤                                            ▐                             │
    │                                        ▐▀▀▀▀                             │
    │                                        ▐                                 │
2.30┤                                      ▛▀▀                                 │
    │                                      ▌                                   │
    │                                   ▐▀▀▘                                   │
    │                                   ▐                                      │
1.90┤                                 ▐▀▀                                      │
    │                                 ▐                                        │
    │                               ▗▄▟                                        │
    │                               ▐                                          │
1.50┤                              ▗▟                                          │
    └┬───────┬───────┬───────┬───────┬────────┬───────┬───────┬───────┬───────┬┘
   1.700   1.733   1.767   1.800   1.833    1.867   1.900   1.933   1.967 2.000

───────────────────────── Sum Time Running on CPU (ms) ─────────────────────────
CPU1.0 ▇▇▇▇ 32.53
CPU4.0 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 540.3

───────────────── 2234 rampup CPU1.0 Frequency residency (ms) ──────────────────
0.6   ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 12.1
0.972 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 6.5
1.332 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 3.7
1.704 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 5.5
2.064 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 4.8

───────────────── 2234 rampup CPU4.0 Frequency residency (ms) ──────────────────
1.5   ▇▇▇▇▇ 4.0
1.728 ▇▇▇▇▇▇▇▇▇▇ 8.0
1.956 ▇▇▇▇▇▇▇▇▇▇▇▇ 9.0
2.184 ▇▇▇▇▇▇▇▇▇▇▇▇ 9.0
2.388 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 11.0
2.592 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 16.0
2.772 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 18.0
2.988 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 47.0
3.096 ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 53.4

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 include/linux/sched.h |  1 +
 kernel/sched/core.c   |  1 +
 kernel/sched/fair.c   | 45 +++++++++++++++++++++++++++++++++++++++----
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 7cd8df8f463c9..d54117ab4c882 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -588,6 +588,7 @@ struct sched_entity {
 					/* hole */
 
 	u64				exec_start;
+	u64				delta_exec;
 	u64				sum_exec_runtime;
 	u64				prev_sum_exec_runtime;
 	u64				vruntime;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 97d3cceba22c0..b8c0cf9153768 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4669,6 +4669,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
 
 	p->se.on_rq			= 0;
 	p->se.exec_start		= 0;
+	p->se.delta_exec		= 0;
 	p->se.sum_exec_runtime		= 0;
 	p->se.prev_sum_exec_runtime	= 0;
 	p->se.nr_migrations		= 0;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e92b923b769ac..a8dbd81e71590 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1385,6 +1385,7 @@ static s64 update_se(struct rq *rq, struct sched_entity *se)
 		 */
 		running->se.exec_start = now;
 		running->se.sum_exec_runtime += delta_exec;
+		running->se.delta_exec += delta_exec;
 
 		trace_sched_stat_runtime(running, delta_exec);
 		account_group_exec_runtime(running, delta_exec);
@@ -1403,7 +1404,6 @@ static s64 update_se(struct rq *rq, struct sched_entity *se)
 		__schedstat_set(stats->exec_max,
 				max(delta_exec, stats->exec_max));
 	}
-
 	return delta_exec;
 }
 
@@ -5980,9 +5980,10 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
 
-static inline void util_est_update(struct sched_entity *se)
+static inline void util_est_update(struct sched_entity *se, bool running)
 {
 	unsigned int ewma, dequeued, last_ewma_diff;
+	struct task_struct *p = task_of(se);
 
 	if (!sched_feat(UTIL_EST))
 		return;
@@ -5990,6 +5991,28 @@ static inline void util_est_update(struct sched_entity *se)
 	/* Get current estimate of utilization */
 	ewma = READ_ONCE(se->avg.util_est);
 
+	/*
+	 * If a task is running, update util_est ignoring utilization
+	 * invariance so that if the task suddenly becomes busy we will rampup
+	 * quickly to settle down to our new util_avg.
+	 */
+	if (running) {
+		u64 delta = p->se.delta_exec;
+		unsigned int prev_ewma = ewma & ~UTIL_AVG_UNCHANGED;
+
+		do_div(delta, 1000);
+		ewma = approximate_util_avg(prev_ewma, delta);
+		/*
+		 * Keep accumulating delta_exec if it is too small to cause
+		 * a change.
+		 */
+		if (ewma != prev_ewma)
+			p->se.delta_exec = 0;
+		goto done_running;
+	} else {
+		p->se.delta_exec = 0;
+	}
+
 	/*
 	 * If the PELT values haven't changed since enqueue time,
 	 * skip the util_est update.
@@ -6045,6 +6068,7 @@ static inline void util_est_update(struct sched_entity *se)
 	ewma >>= UTIL_EST_WEIGHT_SHIFT;
 done:
 	ewma |= UTIL_AVG_UNCHANGED;
+done_running:
 	WRITE_ONCE(se->avg.util_est, ewma);
 
 	trace_sched_util_est_se_tp(se);
@@ -6102,7 +6126,7 @@ static inline void update_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 	}
 
 	if (flags & UPDATE_UTIL_EST)
-		util_est_update(se);
+		util_est_update(se, false);
 }
 
 /*
@@ -6203,6 +6227,14 @@ static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
 	trace_sched_util_est_cfs_tp(cfs_rq);
 }
 
+static inline void util_est_update_running(struct cfs_rq *cfs_rq,
+					   struct task_struct *p)
+{
+	util_est_dequeue(cfs_rq, p);
+	util_est_update(&p->se, true);
+	util_est_enqueue(cfs_rq, p);
+}
+
 static inline unsigned long get_actual_cpu_capacity(int cpu)
 {
 	unsigned long capacity = arch_scale_cpu_capacity(cpu);
@@ -10421,8 +10453,11 @@ static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct t
 	se = &prev->se;
 	WARN_ON_ONCE(cfs_rq->curr != se);
 	cfs_rq->curr = NULL;
-	if (se->on_rq)
+	if (se->on_rq) {
 		__enqueue_entity(cfs_rq, se);
+		if (!se->sched_delayed)
+			util_est_update_running(cfs_rq, prev);
+	}
 }
 
 /*
@@ -15401,6 +15436,8 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrtick)
 		}
 	}
 
+	util_est_update_running(&rq->cfs, curr);
+
 	if (hrtick)
 		return;
 
-- 
2.53.0

