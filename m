Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605977;
	b=bfBG5tynLkvPBmCm31CFl2Mk4TxE88ghPLU5HX8ksOsbj57pfh2u9b1UJtmXG0At2H3E
	 CJge2raw2+wd/DlRnX78Kn88GpDu/+X7dEntOtGUfixb5/mXjn23NMM1gbDkBfEM1qRbt
	 mBC4JzAZW3ufi6UEAbOCqsjymg1mV4tBmZbJ6UvxZh+HyHbabIAT+vYt1li5TqkjAne/N
	 +x9JCRUtnL/eKe6DTG6Hac2o9Hznt8Sq5Ldqr8mehXyxy2e2TveU/PBzVBOOTXfnP7sIs
	 qHaXWvlk0Jpfp4U5BUCADkkR2ns3Nlha7WMOn4USDXKl7wzmBEH4rU8s4HQ4jIG0fug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OC4Q2zWXuivKEV3m6bSW+hewTlyeDz+wr0tU5oJTBu4=;
	b=p3heYBQ75P9Vlf/vMWNo1gcorZZp23x2Exzw2wfuXrr1U/rlVQyBWHjDmgr5zNserI0B
	 eFHsHu9BhnxZCrTic6nc4Qg2sxEbhLzCSb2olNrWFZsb/dpE4lA4dlXg4CUno2NYwNQge
	 KP7xuRX55m6h3NhlGAwzHorm3+l/BnkQGxr4TJrkKYQIQcWQ6/93h5L7DErb6Mkqu85b+
	 FaLNFNgWVQ33J6rlFfXtEHa2RyfJZTxRejXiXPkeuDJKR8qQOXXFWn2ZAWMvytkX+TtEI
	 Z/05iq/SEKbaXgH7Qj3qYVx2AV2NfBOACs5O/wJ4wjHclGEoONh63H5LVU6k5X9Smtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uRO4sAeq;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4259606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4259606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uRO4sAeq
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so9391352c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605976; x=1796210776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OC4Q2zWXuivKEV3m6bSW+hewTlyeDz+wr0tU5oJTBu4=;
        b=uRO4sAeqNd5YNTTdbJ/ADYpaqmcENot84wO0EwZOGIi5krkAMXU/ARCY5R9J/BYfWJ
         VNPPZdZTdOzkJqccZzDJHbWhSRSefmJwAPqcLVyfSb66EgiTSHvLng+htDTiy4Xna4mf
         KVIciMiXA2csdpeWrvWEKKn16hJeZpSsRHdyeDVYo3qdbEyvV7WjwzJMM80mouorclM4
         wfrqjbIR3ZhNeh4iPwyxz6UUFNeFh4eotxoLqudMaK182A5Eaj2luxxMzQUfTLhkybS3
         N5OGncKc6Vm80sm4TlD2rH+9zweCg7UEdu0a1RIlD/9glP4LqfSHyML7fiGZsjzfMxXl
         vJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605976; x=1796210776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OC4Q2zWXuivKEV3m6bSW+hewTlyeDz+wr0tU5oJTBu4=;
        b=Bs1Cwr0XNxiK2QNqa+lOk4Gmh8Jhx5VsHgzgCzk+PXYyDDM9ky6TYdLfGTC13c6/Ls
         njJ8n1o3bYp4+iiP9H6tDrNAT6MiacV8/T2GnNp32PlFxIyN9bc+zEKrhuPsUjhfjNMp
         rASVFcjCQiQ5vJUUml8IS1wI31Qw4U+uCqAeeIZLBMHmZMovqq5fEsQ1wu2FxdhBTmcq
         Uh+vwzc//xbUPqL0T5owNfFkVyCgEO2bg0LexEnMmDNddMe1jET8jHeWEOW8jPAoIMMT
         dHtPep9xm99h8X2LKf2QQyrAd+7nJoWpLcBamgHRWbVKadDpc4nO44gQCCzOtB7S2Ig7
         IgnQ==
