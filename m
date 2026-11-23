Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460058;
	b=N1OPMo5bLpEFdg+31rJyixwL0voQSxmXX/DWscFRGy81QVKzlkzVcutJFMeO1f2Gtqds
	 wdlHd+j313FxXBWMAXoe/e2LPVFBOSYgD07HQamZdXfQZ16oAfIgGgqo0h0PQgOEfzE+J
	 5BW8r9dNTX5sPT/+gYnz57WVSxoIbbkZTvh8VrVPlju05awKT/wVVYSecmkZGYH0kWHm7
	 PV0QKwkkuO/ImVRCmNlVboiHl0emq4Oep9d/DVouWHvRY+6nhmordjKo2phCkaT6jnRLY
	 nxVMOYSixUu6r2mM36mlYcr/74hoKS6XlQFcp2R5gmWVWOsV7/t/xR2N5L4X2JH2r+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
	b=0one9HX73nQQhmi+Cvw7r84Q6InZY/8fm6UU/rgPeEu7b+DeYnompOUD245A3HJfn2TL
	 GmBs/t8GXsx0ZbjHbePQVIdI5W/k0ZOyY9tgl1R0+RcPLMagPSBvV56Y/Luk78WEgLpkr
	 QcV+l2PGa4XRkvQBKbTkW3d2lZlqIJw+7tLM2ZnZ+GR9BD57fSZLX0rVXdaNmRo5k2B7u
	 s6LB2y/kxbT10XbPmlBUrPETasiyZ/0GfBNh/RulHVpRsdx3xxPFODVIufQi2R+dn8Yty
	 SuraW2FgSNtQwl84gC5SySMVBB8+2ah7Rf609DDELKv3buDCooXfDMUpt+Zs4f59HfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XnziwLYp;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E20606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E20606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XnziwLYp
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5133831027so525958666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795460056; x=1796064856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
        b=XnziwLYpHO//8QZDuGqmEm4JoJuaaPAFh9C3bRYRFNoaz/LcpORkLjE+D5E7QX/TC8
         NBOZzMuHRPNbJRQFWj1Xx/dk5v8ei1u+lDQiDeHM7peJVg6VvlyBErMSCmPFrjo8bpwQ
         28s6HbELWMpUXWb8xf7W/wsEsU2X0EnsZrTvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460056; x=1796064856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
        b=nBuzN075btnJYJXQgChSPSYhyZgxR6oWvxi4P/WfEj9laUEa58dgvgTIsdgu3J8tPa
         uNqP8dVDipIy/PRqM/r7FMvHEvJWPKc4NnQpxKpq38z0LH269YgEsBKIR8/pqAHRNN8V
         GJ5yg6Vf4ohWfzdR33P8RlcQeN0ApjuLKD4RQBS0Ya4qWpyB2ojmyZundf1RWlYYW05/
         MtUVgyiRopHT+dbcnAcjn29uUUKCKQZYliJWsvEd42b9awJ1NaOuVS8aorJi0GKcy0Vk
         TqUguF4P2toh8BxwHxCTmpupJzJ/u9AuRFuaT0o8uRI5DXoNEm3HgbA1CPmgzvvVDqmE
         LPJQ==
X-Forwarded-Encrypted: i=1; AL+hErEA9txlv8uubr0NUX6e/zBbQXWY77tx4nsEzpBfZZjkZZoWHBxA3DF4ByF9LFvLz1tbUEGlFbz1fBOerOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z90tpwu6j3/BwUeLum1evI1RVxemgWMmEv7ZnG7mSqWEtSUiCBf
	kZNlJukMRtvE2PDPkHf9xTDDFbAUz+IEXk65KIM7RQkO+uQf/9NaPE61Tha1rlWzFC3jbVF7lqM
	9Y9KiSw==
X-Gm-Gg: AZFdTZdeQav1f+Vdvvi20ZGQ/5fP8d8sO71BwadyW4PvjZRNcFpfP2HP5iaThhUzbO6
	xnzXKp32C2f8/l1+ftQU9mkQshYQQQcb+CIlbc/hJtUDZFUZL46rAkLiHP0R72zhw/fIN/FjgWC
	d66be/ak9Ap5PlWb3VeieFhIKjpoYkacHlQ7qurn2jUeDVxHAMxrlf8hepDbKjwmAaETbNsMnF/
	Wa5icdO7ly1Wmryr581cAvoH1Et435ex6Jam+y3XcRP4x1BS6k0GKgWJWFRsaiYwHUiMjwEc6lp
	PHZL5zdBNp75bql08gHgI/UkhFfpuklEdfJbHq5Xm/S5wQ73X5FUo4VgBPoSVBx9OEhCG3weEIC
	qHciwyTCt4xpnSXMS77I8FHh6LttIFyls/UHyirE6tDjvtHNYUZtmkuyb+Qr9iKSt3KQL4Fkpr4
	gzsRfV41j/cHNaZTlzyiGFsWUcbCg7aEfLifj7In9MvPieyUtS1ehWjCJR+XD9/NsEAyuABLmUz
	yYoVzoamgwGbyJG311sjhNGZBKB/Z1f9ACKvFVuA17B7Qn5LLploru1lp/NEDCWM49qTecqMO66
	1yYPzFk+IE2SeEUCR15FoNmTwVKVe0IKyYKUue34aZpeQziQppvzJLG/HCarRi2NCstT
