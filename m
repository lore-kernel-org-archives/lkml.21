Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194571;
	b=vz9me2XsfMheKWxqCjKDBZ5uDWd6TVfJWRw0kpFuhIonej5eEikqBs3r0Wr6S/hBP3Hj
	 4z7PlB89SzszaKhWi4EPSGBV1X63rxATNfOaDKGo//GiKXmjJBAV1A692QAV12FGcJDjO
	 Y1+DcNWE60+hLQJ3rBBhZz/SNyr+rs4eowuiToCDMwLRFcrvGzmF/ELGSJGeTm55S6KsW
	 ZW83zJ0C7EtUfDxm6Y3W9YxXQ28Xp35OAxWjzRy682jq4rzh4lET43mXXmEevB55e0XAw
	 93mSz6GOaN0fxaOwvLR+2AdOadyNtwjJEG2wr7gx/WwOkAyrxMJXeTT9+ZIyCAlcQFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194571;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5juQiS4NV5WDA9Mql8KGEciA+P/kt6ePCjBKpgAiReU=;
	b=r5ihajFtn2wHL3DI5ZSSpbXJCkWIUGWapNJDVg4yS0WmRz8AeFCxZga+ni9DXvuRI3Q9
	 xCZDQ/GtJ0cbf0X3JlWiPYuLrGN2mMt/vCEFZjN1avUMC76BjpqZsiMGiaw52G8Owxitr
	 hLe1HNLvg4cVxkt+jpKFB1+krSjU5PysDC6VnT5EZ2r5R3DZ3ulFxAs5VTKucMsOqJ+jQ
	 YUJ+NBwOk00+6DQPxWnHwEor8+3vYUZPUoZXm8HOeYhNZ+6yixKEYvkDY8jlPKe0IHUXn
	 +8sJ7SHm896MbKSYdGX5KGiFL/Ie31b7O8+H/ldmzJlutp6jaJRZ3DBXmgod8/vXhEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aghKennR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9EF606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aghKennR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABB51F000D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795194570;
	bh=5juQiS4NV5WDA9Mql8KGEciA+P/kt6ePCjBKpgAiReU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aghKennRr03xKxOZoOVVsaoxmHiuOy0Arzqjh3H4+XaTwDwLCqX5lvfDqb64plhp7
	 fXC3HOhWZSNVnSjey0BZGwbkggKW9VUBdNvFQoZce47WYlvYwXrDsZ/hbuj/7+Ru6F
	 eW/LVZAJcVEPLuQhWIBRruZPXBY7NxhZ39BQCeH/A8g4oLNsZ4TrtirSVTTmc9ZCCC
	 OIRmAZOrUmF8gGos7dRV8FXHw8GStK8LMakqItoXqqETUZMbvf6VxTxitY1kkUfSA8
	 iuUSFdy5KsLFRBEwdl08sOm7zchndL/PVYSnBbMhD0TjDHui/JuP90Xwsjcsb9YOUv
	 Za234rg6qzPNg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c126f80426so1027442e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:09:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFw2Z45DOKSgk8ld8obN3jJWQYg4QXMQM8nPoOnXtMzUUJjJQ7JARpXBzolqprYvWi63JOV9MrBKr3C5wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bZJdPvPSCt+ON7KBtNT6IyEOuPhYWKzvJxSjEVcxvqV6+Rufd
	dnyb7OzLmSdXeJ/8uBE+hX+Au8k+2P80BiSjbcL98WY/MpbBCyBbFdXd9qzCWJwILiDv9eJSrQ1
	HJ9uuLln8SXiiknvc3k36w/CmyfgFfpk=
X-Received: by 2002:a05:6512:3093:b0:5c1:595f:b370 with SMTP id
 2adb3069b0e04-5c1bc6d253fmr1174527e87.3.1795194569103; Fri, 20 Nov 2026
 09:09:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-intel-pstate-online-max-freq-v1-1-1bbdae2b4986@hsal.es> <20261115085234.40661-1-xzhangjr@gmail.com>
In-Reply-To: <20261115085234.40661-1-xzhangjr@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 18:09:17 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j_XsA_vv5XyjvtbkNXBJNhwDkYoJSfE78KsA50BaUq+Q@mail.gmail.com>
X-Gm-Features: Aa3M54r8cdEJAdD0Zd7M4FbDyba-DKAmCj_dmkYEh4fRehGNENiucSzO3VGQDYs
Message-ID: <CAJZ5v0j_XsA_vv5XyjvtbkNXBJNhwDkYoJSfE78KsA50BaUq+Q@mail.gmail.com>
Subject: Re: [PATCH RFT] cpufreq: intel_pstate: Refresh cpuinfo.max_freq when
 a CPU goes online
To: Ximing Zhang <xzhangjr@gmail.com>, Hugo Sales <hugo@hsal.es>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:53=E2=80=AFAM Ximing Zhang <xzhangjr@gmail.com> w=
rote:
>
> On Sat, Nov 14, 2026, Hugo Sales wrote:
> > I have no HWP machine, so the HWP capability path is untested
>
> The patch fixed the stale cpuinfo_max_freq on my Core i7-10510U with
> intel_pstate in active mode and HWP enabled.
>
> The test changed no_turbo while CPU 7 was offline, then brought CPU 7
> back online. These are policy7/cpuinfo_max_freq readings in kHz:
>
>   Turbo change   Unpatched   Patched
>   off to on        1800000   4900000
>   on to off        4900000   1800000
>
> Both patched readings matched CPU 7's reference with all CPUs online.
> CPU 0 stayed online and reported the expected maximum in both cases.
>
> Tested-by: Ximing Zhang <xzhangjr@gmail.com>

Applied as 7.4-rc material, but I renamed
intel_pstate_update_cpuinfo_max_freq_locked() to
__intel_pstate_update_cpuinfo_max_freq().

Thanks!
