Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670079;
	b=BP9jIuYsyvJWs3ViEPS7WHYT1bqMH7JynjhKdGvbMtmKgmNfV0EIAVuGgfH6/za0uc7g
	 YKQM67mymfQuSEB5SrfngX+4QqDCQi2IWjuRdQ9oNrlZVqu7yfeqaHEItI7YbHs8z10jC
	 mp0ZyNLnIZ2CqGHi5P8UV7E09MJCvz74w9wH0DfZiYIH+q6HXLLZyqyvBhif+GWyC0cCX
	 XwwYk+NnOBaNS9aZY8hCEkbg8ibQe+4EKEDXy4k+Zcz/JBBv/HVrMAOVc6tTkTGujKJOr
	 QIyw3yNcRaY/euZG08cnG6imSMcOQh8B0gROJD24WvZXnxn3psqSRJYSjwpyDQjTD3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4Ad2tE+Mv1vxfx2Y30i+azuH5kIRW9Z23B1JR08v3MI=;
	b=OEo9baE3YkPJRHk08LH1NK1qHYKb5RTD9lm3zW/6KepuT1ENuR1aGiqbPluWevAzqg/k
	 8/BRxWI/NWwk7RHhmVLDOUYz6IMJP3OB9t7F/dX14MVnldYi+vjAAkvAZTV6yqTNmBIdU
	 Hpu4CCLBEoRQUYJ8Bftls1RmIL3ediTbJYHwyC4BHlGwiZKWIzygr12y83Z3p0QhKu8zy
	 dBCxaunboX2qGaE844DFDvChDJclFcYd3e2E2Gw7WKqXunSd4hv6SyTDdiWtytoW+TbVk
	 0BI+IOFPKtFmXwpkcEFkOXXXnw+ftpO1gqQBk2Kt+baf5wIk/slIu7HVdehz/VIAz7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="QS/LfIFo";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1553A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QS/LfIFo
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3431627f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670077; x=1796274877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ad2tE+Mv1vxfx2Y30i+azuH5kIRW9Z23B1JR08v3MI=;
        b=QS/LfIFojvrwB2LT3C5hQmGcW5ZbvooyGhGJ1D2xQFxu5cpZHzwYaPw1A38aRpx1Pl
         aHUdMKOS/Crg5WUR9SMtZQgosjOzb1hNEisAod3KwEkSMwN87+cdsv4gJuV0PEAOlSfQ
         pCfAPS8GzCBfBb7AEaHDtIBBmHgcLBqo6Rtfq/rdM4L36ouFhtgYeGv1vhCJ5iuyj2fk
         wKwwXNM2loVTYwCyqwxocnSQsjTfxQQS+FCeVykEXABDWaMayyOy5cZwL/v5jQ6sxeCk
         oaRZ+DPJQ9TMiZ6xQDlCo9pnRZXx89Z222ssnz0y+9dBLGi0alWxqWpFgHcEyOUcdwnQ
         NGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670077; x=1796274877;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Ad2tE+Mv1vxfx2Y30i+azuH5kIRW9Z23B1JR08v3MI=;
        b=ABG+05wUYeHvEskLQ6lyALyTxNofHgIkGTBraI0zXwEi3Lj4bi5R0S10VayNgO3QQn
         dh2fFti/HM1n+99MlUPgzbMzu4pe4Cf9JbQ3TbUEQs304a/i1sFBm6RP4nPinF2hf/7Y
         l6TE3JtZ6a4bCbJ2KRr8xS3YkQo5brrwbB9V/l7t5FEygTXsA8OW/nh3i0QvnHC/Vexn
         tmKXNHvsyCbT6ktJrcDljLluKZtZJa1M+fLyqKUI6hwTd1op9eimLInb9aVU8SoDTdST
         Izeec1gJ/rLE5Kot82B8q6kD93C+xJF3S2T3M3QVKq3J9lO4hFvJXuqbbB1XTjn+2uqe
         /bTw==
X-Forwarded-Encrypted: i=1; AL+hErGWEGpnYBpJg1syXqhiadztuL7MEb52gwRoGvwIPE83w8EkEjfUHHpxYOC/wzcAuNhPOjV8rnTLVzSCha4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FxasrvC14tu7K9LohqL3ziiG9vfwlk9azo7O1MNbCX3ey3mRO
	qg47lYCw5pCUgKEA6JFKEwDeU3IpboBGvuzNTIN2pmkIGbM+DSY2nwkn4BYVNZzclZtAOjVHhTQ
	4Xrir
