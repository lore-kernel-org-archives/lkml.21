Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795223119;
	b=SLexFbVllmdPqLAn+AGRFUgyQJBEgHTQjdIT5VX2oG7iylsKyc3aTUwu7tDR7ab+yHgk
	 QG7GOrRWTalyGZ5/GMhGblJATKaS+d2eV/a5emmyKL5qRUbc7k2WccISMSlOL8rI35Axg
	 Yo9RG1DfhIQN7UUYe9ALgMDhtk1WFVHKsX2Bjk0l69pNdMZo4bexRl77eidc0/aEXN5/F
	 O2bGRIgGec4nsc1K0vQ6GDE/bBTmOcvQt+uZvcczPZcSHBtx+3zGEzZKP6DQ0B/KVARsy
	 hDX0V91maOC5BlXwIalzLR9IlOq1JxKw3Bfzp18VYBoTFdwpbG60/5Ic5phcfiQHIQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
	b=F+EwDPm4qn1IYRPThspBy1/ghPD3fIBnaaarbysvvK16hECXgbC0ouvYLFYICqcl9lcb
	 59eByLsvFnxfxN50D6zfpDBdt3KEAYfWSPP346le1wR8p5srz/tJn4igFBWD9Uq09HLUk
	 q3NYpVbWf8DM3tFmH/s+/9vlfN2EbswHLXrGJoyY6DX5YAm3tzwvHs1bPbUROKYbj9E9r
	 Z8zFyO6/Ou8kooclRAT1KKKm7QJbVcymCNRm6IyHRYhy1XVZaytF97yLMhAK0ckJRQoeA
	 Vxfr9izyWMLJ7vXJ2RMR9ww2E7QgQTLZHeGCiIM2YMCEcbNDoFeaGfYzNA0+Ny4F0ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNm6DzDO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A208606A6B4
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A208606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNm6DzDO
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9213f004a14so11151276d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795223117; cv=none;
        d=google.com; s=arc-20260327;
        b=rXsCZOt6zywIYfbfDfD8QGAkHI52KAg+1mEiXCkrbvGWA6IZEty6kbTTrkmZ/j6hrb
         cHrf/9urcyWUkI9cSbtD5FMi7x3VECvOh3ZQdxmcc82j1TLyBNlfQb7jc6GBB9zvvVSe
         b03uFeuS2cKFqKGhhdWa9R0UtMoQiHqR4zeJPQ14LRbwnRiGbQxRqWxJKpGJtwtfpb61
         Bb2rIfLKqrcz1O3Mu9UHHNFcPN5E1I5HxH7VnAHN3VciqekuvbrIqYnMvuqQ3OFiuJW9
         YHN/achu52DLw+EK1fdYQy/l8wMLgnQqu2kI9RhqaOVpsDH92xHq8cxuw1Wf6S5Opxyr
         Qgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
        fh=h1/Gmi02hBfrghccPDjMN5wih/hMqkneuM/0iZGY62Q=;
        b=P6wj5UdCTqzw7aEZbF8sQ+FO3kRP0dUIKgDnVYnmXjrbkMBsHxV13u7SwO2PU934yw
         iNREhFPhGSf52NIZHvzgh1lkXQePQLyQJ7qXaF6QzAwcj/EINL5KdbHi+BcPJm9n6Y15
         CeYQK7geM27TgZcFOU7ULEyWjZbEqMbB3ZsVIryYveYyR5lfufBdMUlsyqOkVhf00K9q
         udMRQ6zG5wnZx3rHzd65wzQvLvCtQZyrfCPgV4qrAzOzFDPluL04YHPw61wnTO0cLFgU
         3xe+8GNcLFrNC7uqFjlly/ciKkEM+dJMwRmMwrHxS8ecJ80cctgtOwH6OW7+bO/zJ5P8
         o6XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223117; x=1795827917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
        b=pNm6DzDON3XuRFzRjM7Y+16VKhmwQFhBUf5Hq++UUOPEGE6DGbP+pA49uGkh17af66
         aBRcavRbk+rvUvDZG+U2ITO0qJ3DIL1eqKKxCxfPpixEeseINAmWRQkkc/jlfUjkORZO
         ml8oIoA3AND6rP6fD6MxW63/nSkvRK3jY6B+0ZSMyPTEqfgxlIglT3FWf8ghU4+seyqV
         +bkE1BIYi+8rRt/rK7uML6rU3qu0hJratEMux8jzuyLkRcIU4jtXklfSaSb2arEuFFfo
         linnLAVVmNdFPVTCPEMQYffRNn1H7I5wBad5fvjfMjBsPwnEeiOrq0b4GdHMAhmiAJ6i
         xj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223117; x=1795827917;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
        b=TZBJjCrYT2UX6iX9guU8kigESEHmZG5gc4L5HV1T36aNSvDuTjPeQuUGCgctZ9WYTs
         bHc9CcZnrSzTt9uF+aqma8JYzsMK2ZVISa8XS2ro494DJJcU8iWXyf3Hy6m3DyVKxDbe
         EXRDLjrFvXzwDwD0+xZgqfKSI2Ae1mjAzijBIkWLF/na0jjJ5pwW2u3EHnxPasyQ3vF8
         1Kw10rMgJQm2e33EQL9rkNG3cbvOJsqqTGTcdpmic4f7p/z0Ds74nt1d5M8jg4MdZxnX
         PSrWsJsga+/xZb52Sse0pS1yF8DqCGFNHTG7qH9fpWm3xXQyG1N+1K8PkPls4Ecu5KV2
         DL3Q==
