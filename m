Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074651;
	b=sZzWVpfBytC8e2rOu4fkUDen5guGlIchcjdMjvurW1lE4tm4n5wG6PSMj8Kwp7wG1pFD
	 pQ5q3R82lSxCn4ju1qIW9UIziVZ2s0hOIkjT5ox8wOhDpPSfP7xnLaYya8dmr55ycIuGE
	 yqvC3Zu/orI30W0QSZUJ2+qW9VPeNLcyYwXcFvjZVSfepbOIbXEpjv+ZqFJX/cqfU/wkx
	 UukuLMu6CZWRBMCR9gRfm4oy5ZRWHn0+pjwETN+BOEXVzxxrXk8Ii2NTrJBB7RLqjbLPM
	 MUI1wAPB5KA/B/o+RZj2ZdJtgwR3e5jaVGiq9pdYuAyCOxLkVi85lrKTT72SSB2lLxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1bSCI/XIOeTN3HJGqPVny1POob1k11pyWM+WJGvjzJg=;
	b=uyBCK1S7Qghj3ytuksGq2thuvgPc7GT4vukxarhYuWzcBS0fzjg0PAaYKSYRK08aoG8v
	 xL6fVwOzgA3DJXk5Qtwu2KN7yR8c+dNEbkpm8hCf1GWAGmDHjSgpOW7gjHD19Mc4XLeWl
	 /UY6GMoReXjoO3EZgNgPVNDqYh7TkCD+mTcQZN+Gc/VTWdCiUkPlJckWowvOMb09ATWA1
	 MG7wEGhv5ISut884M6r3i3119QpEzoVDJnQSnNN7AYu4H9tYYx/YKaaMwgmnK6XJuzImV
	 GIulqlInu4TKksKci1xNYiB1Xpsi0k1UO653I/sbBKXSu4bHmGmesJJ905E9pal3uLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVQ4PJH4;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F17606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F17606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PVQ4PJH4
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55be673e029so142591cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795074649; x=1795679449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bSCI/XIOeTN3HJGqPVny1POob1k11pyWM+WJGvjzJg=;
        b=PVQ4PJH4kHFTI/LCIdThr4c40lQofYBLVh9WFs5KFgpTdjarUyOVfd+wQlyn+6BgUb
         70F7Q5FOlWlsaJWjlbvvgB4owQr7SNhFUsLc69IPYg6yCqmM4IwWVBSMRkwa3ZC816ZR
         70BiMGiLoW1r6TIKqDWWrjX9XyMLwj6joirK2ELvDtdUKbBeCQc1K+T9YxUQbvb61dYr
         WfyBzMqH8bemFPln4LFSgqD7DHsKC3KTCD+WRmipWu0I+M0OWz5WCGX8vf1ssA3K+4JN
         KPRyDyNr8FQzLziyZ/Nrx2ewmXSdSt4P0BmInl1OPrCBO/h6gALHrNNjrW3ffRQi0S7r
         ajtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074649; x=1795679449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bSCI/XIOeTN3HJGqPVny1POob1k11pyWM+WJGvjzJg=;
        b=p4j0iWMDcEIMZpqadeisrRKlAtlLZfB0ZKlovjlILx0i/s492UmJdIQ+/WHSExj9q4
         WkwIX7iw1ASyrCCS9K01/f2ZD/hHt4WghNsHSzHlTihABxTq2af2ovXo0IDBzKysnDIa
         1RSI34m+GuLFsW7ObOrXHxuxpGA8AkQz8cDdx8Z02LKzWrVihHmJPiOkB+yPjJ7ybi0e
         BTWY27P3kiyWSFsMgLTQDtdpxi/iCoIzyxMb6twnglI1O1bBMEy7LY3QO1tJs6+vjoOz
         D1yzsBOToKT50SMT+A6tMvJL50YzEKJOoK+hC7k2kmMiJinYFe+sjpUrwHXY/QwL56O+
         wRdw==
X-Forwarded-Encrypted: i=1; AL+hErGi5o0F/gm7ZTTWTqgvj0NQqSkuG8oip3xER+ZNziF1K7M/DQxc7NYac3Prs0P5dhf5j8e6Z+vHo2mOzoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9giItrEyQuIzqutZriLk7xusEPLiA/2AFqnheCDycR5yioy5gK
	5QLHp/z93DtxAS1XMs9Q8umVrA43c9oRxBZ/0hAcWX1PPsH5AId1yNT+WYtw5m50bw==
X-Gm-Gg: AYBFou2fAoOTkqnoM6diSNFPVBm0QMN2gZacc4du21BZTPcLdc2Hmwuhda8Po8zskWP
	1G1ndLtsuyaaGosImwjy1hRiBowAd8Qywr/+lo1gnsAm2Kgx1qJIeD+s0vWIcclgc1j5vnD643T
	birGkm420eT3iWHq+4R9RMEyAa/p1r3Ck4m2++KmbyzWBCG3HtCHb812vtXzu2X+1vsOV4CUliA
	gqpWbqGYdQqJDTTWDf+D6EL87NWbfXgUNqFwnrFkzYnjCmvA4oJHg1qscayHyuMtjzSHZc4r3gE
	1d+KLfsOUkhRJmaAodIeWqokmg5GEcOKRq1oTLJ5r1L/+7EkZeGuqUDeK5dRQcaQO0UVCtl5Bpc
	GrvToPQNWFXlI9ziRtYizXcX/o4rqw4mzOa6mHPCUcryeui854pDYW5I+0W+8pu83CzvPQy3DrL
	CeulDtkWr3cWmOUU86oP9nzlVBQxmgXtDel49BcYvbssAZ5QH003EwW8A0Swx7MP3q+HssdYKNN
	8RtZJeiIozVJbyW0lhVnN4K45sbcXwLib+7bzV3yBNfV2tAVFt4ny1W0+SDGoeNEtn6oqKJGMUG
	mwsgEd3voaQw3E+vgZ/kyBRnWy2VkumLgfPnvs2u7QboYoxYOEkCDEJtPMkj6NSWxOmVxEw=