X-Received: by 2002:a17:906:a207:b0:c42:102f:15d3 with SMTP id a640c23a62f3a-c513a897629mr704824166b.34.1795460056392;
        Mon, 23 Nov 2026 10:54:16 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b001172sm442313066b.79.2026.11.23.10.54.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:54:15 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so46472915e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:54:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5/3Tz4nMC4IKGm8b29yAnSZkzS8H3m3Z4s2dKm/DtZHEWhEQoeD3Uyq3DxO0cqRpDgut9DiVIaMH8fZw=@vger.kernel.org
X-Received: by 2002:a05:600d:8449:b0:4bb:8e95:8ce1 with SMTP id
 5b1f17b1804b1-4bb8e958ce4mr161086305e9.23.1795460054386; Mon, 23 Nov 2026
 10:54:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org> <avvOUIIn9t00XqY_@gractus.seuss>
 <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com> <awOzcZqcrKwMjE7e@gractus.seuss>
In-Reply-To: <awOzcZqcrKwMjE7e@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 10:54:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U9BRBp482ZNavG2SioZ3BqDx-qH5Qh13k50qMVdN-s9A@mail.gmail.com>
X-Gm-Features: Aa3M54q7_XT74h_vNqApIdx5UmvbqmG72OJ4vaE3NHyGaBbVB8eeNq9DNlLx3DU
Message-ID: <CAD=FV=U9BRBp482ZNavG2SioZ3BqDx-qH5Qh13k50qMVdN-s9A@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 23, 2026 at 12:39=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Nov 17, 2026 at 08:17:33AM -0800, Doug Anderson wrote:
> > Hi David,
> >
> > On Mon, Nov 16, 2026 at 7:47 PM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > > On one stress test (walking all ~573k nodes and ~2.06M properties a=
cross
> > > > 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> > > > ~1.8x.
> > >
> > > Hm, optimizing pylibfdt has never been a focus, on the general
> > > assumption that if speed is really important to you, you shouldn't be
> > > using Python.  I'm happy enough with patch 4, because it's a speed wi=
n
> > > with a very small and simple change.  This optimization is a much
> > > larger chunk of code, so I'm not so convinced this is worth the sourc=
e
> > > complexity we pay for it.
> > >
> > > That's not an outright rejection, but I'd need convincing this is
> > > worth it.
> >
> > Right, if we're trying to get the absolute maximum speed then of course
> > we wouldn't choose Python. For a tool like `fdtfactor`, speed is
> > certainly not the top priority and Python is the superior choice.
> > Writing it in C would have been a much bigger pain.
> >
> > That all being said, just because speed isn't the top priority doesn't
> > mean it doesn't matter at all. When I started looking at optimizations =
I
> > was seeing my 438-DTB run take ~25 seconds, which is just a bit too
> > much. With all the optimizations I ended up with ~12 seconds. That's
> > still a lot and it would be nice to make it even better, but it also
> > starts getting into the realm of acceptable.
> >
> > `FdtRo.properties()` stood out in profiling because
> > `DeviceTree.unflatten()` calls it on every node (~573k nodes / ~2.06M
> > properties across the 438 Qualcomm DTBs). In the pure-Python generator,
> > each node makes `1 + 2 * num_props` SWIG calls (~4.7M boundary
> > crossings, each going through Python `check_err` / `check_err_null`
> > wrappers and generator suspension/resumption) and allocates a fresh
> > non-interned `str` for repeated property names like `compatible`, `reg`=
,
> > `status`, and `phandle`.
> >
> > Below is a small standalone script (`bench_properties.py`) that builds =
a
> > 1,300-node (~140 KB) DTB in memory via `FdtSw` and walks it 400 times
> > (~520k nodes, ~2.08M properties) with patch 06/14 applied. On my
> > machine:
> > * Default `meson setup build` (`-O0`):
> >   - `FdtRo.properties()`: `2.52s -> 1.50s` (1.68x faster)
> >   - Full tree walk: `3.35s -> 2.25s` (1.49x faster)
> > * `meson setup --buildtype=3Drelease` (`-O3`):
> >   - `FdtRo.properties()`: `1.76s -> 0.98s` (1.81x faster)
> >   - Full tree walk: `2.24s -> 1.43s` (1.57x faster)
> >
> > On the source-complexity side, roughly half of
> > `fdt_node_properties_stub()` in v4 is repetitive `Py_DECREF`
> > error-cleanup boilerplate -- using `PyObject_CallFunction(prop_cls,
> > "Oy#", ...)` and a single `err:` label trims it from 55 lines down to
> > ~30 lines. That said, as noted in the patch notes, ~1 second on a
> > 400-DTB run isn't make-or-break, so if you'd still rather not carry the
> > C helper in `pylibfdt/libfdt.i` I'm totally fine dropping this patch in
> > v5 (or trimming it to the ~30-line version if that tips the
> > balance).
>
> Let's leave it out for this series.  I'm ok with revisiting this
> later.  Fwiw, gotos for error handling are generally acceptable (along
> the lines commonly used in the kernel, if that helps).

Sure. Dropped from my draft v5.

-Doug
