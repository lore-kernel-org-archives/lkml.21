Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795828589;
	b=LlclBh2DASo3DJH2USjNVKBLbT2rvmqJVvRyi+G4luq8QwjZq/losudIhB/mu2SDyXRm
	 dgiVH+I6wQzvQ1N/O1GiUk9Zm04jiFDVTQwoxzMn9mFpbXEIJgPmpEE9rI3woJxrnAdIn
	 R+2nlvK23+fNHHwfZXbf32YsOCz7Sgx7vCSpT8oEJvGGeok6l7qWM/GURGZ2ZKKxfgg2S
	 qzlcDfIJYdIlUJcC77sg3TUdp6MqM3H2M/CCG2+Nzx38ZUGIxTJ34yEca3+uVhbSMwchm
	 UrFyo4GIuZuDDpSrvnRWB37WnJdZU7tClic5QBE9hyj+sfBUR1PQErWxususxjuNsFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=;
	b=WXWBhHu3HAA7lIy5BAGgeg+WbJ9yHD2oRbc/+jq2ReSk1eL7QDgnOmOTvM3wueS8vFEn
	 5Dp5pVsCiwsQLnj6ZAek3S62urXrBzpMZ+y1Bb9jsS+ZHk5gcXZDmkFTvLUieRKOkbgA2
	 ES6SMyn5dzBSa7kGpN7tWSeR20kvnWhO3lp/N+d8SuKkqMgDLBBOJ6jsGkFak45ModwPW
	 rfF16jbsT99CS2OFtiLDT9Heyew8TDRI98J9foV2L8Da5OHVZ9QgtvOGiLyCDPCJKmey/
	 VjkUVqipHQZ6JV4mjvPyPng7nxjJP2KVvbDHPIv95hsOkG4p/l9I+6/O57di5OMXfig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o86oLYeq;
	arc=fail smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9F606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF9F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o86oLYeq
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-57728d87699so3448042b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795828587; cv=none;
        d=google.com; s=arc-20260327;
        b=a88vCYppiducmJdZZfR1GUKSlmHGGIqr8jaBekT5480nG1uqAbgQcZxzBJD8SZuGhN
         sNSMLv4EdRA+YG9qlhZodPbegfokoGq9QHvSfIPW8iBQNhVpcV19gw8DaITBIo4TC/XM
         PfwM6a0X/LkJSlkHfEJ2Zii904M1vBLMXzVFudd2k6QC6/ajieLYjQ0yUnIgpDWNWXiu
         NX3jppUIrgmKUjEmqu1qZATGKSJdQyp1XKc3Kv2qW8tlayU/HpSe25VztCHbHMMpQuv7
         Ue0QVbXzcF2DqjVFsFIL9eHvUU38MokvdqEw5Y3b3VB5hFsjcjG5sIIwtsFVKmzfSXbx
         d9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=;
        fh=Q1Q2DwU3T3Do7aMVIvc04XA8n7QWahOIybBR116RzHY=;
        b=QwOUqT+vXp+lRc3xoxRYvcJXClm7JZcto90juC93bdu6s1T9jysARh0gY0ZWanu53Q
         S+CElHS+Rz0Nggggzyy1XS2oZGLfq2e86klzqzl08VD9C4G8xrpQnGvvMweJTT0Hwwks
         5JWzqEW/x8j9u4uZS93p6V4tPDsoxGaZOKJi3gptMGgt9njpsijCK9h9SRf4sUTVL2Nm
         L7Pu5BPwUqoDfw4AmmmfbUBWnNYbGexElNKshO8jffgKPIr5sUS4vWrC5kOLBQtwPizJ
         UKMDXfM0z7a4ERVrTCnASrS7BUbhJIkd8QpXRTmWxtTJKyPUJxq+NgCbJ6vQtV+QlViZ
         VG+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795828587; x=1796433387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=;
        b=o86oLYeqVzq2hq2G89nIH8n5OsHRRTqP7nbBmZvSb3mqA/vNuXrEujFGZAe1VLOTq1
         k+Tmm7ye3PH06KsM5zyMIDLMgbvXGvD+5frlR2wFVNxRC0cy/gYRneggGbFd7ap06G5a
         bV5P4G9CmVkZGQMAsoHFIciwwQoxHMNMwWjmUTfKFVbvGGOFmVrxd1WSvFLLcx9g/jn2
         nLI6F5eNcFDT7JI6O3DWaZ1OF5igEAh89s3IzYqDrWxHxvUR44So3raDi3Jdohk3gdkP
         CRfOcLoKQu5z8v0jjbcYxfvwvq7BXVoqZNIGhQyu/dFSibsKfbVVBeHJiaAHy4pBTVox
         So5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795828587; x=1796433387;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=;
        b=KTqpoCAg7v1MQ5rgS6aNRGf0YU+I9KKFfLkektl34aza6A/MsZroHrY5QwxOBw/drI
         6uKaUXH13TixzyGSr8rdSkuJLa9Vusr0QWbIrIztgvT3yndqOzZCbOUdtKspmAkaheYq
         cuKqp0cC76+IDlb/AWKaHoZFC9EgBJHFc6BEEm5RAiJZAHE8aFymJXPTZ0CvqOCjqCr4
         nAmJf4M5oGPDzG2TqU/ru1VkGACFSeed+Eq6+OrDoaCPblPwUDPitJ5V6It2QF06njaL
         aIxku/orYPTlRtLo9IAb2PwD7u+mkN4XPTgmuHmix6WjPIhU/wjRKucf+Ji4ACnLOc7+
         pd4Q==