X-Forwarded-Encrypted: i=1; AL+hErGnP7ZbfCpEqIusHY1Mv2ILYZEkUD7BlaazBq6GoS6EVNDkS0gi2n30Iu4f/RClm0yGIIN1o1xKIFrG1Lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NQSSsJJRLPcsA7kuoqQpaQIYB/IJ7XmOGRlhUBrgqFF3Ye/sr
	9YkFWg3DHoXMROJ0RVvm7cFQ2TdQAohaXYql6ZSKIQE2qdoDOBuzCqp64hNRMNtUuqvnUfiO0sh
	1Hsd9Jrhcrc3qkVaN7nCJruq8bv7enbE=
X-Gm-Gg: AYBFou0ISAyG5ayAgiTfsRHccBqvuo2htX1qjn0ty6T/VkIDxWGi+q2fRhWpUqliHDo
	AuKG7Q9j5J+2623m/TtlIZY6i1H40DVxURdRO6kXIs2LXhk/U8zOnfTWzGKY+Ee9Ut/HjnWMdxI
	yTn1ZRCw8rfM9cJuBSRcm/LoyYM7I5GEREuEUCiwrew8+sw4dNkgOIwVa4GC3onPpDf+eiu7vxl
	DXhjdXLqHzq5//y3NcaHb1MQbFvy//HGsWGl2UxjorjYtH8QHIenplVxPA86AtThiRPiGCTP5DY
	UPAPZUJTNsUYHjTLJ3kYPyFbjRON06E+m6Bd1oslqaBuUUgZmRBuMCWpOzRGpvZ733/UiE6Idn2
	9ca4jfgbyA78zSGaIb6gk2kdyGVeL5/zykw+NrIT9hqezQ+7EUZT08vuxpuAWv/7Mif57EI3K1n
	wMF3Tu4Axr
X-Received: by 2002:a05:620a:448e:b0:949:673f:72b8 with SMTP id
 af79cd13be357-949bab7c484mr770407685a.82.1795223116801; Fri, 20 Nov 2026
 17:05:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Aditya Kulkarni <adityapk@gmail.com>
Date: Fri, 20 Nov 2026 20:05:03 -0500
X-Gm-Features: Aa3M54pTWqH1XC2rWFy8uaXuOTB6eCym0Qm8pobFm_S8fWG3Z5eim7Tuy-Z91ys
Message-ID: <CAO91vefPN9NBiaErBZk+D_7wehUZozU6Bo5gy7mPZw2MtJk_jw@mail.gmail.com>
Subject: [BUG] x86/mce: mce_syscore_resume() queues MCEs with MCP_QUEUE_LOG
 without draining, causing permanent 20 Hz MCP polling
To: linux-edac@vger.kernel.org
Cc: x86@kernel.org, bp@alien8.de, tony.luck@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
I've run into a bug in arch/x86/kernel/cpu/mce/core.c where resuming
from S3 on a machine whose firmware leaves stale MCA bank status bits
across sleep permanently locks all CPUs into ~20 Hz machine check
polling (~320-335 wakeups/sec across 16 threads) and silently drops the
resume-time MCE logs until a sysfs write to check_interval or reboot.
Environment
-----------
- Hardware: Apple MacBookPro16,1
- CPU: Intel(R) Core(TM) i9-9880H (family 6, model 158, stepping 13,
  microcode 0x104, 16 threads)
- Kernel: 7.2.15 (7.2.15-arch1-1-t2; CONFIG_HZ=1000; arch/x86/kernel/cpu/mce/
  is unmodified upstream)
- MCE settings: default (check_interval=300, cmci_disabled=0, ignore_ce=0,
  mca_cfg.bootlog enabled)
Root cause
----------
1. On this machine, Apple EFI leaves stale error bits in MCA Bank 12 and
   Bank 13 (status 0xee2000000040110a, ADDR 0xff7dda00/0xff7dda40) on
   both cold boot and S3 resume.