X-Gm-Gg: AZFdTZdTWWZJQtNNYkTJ4SQPGRj46qx7zZn+IFoX/c98G1W/7B9+3XWeQfyQOviDSsj
	rOG/APlTgtUZ/U0x/y3THgh4O+ewxeLhzM70389RM8KouPu5Ye23kGfvOBZPqGmLV6t1WsGTrbB
	AxKC/wOnwHQsOLFGkT8nNX0JlAftY5Q+uFaHTCwb8U8XtRMdnHWpP8xvrM6bdoureO9jynDXmd7
	kc7QB0VAGQDFEV6JT1rVW0L9b1uxrO3iTOiXS/qyg38PEnEujcRMb+taxpKHZJcMhm4ZfSrDrgx
	wLXS3aPytLiR4ROnAMxKRiqf77fIt0bbuPnjJWLT5Hci6/a3KXmPB5tOYkl7edFlCNwhfPHq59Y
	g84HSLRnYbwNH35rQZd4amnWTB/dqtYC+XWSVxUToQ9bbqKuLuT8FmRQEEx1rocRhOpJksVASEZ
	S5uTDR1M/qm9ggZeXs3r3IdmU27kHwm32YGJUzPcBr5ET3qKUiwaJMOoegHdFvi+na1mLSkR3Eu
	Gd35S98tQfBrLVINvSBAMJ/GaK4J/wkq6UUgijLvYydDPnXpEg8R99dTUbGoFmK656i9UXTRCPl
	a4XBuDQaOpVNtJCRqIyV8+QjLoii5kl31cjGiO9jr37UhMMCVe1S2VeDbXjz/l5MPTZo3GdnffS
	2gfQdtGWGFtEtQLHG/MVvo/qpL8iTgA==
X-Received: by 2002:a05:6000:1a8f:b0:4ae:43e9:da61 with SMTP id ffacd0b85a97d-4ae43e9daa2mr33501492f8f.4.1795670077165;
        Wed, 25 Nov 2026 21:14:37 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:35 -0800 (PST)
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
Subject: [PATCH v3 00/10] Better manage system response time
Date: Thu, 26 Nov 2026 05:14:19 +0000
Message-ID: <20261126051429.14091-1-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
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

v1 discussion: https://lore.kernel.org/lkml/20240820163512.1096301-1-qyousef@layalina.io/
v2 discussion: https://lore.kernel.org/all/20260504020003.71306-1-qyousef@layalina.io/

I hope this is now in good shape for considering for inclusion.

v1 cover letter has the full details for those interested with the full
background, link available above. LPC discussion from 2024 is available
in [1].

Major changes in this series is dropping the sched_qos interface as this
will be taken on its own discussion now. I also moved away from sysctl
to debugfs interface for setting default rampup_multiplier. Along with
new debugfs entries for fits_capacity_threshold for each CPU to help
understand how these values end up being on different systems if we need
to debug them.

Code changes required reworking how we do the util_est_update_running()
and introduce new running arg to util_est_update(). But other than that
it is exactly the same.

I should have addressed all review comments from last round too,
particularly from Vincent to use us for approximate_runtime() and ensure
that fits_capacity_threshold is updated once; which I attached to
build_sched_domains().

Users can retain the old behavior with these commands (except for
fits_capacity_threshold which I think the new behavior is correct)

	echo 0 | sudo tee /sys/kernel/debug/sched/rampup_multiplier
	echo CONST_DVFS_HEADROOM | sudo tee /sys/kernel/debug/sched/features
	echo NO_UTIL_EST_RAMPUP_ZERO | sudo tee /sys/kernel/debug/sched/features
	echo UTIL_EST_FORCE_POST_INIT | sudo tee /sys/kernel/debug/sched/features

A branch of the changes along side with the sched_qos interface is
available here:

	git clone https://github.com/qais-yousef/linux -b schedqos

schedqos utility [2] has support for this interface on ToT and will
allow per-task control of rampup multiplier to get different response
time for different tasks which is key to get best results in terms of
perf and power. Look at configs/qos_mappings.json - sudo make install
and sudo schedqos restart --daemon.