X-Forwarded-Encrypted: i=1; AL+hErHFiwIpVd1W4CLPXV5kZ16Osezk5BREKmGQIasuXDRDhl5Z+uOl/6lSKf7w9m+rHJNJqAWq1T4S3UdRD+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xuCIOljn28/mFhfq5yBDR//m1BK3bpSem7PCURzekBTqczA+a
	aCUxVWu7TYoON57qCF8hzZASQJPYklCppxEgVFoR42rJ0DUICTrcJe4DTB0HazjSMmocAzaOY8J
	OMeDYX2G7P6MIaVHDK52hmbvFWaVEBUM=
X-Gm-Gg: AZFdTZfznXQlMD6kLFPyoiCmKNCeHvzgMSDqb4rp2ssThxKs7TmFizBTdmdwn6WIVLK
	TtYZy1paDNJCOfxHsp+vUKheMwmCypdghfNCqKF/t9Ns65NhwqdOj7kitMi0GYf/spuZK1phtg+
	tG7HVMVmLQ3h/IfU7TG3h8o+jCmaZVAhASF3AG2qBpJtKJwgC5e4Teu6XwMeo/5rtORbzIGKf/W
	534LMVhfAuYyVlkur3rDff5I75675CACGZiNjBTzp5sWTstotLKCBGJrbQ9OzHUyOPDeV0Qop/C
	1Aes+3FM7uPQW2+IWTMrc8tSH+z3YelpRJCI8KA5XTSTv6U2yCAPZIa1VVii4bSYKixfeEywGMs
	SPCp4857LVgtLlNYj9Js2NUs1tJMvVAcEEUU9hlC73bBTtVlylzFhfDMh+Q==
X-Received: by 2002:a05:6808:2224:b0:572:d0fb:ae56 with SMTP id
 5614622812f47-57a0ab2d70fmr29848553b6e.34.1795828587269; Fri, 27 Nov 2026
 17:16:27 -0800 (PST)
Received: from 968777710935 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 20:16:26 -0500
From: Chenyang Yu <yuqwerty123a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 20:16:26 -0500
X-Gm-Features: Aa3M54qrHo6Jaw9Cpb-IZQafwPQlp-SvlrLs2D75RZWuMCPZGNxcGUVQM_cbxKU
Message-ID: <CAGV7iNjs2oYKh0eGrp=7XP+__c2XjjDQMd5gHmUcm=86uzCuCg@mail.gmail.com>
Subject: [BUG] virt: geniezone: unimplemented GZVM_IRQFD_FLAG_RESAMPLE and
 dropped GZVM_IOEVENTFD MMIO notifications stall SMP Linux guests on mt6991
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>, 
	Liju Chen <liju-clr.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, crosvm-dev@chromium.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Yingshiuan, Ze-Yu, Liju, MediaTek GenieZone and Android/crosvm teams,