2. At cold boot, __mcheck_cpu_init_prepare_banks() checks mca_cfg.bootlog
   and calls:
       machine_check_poll(MCP_UC | MCP_QUEUE_LOG, &all_banks);
   Because MCP_QUEUE_LOG is set, machine_check_poll() calls
   mce_gen_pool_add() without calling irq_work_queue(&mce_irq_work).
   Later during boot, mcheck_late_init() checks !mce_gen_pool_empty()
   and schedules mce_work, which logs the entries and empties
   mce_event_llist.
3. On S3 resume, mce_syscore_resume() calls
   __mcheck_cpu_init_prepare_banks() again. Since mca_cfg.bootlog is
   still non-zero, it again invokes
   machine_check_poll(MCP_UC | MCP_QUEUE_LOG, &all_banks), pushing the
   post-S3 Bank 12/13 entries onto mce_event_llist without queuing
   mce_irq_work or mce_work.
   Unlike mcheck_late_init() and store_int_with_restart() (both of which
   check !mce_gen_pool_empty() and schedule mce_work after calling
   __mcheck_cpu_init_prepare_banks()), mce_syscore_resume() never drains
   mce_event_llist.
4. As a result, mce_event_llist stays permanently non-empty after the
   first S3 resume (and those MCEs never appear in dmesg). On every
   subsequent mce_timer_fn() tick, !mce_gen_pool_empty() evaluates true
   (without scheduling mce_work), so every CPU halves mce_next_interval
   down to the HZ/100 (10 jiffies / 10 ms) floor:
   - Within ~10 minutes of S3 resume (at check_interval=300), all 16
     threads hit the 10 ms floor and stay there until reboot.
   - Inside __start_timer(), round_jiffies(jiffies + 10) falls back to
     unrounded jiffies + 10 whenever rem <= 249 ms (since rounding down
     lands in the past), firing ~20-25 times during the first 250 ms of
     every second and then rounding up to the next second boundary.
   - Over ~14 hours of active uptime this accumulated ~810k-935k MCP
     polls per CPU thread (~320 wakeups/sec system-wide) with THR=0 and
     MCE=0.
Live reproducer & verification
------------------------------
1. Fresh boot (22 min uptime, 0 suspends, check_interval=300):
     THR: 0  0  0 ...
     MCE: 0  0  0 ...
     MCP: 5  6  6 ... (1 poll every 300s)
2. Set check_interval=5 (just to speed up the halving sequence from
   ~10 min to ~15s), suspend to S3 (mem_sleep=deep), and resume ~30s
   later (at 19:55:59):
   ~28s after resume, /proc/interrupts over a 2-second window:
     t=0s:  MCP: 420 334 325 333 331 327 334 331 324 333 330 337 332 330 337 334
     t=2s:  MCP: 459 373 364 378 374 370 376 372 364 374 370 382 377 375 380 377
   (~20-22.5/sec per thread, ~335/sec total; zero MCE messages in dmesg.)
3. Write 300 to /sys/devices/system/machinecheck/machinecheck0/check_interval
   (triggering store_int_with_restart(), which checks
   !mce_gen_pool_empty() and queues mce_work):
   Immediately at 19:57:00, dmesg flushes the two trapped S3-resume
   records (note TIME 1795222559 == 19:55:59, 61 seconds earlier):
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: CPU 0:
Machine Check: 0 Bank 12: ee2000000040110a
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: TSC 0
ADDR ff7dda00 MISC 43880000086
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: PROCESSOR
0:906ed TIME 1795222559 SOCKET 0 APIC 0 microcode 104
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: CPU 0:
Machine Check: 0 Bank 13: ee2000000040110a
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: TSC 0
ADDR ff7dda40 MISC 43880000086
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: PROCESSOR
0:906ed TIME 1795222559 SOCKET 0 APIC 0 microcode 104
   And MCP polling immediately drops from ~335/sec back to 0/sec:
     t=0s:  MCP: 1002 933 920 941 929 917 934 924 905 933 920 941 928
919 933 924
     t=2s:  MCP: 1002 933 920 941 929 917 934 924 905 933 920 941 928
919 933 924
Workaround & possible fix
-------------------------
Booting with mce=nobootlog avoids the issue by skipping the
machine_check_poll(MCP_UC | MCP_QUEUE_LOG, ...) call in
__mcheck_cpu_init_prepare_banks().
For an upstream fix, mce_syscore_resume() could queue mce_irq_work when
!mce_gen_pool_empty() (e.g. irq_work_queue(&mce_irq_work), matching
mce_log() and safe with IRQs disabled in syscore resume), or
__mcheck_cpu_init_prepare_banks() could avoid MCP_QUEUE_LOG once the
system is past early boot.
Happy to test a patch if you'd like.


Thanks,
Aditya Kulkarni
