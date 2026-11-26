Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706708;
	b=ZpMgPdg1Vcq7HDrHTdtd27YOH/8QKGYe0jBEYTfLaDb4/ZNdBFlcgkZiqDX7GxUeoIPO
	 wz1pM5gpx68kxiBmUyJewmDGAomMOrGAzpzEdKt0aLm5jcvUQdcTnDZzVeps42wqkT8kv
	 6kLSbVQTeflc725sDheD+UmdYEeH3oBXYmDOXcBe5YXNGsOBEtV4xTj5SKc7p90fcISZ2
	 AY+X8ibL3ukNkMIGEA5eEynk5juuaoN+h/YweL1trEntMP3WNLIbemIK0/mFznb3pPFBH
	 p/GC4B6S7VLmd1h54MHcrzp2mbFHdfpyH0zqqOJIB0c0VHOLLBbvrftk4rk7dZFJPvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7krDrPWo2VhuN6vofnlOAtcdQ5OzWQZBTrq6Bt73Myc=;
	b=3PgVa0u2jygB3ypX++Tz08lzzVAk3VfR0QULmeR+HbST0VAFcfts9meHNpE5KBsCDihp
	 AtvQKyN4IW+9fxSRWxyu0v4ehSxcPGbZIew8K4yEkwS5A+zDwGTrgC1XHykaeHAe/Bi1D
	 CR8Lgrxn2+77pH7wFeEay8KnXxdpOKN5Pez1jF1u0Ipap0eSvg7dVGbAVfNsNQun98ssc
	 9q4lPGYp/M9e1D5FTsDEEIAD5/icDr5YK7lvzJ+eZ5AOEMDICJ5sINmiynvOxd2/+x5/A
	 2zqq3OetR1tKANzbDUo2q2xHBVgDBRwEQoe/HkzL7TJYqBLNqizvuUNd7AYGk58ebBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AGopPAHq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E49606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79E49606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AGopPAHq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso38636465e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795706707; x=1796311507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7krDrPWo2VhuN6vofnlOAtcdQ5OzWQZBTrq6Bt73Myc=;
        b=AGopPAHq8TZXGxFSrZRNPzFLgdTWqFz9rWFhKoqSk28tgQfN2Qlw1fe/EDS2PJTLca
         wApg7GYxaf01BExmKLhW7IUev0RStX1XrNzWUThmb0gwObgVeAEDsNoaWNFgsGBY5l4D
         JUj6iiIog5KikqXDYpuyWOOT7V2IJn3UgwQvhkh7BXvFAdD1DxQr33NvWEurDII4m78v
         6mek9mbmE8KoD1iQOKqQKLgrLeUWyABwsgiM18zUCHkvMHeeyspMZucGJ8dwT6fN//Eb
         N8BdA5+hxENo75gMNpLu9JIJ/rXwrVLwY4tOAKRPy86Vt4B8zibX7wbFPMD3yBndXhIw
         Z2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706707; x=1796311507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7krDrPWo2VhuN6vofnlOAtcdQ5OzWQZBTrq6Bt73Myc=;
        b=TVdVtq2lSjRlL7FXv8PkoQvFUIvgC2H++Gv9qaisRHdhduCWzlEVYtdh249SLJv8uv
         qHNMZaC+WKR+sEvtdfd4A/QMqVZpBXJH9ANFPZy/BYGxltgXFD0E3kXFkmXqwqqGyj0i
         4BsNSldYBC76bn6HApMzBlxZSoj+6w+hi0g8fYmts9TWCCfHTlN+ueQW+VeYSDv+oQ3L
         z8ByZlF7tdoV4Db/dV52Fjaeqbn04I5/jRl2XxNIIlDgDpKJ1LkeSlYo/CBwa4OrO4+R
         lBedHdfHeCR+1UceWRBpvmFmEAsFy/EjP+9l6XMyLZSx9UfQe3HFHQ8jPvy53lm2IT1o
         vApw==
X-Gm-Message-State: APuU4Z9lJOK934y/adjhj3X+5c6PzCtFgosTHT+kQXL3FlNHok4CVcSI
	7JuA4WqW7jNf/WVPksxzOztDpwqIaZdL3NTS8gW4dcmtg/4lSZJiIJmNXsH3P9GFnmVqBu3+ovp
	DhUWMeqQ=