We are reporting two critical virtualization bugs in MediaTek's GenieZone
driver (drivers/virt/geniezone/) and EL2 hypervisor observed on production
mt6991 (Dimensity 9400) hardware running Android 16 / ACK 6.6.118 with AVF
crosvm and an unmodified Debian 13 ARM64 guest (Linux 6.12.118, 8 vCPUs).

Hardware & Software Versions:
- SoC / Device : MediaTek Dimensity 9400 (mt6991), OPPO Find X8 (PKB110)
- Android Build: Android 16 (API 36), PKB110_16.0.8.300(CN01)
- Host Kernel  : 6.6.118-android15-8-gebdfad32d749-ab15099304-4k SMP PREEMPT
- VMM          : Android 16 com.android.virt crosvm (ab13197479)
- Guest Kernel : Debian 6.12.118+deb13-cloud-arm64 (8 vCPUs, 4 GiB RAM)

========================================================================
Bug 1: GZVM_IRQFD_FLAG_RESAMPLE is accepted by gzvm_irqfd() but never
       implemented, stalling level-triggered virtio-pci INTx queues
========================================================================

In drivers/virt/geniezone/gzvm_irqfd.c:

1. gzvm_irqfd() explicitly accepts GZVM_IRQFD_FLAG_RESAMPLE:

       if (args->flags &
           ~(GZVM_IRQFD_FLAG_DEASSIGN | GZVM_IRQFD_FLAG_RESAMPLE))
           return -EINVAL;

2. However, gzvm_irqfd_assign() completely ignores args->flags and
   args->resamplefd. No resample eventfd_ctx is acquired, no
   gzvm_irq_ack_notifier is registered, and gzvm_notify_acked_irq() is
   not wired to guest VGIC EOI from EL2.

Impact on VMMs (crosvm):
Because GenieZone does not provide virtual GICv3 ITS (no MSI-X), crosvm
falls back to legacy PCI INTx (IRQ_TYPE_LEVEL_HIGH on GICv3 SPIs 36..41)
and registers GZVM_IRQFD with GZVM_IRQFD_FLAG_RESAMPLE. When register_irqfd
succeeds, crosvm assumes level resampling works (async_intr_status = false
in devices/src/virtio/interrupt.rs) and suppresses further irqfd triggers
whenever interrupt_status.fetch_or(mask) != 0, relying on resamplefd to
re-inject if interrupt_status != 0 upon guest EOI.

Whenever a host virtqueue completion races with the guest window between
reading/clearing the VirtIO PCI ISR byte and writing ICC_EOIR1_EL1,
interrupt_status transitions back to 1, no resample event ever arrives
after EOI, and all subsequent interrupts for that PCI device are
permanently suppressed.

Workaround confirmation:
Rewriting /pci/interrupt-map SPI trigger flags in the UEFI FDT from 0x4
(level-high) to 0x1 (edge-rising) prior to booting Linux completely
prevents this stall class.

Expected fix:
Either wire args->resamplefd end-to-end with EL2 VGIC EOI resampling (and
deassert the virtual SPI line prior to signaling resamplefd), or reject
GZVM_IRQFD_FLAG_RESAMPLE with -EINVAL until EL2 support is present (and
avoid pairing IRQ_TYPE_LEVEL_HIGH INTx with async_intr_status = false in
crosvm when resampling is unavailable).

(Note: while inspecting gzvm_vcpu.c and gzvm_irqchip_inject_irq(), we also
noticed gzvm_vcpu_wakeup_all() unconditionally wakes all GZVM_MAX_VCPUS
threads on every SPI injection and per-vCPU gzvm_vtimer expiry rather than
waking only the target vCPU(s), causing 7x redundant host context switches.)

========================================================================
Bug 2: Dropped GZVM_IOEVENTFD MMIO doorbell writes permanently wedge
       VIRTIO_RING_F_EVENT_IDX virtqueues
========================================================================

Even with PCI SPIs patched to edge-triggered, guests intermittently hang
due to lost Guest-to-Host ioeventfd notifications when executing
vp_notify():

    dmb  oshst
    strh w0, [x1]   // 16-bit MMIO store to VirtIO-PCI Notify BAR

