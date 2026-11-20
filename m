Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202293;
	b=FvkNyac269RHoVBS8w5WsLuaiX2rztlwaS62D78jpJweBWsXnjifzWvLlXChS43bkKeX
	 LRnbSl0TrtOz4uXNtFmU4AVC7UKJOgp+jKhCPl0vJewSO01dWrEU21KuueEKnPo2SC8Ny
	 NTdaxcYIV9QLBwAgksZgxeQZA6DdqPABF9mm2vK4+7Wlb7hOeSkW/QFGzPDYtd47c5K6q
	 LRSeT00Akzw7ukG9tVUjT0vAvVaCVc+3TuSDCS7be6GKdQgl7TWn2crxjG4ux0rDYXcIV
	 42PhnKXko0xqXaYXbRYHS8FSR4B/OsR4FY/bT4JXp9S2c+zaaBf0yPOb4PPmHNLW12Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202293;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D0aacaaucLazBzamGaNcpBWXLJSLR5Zsq+QZIkHcA28=;
	b=CeUJ4red8ce6e5CdgqiwICPObMgmoCpJHONanneWzXAQWpPQXVuArw7uAy2ioBB3vUsb
	 NI+GlKuT+iKOKsMNl+q/UMTCQJUPaVaGJVHIYQgAEdz6B8daoMiVSYhKObsCQePIp6Yru
	 fiwGijjx90rIVW9iqXVIfNmo6T2OXtV2PZ1QFe+uYJ7uckw5dv+sH1bPO65pL4WCOzzEJ
	 lnYf2xACgqC6r0hEzAsJgO32O7ENdawWPIhBH/c0sTiKDdZA+VqMTKJMTVFsQztaJm5ri
	 OOobZOEit2SZUDzDkomzYK7iFq3pULWH9PIFMBOoHASCDwJ1M6UPpxq5YKIgQzhcc5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tsu+dV+R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B69606A6D3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tsu+dV+R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBA71F000D0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202292;
	bh=D0aacaaucLazBzamGaNcpBWXLJSLR5Zsq+QZIkHcA28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tsu+dV+RFstRRv9DCiGG0qgN4F8PbOY6/XDaZv5+N00mdm7KoZod3Jdlpak9BABKb
	 +0EFOLZDoGVg1Vq9B4RmzFxNH/wQY0yNFsv45UIm33eSA73I4GM3IBVrF/5Jqw/Xgf
	 ozcfDRa8hK4Gmiw0At24xmlO4vfcN5aQBbCTmw4TWJimTBBU98kG9/k6WGLZhzvu80
	 8sOHlyWx2IzZXdrGubIH5/9bXbZHy+JDhVtOFJrXu9DKfIBP1fHYkjCf4DRqULZovf
	 kinhqDgKUHIqWP9cTdUBbH2y7ALbtl9I4RyBWfFTNyTg8UZca1BJi5UI4Mk2tRNRKo
	 P2IFBQw4/i2Mw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so10132621fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:18:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEPTX5nuIq2nd5udTfefm/mzZr5P6hMqnjGkaqt7XrC2DGrdvxV+FvZAJ4gJZDz31pNb26rPA14vEeLAFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UsKGsWfeGx0c7uCRsOBsAiMvVo/saUwK0W+hb2hkBOF0N9WeZ
	zDcBVDXZT0PjojQA2BoxnRkXr7qAIi8ca8iIu+U3wuGoJShD4uvQ5qNaYamUgUrieQpSw9s6CH5
	IEjdaKsP3jyDNeuVbJvw7cZ6S4HkuVC0=
X-Received: by 2002:a05:651c:419b:b0:3ac:433c:6ab7 with SMTP id
 38308e7fff4ca-3ae7f9f2550mr11211681fa.16.1795202291354; Fri, 20 Nov 2026
 11:18:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 20:17:58 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h_kRcqpfM=8wnEXSnwB5+MHHUd2wK8jruQSRoTYnuXew@mail.gmail.com>
X-Gm-Features: Aa3M54oLwSoxOTZL4M8rcFfriin7DTrg-svIenSNy9jdlFieUb2umtCsC8Amt5k
Message-ID: <CAJZ5v0h_kRcqpfM=8wnEXSnwB5+MHHUd2wK8jruQSRoTYnuXew@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/2] powercap: idle_inject: Create threads on demand
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, tglx@linutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Ziljstra <peterz@infradead.org>, Bradley Morgan <brads@mainlining.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:16=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> Idle injection currently registers per-CPU kernel threads during early
> initialization, including on CPUs for which no idle injection device
> will be registered.
>
> This series makes thread creation follow the lifetime and CPU mask of
> each idle injection device.
>
> The first patch adds an optional CPU mask to smpboot thread descriptors.
> The mask restricts thread creation, CPU hotplug handling and teardown,
> while preserving the existing behavior for descriptors without a mask.
> Registrations sharing task storage are checked for overlapping CPU
> masks under smpboot_threads_lock before any threads are created.
>
> The second patch uses this support to register idle injection threads
> when a device registers and destroy them when it unregisters. CPU
> ownership claims, registration rollback and thread teardown are
> serialized to prevent overlapping registrations from sharing threads.
>
> The series was tested on Rockchip RK3588. The updated smpboot code and
> idle injection code also build with W=3D1. Concurrent registration and
> CPU hotplug runtime testing remains outstanding.
>
> Changes in v2:
> - Reject overlapping smpboot registrations sharing per-CPU task storage
>   with WARN_ON_ONCE() and -EBUSY, as suggested by Thomas Gleixner.
> - Default a NULL CPU mask to cpu_possible_mask at registration and
>   remove redundant NULL-mask checks from the lifecycle helpers.
> - Use scoped guards for the smpboot registration locks.
> - Document the overlap restriction and registration return values, and
>   update the core commit explanation.
> - Add Bradley Morgan's Reviewed-by tag to the idle injection patch.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bradley Morgan <brads@mainlining.org>
>
> Daniel Lezcano (2):
>   smpboot: Allow restricting per-CPU threads to a CPU mask
>   powercap: idle_inject: Create per-CPU threads on registration
>
>  drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
>  include/linux/smpboot.h        |  6 +++
>  kernel/smpboot.c               | 45 +++++++++++++++++-----
>  3 files changed, 83 insertions(+), 37 deletions(-)
>

Applied as 7.5 material, thanks!
