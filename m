Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795254788;
	b=vunLl12vVx/fKOcyteQEj4FzD1AEdVEQNy4ClpjGXf7S1//oNUFArHPcdfaSl0Id+hUt
	 KK6DWzzhQAPKwyaOlRCkTj1MSsbiYBMO6OHYJxSn3XHqhgGZbNlPi/ndq409QDDPGrPDl
	 eCSz3TwbT4SWDBb0So9p8cMEeOoNf3+O/F12BV87LqP1mEiJ4B+MupQEXbdw9ro9f1ul7
	 VSNF2i4u8O11O8OrZ2gToEZABa/+pvoBkm5WQ1L295G/E3MXaN6Vp8tKrzzwRpnul5Get
	 rkCL9jONwed7uCjuYrxUclM2n/jUino0q5RqMkSr6BhxYXQtdh0YJimX9o1SkN3hSGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795254788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
	b=gExpNRJ4mh1ttltDUlPVyfDpPEU6e/fhl8q9nS6bqIfCrZB46N1OzkOubwvaJhdSpUrI
	 g26Vi4LPXEWX0kvgNhkvlTZjcPEiuUZGtScwVUef6+JBtp3pFosq1jVxJYWUGYZZIstyu
	 JJvkmINoUxxUE3UpxBkwwlnElwXpce59rx4DiDqZBtDdDHfTrBo0NikKDImIGMylsn63m
	 5Dy+FCh4brd9PKX8GCyRfA6G0urgETP396qhcB9kGKskNFzp6j/CGLqwg0U/Wqscxd/EC
	 Zq2mXVVMiphN5K/DmMC7MDs46N5qMwQaXlNphmXqbCsN0m08LsQEMfxHj370zRx7bIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbFgbxOU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9D5606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbFgbxOU
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b360828905so14645077b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:53:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795254787; cv=none;
        d=google.com; s=arc-20260327;
        b=b+C8hDCPrxMHSu0aAcstBD+aMLdzLZkqjsEpSZ0bF1CRGgj2J2aChHy8i1MJqn9GE3
         9Pc0I9ltr+2XOeINSK6rY7kmQHi3vw8TE5AaFXKCL1ApNmkiW6NBrXGlsdO6SPSt2zJ5
         GQkv6G4hh0er0qNC6iVzt5QivhapnMrVrnVgWQlhMZQIUjuFQmo4xSO1EB7egIFvl/oR
         doEtKVb/moAf9orIb3bPgLdgx4GSkaLatLr/2+30hmu0javUxGNhoM9ADAtAxi/hlKjG
         kDwjDTrEnv/XMNwnQ46IZtRs7btYewZ21zY9GRI2VeH+qyRp27uc3/IXc0QG3b/JthOV
         WWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
        fh=U0ejUetq6DLuQUFUsL3tpqZfcH84x0mpDJVPM9XZErY=;
        b=lLFTgW9Z/6mBo6OLAHfPNqnjouEbf2WkNy2j363fzV2OC73lf5kByEZeUsyv5y265Z
         cW04VWP1cnuG+Ge8bfEzKAzPV1H+eReNcKvAaVDnuUb/uMwewJQ+xRfpmVuG7fVbZDAy
         bjgk/y8+am3JIbhPD55DZyr+Ej1tyQVOgHWLDF9KPBepOgaPMDykAFjlMK+uvoIb5GlI
         xiOLLO2F//KKJQka6QxYj4YQBI7J7RDvYfaljftFPBOYzyPCkUOe8tOHmRmPSvIi0fpZ
         DPhsaq8pMr1vCtFsBJMS4S6uss14AfAjLHD+1ujS9UaDZTb3BDmWnNjWylh0eLGcCESC
         nG2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795254787; x=1795859587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
        b=wbFgbxOUakxTryJoiXSp2jmblEj0LxLmOUxBjzHpXKYmiO60BUuehLCYUjuiyQ1Bz2
         hTvI5lndvJ23ERuXtOUhJ/1KFR+P3K5pxH0jNAUHERWMP2BzwJ/Qz0pSPqolgIkx/pkA
         PJLfI8KIaKCUvP+vLALE18C8V/3bB1kXoh2Ero77lNo30zVT3cdckHfzmGgljHp31UKC
         8oRy02cXHh5dKfVf+aH0MTwMkPgwjKsWftGWJNaOHSCZjTo709pCO8zzqPupBud37S9i
         DZFVwA0NsW6p0Xo7/qVoTWsFoEh+u75OlvyDdKcpxcwkHSjCD+iC3WtrGGgeX6wZmA+0
         2UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795254787; x=1795859587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zENLsrjxXzbyMbN8YT2IRoZaTX6XrURmTnkpOGqlJsA=;
        b=a//aFP3IRpBswAyzNAQlUaiRuzIjw/t7CYiq1+JOU9k8/qT2TatkRGFMshZ8eGzlxS
         zZZVxlPDV0anuRczNlxuerdq4VVqUNwfffrlZmz15+iXHLrjs+FOxmbdP0gp56d7RogF
         Y76Xdj0q4a6VjRwFPAZXNFvFGajDcB/adMBoOyD46+4XyWRhMTJ4RG9BniLeQgTczwNP
         51JUOLH8bpdz2iUZ5oXUgGm8z7bqZOabf+eKFNMwFUCkL22x4xfJS27MFZ+RckebZq2H
         xGtlKcDIlCaOqxiQBJ88vFbOpCZvZYEt2uw85RSl895BaR6rm0W9HU+sCiOqZuaBAeVy
         pxaA==