X-Forwarded-Encrypted: i=1; AL+hErGp+3eSfQt03rvwvnpxr/cK6aHhmKJXK+15XR772fVwSrD3K5GIcHduZmN33byCH1d/Rdw7AJ0Q6wx4iNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5hLig6ivCkoIhc/fcDqmAX2fsszwmHei5qpIe3Bqz4qtROl2z
	GaNMcyXWOp5wgtfSrfAokiFwPS6UG2D32TY0LFLV5OSq5y3kDLY1eywn
X-Gm-Gg: AZFdTZfWYks5mCHqOD3Xik1Sk9M0cpqLtlDd5UeBPKMWKZZy9BOR40k305Ue1CrVZ95
	RHxpx+bpgeqzC8Bv2s2godJZ+xhjPFoQ5tDbsVCsglH0tHynOcigJ/J6y8EuYWtuRIK4PES8eKk
	YUstXzt6pZj0LsrIRYc1wFFUPauMcVtUCyQBZWaiZ+SX3qRt32hmA1ZFIOqlFpx7NEpTZLQZV/6
	yXVpqKyIjRpItfx2ljkULwy5bBWhbv5jJItYLUotvdmVzmu4+RNqoGxMehvaLk+XmEMpvwaNsUy
	kYL6ARwN6yMq5XERs9KlXFK3TGCdQll1Xtsg8kUbpDfF0ZAd0PBgSjKEvqHjjJ9293pgP4OM+cc
	TyykR5Sn67YPcXg/hepch8FqGPjlmuJbhEz0gsXhx9dxHtijFD9AylRyN9XGXWoQUhjL72gRXpS
	l9gu1phSTnwb0w25orOTfw4t0xgQamwJ5okl/4BNWXQfCsgeYN8bDHQdPYJWBnJHrUoVO5Nt12j
	qfS3aMFeQkWdSIQYDTiZNKn1SVdL10nJKO3VXhtcHnd+8z0vQWUV7GzFXv2GEJURNY6FgmPRO64
	vKvGRP/m8I2JW4OslOenRjVOCGEcXTXGZw==
X-Received: by 2002:a05:693c:87c8:20b0:386:ac97:f661 with SMTP id 5a478bee46e88-386ac97f9cdmr9061603eec.9.1795605975654;
        Wed, 25 Nov 2026 03:26:15 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm11778380eec.17.2026.11.25.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:15 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv4 0/4] powerpc: Misc fixes for debug kernel splats
Date: Wed, 25 Nov 2026 16:56:02 +0530
Message-Id: <cover.1795603946.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Enabling debug options like PROVE_LOCKING, DEBUG_PREEMPT and
DEBUG_ATOMIC_SLEEP on powerpc64 showed these warnings.

Main motivation for me to look into this was - many folks internally reported
that after generic entry/exit feature, they aren't able to use lockdep because
of the warning splat it generates during boot, after which lockdep gets
disabled.

Therefore this series is an attempt to fix the warnings which are generated
- when we enable these various debug config options.

v3 -> v4:
=========
1. Dropped notrace in patch-2 - Mukesh
2. Collected RB tags in rest of the 3 patches.

v2 -> v3:
=========
1. Instead of calling lockdep_hardirq_exit() 5 times, consolidated that once
   for the entire duration of __replay_soft_interrupts(). - (Christophe)

v1 -> v2:
========
1. Patch-4 fixes a pre-exiting issue pointed out by Sashiko.
2. Patch-2 and patch-3 from previous revision is re-arranged.
3. Patch-2 change smp_processor_id() to raw_smp_processor_id() since preemption
   is already off - (From Shrikanth)


[v3]: https://lore.kernel.org/linuxppc-dev/cover.1795441238.git.ritesh.list@gmail.com/

Ritesh Harjani (IBM) (4):
  powerpc/64: Leave lockdep hardirq context around replayed interrupts
  powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
  powerpc/kvm-hv-pmu: Don't allocate gsm/gsb GFP_KERNEL allocations under spinlock
  powerpc/kvm-hv-pmu: Free hostwide stats buffers if perf_pmu_register() fails

 arch/powerpc/kernel/irq_64.c   | 19 +++++++---
 arch/powerpc/kernel/watchdog.c |  6 ++-
 arch/powerpc/perf/kvm-hv-pmu.c | 69 ++++++++++++++++------------------
 3 files changed, 52 insertions(+), 42 deletions(-)

--
2.39.5

