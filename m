Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795217701;
	b=dH1AMA8xiM/9G+D8MpmTF11DWTRSGOMzM2o4UAyfQgbWkNIsYtIJrguXAQUl1KaOb692
	 DArffdny7c9lF/7d7M8XQE9Y/fdgGiwm3MiSlRHFy4qwuOq4YWxdfhxj9gJUw92zBp5LA
	 Uw6soXqTNpr14XZfktj4L3Tpn7PM64NACBnQ22QBE9gFAWbX5/tR/58nrL9Hdzt3s84ay
	 UaFCPiHtJTTeP0uLXde3XswDz/+BDS4pmB04yUnc9SGww0RA8oJutjkn10VGVm/RpO97K
	 Pmt+3Y96dxjaATNbx+3yxEOp6yZMdI3kHJFPGxd3ehe2d95MKegBqxUCAfJf2wHajiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mSfM7+e0DG9yL9CSNMx7Lr0IjIg30n3lOiJCXJuSizc=;
	b=jtJF0Osl1I3Rgt1pHyt4iu9vzC5kfzV/aXU1Us3xMogEex1Aymnu8TvVS8FNU7oo6k7V
	 o/eaksgcmWsv5yaecRPIzbnSnSTngQUpUk27uBDQjJ6WfQG0ZpbktYG8XhAjtqrfWjecb
	 y/LBlM9xXIi7vRrdnZBlQ1iRFwNFSFxMvLGwAep+3ub4bmTNnCy+UcqY3L9Oer93D4duI
	 ZFkXnQRcMmpv9OWUQIBAf0haN/1Dh4rpcRVYR6d9WadEECyOldyib49pxm5AY7xY7QkjB
	 pJsE1YBrrric/zBlEmP2egl3ZfKlXfEMg6CugwwQdXLXNQD9U4VH3pRi30pYeXyRvHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejqJ3ecJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E2606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C38E2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejqJ3ecJ
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-85c1135c286so1092092a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795217696; cv=none;
        d=google.com; s=arc-20260327;
        b=Ee7YKMW3Gmtdf//CsY+ZGkVT+UtXqNG5dv0yJi++PKWo7lq3noge1MjKVLo0brzq/T
         YwwWXFioPJVyWBeQSA1d7V/b3l/R+L4LvUD4FZc3aAfGoX03Y7wcn617Kyd2KmvAp84O
         bqxBQRE5sRA+iWvAioRaqogfOOzYLTtFQ344RqZIJS1c7d45cK7G3mMTVlypQaC/FWRz
         OTtoSvvUAMHBjj/3danRmjiCF6AuW7fl7Q4EC5LZtSd+ATYJeg9K+lO5Q2Co1cRXncia
         0zxmKvCzkczJOvTyiNDOlThf//EJm+iOIxY5bVnV6Ya8tb5009g8t4nU8PH+KaCwh/c5
         IOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSfM7+e0DG9yL9CSNMx7Lr0IjIg30n3lOiJCXJuSizc=;
        fh=3vg2FdYW1WjYWYYu9Vkw2D0MFYW573KDeQdOyWHXAAg=;
        b=Xelv8sDHSsI4JXZap1xUKaXSyag2FkF2C5Q4081BVbXn90z54TKiDAVtdLuRFBNZk6
         qJ3mtxomQ+2PiDCK4OrI0RhZ/38xVvHw+YpGEA5QZfTJIaX4rVPzKxhYYxhFxpc+lT34
         XwPiaiAd6I4Vi03X0UhthoHNYO1bZnvY3SodTodUdhCgp4DtSLxG+adc152HmAzTMPSm
         lswKHVEXorAwCOu4k4nq6TkwN+q99OC7wCj2/8hc7CipxDZ40dOs4M2EYIaPawiobQMq
         FlQ1HBfOn8WhKOIeq/moHQioXnpcY2PZu/ir5JDXhhHOspCGfc3CUMxts+Os6XSq/ntp
         ls7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217696; x=1795822496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSfM7+e0DG9yL9CSNMx7Lr0IjIg30n3lOiJCXJuSizc=;
        b=ejqJ3ecJO6ZrT9TCWzPbDFwR8dbB3A2UxHw6fRGLCkVUeoHedvoardZkr9yOAYOczv
         Kr8ZlFabZ9M0TlaN9SnmPdoYPGhklrlt0D0Kr9OjGC2XvEYXH4jIsblwY/XbDoyY/33k
         f34CuHl1I2O7Cu7l8wb0jzYJE68dC6Er1dV2LTB9tx8txH2k2r2RsNAIBf/XDbmnJUHI
         3p/GRhxJovSHdEMeq54c7TDrdeGfEdedR+8f/oYSAOJaoMc1N7odNo6zZtIVS68BDoI+
         oNYcgiODqK6TnzHjyzckxQvRfpNjzUFh4HgpFgYaNle/mc1Xpz8zUV4AQxxy6MXaeBCt
         CwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217696; x=1795822496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSfM7+e0DG9yL9CSNMx7Lr0IjIg30n3lOiJCXJuSizc=;
        b=F6tznzhPfdJcmIRGd0vbM1DCs5CyIy8zRfVjAOewzSXXhvG5SrDXXPmRKran2bmqIX
         gdE7Bf/2pJIHyTpwZw9outNYix7GaU1MozET4GRYrclpOnTsXsrYQcH8mQE/Hs/54arz
         6wLmf4jMFjjRpXj3yOwrRMyd34nnn2SQSSOXWHCCsP06Djl9MXQC1JHRFKswJklqJ9LQ
         xvfkf+EnOKosQ2tJ5rnWu6wOSI+fZKmP56kTplVauUGdPybQDcviD/Qs64tBZ55FPmtR
         FJWBV9jx3MCta9G2WiS1TOFNvLwMfPyCC11/FI+UW2l0yCvbNegr2CTcYkL+f74PfCWL
         GjCQ==
