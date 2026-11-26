Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795682888;
	b=NcHeAFTnzT2q/OuEUcg6ljd7ABzSNrWyyiMg2xXN0YTRvMvIqUyb1WpVB7x0E7uWHVqV
	 lxCajsIj14ZDTbnC1zDKBHZVqRVh9eqSMfmEG2O4Axd+hpdYysqfwzBfW9KoOoVara5oL
	 TTz5JBwfIT4/g3nAuX/zor+O1gcRRE3GU+NkhfnNp69aNFKfaOk4/YT5anSeuyvSX548F
	 sikFqzhAsfSlARcZNsTqbbbSyfsaWbH8ZwPcifYXKKtJhXja9qeCw3aSQP4h0hLPOI1Bb
	 G/trg+HSoyIfh+gqNRkwYJL08k1IP33hlWpZJjHUJbaxMURRaiIVDupIy4nXl7nhKfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
	b=xFM7D1tGyq9SCYQ7srnciH15LtL25NpbV0fND57td2XEnxzAu1cx5pJ1WUuQewkPVaLc
	 mjCsZUTy7Mjo/wIudhDwAA9FaHGfmIGskuO1q/+mf2FCp+EqlgYEbh5kvaCXzX9wCRFKi
	 jRCF/Au1AyaSTsFUhTy5huLAuUwUKPn6pSOjoEaSH1ED4ri/ccfLvLqUnW1uvG/0c4CLp
	 iZWecEqOdg/5Ht6KZeFGsex1Tp1926MV9QMiTFs/TIJA/kfl/u/eV1ce2SCm5rmgZfwhE
	 YBU344fulT4Sv+/ExsC2tDo2MXjHXBcEkcLQMiRisuEvHprqskmJPz3EAXg0F6Fpa8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEmv24t1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D3606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651D3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEmv24t1
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4fb5d96b3so104453107b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795682887; cv=none;
        d=google.com; s=arc-20260327;
        b=HiQmOIBSPF2xO/oXnsG+sOHTq01dfifkN0bGaEPLRS6Hrzaash4RHVTZo7L+POPcSg
         eN8FMQZ0TBRWPVMBFGgzE27gBlXr674D1Z9AJZctnSuJDlmKsLo/4yhfFvygL4dy3Dd8
         EbJcZejHGIjx2kIKkY4P2QtWqkohYv7Mlf8eTVxEuYNu2IRcxkdk3fH68LKxm/NXCwGe
         +ZtJtnNeWDfsTlEbgmYi465Elmyf4/9/9zuXaLLbITju0GoHqyYfU4Jl8WKqzW5yUmUV
         TmgrvdUmhtyaAyZlRqY87toinjh1ZEjA/ZVhvpQIzLGnezLDW5RSRIR/AI8/VJQnPyh7
         A4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        fh=lC7JVJdQp2MWbrVVAcaxiefDT86MBkZnm3TftADH8dE=;
        b=EXUg4D2HD250ETGzKxtp5aTpDmEWfFOhIpC0Dbg5mz62VZY7stNIVT8E4Nm7OkDPHe
         MsjTLKNn7YOv/B61F2e1lmlc/fykgF+PGPTBKqaYqyqGq4oPPqnG+CwZhOMWLy5YGsTf
         TtQe3nLgsyDX2CGj9pwk69+VSGgakh9uJZ0+3aOTUXZ9GdGFQq7gus/G9gos4GaYaDiw
         gB5Ss9ON5oxSdTjEeqT7xol2xyOERnRx/AR/J+1s1BggG/oawCu14pJc53/9UJoEIXXs
         v5AfXzqONVB1SHINIZCe1mruKVmrL8NXCCfxu3ukBE/oKsrj+Og3IGpVe/yB1qLwEWyz
         mBFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795682887; x=1796287687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        b=PEmv24t1/PGnLTT/viQApZ2CbEXaAVnpzVTUBxuWfIrWmQFdudGmMKdqe2qnoFfsth
         sjy5pGGEXrLTcC5m3phYBbhlmip14yGNAaVXMGtqaBx6bF2LYx6FUtrQoTsDaibQCvbS
         YR4vVxMEHOU3JwWF5L8JTepVG2wrhGTafo7iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682887; x=1796287687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        b=t7BORf8mrXqZYp2FALkV6MrqpmTiqH/nQYD7dE8HrQU0n63HbIpZnDmBEHw8GgQQrL
         u/FI9E7NctMJWhU1AaBKff9MHMTp5fpxiICDr+PvtfNKFhbTzSR2GBAPgZLck2/pIk3X
         sVd3gZH5YIJdoBLOL5UekAcZDBNdO60bc277N6OeY3Lx7cSgLQRtACwQKOZ0A0wdnsdJ
         FJ1ZQrPmJcJF9ypETx6VOmZiuxBIYLiOz/cVYD5YaWH+EfRNqiYTU4R9Apf9QPLc3HrN
         5LVq4j3gnfYrS4aHferan/xkd7JoAK/e7rtOV/PRfBNV/8Xrpzu4koCAVQpnyHePVVpC
         bxyg==