X-Forwarded-Encrypted: i=1; AL+hErHjISg3DxIOaqd+vlsGYA2AJZU+gsfymzYTEhva14Y5EfCFgzgNK9Zu0L6II9Gs24Z3Vq5+IEx2hVO/JKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9An1vLUSxpqUJsZ2Qo6uZyR8ltD7Vp4I9xxNorv7Tn1ulRyKVR
	SaFaMbIc4au9tJREgXfDLdvGIjpDnRy4fJ43r8PEqELv1GdzOU3kO+X6Mcq0n6FFfBomxl4vLj6
	67CDL9mF0SsxwNLrW6PeDirYle+W2bhQ=
X-Gm-Gg: AZFdTZdbRWCb8a5z41/SmXHkR6+waWSi4ThRe29w5ohKgAXyWdhlGU6St6RoYjmKA5O
	EJda+1ZigxRQoBnVg+W94NIFc6gnPfqhzSqUGNYaU95nE+PTezqqDv+or4anPI+KKjwvLpQMtd1
	OLmuxu/tsy8+7P0zaBV1LaGly+/hrIOP0IPalGaL8pZ7e05oDkqxFAJaO7phKie330pKNKzZqUd
	2N+MWGQDaniyxW8a5nxbiQNAQ9AEkfosVg/xzO5GFhgXWKN6pHUYAcKNFpAWhJ7dvHP3YTjS1uS
	DzxvqRtoll1db5fIpp0D2k8sR9en3xhTr4XrdDhHvsTgRL0dSUdGINqGFkRGXYHYNVtIQmKxNHc
	3gaqHmcw1lQWA7mqAcjEiuzg8z57f5qTbvuwhaNk=
X-Received: by 2002:a05:690c:9a8f:b0:8b4:cd96:e2e5 with SMTP id
 00721157ae682-8b52047eb39mr22433217b3.57.1795254787409; Sat, 21 Nov 2026
 01:53:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120141225.789350-1-sidong.yang@furiosa.ai>
In-Reply-To: <20261120141225.789350-1-sidong.yang@furiosa.ai>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sat, 21 Nov 2026 18:52:56 +0900
X-Gm-Features: Aa3M54p2-QsFjV4SsFcebynkN_mXbs5R4b29wWDoqMp8rJ_L5RBNQwxz99F4OLs
Message-ID: <CAKbEznuH4sgiAQvnCxh+DeLcLHfzariiMumo-K9S3=zi7LNYxQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, ckoenig.leichtzumerken@gmail.com, 
	Tvrtko Ursulin <tursulin@ursulin.net>, mcanal@igalia.com, Heiko Stuebner <heiko@sntech.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sidong,

On Fri, Nov 20, 2026 at 11:12=E2=80=AFPM Sidong Yang <sidong.yang@furiosa.a=
i> wrote:
>
> Report how much of the NPU each client uses through fdinfo. Patch 1
> exports the runtime the scheduler already accounts per entity, and patch
> 2 uses it for rocket's drm-engine-npu key.
>
> v6: Rename the getter to drm_sched_entity_get_runtime_ns() (Ma=C3=ADra
>     Canal). Report rdev->num_cores, the cores that are bound, as the
>     capacity instead of rdev->max_cores, and skip the key once no core
>     is left as a capacity of zero is not allowed (Ma=C3=ADra Canal). Add
>     tags.
> v5: Use the entity runtime from the new drm_sched_entity_get_runtime()
>     instead of a counter in rocket (Tvrtko Ursulin). Reviewed-by tags
>     are not carried as the accounting changed. Based on drm-misc-next.
> v4: Single drm-engine-npu key with drm-engine-capacity-npu, and
>     documentation (Tomeu Vizoso).
> v3: Add a rocket_engine_usage_create() helper (Gyeyoung Baek).
> v2: Size the per-core counters by rdev->max_cores.
>

Posted gputop support for accel devices to IGT, which shows the NPU
usage from drm-engine-npu here:
https://lore.kernel.org/igt-dev/20261121094225.628262-1-gye976@gmail.com/

Tested on RK3588 (Rock 5B+) with rocket and panthor running together.

Tested-by: Gyeyoung Baek <gye976@gmail.com>
Reviewed-by: Gyeyoung Baek <gye976@gmail.com>

--=20
Thanks,
Gyeyoung