X-Forwarded-Encrypted: i=1; AL+hErGqaDp8bPZtlxDyxD7q46N+eYCCqaY0TprZU8YH8A2hWA6lWjk/4yHYRUu9KJXIGae+hrgAvbf89URMpi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dzjoG3A9W/9iR3lAWa6ADaB3QGIeWW7xFbg/0vmDSGd7lXmOg
	7V26Ma0hCH9slURkx7O7XSumTzXs1zdIdxzhNLyYPZ5duELJhbHjXjHfiPg+N3G87+3m0wHGGMv
	ooPxz2y3kbvD7NKiyvtanLMWoCdWd8XiSNnjMpSQ=
X-Gm-Gg: AYBFou0gOV6siSmAV9NdNfyp5JrPPIslO+HOVIfkGt/iErvxFP/wDVIgoKNdi/2+WEq
	AIU32OdAedyDynN8PD60oCbHKCM1YD5ucGpMHe6eRuqUiN2teuMeX5QWuzvvdQnpOIky+ZcBRhB
	JEe0usQtX60LuFiH5gw967u/LoMIbFbTb7f5SLSu2v0XoeePVK2O1vJEN3rg6NwAw4ImGGE7rrb
	e/4vANNBMsfCPDV0O6paZk3ZecXjmt8qmK5367YpKD7DeTI7NCLj/GRY+M20xszfjO4Utoi2wVH
	QN7j6JT6JVlAAML9TcKRWPizk4YMSzXUUJa5/Jf46hHh0lPq3akbAU2lOmZc9QkEsBNTDuxQsDW
	qMWfleH0hJWdOG9TA/b9xMC6t/mmL6ziGPnw=
X-Received: by 2002:a05:6830:314c:b0:862:a48e:24dd with SMTP id
 46e09a7af769-86315646cd2mr6660418a34.8.1795217695683; Fri, 20 Nov 2026
 15:34:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117112640.1435-1-danjwade95@gmail.com>
In-Reply-To: <20261117112640.1435-1-danjwade95@gmail.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Fri, 20 Nov 2026 15:34:43 -0800
X-Gm-Features: AclHuK913w91YzROhxoNVPzwkczJvOrCw75Efl5My4uNVFRKEM8UnOUNaw7Azo8
Message-ID: <CANaxB-zWf3BkCM8hsd0pXTULHi2ZmpRnLgpp2BFzT=_XwMdRrw@mail.gmail.com>
Subject: Re: [PATCH] x86/fpu: Put non-enabled dynamic features into init state
 on sigreturn
To: Daniel Wade <danjwade95@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, "Chang S . Bae" <chang.seok.bae@intel.com>, 
	Andrei Vagin <avagin@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:27=E2=80=AFAM Daniel Wade <danjwade95@gmail.com> =
wrote:
>
> On sigreturn restore_fpregs_from_user() restores the features the signal
> frame carries and inits the rest, but both masks are limited to
> fpstate::user_xfeatures. If the task lost the registers earlier in the
> syscall, a dynamic feature it has not enabled yet -- XTILE_DATA before
> its first AMX use -- still holds the previous task state, and
> fpregs_mark_activate() makes the registers current's. The first AMX
> instruction then raises #NM and fpstate_realloc() clears XFD without
> reloading, so the task reads another task's tile data, including that of
> a KVM vCPU thread whose guest used AMX.
>
> Init the user features that are not enabled for current as well, as
> restore_fpregs_from_fpstate() documents and fpu__clear_user_states()
> already does on every signal delivery.
>

I think you can add this step sequence to demonstrate how the issue
can be triggered:

A: rt_sigreturn()             AMX permitted, XTILE_DATA not enabled
     sleeps / is preempted    A's state saved, TIF_NEED_FPU_LOAD set
B: runs, uses AMX             B's tile data is now in the registers
A: back in rt_sigreturn()
     restore_fpregs_from_user()
       xfd_update_state()     XFD[18] set: B's tiles hidden, not cleared
       XRSTOR(frame)          XTILE_DATA in neither mask: left untouched
       fpregs_mark_activate() registers now marked as A's
A: exit to user space         no reload, B's tile data still there
A: AMX instruction -> #NM
     fpstate_realloc()        XFD cleared, registers not touched
A: instruction restarts       e.g. TILESTORED reads B's tile data

> Fixes: 5509cc78080d ("x86/fpu/signal: Use fpstate for size and features")
> Signed-off-by: Daniel Wade <danjwade95@gmail.com>
> Cc: stable@vger.kernel.org

The change looks good to me. You can consider to cherry-pick the
selftest from here:
https://github.com/avagin/linux-task-diag/commits/wip/fpu-sigreturn-init-xt=
iledata/

Reviewed-by: Andrei Vagin <avagin@gmail.com>
Tested-by: Andrei Vagin <avagin@gmail.com>

Thanks,
Andrei
