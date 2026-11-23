Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447991;
	b=ai7EKX5TfxRVvUJqL7+QkasZebmsIxZmcAg8ZDV5JmQvf91vrJuBL+T8Cj81FOnNc5iM
	 ofCFbQEj+ZcwAQbB6l1pSjI6u3ujSwvPNTkl4/EqWE24/CB8qBDhHtYrrH+Sccaiykg4w
	 Z+E8ap+dML/Lj2I292a9A7BA3Oo20B90DjIoKENDPUMvxBjIeU5w+OqZRixUjs9hEgUyI
	 RBYITBcwXt5/ToDdTdwnpTm93scVfYcwk3g9z7CvVu/ThdjBWhp8WqqCgPj+CU+hGzD4a
	 teg1Q4fQa40o20ONmXAxyI5z7qtDdcuwwTRKUQbaVeRDlGCRYYdUvmCOw1FTENNxvnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Om3+ZF0XtREIm6HCfdv7ugOGpXmbs7kvx8h4qtcjszM=;
	b=EyOkB9Pjn/gFwYcRAoOaKIr7CgeG/7yHe39bXlIxLAMyq2PFOwiR++nr55YXXqk+fZcd
	 xacRHgbZLlmFVgkQNkq/68P44Ubx5drWGSd9ibIttFFFL6F3d/ktjp25RN/T1SoZHznWa
	 u7m7UV2UBxut+86D2um+u4R8YrdBqB+KmS4WZB4diANVCT43a3ax+jXcuUKHJ6nuo9n8t
	 2VEdTgWVe4/nDkElkIMNLcy2TtauzHZTFFQze1PQxGKxcPZWBKi4mIQehp2j/a+KJyUws
	 2o8FM7yijlX0kBGPSjrJHSSBFQweQGorjU4C1i8XMWvK0E7aa6M1JLTw/iI1dNie2yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=PDpaJYuZ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596AD606A683
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596AD606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=PDpaJYuZ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38587f3de36so4146460eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795447989; x=1796052789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om3+ZF0XtREIm6HCfdv7ugOGpXmbs7kvx8h4qtcjszM=;
        b=PDpaJYuZb+DORPk4kwRe6ZpuRcQHMCKRWIbtR2XvtYy7GdBAgIH2GezVfCd2rGjJ/m
         5rT5z5RSWLl+ftMa7vlJPFotH8mJMWu2CrcEm5RMDRWU8d2bkS+Z3C/phqgJUa9eWb2u
         vRZOgjAG6HY0Xg+nGeLndPrxNDTdJNzCO1jsRN/vPHvTTilRiRPPmku299ZIt+FF22Bd
         4abR9gbzYe4ZB04LCtHIb+foAkU33R8OGQJJIpvfjuM3CDKzXR0fSQh6EeOtL7Hd4L53
         VvQl9Ol7LHDS12NQB5k2i9m531Q4Z8bTahV/i+OEi1Rtd2o3zIiMS65VwcYGnbPMARGb
         juDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447989; x=1796052789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Om3+ZF0XtREIm6HCfdv7ugOGpXmbs7kvx8h4qtcjszM=;
        b=CwgPyDih8uxLX/hlvjVPdwi6FkVuXI5pxWU7RSJhlYj1SqP+tXMfqZGjMo5yYhDLCZ
         Emz72TYvnd97lcDOGV239tZ6vNJAGh2j7r/i6igd9hWTzfCILpjR4kPkkyTmgx3OGv4v
         d0WSCJmDRRbazp6NBfHhZCMypnZVm9sIaozVpbl+6BOc4WvfEBtKXUWEHkcS0UXXYfsM
         2Xg8aLapKCEUaTBZRiB66JSUKkoN+Y2dIJj5FQ4+2yHK/3OMMeF6tUpJdZenv040Gqzn
         7kc3TxewMpjvHSr2QEokXXAgwQpE/LpP4ajXfjznUDzthu3CbP0pz94pPSW1rLVoRuAm
         Inqg==
