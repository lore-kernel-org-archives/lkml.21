Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770062;
	b=Pr/6jdMJv3nJKaud1WFFbKTxKwynJ/tABxiAi0Yt4ziWbSpBPbamyooSusC/XmLPTK/i
	 t9l3bHlGHOO+q5O4pRdEW4TnohsSrR273W73e2yEs3Nz8dQFVZgW7s3lH4QbtQ+6oBuUp
	 pscbowjxLBiRhrS+cjI7uR+VTv2UGHy9jWbvlVLotFekaOccrysPv/Kwm9tsXc87l8nQz
	 a8mNRF0GUK/cMMoZAedson9kTvep6uCrQRvheBwlAsgdYdZ4YPIBNeUVmxGZqlN4KFZl7
	 EQpX2g4SIn4Cc0k8g6tHwHwGL5qBCoFBXsWvlF1mSY+CAgraCQmCYX8HNq1zwRk+qhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HU0J3/+pl0PPUVxUA6gVTC/0c3E32/WaV1tvPlY0ciA=;
	b=tAOFZ1+y9y3U0sJEvsArwqvMLNhRFM8HuE7XiAPo2HXRmn/6XlfGHTE0z3Nc6uE6v4RI
	 IFHnHBRt3QN1aVNbHzlavmz5PBGWnaj78VQJ3mFi5l+fGqynSozvvpNLbtqyOy1gUlcHi
	 mt/DBLDN8WChtJ0W8ddsipuBkyEyMreZkBu+vahzgW81M+2hB+Cgkcx6cPFUIosSWfYdU
	 Q/PlRxxRx5ES2cBcPSKSw7eBrnrHYmOTIa9gzimdzn2DkD6TT8lW/nrSUQRbPsWER4JxY
	 Uj6eAQ0gIPw/SOlibHdcZujEBQCHECcp/ILLu3xaJtU15CYodoT3ru21fK6dIdug0hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYqEUL9D;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF41606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF41606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYqEUL9D
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f03eeda984so43370005ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770059; x=1796374859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HU0J3/+pl0PPUVxUA6gVTC/0c3E32/WaV1tvPlY0ciA=;
        b=GYqEUL9DofcYgG+tXJ+XnKRm2PeDaL1CorIMXw0qumTrfpx0Br3fVx0pLmiJ5PQgib
         F//q8eKjORHupFuzSHRzdeiF7aZZumpj89TXljoV2rc696RSkOIMChRhJek2BvWjFWrA
         H8u+jIPxkwBkALkSRfEOXj95fZiJxskvJWCPkCcLdzyVHhck5V2MTDKRLhRRzxZytvzb
         uc+zfpDBpDkNFyAYMjLW7IqViQWlmXbyEjDH6VC7q3UVsNyTFew5bcsQBmztuPyyjkQA
         7dBlDBryTWHJkTC3MyvBXWDsqk+D0EwDp5/HV72KjeGQSc5/tD3lYTtwHKn8pw4iiwAs
         7Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770059; x=1796374859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HU0J3/+pl0PPUVxUA6gVTC/0c3E32/WaV1tvPlY0ciA=;
        b=E0+m7Py3DD7WLGZu+t9paZ7GYoVNC2J/dNK74D9UriOh0y/BnNyF9vThQfNnTl4UYZ
         9PXoIMcqmEQmF8LOnK/de8bJPB6nGAjMmBZBVvTECha6GS97Y2zoXnWbr3zmM6ibRZ1A
         hsk6nCANbye1Rh5KhDAdBSvSloc4Z017n0yk+YKeqrr3q0LQV9GxXf5x92KxnwIXdmjc
         TrU357uMBijyanYlJAjvsnH5LIh59/4nS51mX/L+0+8+CcQJ0wv/V2AXJbHu9H+G86ep
         qw7E9XocxDFGFfgRUgt2rZc2gERXD3SOcmgcDZCH3Z907H7ddi4bG9APE89QioTFksCK
         ZTuA==
X-Forwarded-Encrypted: i=1; AL+hErHkXWTWcqTKenKH7Q7w83ZnVmjEQVtiViprtJEp4sNevoNJGg7iKgFiFHKhX+bieaK/b/el+owykON+xZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RDq9sgrNOVUTfAjoJFUHJMnaXQM+DSoD5kQquP0RVm4kGq/LO
	knoDXRNvisNzpHs3sjFnsGpCWwNI2ZmQYdrvCnc8Lq8JGXUXPW0G7d1B