X-Received: by 2002:a05:622a:2615:b0:536:6ea4:e6a0 with SMTP id d75a77b69052e-55d6f1c71fdmr4256331cf.11.1795074648713;
        Wed, 18 Nov 2026 23:50:48 -0800 (PST)
Received: from google.com (228.209.197.104.bc.googleusercontent.com. [104.197.209.228])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777ae93f99sm3603366b6e.14.2026.11.18.23.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:50:48 -0800 (PST)
Date: Thu, 19 Nov 2026 07:50:45 +0000
From: Andrei Vagin <avagin@google.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Daniel Wade <danjwade95@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/fpu: Put non-enabled dynamic features into init
 state on sigreturn
Message-ID: <av6qVXvdezQgH7BW@google.com>
References: <20261117112640.1435-1-danjwade95@gmail.com>
 <a0c51547-a354-4dbb-9194-0b359ea604cf@intel.com>
 <av5TI7uMazFmWYid@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av5TI7uMazFmWYid@google.com>

On Thu, Nov 19, 2026 at 01:38:43AM +0000, Andrei Vagin wrote:
> On Wed, Nov 18, 2026 at 12:19:02PM -0800, Chang S. Bae wrote:
> > On 11/17/2026 3:26 AM, Daniel Wade wrote:
> > > On sigreturn restore_fpregs_from_user() restores the features the signal
> > > frame carries and inits the rest, but both masks are limited to
> > > fpstate::user_xfeatures. If the task lost the registers earlier in the
> > > syscall, a dynamic feature it has not enabled yet -- XTILE_DATA before
> > > its first AMX use -- still holds the previous task state, and
> > 
> > How could that happen?
> 
> The code relies on this: while a task owns the FPU registers, a dynamic
> feature it has not enabled is in its init state.
> restore_fpregs_from_fpstate() maintains that by restoring with
> fpu_kernel_cfg.max_features (the comment there describes exactly this
> case), and fpu__clear_user_states() does the same on signal delivery.
> 
> The 64-bit sigreturn path doesn't. restore_fpregs_from_user() restores
> from the user buffer with RFBM and init_bv both limited to
> fpstate->user_xfeatures, then calls fpregs_mark_activate(). That clears
> TIF_NEED_FPU_LOAD, so the full restore on exit to user, which would have
> put XTILE_DATA into init state, never runs.
> 
> If the registers still belonged to current, that's fine. But the task
> can lose them inside rt_sigreturn: the first XRSTOR from the frame
> faults and fault_in_readable() sleeps, or the task is simply preempted.
> Switching out only saves the registers. It doesn't clear them, so the
> next AMX user leaves its tiles there:
> 
>   CPU0
>   A: rt_sigreturn()            A has AMX permission, XTILE_DATA not enabled
>        sleeps / preempted      A's state saved, TIF_NEED_FPU_LOAD set
>   B: runs, uses AMX            B's tiles are now in the registers
>   A: back in rt_sigreturn()
>        restore_fpregs_from_user()
>          xfd_update_state()    XFD[18] set: B's tiles hidden, not cleared
>          XRSTOR(frame, RFBM)   bit 18 not in RFBM or init_bv: untouched
>          fpregs_mark_activate()
>   A: exit to user              no reload, B's tiles still in the registers
> 
> 
> Here is the selftest to rerpoduce the issue:
> 
> Subject: [PATCH] selftests/x86/amx: Check that sigreturn does not expose stale
>  XTILEDATA
>

The next patch should be applied on top of the previous patch:

diff --git a/tools/testing/selftests/x86/amx.c b/tools/testing/selftests/x86/amx.c
index 31268193c4cd..17fc113eda5c 100644
--- a/tools/testing/selftests/x86/amx.c
+++ b/tools/testing/selftests/x86/amx.c
@@ -895,8 +895,13 @@ static void test_sigreturn_stale_tiledata(void)
 		attacker = fork();
 		if (attacker < 0)
 			fatal_error("fork");
-		if (attacker == 0)
-			_exit(stale_tiledata_attacker(cpu, helper_cpu));
+		if (attacker == 0) {
+			int ret = stale_tiledata_attacker(cpu, helper_cpu);
+
+			/* _exit() does not flush stdio buffers. */
+			fflush(stdout);
+			_exit(ret);
+		}
 
 		if (waitpid(attacker, &status, 0) != attacker)
 			fatal_error("waitpid");
diff --git a/tools/testing/selftests/x86/xstate.h b/tools/testing/selftests/x86/xstate.h
index eedf0cab7ccb..7229f3e5c6d4 100644
--- a/tools/testing/selftests/x86/xstate.h
+++ b/tools/testing/selftests/x86/xstate.h
@@ -93,7 +93,8 @@ static inline void xrstor(struct xsave_buffer *xbuf, uint64_t rfbm)
 	uint32_t rfbm_lo = rfbm;
 
 	asm volatile("xrstor (%%rdi)"
-		     : : "D" (xbuf), "a" (rfbm_lo), "d" (rfbm_hi));
+		     : : "D" (xbuf), "a" (rfbm_lo), "d" (rfbm_hi)
+		     : "memory");
 }
 
 static inline uint64_t xgetbv(uint32_t index)

--
I pushed all changed in https://github.com/avagin/linux-task-diag/commits/wip/fpu-sigreturn-init-xtiledata/.

Thanks,
Andrei