X-Forwarded-Encrypted: i=1; AL+hErGHIcn2JytvSvpdWTO2kwtsTVGjy5awBNrEIoJkIinaSy2RwKZUTwvQwVsWhBygmTNOXaX8TgNCZEHrL44=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lUau3gHeYPAg3JLQPPhy+vuGB2CyqbZvbYeijDpVRfPAo+PfM
	rE3EROLZHDUQMHrvmtgpIwuArtw+eM8Vf4Ph85txRO9ds9P9TmYmRLwLLEMyS0kI/w==
X-Gm-Gg: AZFdTZepEV4pcJMgtDG89w/dUNpvG4lE6jAV6m8qeK9n5NpfZ4Ab9fu40VlSMFeewBH
	vg1YuOwRg9hsnZ3W1pT/uKw04XIyD+iqzgndGvXAHyn17KBXe87S26DDSw1Q0oc7OlzAWoyomuX
	X5XnZboPkCYUGaXupHSb5srr/zsjJh0/JoagJF/EGB9U3AwURxcHrzrwuXxQijWmX392V+eKmpI
	yYVFi7XpINyoDsP1fnTCnbdf9sRsrm7sBFbFmRD1Rq5WY4R+02Z9bdlWAAPeuO7D52gVA9ApAET
	nutjk/swkN7ArWZgsIQ/odS5gXofwrypPZnlaTGEvF2dtyIT5NP471980Olk3h6NSr9CVevtpyk
	7iwoYmWpkO6O8ZM9RtFkLkvHexJzunEIWgArkdYLvHLi8lYv5GZaeJmHP2WRcbh3bmjUBapE6f2
	rwrijFlrVcu3SHb0YraE1Vp/og4xBFJc6nHHLWJ9x0CAv4123YhC/BI+TK0zWaPbEWE99N6FYPJ
	+6yD2tMS6SD3nhF1oke8Xqif01rGZPfnnQ6DqCWUKfBHuhbUmAZlBMojPJL7suVJua0UGSf+Sih
	X8FLHxO7/8Huq27XpRCbJyR1ZbsUT1KwQr8q4h+Oew==
X-Received: by 2002:a05:693c:8947:20b0:386:9ef2:8e01 with SMTP id 5a478bee46e88-3869ef28fe2mr6486341eec.0.1795447989335;
        Mon, 23 Nov 2026 07:33:09 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:3391:10c3:1717:1522])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34601237eec.16.2026.11.23.07.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:09 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] KVM: Disable preemption while pushing to the dirty ring
Date: Mon, 23 Nov 2026 08:32:37 -0700
Message-ID: <20261123153238.1036972-2-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123153238.1036972-1-smish149@asu.edu>
References: <20261123153238.1036972-1-smish149@asu.edu>
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

Disable preemption in kvm_dirty_ring_push() so that another push to the
same dirty ring cannot run in the middle of it.

kvm_dirty_ring_push() selects an entry with dirty_index, fills the entry,
and only then increments dirty_index, all with preemption enabled, e.g.
when vmx_flush_pml_buffer() pushes the logged GPAs on VM-Exit.  If the
vCPU task is preempted in that window, kvm_sched_out() calls
kvm_arch_vcpu_put() while kvm_running_vcpu still points at the vCPU, and
kvm_steal_time_set_preempted() or kvm_xen_runstate_set_preempted() marks
a page dirty, which pushes to the same ring.  That push fills the
selected entry and increments dirty_index, then the interrupted push
overwrites the entry and increments dirty_index again.  The entry after
it is never written, its flags stay zero, and the entries after that one
are dirty.

Userspace harvests the ring in order and stops at the first entry that
is not dirty, so it never harvests any later entry, and the GFN of the
overwritten push is lost.  A VMM that tracks dirty memory with the dirty
ring, e.g. for live migration or to restore a snapshot, then misses every
page that the vCPU dirties afterwards.

Fixes: fb04a1eddb1a ("KVM: X86: Implement ring-based dirty memory tracking")
Cc: stable@vger.kernel.org
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 virt/kvm/dirty_ring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 572b854edf74..1ed8b8771c3e 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -221,6 +221,8 @@ void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 slot, u64 offset)
 	struct kvm_dirty_ring *ring = &vcpu->dirty_ring;
 	struct kvm_dirty_gfn *entry;
 
+	guard(preempt)();
+
 	/* It should never get full */
 	WARN_ON_ONCE(kvm_dirty_ring_full(ring));
 
-- 
2.54.0

