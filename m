Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729680;
	b=vmx7eV6JNQ2jiUExpnNO8RjgpM3bR8sllodeJEladGSakGXyeZ8qvgRvUzVhcJ3ITwcm
	 v26UFMwZykVgRc6gkKyH/pNYVuRrKjC20v9rRcCOYPeDKwgCBfnOeSfLWbdN7NAaeOKm4
	 FN8va3OwEmxKGpb1K6WrFI5ub4fACT/fVtg1M+cLrTVksAJId/ykG71etwI9jpxAPNpvO
	 w2ArKLDv28fseEBT/PWionrD0thlRxoNy9+NtJkQqeZuppWpH5EE8Z3pdzUL8qCbMSsgl
	 AXXiBDqSGCMXCnNeC+twxhe90pVvEDCVQUpGGCSDjXQm2KGQAEHXmduqgFENAf97tPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hMd2UDZDqgoSLjlD+QlyfYv75EMnrM/QsLd2ClYi9dE=;
	b=ZCiyoF63IkYp2OcFhOHg5tB5PdxP3Qv32nsZb4OEWvJtEtWze2SQwTii84L4+ebfq2DZ
	 MP+Hpu0prFbp34L6MKF8+Jy+haBgYCGZgm7b25fLIIthNCyAakbmNIIJJHoe/SYmz5+54
	 DfDcw4zHIycU2JLMX6i3kNwUgdQWDtMg6UbQZyz6SG9pr1bAEY3GHUbVmTjkdbzy1hitU
	 AEntHuL43cCQ7C4bFNNWx1ydX4qOY0S5Rh8ru57ytYmJ6Ocw3cKzcKk37OedGLm5O/1D0
	 WiEoOnWxlRSUO5xiYYp/KXwZ4da/nf9AuXL/v1/TMRIopRdXeYiNW7C7OKBkq13AQzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="K8sv/3bT";
	arc=none smtp.remote-ip=91.218.175.32
Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB18606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K8sv/3bT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vr9+j3KpJ0IcCV+2BQGOkIu4rLGAg/NPKJPG/3rUsx0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795729676; v=1; x=1796334476;
 b=K8sv/3bTs+am9So/TyVqC9SqHFapaFlnsbFE00WSetr8Fe3VlSYhYpzMPE2GzdH6A5lFBd9W
 HKcx5HgPJVe19erk4l+4VtY0d5ADwgzeiyFcfGGSZeCEKTFUXAORKkctEaZOvALJiw3bCkcBn6O
 k9vBJ77lmJbhcnYSuepwIJNY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 17144dc27f4205be;
	Thu, 26 Nov 2026 21:47:56 +0000
X-Mizu-Trace-ID: 17144dc27f4205be
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Chris Zankel <chris@zankel.net>,
	Andrew Davis <afd@ti.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <bradley.morgan@linux.dev>
Subject: [PATCH 0/2] Fix a few snafus in the reboot code
Date: Thu, 26 Nov 2026 21:47:52 +0000
Message-ID: <20261126214754.3630965-1-bradley.morgan@linux.dev>
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
Content-Transfer-Encoding: 8bit

In reboot, i have found a few small snafus which i have fixed,

Patch 1 fixes a small snafu in platform_sys_off_handler,
where **IF** a caller passes NULL for cb_data, a second
SYS_OFF_PRIO_PLATFORM registration thinks that 
platform_sys_off_handler is still free, hence, it reuses
the **SAME** struct, then links the same notifier_block
into two lists at once...

Patch 2 also fixes a snafu, where do_kernel_power_off()
registers a pm_power_off quickly, and then ends up 
allocating with GFP_KERNEL or calling synchronize_rcu()
with interrupts off and other CPUs stopped.

I am aware these bugs are quite "edge-casey", but better
to fix them now rather then never! :)

Happy Reviewing!

Bradley Morgan (2):
  reboot: fix platform sys_off handler reuse with NULL cb_data
  reboot: register legacy pm_power_off once at boot

 kernel/reboot.c | 83 ++++++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 35 deletions(-)

-- 
2.53.0