X-Gm-Gg: AZFdTZcHJnVxjixMDs0md6V6GyGo1u9uwW5txAPOYZnDTxaiWMqwoIp6DVYimUrKMIi
	Hdi15TnrBus2nNRmRdz5DX91NdFjYg/oJeOjw7TRDIWVVQbGRcbx0+/VgnWEmb8tjrktzX3tLTZ
	/+KVXYl724iir7tMnnA95q6EDfN2QZ4Sje70HwH/iRT4k6/zY0TP5PclSS6oC1oUNJvq0udyZdp
	1pzTtxKjxO0GZ/ypyAg6aEcvkIzdxZma9r77ptY7todzrfpaYX+uObRrXlQr1lg/tMOwPmt1y6p
	IZ36WpKcGVRdAcU3rwGpnb6qNPLRiCHYkld63wGhXM1t/xipJSXV7mSLEBk7dh4L5y0f6cygbA6
	UY+vRNubYOdQYp8zb1Yz7pjgzm2K5wWT38AsbhaJ/3F03kLCD6WlUS/m1GBuMRj29cG7pNEzizu
	mDknhJgubUbQS1TetMP66c4SBfKF+zUYx+92ME8XEXwD6IQj9JbsNXFHuCa9RshdHbhOjEya/JE
	sQuWj5Ko1+l7tX/NMUFRSK/tArA5p96WPi/2bwRU+zTE5m3OyMUINDHyYTev8agMBktKlr6vkik
	pHhzIuWrIOzIogT13RboYR/1jkZhPuS+VHFDU+HVWmOxT7L6aIrGbBkXXh37yMoCU6V6f/Z9XBE
	mykwEIf1L9hqHP3LHT/lRgRbcLwGUyZCvMYrz3+2mJI7mPLUNr5GNe6wEPQlJTsnYcF66WERqno
	DdZMdS7xPd6Da3rpZZ/THghC4zUwOnDZ5gpfwUsY8FO2wQJAsGC8V234Jjj+0aX/qyAfx9g57R/
	NbHeYNEV+eN/n1mABCxYGfCuSDDIMo+C6gPxknSBsMUB25ziWhzr7wzAWbfxwfd
X-Received: by 2002:a17:90b:3e81:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b41c92a389mr20166058a91.40.1795770058478;
        Fri, 27 Nov 2026 01:00:58 -0800 (PST)
Received: from localhost.localdomain (27-32-254-230.static.tpgi.com.au. [27.32.254.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm40257422a91.10.2026.11.27.01.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:00:58 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Andrei Vagin <avagin@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] x86/fpu: Put non-enabled dynamic features into init state on sigreturn
Date: Fri, 27 Nov 2026 19:30:39 +1030
Message-Id: <20261127090039.1557-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

A dynamic feature not enabled by a task is expected to be in init state
while that task owns the FPU registers. The direct sigreturn path limits
both restore and init masks to fpstate::user_xfeatures. If the task loses
registers inside rt_sigreturn(), another task's tiles can remain there:

  A: rt_sigreturn() with AMX permitted, XTILE_DATA not enabled, faults or
     is preempted; TIF_NEED_FPU_LOAD is set.
  B: runs on the same CPU and leaves nonzero XTILE_DATA in the registers.
  A: resumes with XFD set. XRSTOR leaves XTILE_DATA untouched, then
     fpregs_mark_activate() marks the registers as A's.
  A: first AMX instruction traps. fpstate_realloc() clears XFD without
     reloading, so TILESTORED reads B's tile data.

A supplies TILECFG in its signal frame, avoiding LDTILECFG, which would
zero the tile data before TILESTORED.

If the task no longer owns the FPU registers, reset any state its signal
frame did not restore, including XTILE_DATA. Otherwise keep the old mask.

Fixes: 5509cc78080d ("x86/fpu/signal: Use fpstate for size and features")
Suggested-by: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
Tested-by: Andrei Vagin <avagin@gmail.com>
Reviewed-by: Andrei Vagin <avagin@gmail.com>
Cc: stable@vger.kernel.org
---
v2: Use Chang's suggested code and comment. Add Andrei's explanation
of how the race happens.

Andrei's selftest for this is at
https://lore.kernel.org/all/CANaxB-zWf3BkCM8hsd0pXTULHi2ZmpRnLgpp2BFzT=_XwMdRrw@mail.gmail.com/

 arch/x86/kernel/fpu/signal.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 164255d..7d0642a 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -266,7 +266,16 @@ static int __restore_fpregs_from_user(void __user *buf, u64 task_xfeatures,
 
 		/* Restore enabled features only. */
 		xrestore_mask &= task_xfeatures;
-		init_bv = task_xfeatures & ~xrestore_mask;
+		/*
+		 * If the FPU registers do not belong to current, they may still
+		 * contain state from a previous task with features beyond
+		 * current's enabled features. Clear up to max_features to
+		 * prevent state leakage.
+		 */
+		if (test_thread_flag(TIF_NEED_FPU_LOAD))
+			init_bv = fpu_user_cfg.max_features & ~xrestore_mask;
+		else
+			init_bv = task_xfeatures & ~xrestore_mask;
 		if (likely(!fx_only))
 			ret = xrstor_from_user_sigframe(buf, xrestore_mask);
 		else