X-Gm-Gg: AZFdTZdLsewydRru1f1asPO1FXVs2GeS0CrUDpiG3KNUxQVjB+BL4Gyl4KhfuvqkAJP
	PwCwNy9vYICvBU8EVD3bEZFP2sSw8UNZFTcNfE0omMmaXfV//pxdaP1m+kYd9l3mJqLXcl/9yz+
	2UfrbVkdYInrR5JBeJkCxUAu2CnT6YPItyM0E0hml3sHlSZAFIY298XJ9w8KkFWRwfbROc4kqrZ
	DMafAEvd9IpjzADJWKj9a2Etf4mlKzI/PDZ+3xAXm0tlrcRpxgRAnbNr13TYse0IwqUPwv3f8Pe
	wW7m7lHXcw4HxuPwI3rQtOgJQbXoCE5qtJGNzlHALQCqjnU4LOSPpnH7vcl6uc5zzex9ojCZ/4n
	vw+p9C4NpFj2Ktn6tmsu2it2G37JG8byJqveF1f6VOCaCbs+c7w2O6R0dlEbduIoiM32MosIsKM
	hyXx0y8cwnbfUxm9s99qRvowq17dk+k41l6gmHwhRluk6fwACgSWxnOJSIZJedsjOaVmp61J6jR
	NXr4cnvxmkA2dBZSUPPJ2gu2DfSS4qEIjILOfSWLxaBf0sOYpfkyufmRk5mH6amBcZlSaWVmmGD
	RQ3aVCc9RSg+6Oe6BLu3r4z4feD4Jw4ZHR0q93Xy6ylv60j/bFwm
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr415585375e9.22.1795706706793;
        Thu, 26 Nov 2026 07:25:06 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm569944295e9.2.2026.11.26.07.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:25:06 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH RFC 0/3] workqueue: Add WQ_PREFER_PERCPU
Date: Thu, 26 Nov 2026 16:24:55 +0100
Message-ID: <20261126152458.742942-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I would like to better understand if I'm heading in the right direction
about WQ_PREFER_PERCPU and the dynamic pool selection.

Any comment is highly appreciated, thanks in advance!

----

Today a workqueue is either per-cpu or unbound. A WQ_PERCPU workqueue
runs the work on the CPU where it was queued, and it is concurrency
managed. A WQ_UNBOUND workqueue runs the work on a CPU chosen by the
scheduler, and it only uses the housekeeping CPUs.

Many WQ_PERCPU users don't need the work to run on the local CPU for
correctness: they only want cache locality. But because they are
per-cpu, they also run on isolated CPUs. When a CPU is isolated with
isolcpus=domain, or at runtime with a cgroup v2 isolated partition, the
per-cpu work queued on it still runs there and disturbs the isolated
workload.

This series adds WQ_PREFER_PERCPU for these users, following the
discussion in [1]. The flag implies WQ_PERCPU, so normally the
workqueue is a regular per-cpu workqueue, concurrency managed. While a
CPU is isolated, the pwq of that CPU is backed by an unbound pool on
the housekeeping CPUs, so the work queued there runs on another CPU.
When the CPU is not isolated anymore, the per-cpu pool is used again.

The pwqs are switched when the isolated cpumask changes, in
workqueue_unbound_housekeeping_update(), and also when the workqueue
cpumask is changed through sysfs. Only the CPUs that need it get a new
pwq. On an isolated CPU the work is not concurrency managed anymore,
like on an unbound workqueue, but max_active is still counted per pwq,
because the workqueue is not WQ_UNBOUND.

Note:

- Work items already queued on a CPU when it becomes isolated still run
  there. Only the work queued after the switch goes to the unbound pool.

Changes introduced:

- [P1] workqueue: Add WQ_PREFER_PERCPU and system_prefer_percpu_wq

    Adds the flag and system_prefer_percpu_wq

- [P2] workqueue: Offload WQ_PREFER_PERCPU work from isolated CPUs

    Runtime switch of the backed pool when a workqueue with
    WQ_PREFER_PERCPU run on an isolated CPU.

- [P3] workqueue: doc: Document WQ_PREFER_PERCPU

    Documents the flag.

I tested it in virtme-ng guests with a test module that checks where
the work runs and which pool is behind the pwq: runtime partitions,
isolcpus=domain, the sysfs cpumask, CPU hotplug and a stress test that
queues work from every CPU while CPUs are isolated and released.

Thanks,

- [1] https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

Marco Crivellari (3):
  workqueue: Add WQ_PREFER_PERCPU and system_prefer_percpu_wq
  workqueue: Offload WQ_PREFER_PERCPU work from isolated CPUs
  workqueue: doc: Document WQ_PREFER_PERCPU

 Documentation/core-api/workqueue.rst |   8 ++
 include/linux/workqueue.h            |  17 ++-
 kernel/workqueue.c                   | 150 +++++++++++++++++++++++----
 3 files changed, 156 insertions(+), 19 deletions(-)

-- 
2.56.0