where crosvm registered the queue's notify address via GZVM_IOEVENTFD
with len = 0 (wildcard length/datamatch).

Case A - Live /proc/kcore proof on virtio-blk (guest IRQs enabled):
During normal multi-process file I/O over SSH, fdatasync/fsync/writeback
tasks hung in TASK_UNINTERRUPTIBLE (rq_qos_wait <- wbt_wait), while
hctx0..6 were idle (active = 0) and virtio-vsock (SSH) remained live.
/sys/kernel/debug/block/vda/hctx7/busy showed 2 requests stuck in_flight
(tag=54 READ, tag=55 WRITE) on vCPU 7.

Reading struct vring_virtqueue for virtio3 vq[7] live from /proc/kcore:

    vring.num               = 256
    event (F_EVENT_IDX)     = 1
    num_added               = 0
    avail_idx_shadow        = 561
    vring.avail->idx        = 561
    vring.avail->used_event = 558
    vring.used->idx         = 558
    vring.used->avail_event = 558
    last_used_idx           = 558

1. last_used_idx == used->idx == 558: the guest processed all completions
   written by the host; no host->guest interrupt was lost.
2. used->avail_event == 558: the host [virtio_blk] worker last consumed
   entry 557, published avail_event = 558, and slept on epoll_wait.
3. On submission 558 -> 559 (num_added = 1), virtqueue_kick_prepare()
   computed (u16)(559 - 558 - 1) < 1 (true), cleared num_added = 0, and
   executed vp_notify() (strh of 7 to GPA 0x2c01b01c) in normal task
   context with guest IRQs enabled, advancing guest PC past strh. However,
   the host eventfd was never signaled.
4. Subsequent submissions 559 -> 560 and 560 -> 561 observed
   avail_event == 558, evaluated vring_need_event() == false, and did not
   re-notify, leaving vq[7] permanently wedged.

Case B - 4-vCPU hard lockup on virtio-console hvc0 (guest IRQs disabled):
The same dropped GZVM_IOEVENTFD write hits virtio-console (hvc0, out_vq
GPA 0x2c003004) during boot log floods or interactive console echo.
Because Linux's put_chars() -> __send_to_port(..., in_nonblock=false)
submits 1 buffer at a time (needs_kick is unconditionally true) and spins
with local IRQs disabled at:

    while (!virtqueue_get_buf(out_vq, &len) && !virtqueue_is_broken(out_vq))
        cpu_relax();

while holding port->outvq_lock, a single lost 0x2c003004 kick locks up
4 vCPUs at 100% host stime (outvq_lock holder + hp->lock waiter + RCU
stall console_owner + hardlockup detector console_waiter), while host
[v_console] remains asleep in WaitContext::wait() (verified live: sending
RX input 15 minutes after the hang still woke [v_console] on in_avail_evt,
incrementing voluntary_ctxt_switches from 844 to 847, proving the worker
was not blocked on host pipe output and never received transmitq's
ioeventfd signal).

Suspected EL2 / gzvm_vcpu_run() boundary to audit:
In drivers/virt/geniezone/gzvm_vcpu.c:

    while (!need_userspace && !signal_pending(current)) {
        gzvm_arch_vcpu_run(vcpu, &exit_reason);
        switch (exit_reason) {
        case GZVM_EXIT_MMIO:
            if (!gzvm_vcpu_handle_mmio(vcpu))
                need_userspace = true;
            break;
        ...
        case GZVM_EXIT_IRQ:
        case GZVM_EXIT_GZ:
            break;

If gzvm_vcpu_handle_mmio() had returned false, need_userspace = true would
have exited to crosvm, where VirtioPciDevice::write_bar() has a userspace
fallback (evt.event.signal()). Because neither gzvm_ioevent_write() nor
the userspace fallback signaled the eventfd while guest ELR_EL1 advanced
past strh w0, [x1], please audit EL2's Stage-2 MMIO abort handling under
concurrent physical IRQ / MT_HVC_GZVM_IRQ_LINE exits to ensure an in-flight
MMIO trap that has already incremented ELR_EL1 cannot have its exit_reason
overwritten by GZVM_EXIT_IRQ / GZVM_EXIT_GZ before EL1 processes
GZVM_EXIT_MMIO.

Best regards,
Chenyang Yu