X-Forwarded-Encrypted: i=1; AL+hErGoxkcxpFpTE22LnJtjezxN5SdL/sulVDyyrPNHhPjm7ZfcXTeZuiATCeV3GNTnQqmknlKyCwLjUgBqCo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y6FMnuYoTDupiS4ZfCMdHy3Zi8BtYlxpd/R7ceJ+21UNoPCgd
	KAsQnke11jw1PgQz2t+wn8+Boo8DNqtZ8mi7vq68tXO9XQKwRF1PDySBgQDDhfSEInQ56OTXGBY
	n8uEZE3xJYiKd9/0CzUbHxkhT65bXSLDqRN/FhHEM
X-Gm-Gg: AZFdTZdRZrNNwAahQ9EEwX1w8UxbebmToLe1Nx8/i23MB/5FUazrpW/xaGB0LjhMTpT
	KtwQWkq296+w1vCtyGNTkpSP2Af+ts+lKqxuAUSRQ/2rJ06onVvqOZwTT+B9oU1boZ435W3naam
	IXpdL9mg+sn1AkS5Ql2nYbC6mTsB1Ur4bWQCRUh9debinAcTUp2nzkGm/O2uS02QKxiQHeawAyn
	KoGbQ2iEpHYZRlJCc2FVgr9LEDlOPalL8AuibU7w2h45+/ITJ2MKwZq/hZUcbWppMiuXT5J6+n4
	mzPiIaL7uhs2X5Pt95qyBvRShUGa7gtmjgtPcKdQP2IBnIbry2laCoHNF2Km91sEuJIC+JRh+56
	z/+8EhZ7goKTzM5UVuKxuredIn5xKKp9X/BVNAiOp3L7290ca00brw/u+vUBtuIOesS0=
X-Received: by 2002:a05:690c:3181:b0:8b0:e13c:2852 with SMTP id
 00721157ae682-8b518e8aa28mr76705587b3.7.1795682887386; Thu, 26 Nov 2026
 00:48:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Nov 2026 16:47:56 +0800
X-Gm-Features: Aa3M54qf4cs2aSjQ1h2bRvoduY7bxQ8dKJy1_2bbcHeKnvBYrvNW4fHBBOgXtRY
Message-ID: <CAGXv+5FEYqMrpL_Kze=Q30CEozpUQND-qX-hVi-gLZMpkd6r2A@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luca Leonardo Scorcia <l.scorcia@gmail.com>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 1:14=E2=80=AFPM Ryan Brue <ryanbrue.dev@gmail.com> =
wrote:
>
> Since the driver probes as a platform device, the GPT clock event is
> registered late in boot, when PSCI CPU idle may already have put CPUs
> into a state that stops their local timer. Those CPUs wait in the
> oneshot broadcast mask on the hrtimer broadcast, and
> tick_install_broadcast_device() arms the new broadcast device to expire
> at once so that it wakes them.
>
> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
> clockevents_config_and_register(). The forced event fires while the bit
> is clear, the status register stays clear, and the waiting CPUs are
> never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle state in
> use, this hung the boot in 20 of 40 boots; with this change it booted
> 16 of 16.
>
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up. With the bit set, the timer that
> mtk_gpt_setup() leaves running could latch an interrupt that
> registration doesn't acknowledge, the kind of pending interrupt that
> commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
> leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
> timer before enabling the interrupt, until the core programs an event.
>
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF p=
robing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8173 Hana (Telesu)