Testing on 8 CPU SMT2 Ryzen 7 Speedometer 3.1 on Chrome I get the
following results (5 iterations)

tip amd pstate:

	23.3 23.7 23.5 23.9 24.0
	avg: 23.68

tip schedutil:

	20.7 20.5 20.8 20.9 20.3
	avg: 20.64

tip + patch amd pstate:

	23.1 23.9 24.0 23.9 23.8
	avg: 23.74

tip + patch schedutil:

rampup 0:
	13.2 13.2 13.4 13.4 13.2
	avg: 13.28

rampup 1:
	17.5 17.6 17.6 17.7 17.7
	avg: 17.62

rampup 2:
	20.7 20.7 20.6 20.9 20.8
	avg: 20.74

rampup 3:
	21.7 22.0 21.7 21.8 21.5
	avg: 21.74

rampup 4:
	22.5 22.3 22.7 22.4 22.3
	avg: 22.44

rampup 5:
	22.8 22.9 22.8 22.6 22.9
	avg: 22.8

rampup 6:
	23.1 23.1 23.2 23.1 23.2
	avg: 23.14

rampup 7:
	23.4 23.5 23.6 23.4 23.3
	avg: 23.44

rampup 8:
	23.5 23.6 23.5 24.3 24.3
	avg: 23.84

disable cmds (retain old behavior):

	20.7 20.5 20.3 20.5
	avg: 20.5

Notes:
	- rampup 0 and 1 are slower since we no longer have the
	  aggressive const 1.25% dvfs headroom although util signal
	  rises faster for 1. For 0 util_est is completely disabled.
	- rampup 2 we get parity with schedutil.
	- Rampup 8 gives parity with amd pstate behavior, too aggressive
	  for perf. We cross 23 barrier on rampup 6.
	- For rampup 8, battery got low and last 2 iterations ran with
	  power plugged into laptop and this lead to higher score.. Some
	  fimware magic I wasn't aware of and since it was a tedious
	  task I didn't re-run with power plugged.
	- Only 4 iterations for disable cmds

I picked the default rampup_multiplier to be 4 based on this results.
There's power trade-off to be had with different values which I can't
evaluate. Having a per task sched_qos interface to set these values
- which is the intention and final goal - makes this trade-off a lot
easier to be made since as you can see rampup 1 and 0 will get slower
behavior.

This result is based on few weeks old tip/sched/core. Current
tip/sched/core has runnable_avg bug that causes schedutil to run at max
all the time. I managed to workaround it and numbers look different
(higher) but I think the result above are more or less correct in terms
of rampup multiplier value to get parity. Once this bug is fixed I'll
recollect the data.

[1] https://lpc.events/event/18/contributions/1880/
[2] https://github.com/qais-yousef/schedqos

Qais Yousef (10):
  sched: cpufreq: Rename map_util_perf to sugov_apply_dvfs_headroom
  sched/pelt: Add a new function to approximate the future util_avg
    value
  sched/pelt: Add a new function to approximate runtime to reach given
    util
  sched/fair: Remove magic hardcoded margin in fits_capacity()
  sched: cpufreq: Remove magic 1.25 headroom from
    sugov_apply_dvfs_headroom()
  sched/fair: Extend util_est to improve rampup time
  sched/fair: util_est: Take into account periodic tasks
  sched/debugfs: Add rampup_multiplier to debugfs
  sched/fair: Disable util_est when rampup_multiplier is 0
  sched/fair: Don't mess with util_avg post init

 include/linux/sched.h            |   3 +
 include/linux/sched/cpufreq.h    |   5 --
 kernel/sched/core.c              |   5 ++
 kernel/sched/cpufreq_schedutil.c |  41 +++++++++++-
 kernel/sched/debug.c             |  12 +++-
 kernel/sched/fair.c              | 107 ++++++++++++++++++++++++++++---
 kernel/sched/features.h          |  21 ++++++
 kernel/sched/pelt.c              |  44 +++++++++++++
 kernel/sched/sched.h             |  38 +++++++++++
 kernel/sched/topology.c          |   1 +
 10 files changed, 259 insertions(+), 18 deletions(-)

-- 
2.53.0

